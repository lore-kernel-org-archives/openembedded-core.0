Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9CC1061B32
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:18:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17690.1774955905261939148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jjMYjpxL;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso47542165e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774955903; x=1775560703; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyE6GzbOUjK4ujo3GjcpDXQzbFrlTiHEaA2+EqCA7mQ=;
        b=jjMYjpxLATPscS8/sPV1PAPDSAcRswXqxtTG3GtbfMY6j40dJVDwMgqIJcb47q/FxE
         NWTTrninuBG+w8zNEA/xqhAx9U05FUSoFrgC4XG7sUl7O5Rm2A6eTLzhyifU+rTmvBNC
         8SbhOq/dZClpnIaLRqhr7aTSZmgV99Yabojq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955903; x=1775560703;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oyE6GzbOUjK4ujo3GjcpDXQzbFrlTiHEaA2+EqCA7mQ=;
        b=etyuOvVwdkWHX0DwxJSowNeOCUsP5w7bkE49nDdqlAKmxvrqumo9OlqFGlYrpLXekl
         ra1VP0u6JOq1AeeZBeokAXNFeK2OcokzenOl97lt1u8stkrCjjgqyRtHIjv0yiAyi3gT
         bizhwa1viZHk5lA3TkKCyYj4FCL/EgGhHjMm4CcJNccSM74LjwIg6Y9DWvSSzSZnsIvm
         FflZBZGoF8dVglc6zQG4b0VfIqKdao761kou8+6PoVOotx6BvaMc/79KwRbeOfYGX01j
         kMgzgynAZyTqfKOJsP2bTMCdyTmyBxhpUwE8PvBjR7ySBVsDw/3fjF2TG66OgTKadrM3
         5Z7A==
X-Forwarded-Encrypted: i=1; AJvYcCXgF0MN2HXOy5UEQ/X+tnXXOZA0I+WwyT5nC0adW+kJbCt62M1tm0TtodV6UmHdIlnZpx6FFCxBy6/7EKUipMcH1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYMhrghFT7RkHAQBVqB80voTs6lUZLGPS6KTqlrFmhupjanqVZ
	DWv2NgCU3q0iH+/g+wG9ajZRcdArv6LFNoO379LgWLFSPDmpEgQK+0ZlFkc/ynbrp1I=
X-Gm-Gg: ATEYQzz4rmDZhpdA8tM0gfRsOzqFCY5ybAT4YTPphaTCa6NcFSZaf5lsjkIKt3U8eZ5
	EIjPH3w2Xi2jkDZvv5OtD4jpkwBkhf5r/5goPXHjiAp5oPDYWXe63b4JAzu4nglWU0xWr4c0qfW
	HWRcSdLsJmfGgFojWEsVkqLKhIor5iubFCrQ738HordBOFNMv7h76EW5zJbadhHVGX59rHdYSoB
	ZrQCVwH3TKVnrWoWgZv+gMmGP71VmRidfE+gYP8i/eCteQ8zwSn7dGpionXBemKXAuBNc1lCWb0
	vkJekU8EzmQjj16zSCgC6XJVtsk1snQpZEvsGHn82LGCvHPv0bJN8RQ/rETtfcJ/cnvF1anu9Ql
	2J3Zva5JkrNNCZvyXa3zqm2RfewzQeifHekbA4L6qOlVR65g1OKokJER+ZAKZG8rJcEMbZMQJxx
	NL9iwP1g4nxodzT2r2AEe53gHJS/i7QPKVuB8Nlujfw/5JcossbUY=
X-Received: by 2002:a05:600c:c493:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-48727efca4emr261531585e9.14.1774955903512;
        Tue, 31 Mar 2026 04:18:23 -0700 (PDT)
Received: from localhost (18-19-104-194.cust.keyyo.net. [194.104.19.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm24287903f8f.17.2026.03.31.04.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:18:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 13:18:21 +0200
Message-Id: <DHGXCS5Q7B3V.1IVYGYGM922FM@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH V2 1/2] vim: Fix CVE-2026-25749
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <131089.1773220389419496773@lists.openembedded.org>
 <20260311094528.2744479-1-adongare@cisco.com>
 <DH75VU1XGMU1.177LB3T02RJF1@smile.fr>
 <173697.1774894874030687760@lists.openembedded.org>
 <DHGEY5KEC0UG.1XDWZWAJC5ZTL@smile.fr>
 <173697.1774947287519751568@lists.openembedded.org>
In-Reply-To: <173697.1774947287519751568@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 11:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234282

On Tue Mar 31, 2026 at 10:54 AM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hi Yoann,
>
> Thank you for the detailed explanation! That makes perfect sense now. I m=
isunderstood and was looking at the source code indentation rather than the=
 unified diff format itself. I clearly see now via cat -t that the context =
line indicator was a tab instead of a space.
>
> I will regenerate the patch properly (I'll look into using devtool as you=
 recommended) and send out an updated version.
>
> Going forward, besides manually checking the diff, is there a specific sc=
ript or tool (like a patch checker) you recommend using to verify the patch=
 format is strictly correct before sending it to the mailing list?

I don't know of any.
I just noticed it because I've setup my text editor to display
whitespaces (but that's mostly luck).

Maybe check your next patches with a trivial regexp?
  grep '^\t' xxx.patch
and review output?

> Thanks again for your patience and help!
>
> Best regards, Anil

Regards,
--=20
Yoann Congal
Smile ECS


