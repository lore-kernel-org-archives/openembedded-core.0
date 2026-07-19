Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A6AC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 22:23:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.541.1784499818424808950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 15:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VfHwVpww;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so7700965e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784499817; x=1785104617; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QrmzohfBd+67ZJqToh2067+6fYj9YBJ0p0RF5j0clc=;
        b=VfHwVpwwK8JqsRM/h/y7MK7qlV4JASp59Hj6LAGiIkrkXJaWLhXgWPXMMbh1J/NNWE
         Tl7hGp7B8z3RERMvWzU0nAQtW3xIBkcdlHUbnM/Bs/HoWbKw1mgKFoRXxTHfkXWJKwwT
         4K1Hdl3+VSsnJGbZkXpfMLhOSPrwTr5NN7qns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499817; x=1785104617;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QrmzohfBd+67ZJqToh2067+6fYj9YBJ0p0RF5j0clc=;
        b=MO7ojsVWQ4XcTujLBGyHIfEZPcRFqGlzT/yiKDtUPnQDXiNeO35uwhcnYGMTtlez0s
         jXE8PP1wYj4OHEEEs2ZjgJlmyxemTi6mm2nfyRetdpO4wF2ku7st3eqouxkT1BhM9izF
         zAufKnOq/lmJGn1KONIQTht/qIK0dwsx9oj02PTCVVqWcYAp/OVfcr+Mn8uCw4mvnFM8
         PFU3IkIiDMZrFTpAdXkThCHGMm5QyyXQ5U+x89J/RUNpHYkxuxx8JnqFFexNgUiRw3ub
         oF1llNn4QoBBMIbTQMGAVF/GZ2N01/4lZ2QFbZ9GrU/CyQtoeSpSUv/BvCXT9rK5FxX7
         UKwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7uhHiCSflFznD6GnBSQK9o7sVMbOPlD4LMh5jzF8IHA+7ZjNH2WF3hKygWUtUeY+cDcVRH5753+zgYm84FPxggQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywKniVv8GeDo+QMcdjV9HV5zz8tUUcyCNMWRE469LmX3XOOH+l
	62j6vil02tFt0038Q1cmXq51hu8FaAbz04Bs05qxN1xwtC1Cq9C7LYvpnvutOKTQnSc=
X-Gm-Gg: AfdE7cnByWYi1KBRGOmZSOpXnMzacs57UVq4YrC4fFnhhK5ULleLDUoMX6V9clZPD/P
	cuNf2wd/C8vpQkSzDD8NP8B5kAaZMMs+yYAnhtZudeBL/aBXCHb5glOdzSd0GEegt8iL0Q7pbxw
	IYcQ3fdNFv0jBvzAayniYRDLjrHT5fFqwo0hD/YvKb9I8ua5qLfmKmJPH6dQswe3XyHq61Rc5kD
	DoPqnk+aPe/cDO65wLqu3Z6zfIqDxUkVSfvgGn9esK6TDrLWKkitA6kNNtIPVhCXZjycz31IK47
	pstmwV3eti70EAskZiIZCCMFVO33TZojFuO2O/61HJV6jUySX6pZCFkObtjrEnMC+IVzxQ3ysBA
	DGSgDyCUqM7ZoZCa+bnNEuEhme1K8Pd4HL6n0adOJXLf3ZyLdCeXVsGGzlvRqSD6LUgcOS3kNP5
	No7kb0Xfhff80Pg3jxzEzdSJKVtkFb2ShN69FrGcmUTDtNqHnj2BuMSTXhLYTK4F0uIo0=
X-Received: by 2002:a05:6000:4817:b0:47f:6b9a:9d54 with SMTP id ffacd0b85a97d-47f6b9a9fabmr8405584f8f.7.1784499816646;
        Sun, 19 Jul 2026 15:23:36 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeece9sm23493668f8f.37.2026.07.19.15.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 15:23:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 00:23:35 +0200
Message-Id: <DK2WE255LOS1.1RK115HGQWWAO@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/6] glib-2.0: Fix CVE-2026-58010
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "deeratho@cisco.com"
 <deeratho@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260715172142.1146263-1-deeratho@cisco.com>
 <DK0YOQ6AB7SY.CQYLAG61QCB@smile.fr>
 <AS8PR10MB507315DE4004CB2A27B81297FDC42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507315DE4004CB2A27B81297FDC42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241309

On Mon Jul 20, 2026 at 12:20 AM CEST, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yoann Congal via
>> lists.openembedded.org
>> Sent: Friday, July 17, 2026 5:46 PM
>> To: deeratho@cisco.com; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][wrynose][PATCH 1/6] glib-2.0: Fix CVE-2026-58010
>>=20
>> On Wed Jul 15, 2026 at 7:21 PM CEST, Deepak Rathore via lists.openembedd=
ed.org
>> wrote:
>> > From: Deepak Rathore <deeratho@cisco.com>
>> >
>> > This patch applies the upstream 2.88.1 backport for
>> > CVE-2026-58010. The upstream fix commit is referenced in [1],
>> > and the public CVE advisory is referenced in [2].
>> >
>> > [1] https://gitlab.gnome.org/GNOME/glib/-
>> /commit/be85f9429bb66412a9775440a88cb115803ba897
>> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010
>> >
>> > Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>>=20
>> Hello Deepak and Adarsh,
>>=20
>> You both sent backport patches for this CVE.
>>=20
>> This CVE (and I bet others of this series) can be fixed by upgrading
>> along the 2.88.x branch of glib. There are precedent for glib upgrade on
>> stable branches.
>>=20
>> Can you look into the glib changelog and see if there are changes
>> incompatible with our policy?
>
> Hello Yoann,
> I have sent an upgrade patch.
> Peter

Sounds good!

Thanks Peter!

>
>>=20
>> If upgrading is compatible, please tell me and I will cherry pick the
>> upgrades from master:
>> glib-2.0: Upgrade 2.88.0 -> 2.88.1
>> https://git.openembedded.org/openembedded-
>> core/commit/?id=3De2063c252d1ab3188e74e9eced91bc17463d6551
>> glib-2.0: upgrade 2.88.1 -> 2.88.2
>> https://git.openembedded.org/openembedded-
>> core/commit/?id=3Dc22a7bd7ecb463da212c25a5aa81a19992e17e1c
>>=20
>> If not, ping me as well, I will then resume reviewing this series.
>>=20
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


