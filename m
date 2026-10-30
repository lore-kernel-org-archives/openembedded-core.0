Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12861.1793370574523298398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=cjFeIQ6X;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so4402315e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793370573; x=1793975373; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwWSVD3wTEkfGwqfT1ewyKDY8p5V8R2d16Pm48KwbVk=;
        b=cjFeIQ6XDnN6Qa5davxYQNWtGvIj1KI2CFUWN2CrTWmi/y1XOkiPukMI/S4y6Yn7Vu
         2HYPSRLc3tOmFbqr0oeylRSUOZJEg0tLqujmb4E/XEmJjkaRGz9U6g64lJ1R2DtsUst5
         U4agfOXrd4NEOK+ntw1OTHfmCig6AT5IuieMy7wYj9NjjGHX+bxKly9UbaInZQjU8mkJ
         1IrQLhv1wFEhBBtMcajteuIzD8YIOd2rzuoGDJI65gGJCkx4zj+scX056g0HYJSVBbgG
         7JH51gWGc1QmMB+wJurOIDVk8DXSRPJF7M+7FfgAmvyzAZMHblXTmVkvtyD4lxcyvLGq
         KqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370573; x=1793975373;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwWSVD3wTEkfGwqfT1ewyKDY8p5V8R2d16Pm48KwbVk=;
        b=jOoncRKiziFDz+ZctGAsZ59xha5ZWEE2cieG1cMd1if6/GOtOS3PqyuW+rbu2iAyew
         yNleSowmyBzs+mXIrKGDl6/yqJI5Tuu/VJhy9xINzQth8U1mAVNsONeyr/Z1I5xa6q2q
         aHiTGHpYrXF86qJFCjUQp4hRNYa03mFXm0FeIj2Bn91FhwMQnKjHm4NBWKvs//fpnZLs
         TRz9fs66NP17abFM/KMPhCZ0nbiizWNvOL3A0t/7vjI4HIf9MRrZ1oPoab9LPeAtijbn
         oKwNkuVtADwc0jQOdopC4CYJwxq0OMQoikSkfGndoHsNmKjzfuNcz547b8B1jrVg6c+l
         Xfeg==
X-Forwarded-Encrypted: i=1; AKwUvBzHq+YEbSVQ49BxOqULRLK5xkf7Ln25aju+o/7BMiByyIDSYS+BfOiMxvIvIcVCD+EdHnlF3NMe8f1lVD2+AxwQ4A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJqdJKsQroWfpjWUvjs3sR/ZXKh0ABcFETrpj9xT6D6wHF8ixWa
	7X6gz3clfdZ76WLh0tcKHlrC2VOF+YS4NdmG4FL8oUJoKGPp4JLXC4OFsGhSfzBHp9cTlCcM/jd
	xpRh0zi4=
X-Gm-Gg: AYBFou2uVFdTyPFiJHqs0xLFMNkuYweOuubgX57NWNWBpx/XbhTeJUwHaFXgQIy5M4Z
	YQQzwQoaOdl5yLHofB4G+VAR+92y99U5Ak4VKdjAl9gYoj52CjoInuVfqiPD+Ar2EWr7+uHWOdd
	GXw6w3lsdGtrItgnNtV/1FWDFaLnCNaMpOiwmoxPlLXrd9EuqMWRnhsHX6ybTL6IadVM3trU9He
	MiCsC6bqU5QB6odF0Yys396+Rq1iUn/rmsCKTUMWUztcA3/mkazhHsr8VlGbLy8mRlDNZgf/pjk
	PrtaKxRIE7WpsgoTWN4cLUyWAacHPGWAsV65QQ8L5rMSKAIbV/DO4pDSv88ER1i3n1gnO0ouHPE
	5YmOb5batKB+FeF6ha31vtXsu9kbs1UV0W+xFDYL0Si0XncqvvV+T3gz+84glF7g19PWC8p0EGS
	o0tqRkZRKO947UFX0wvqX2DU1XVqncjivv0snckl4TB8DZcU/bWQ/Eiw9ksxda/WwOrIFcKHUNo
	Te8SFMA5409EjZ4kfcJ3DYoVvQ3hpYjuV7kwtzU18R7+zchGBcqZsnfyW5/xSnNtJlyE1CvQLML
	51wL8tQG1nervi/+bmvyyT+XEovZXuRJ7TPKaaWFvMxIrDf0Iv+RANsDf/i7fSs/gpPtfdZAMER
	2CVCvFsm65fafkEHu
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr55026585e9.24.1793370572769;
        Fri, 30 Oct 2026 07:29:32 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm156672935e9.10.2026.10.30.07.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:29:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 15:29:31 +0100
Message-Id: <DMI8T75J2RLU.2XXJ5T2RBGCWH@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2 3/5] libsoup-2.4: fix
 CVE-2026-2443
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
 <20261014161209.2227316-3-jason.stasiak@garmin.com>
In-Reply-To: <20261014161209.2227316-3-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249045

On Wed Oct 14, 2026 at 6:12 PM CEST, Jason Stasiak via lists.openembedded.o=
rg wrote:
> Backport fix for CVE-2026-2443 from meta-oe to OE-core. Update CVE
> patch to restore the range-test validation unit test from the
> upstream libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).
>
> (From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-2443.patch   | 390 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 391 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-244=
3.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
> new file mode 100644
> index 0000000000..e4d5f184fa
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
> @@ -0,0 +1,390 @@
> +From 7bb3115a296154e3f465900ea5c984a493385a7f Mon Sep 17 00:00:00 2001
> +From: Philip Withnall <pwithnall@gnome.org>
> +Date: Fri, 19 Dec 2025 23:49:05 +0000
> +Subject: [PATCH] Fix CVE-2026-2443
> +
> +Upstream-Status: Backport [
> +c1796442 soup-message-headers: Rework Range response statuses to match A=
pache
> +191ef313 soup-message-headers: Fix rejection of Range headers with trail=
ing garbage
> +be677bea soup-message-headers: Fix parsing of invalid Range suffix lengt=
hs
> +2bbfdfe8 soup-message-headers: Reject ranges where end is before start
> +739bf7cb soup-message-headers: Reject invalid Range ends longer than the=
 content
> +]
> +CVE: CVE-2026-2443
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +Backport the range-test validation unit tests from the upstream libsoup3=
 patches.
> +
> +Upstream-Status: Backport [
> +5890c42d tests: Add more tests for invalid Range headers
> +c1796442 soup-message-headers: Rework Range response statuses to match A=
pache
> +6574a84f tests: Allow range tests to check more response statuses
> +191ef313 soup-message-headers: Fix rejection of Range headers with trail=
ing garbage
> +be677bea soup-message-headers: Fix parsing of invalid Range suffix lengt=
hs
> +2bbfdfe8 soup-message-headers: Reject ranges where end is before start
> +739bf7cb soup-message-headers: Reject invalid Range ends longer than the=
 content
> +]

Please split the backports into separate patch files. Also, only one
"Upstream-Status:" per patch is expected.
And please use a commit URL (like in 1/5), that way I can automatically
grab the upstream patch and compare it with yours. It also helps manual
review.

> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> +---
> + libsoup/soup-message-headers.c |  62 ++++++++++----
> + tests/range-test.c             | 149 ++++++++++++++++++++++++++++-----
> + 2 files changed, 172 insertions(+), 39 deletions(-)

Thanks!
--=20
Yoann Congal
Smile ECS

