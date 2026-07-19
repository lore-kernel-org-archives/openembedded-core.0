Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C01C4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:02:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6705.1784473341724072379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fCkmgTxI;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so21912845e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784473340; x=1785078140; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZBCh6+TY5UVv+izrUNd3IlATeVZFbWEkesIUiu98C0=;
        b=fCkmgTxIWhLcn7aSlIPNKZy7S4YBcUEUucR8itxRVYOcB67IVVhIIW0SF70rzMKNp2
         qC21sB2lC07rAafKbLLL90MPGRzQzfzzM3J+UesqDytQ9IlztM5esmpZ5MngxAnvw3jq
         /qfkiuUKadb+/iNiSxuzZHfbJg3rhy+JmIXn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473340; x=1785078140;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZBCh6+TY5UVv+izrUNd3IlATeVZFbWEkesIUiu98C0=;
        b=BsN2vMJnu4+IfgBxixFrVsNVqc4dFvPhoNnCMkOh1O0DEfhKF4eerecb4dV6y391ja
         ECSnaTuUM8BcizbwoirBhR3D9bBgo6n4qDPWeIEFCkDdTFixmX59Ct0d4OCPOO9sJfWV
         dsnhSSlxfSK2yClAy1gbcxs0IrA36f1N/72wo74cuGTT1HJv2UETOJ4InqwyBKpI7htm
         qdh+fezgjhRVB4UOWdhVc3Zrhe7YO3NByxOVE3ZPlKbtN+Tg8828bBsrcDA0cv5nBITn
         cqxQGV0uy+tad1YTpsTr64sq0/jhJkByKHylfHwd20vGSkxEskEQdgnZpmftJL73EPaC
         i4tw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1rjcZUshfPwb9fUXMU58niWlD4Jh6R1HQQrR1qR5RVxMnNe+UEtmJwPDfYG6pEhqWcd256v1Y6jQsnxubUuehVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUgPnBAk5FszYkHZMUFtZhDMoS3/l1wYrrluHV1ZAh3Z8CB/bQ
	PaBK3uHkrVAntaPwgPjT36vgu8iFqSKZQv1l1DF/902uPqfgx9jtLd+gkRp09/lgWjw=
X-Gm-Gg: AfdE7ckEBbxA4jtKCaQfJpjZ1fCdSCiB6J2SlU85+8r5S9C820/QkcKMmUIHj6+beET
	Vhww3lCnpLoEgfRDI9OV//X3+GJ2rGnlNNBrFrRtcjP+nQMTQMDPGeTJXhViJyPjLrrNAWN7D4u
	A05v/tPwRc8Lln1KTc2S+VW4LAbJnBmYTYxPM7Zc4XELp66R0e+3WX8kHayNerbekrEV5dJKqEN
	79huwVRV80Bmlq6zq20s/EjCvALY54iBZQdMggVPPBHHi/M1i3DsWYbFlQ27icGJN/3W4ZBHqGh
	7k2xQ9pQ0B7RIqVULBL/o0WnJh1GvxoH/wJy6fO5aH7rSjoPyzpmnWl0uO1ypQKH2hBTZcaHVws
	KNzriGhiXul0R8CeU92A1nlQAne/dMvxA0fWs2iJ+bPZ2iJSpADkUpIIJlN8aorRfg4Z4L40scs
	uwhK7NWFFsopPneBpuGu4riYmN+DxfSVwhPWd7b63fLOsNyjvr9Sj2ZjhlD18W/HDvyD4=
X-Received: by 2002:a7b:c7c5:0:b0:495:41ea:f6e with SMTP id 5b1f17b1804b1-49542894bf2mr122233325e9.8.1784473339885;
        Sun, 19 Jul 2026 08:02:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee9281sm23508925f8f.36.2026.07.19.08.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:02:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:02:18 +0200
Message-Id: <DK2N06S7DNIU.3NHYH9RB4Q2DZ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260625125532.185380-1-hprajapati@mvista.com>
 <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr>
In-Reply-To: <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241288

On Mon Jun 29, 2026 at 12:27 AM CEST, Yoann Congal wrote:
> On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.openemb=
edded.org wrote:
>> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>>
>> [1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f=
20d442df192b83
>> [2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22=
ccce4f5ce05c84
>> [3] https://security-tracker.debian.org/tracker/CVE-2026-42011
>> [4] https://gitlab.com/gnutls/gnutls/-/work_items/1824
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> ---
>
> As far as I know, this fix is also needed on wrynose:
> CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wrynose=
 has 3.8.12.
>
> Can you send a fix for wrynose so I can take this one for scarthgap?
>
> Thanks!

Gentle ping for the above

Regards,
--=20
Yoann Congal
Smile ECS


