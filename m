Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D797CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:58:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24534.1780405086978793212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 05:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KnNcaljO;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso14845055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780405085; x=1781009885; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfwInhi6049n01jYTodP1OGCrHCgyRzavCzuEzNHJE8=;
        b=KnNcaljORr6+jpyzblxCEHvE3GWPc+BUJoF1SVhCgyoWwQ8jDC+qe2H2ZPadvY8gK/
         nP7CL3LS5zxbmS9OSIvEggl1s0sYX6hkabityIWdU0T9VEJUSNSpDbLzZouwhLb9oEPa
         H1fwc5ltnGq3yiBs5vdfAU4TDbThqUrcOHx48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405085; x=1781009885;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfwInhi6049n01jYTodP1OGCrHCgyRzavCzuEzNHJE8=;
        b=FzJQkzeoHfXX6O2djfSHkDBniQ+Zo1DxfeooMTlsPIhEGLQbr15GVsXqD3I9JykTT0
         qzrk+E81GkC1mJEgftR3YC/VO/xyp3QqzGlkgeb9A0PbL209DBjgfQfGhup3OvLmUYSF
         GgY2HxlwSWDGmR5tBsNBZh2k54OshUfBt6JEAsK5Pbis1zi/7hFydFlJP4ie9j6Kp9uO
         XAf9CSAKkjjZMij1v4t5KXCTEaKEGJl/owYYXxZ7fg9e+y1Y4Qpfbrz8lhxNtFhMwD4C
         wCMMNY/WB6f7wrndoOvuOV7v8BXhhPeiyTwGZbUqdNI4gwH1S3ic/dQ2LFifYeBTrjRh
         Bomg==
X-Forwarded-Encrypted: i=1; AFNElJ9EqU3ez5TB9YBzKxz8Scsq8US+mMNTeG86+CHaF3gqCIL+J+XjhZAcvErhQlsYVwb7Q40S56EEUcjgIpRRKWlA3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRRrYnXOf526IwjKTygeRoiNNnpZLxhDNMUSKvNBSiq+Ju0wxN
	rHYPmAFxcBf9eC19kKXYvlAmjtqLPV6TwKCghjdiATfQJAvvIsUTzKXTKcuiwhllJEM=
X-Gm-Gg: Acq92OEbiigTLAZTPNsUNRKcwkC8zSf5TjV5hqutnyfUWwf8FMQZWiZNIi9aEgMFtKI
	N44vRiT12aXJ5rgKCg2oHwvpPFKjrCvfsC7s9exG387Gwy7O1jpyMFdT/o9e3DQIsH2DyPGV6Qe
	YpUo4VOgr4R2DyftrEdECNn3lwfO6y6GnG0UNb/rdxShrGQVzDvWOc51cWrJWtKWQGxYs05Vx1m
	CQ3HkK07hbAsuL3fl9fKQEonWt0+CWIfnhhiicPTRvgrZxy5MeLlo1CyK92Yqv5+NHSF2P0x5Kv
	nMyCWm9hcaqRe3YJzHLrG0RfInZnwZZlK2VAOeBYXEBYtQlqIgkYvYAYw9+/PPDSmVvlOgFo71l
	g5GieKgYky1FD9ECcPjQIatjcEaV4PD2JdejSPBSJVC3Y3SNa/ukSkeAC86ptEk2czvsF5tbqR5
	ZZ2i0jY21Xi9omVyRB5iZX1RM76MnAYUD2mx+wqXRTan3McVaGdfhmsQQ64lRYr8CYi7jZ18Vak
	s00LzIJZRWCipLbkkizow==
X-Received: by 2002:a05:600c:3587:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-490a2941425mr298049115e9.29.1780405085220;
        Tue, 02 Jun 2026 05:58:05 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm57149215e9.9.2026.06.02.05.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:58:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 14:58:04 +0200
Message-Id: <DIYKXGF7JHKH.33C4968AVKRK3@smile.fr>
Subject: Re: [OE-core][scarthgap][patch 1/5] xserver-xorg: Fix
 CVE-2026-33999
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260512085923.820545-1-vanusuri@mvista.com>
In-Reply-To: <20260512085923.820545-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238046

On Tue May 12, 2026 at 10:59 AM CEST, Vijay Anusuri via lists.openembedded.=
org wrote:
> Pick patch according to [1]
>
> [1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
> [2] https://security-tracker.debian.org/tracker/CVE-2026-33999
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>

As far as I can tell, this whole series should also be applied to
wrynose and master. Can you send this to theses branches and ping back
here?

Thanks!

> ---
>  .../xserver-xorg/CVE-2026-33999.patch         | 49 +++++++++++++++++++
>  .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
026-33999.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-339=
99.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.p=
atch
> new file mode 100644
> index 0000000000..cd3bf47397
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patc=
h
> @@ -0,0 +1,49 @@
> +From b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b Mon Sep 17 00:00:00 2001
> +From: Peter Harris <pharris2@rocketsoftware.com>
> +Date: Thu, 15 Jan 2026 15:54:09 -0500
> +Subject: [PATCH] xkb: fix buffer re-use in _XkbSetCompatMap
> +
> +If the "compat" buffer has previously been truncated, there will be
> +unused space in the buffer. The code uses this space, but does not
> +update the number of valid entries in the buffer.
> +
> +In the best case, this leads to the new compat entries being ignored. In=
 the
> +worst case, if there are any "skipped" compat entries, the number of
> +valid entries will be corrupted, potentially leading to a buffer read
> +overrun when processing a future request.
> +
> +Set the number of used "compat" entries when re-using previously
> +allocated space in the buffer.
> +
> +CVE-2026-33999, ZDI-CAN-28593
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with TrendAI Zero Day Initiative
> +
> +Signed-off-by: Peter Harris <pharris2@rocketsoftware.com>
> +Acked-by: Olivier Fourdan <ofourdan@redhat.com>
> +Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
176>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b]
> +CVE: CVE-2026-33999
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + xkb/xkb.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xkb/xkb.c b/xkb/xkb.c
> +index 137d70d..2b9004a 100644
> +--- a/xkb/xkb.c
> ++++ b/xkb/xkb.c
> +@@ -3004,7 +3004,7 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr de=
v,
> +                 return BadAlloc;
> +             }
> +         }
> +-        else if (req->truncateSI) {
> ++        else if (req->truncateSI || req->firstSI + req->nSI > compat->n=
um_si) {
> +             compat->num_si =3D req->firstSI + req->nSI;
> +         }
> +         sym =3D &compat->sym_interpret[req->firstSI];
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> index 7f6197a0b4..ef7f5c5bdb 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
> @@ -5,6 +5,7 @@ SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only=
-for-pre-gen4-hardwar.pat
>              file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch=
 \
>              file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbIntere=
st.patch \
>              file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
> +            file://CVE-2026-33999.patch \
>              "
>  SRC_URI[sha256sum] =3D "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f=
2994deff90116352"
> =20


--=20
Yoann Congal
Smile ECS


