Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EC3C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 16:44:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155579.1783356286896846307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OWEIJxs3;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso932790f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783356285; x=1783961085; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to:cc
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+WE5NB5WoWo3XK5roRWNaStkR+S5cijwnrH7DHPKaU=;
        b=OWEIJxs36rqxzeaVEYo23E+BBEH16lo4iBS5E4rAkDnIQjQ7KQGml8nl2/QEMs2IWQ
         492KvqXpTH//BReX1CfqxyBi1GkYH2ZR2daAlO6U7AzlgpWUZUxke48QccQWGz1gq2hv
         JAaefer22KIroMHU7IM6yDDTqE8u7My6LlL00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356285; x=1783961085;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to:cc
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+WE5NB5WoWo3XK5roRWNaStkR+S5cijwnrH7DHPKaU=;
        b=JiNuOVGhD9eLcYIAikyNkSEVCLibRxBt8cmGGorKwhDCq/X9TWaf7vL2UhtWw4C6IU
         BVXnJ9rUAKi7MwMK7ktA0BIO66wsf4ZBiTDzr99D+W8CcA0JHsRRpV6g6uRbUnoczMW9
         MzQxq8dYTbHaW5npir+D9noo94BGkPQThZ98RDmg+nQNhb0RwFK81Gwt/+WuMHSrjRxj
         pDwjCNHb45rVK03qJM4YcFPzb7vHi1RFa3Uqk5j3qjMgRbJ7M+LhCxltisYUuCgqg94L
         zrYGGU1slXVSzBZmrjze1MGHccRQMdz3Aj7NUgWje+Tsss5P8nmFh84L3LOj/pHFtG0P
         go5w==
X-Forwarded-Encrypted: i=1; AHgh+RoCdqNG+5/6bdiDwKuOEEdjQMHW8Pr+CS+ERvQpcsaUn3P+mS4730bleIY3T/YpJSFCqa7LvkYkgYRpBN1fUjU2Hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywfz8GRfyhtpKlvQ5ioPccUeoqB+P3rWIkf2qgjvU3rfecRlyk9
	X0UM89FKIA910htAOWJEE4CXkSxkKZw/xBu2tN5266k1kmz9J1qoxJkm10hXfuuJCUM=
X-Gm-Gg: AfdE7clc3nsxUIpOymJri+e4J2ltYbO4h3L1oc5cJrKfppCBPYcyncWPiqDcok9NzVF
	5mfQ0RpVExUJqHwtJrOTq0P6sTStNtZj4GHVUGg25PW5iEau1YkN7c5nGJb/+Rz7blxP04jERzO
	5cRujT4eprzMX2cmrfOW3ZHR+vqr0Gen0gnS8eZD+du2wDA00A0aTciWozJFeNnMSvvjkST4+8J
	fs1v6zTr9rP0qEcrRBnPwDkXnIsmIXb5NUNXxvFH4rMv0AeAl9vNKsuCSHcqm82le70YzKuO8kn
	MCptW8/5aQ7rQvxHFZDKGAlKwPjwJro5qlTmbqHBxBSDKFaZgm2SWKFkzOSWadk7V0snS4Q+wjo
	RT8oPxDqunZpeCcyEFQMdRsMATtnrPk7rKauwxR/nL6cFPL5uigvvxBVCCDTN7DODKxectBsAji
	0h87fMTB80AYc=
X-Received: by 2002:a05:600c:8119:b0:493:cce0:3757 with SMTP id 5b1f17b1804b1-493df062c33mr15617035e9.4.1783356284721;
        Mon, 06 Jul 2026 09:44:44 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm372886885e9.2.2026.07.06.09.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:44:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 18:44:43 +0200
Message-Id: <DJRN1II8LYOQ.1UZ61N9NS4OI8@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <jeremy.rosen@smile.fr>, <adongare@cisco.com>,
 <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260601134257.47867-1-adongare@cisco.com>
 <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr>
In-Reply-To: <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 16:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240280

On Mon Jun 8, 2026 at 4:44 PM CEST, J?r?my Rosen via lists.openembedded.org=
 wrote:
> Hello Anil
>
> from what I can tell, this CVE was fixed in master but not in wrynose
> please submit a patch for wrynose then ping this thread so we can apply
> to scarthgap

Hello Anil,

Gentle ping for this patch, do you plan to send the needed patch for
wrynose?

Thanks!
>
>
> thanks a lot
> Jeremy
>
>
> On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Anil Dongare <adongare@cisco.com>
>>
>> Pick the upstream patch [1] as mentioned in [2].
>>
>> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D28=
6ace1259992bd0c5d9016715833f2e148ac596
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>>
>> Signed-off-by: Anil Dongare <adongare@cisco.com>
>> ---
>>  .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
>>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>>  2 files changed, 163 insertions(+)
>>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patc=
h

--=20
Yoann Congal

