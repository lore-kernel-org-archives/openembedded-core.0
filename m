Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCB9EEE268
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 21:26:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.59557.1726176369234202207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 14:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sn+IhAZ7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso2667375e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726176367; x=1726781167; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pbLsAlltFTXYKqoV2MxvUJ2LZFMBkcdkJqUEeK1pr0s=;
        b=Sn+IhAZ7CpGHw27NBUCkgktP3NfUnPNtgxL7HEBKFyJDOqVHCiXEX189b/Omq84HUi
         XHmP81hGpQClCDCL+2qdrxALE90MBHT4mD0zRC2bc3ykmqTkMkqObLdDVYWUZbzTshfV
         VboddQCzNAKVKlPWgonUxmiB6XZZn+1GVqM6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726176367; x=1726781167;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pbLsAlltFTXYKqoV2MxvUJ2LZFMBkcdkJqUEeK1pr0s=;
        b=t/tI2T8qW6ZY8+38V9DTalgPPscW22F4qE6tiMzUlwRgqIqrHeiJyyK5IVQRX1+bBY
         8B6TEXWsws59xAV7UlnjVIcbdDBemQLMruJYIHyuWYqF6LZAEU/0nIDEDcdpbc9CoIos
         gGhlXS1AsjXUwiODbiXtoEXCHmcCCowD7Vu3T1xOnxrz29LLnMXuhVKZfYCUYgSgtFmT
         lsD2nsi0KPS/NuMLRO2i0nqZJU5isdAtk1sbiKF9S93UvzfWEqMXgiu086M3OXHO7hax
         THKe7a0PmJWmIRJAe64mX8wUhDMhcfzCWt6FWGG0aVNw0Uh6Lr6+osKYkyM/UxmQGCmO
         Do2Q==
X-Gm-Message-State: AOJu0YziSm2HjyvdMO+nV0a7zFde/UbGkq3g/j9gBv1ss9P4aSesuptG
	8gi0o1QjYMxKQt20piE8o7UKelGOChFT1NaRjXyRuGw+YckDKZFTfLyvoRd77UNH+FtiEwQ2kvR
	S
X-Google-Smtp-Source: AGHT+IGJMemIVzNVNaOA3dHBVm/m1kCrmy8lEz3j5Ag0Zrb6azCXOkND3piUw5dla3wvi6EQSJ9XVw==
X-Received: by 2002:a05:600c:3b23:b0:42c:b62c:9f0d with SMTP id 5b1f17b1804b1-42d9082739dmr6634215e9.17.1726176367376;
        Thu, 12 Sep 2024 14:26:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d743:6685:2831:83f1? ([2001:8b0:aba:5f3c:d743:6685:2831:83f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b194c57sm3269355e9.48.2024.09.12.14.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:26:06 -0700 (PDT)
Message-ID: <406bd3f38590ea10fd54a0cfbc6d17a748897020.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: Upgrade 3.12.5 -> 3.12.6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, "Divya.Chellam@windriver.com"
	 <Divya.Chellam@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2024 22:26:06 +0100
In-Reply-To: <8940EC00-1BE1-429E-AFE7-D250C9196351@arm.com>
References: <20240912064407.2503089-1-divya.chellam@windriver.com>
	 <be3c1eed539e0568b5272bb9f0e88b49f7cb886a.camel@linuxfoundation.org>
	 <8940EC00-1BE1-429E-AFE7-D250C9196351@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 21:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204464

On Thu, 2024-09-12 at 17:43 +0000, Ross Burton via
lists.openembedded.org wrote:
> Hi Divya,
>=20
> > On 12 Sep 2024, at 16:22, Richard Purdie via lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > Unfortunately "0001-test_readline-skip-limited-history-test.patch"
> > is still needed as it failed in testing:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6985/=
steps/12/logs/stdio
> >=20
> > Could you rebase that patch and resend with it included please?
>=20
> We=E2=80=99d really like this to be part of the next release which is
> scheduled to be built asap (like, Monday), so sending this revised
> patch promptly would be _much_ appreciated.

As I'm worried about time pressures, I've tried refreshing that patch
in master-next and am retesting...

Cheers,

Richard

