Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15166.1795516215411431953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fVk2Jxxl;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so54880915e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795516213; x=1796121013; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bJgDx9xFQxAbyRcCuQdTRJ76eGtyq1IQ4otGYc4vzg=;
        b=fVk2Jxxl89BVfx88ctkh7zUBxYuo9axyeAmpCfSsDVFFs+uqidmp2XYSHMyRuADHJR
         nIn/LAK+3O3UV16FWUjjoIUykv4qZz8VG4eQQivVUAfZoHQLMqm8dvakHRilxZ8O8Fj9
         327UUQNOmoa6/7z+dbT/ND1mpNX0pscVbebO9HuZ9LgTgTb828a1t32BR4WVaFSgFXlk
         Be2Znc0nc3zHFshcaTTpea1RCGr9KmjnkFQelKVOqYG161V8n9qgouzsZx1glj5G52zV
         HXVlvPtWfYKQzBoYDlLtTv7KY7SvqutAZzlhGprOK7iu0DuKnfREnOvDtxLrj9wpKrhl
         n5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516213; x=1796121013;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bJgDx9xFQxAbyRcCuQdTRJ76eGtyq1IQ4otGYc4vzg=;
        b=GhMcovX4qtFZeaLFPjZBlQtOlsutjRKNBiCFS3VYoFMjnLifHv8c2pqZFysyHaMPVi
         7wgc76HG0e4cDkXdIgATBBv64kCft7HQAjpk7D/SigygMXbkglsxXuT2FWItqcl2yNpv
         RvgJo8TYXPF2pZUAgiqySho7vHLitp7Xt4xsmzwMmy0F3jjQ+Qj2wVXfaZPZzU1mkg+J
         jZm/GfX1cC/EyKOXJWEmqLR5jS6GecNmEfpedenb/+Zv5ZMznxWSzth/pek2MA6Wcvvo
         dOiCE/ACYQtOW/qltuX+HFXMlV42hJ+ZL9BUT+HOsrTiyRkV4rTR4yZyenyC7Py+JZcb
         7CEQ==
X-Forwarded-Encrypted: i=1; AL+hErFjQUpGEj0S7xlIHzupWwSGhvAgOkklEuz1+nmiB+UUxOxfEJWnEY3IblhBWcp+dgzAUpkK447skh/dV1lkxhsWjw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9zIwdqgbplOj1EutedWIhVr7UMg1NhJLfgpxEyFp2107kaCRvq
	o8oZCi+ZT+9M6LhiP7WfVt3pdtdBELaK8uYpl5RaiTeQCZMm5QA9pmU8dZISPTxXzgI=
X-Gm-Gg: AZFdTZfCx98w8gw7iyqJDRZeksFmpYxdY/ndg8hGuAsBeH1KXCOsYrakmlX+21rja27
	5McfhksOyCxSJ3Fsx5CtScYJ4ct/xm9MugD+VUB+ut8wkXzd1Dy/S8nFEGv6TcmmuX+wW50KKam
	9NdgBOcNPUfxqyDdCY/AJGbGXw5yiS+/MD5HHcMKj58zRH6VKz59+xAcCb8D5iTJXW7aCE9hNTi
	pDW/tb3uGrfbogh1aUaKS2u41hIQX3yaTAS+M43MjurIQD0lk6fcDDAnMXO5ZJX/agizRLLpehm
	EdzVFLgX9N7FfBEwN8Qmsz6A7lo8TToHsbX7GEPSfrBtaM4hBnZNzCAo+5Ie1nq2ScceRLPtSAL
	5vrotxJarx7Jsb74q8oYkOzBSXHlBL+lXh1nW9FsZ9OIOng9ZK5wJEKHptqoDC/ejsnTAE2FX4w
	2PO025Y/rGkktD1C9LlRqkGJF0Eie+/Fb0nvtkqWDHn0CwsikUEhe0nXwzcaSjdWTbnoWXDsYAN
	GAMBiw94H3oNzgebFHhM3yAf4cLQWlzoLMV848X6WqdBvpkbQeNKPAdigGIB5FjCbhBZO1nHfWJ
	TMUNvaggnHdL+ADA3emficzTq3ZK2GlnpEq4+9EFGSSa293LjfiJv+WddKuXJSRV1okarTYOZIx
	1YJYVdTX0KW1nZU5K
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb88800013mr312725355e9.6.1795516213439;
        Tue, 24 Nov 2026 02:30:13 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm24957809f8f.23.2026.11.24.02.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:30:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 11:30:12 +0100
Message-Id: <DN3DDL0KZ6NW.BK7C0Y2NOT0B@smile.fr>
To: <rsangam@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] libxml2: Security fix for
 CVE-2026-74860
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261118112839.94636-1-rsangam@mvista.com>
In-Reply-To: <20261118112839.94636-1-rsangam@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251003

On Wed Nov 18, 2026 at 12:28 PM CET, Rohini Sangam via openembedded-core wr=
ote:
> Pick patch from [1] also mentioned at Debian tracker in [2]
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/f41e1865781f74d1cadfe=
2fbdfeefed946026f12
> [2] https://security-tracker.debian.org/tracker/CVE-2026-74860
>
> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> ---
>  .../libxml/libxml2/CVE-2026-74860.patch       | 35 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch b/meta=
/recipes-core/libxml/libxml2/CVE-2026-74860.patch
> new file mode 100644
> index 0000000000..0a56282bc4
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
> @@ -0,0 +1,35 @@
> +From f41e1865781f74d1cadfe2fbdfeefed946026f12 Mon Sep 17 00:00:00 2001
> +From: Daniel Garcia Moreno <daniel.garcia@suse.com>
> +Date: Tue, 10 Mar 2026 20:30:20 +0100
> +Subject: [PATCH] python: Do not decref string after adding to the list
> +
> +The python API PyList_SetItem function "steals" a reference to item, so
> +we don't need to call Py_DECREF here.
> +
> +https://docs.python.org/3.13/c-api/list.html#c.PyList_SetItem
> +
> +Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1076
> +
> +CVE: CVE-2026-74860
> +Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/=
commit/f41e1865781f74d1cadfe2fbdfeefed946026f12
                             ^
FYI, this is not the right format for Upstream-Status.
I fixed it in my review branch:
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/=
f41e1865781f74d1cadfe2fbdfeefed946026f12]

Regards,
--=20
Yoann Congal
Smile ECS
