Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1905.1795105940312516008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 08:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=foZHsohP;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so26569755e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795105938; x=1795710738; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6xfc6Bqi/2u20aJyNhlxmjqkTY86JQLUFRZ5rhrgHg=;
        b=foZHsohPV/TYitokWzq3vVEKmXo8B69gMtbdLjLOwf1p9m7VqJfG60gmNWTrtn5szo
         Wk3YYHsYtI7Fawwy8JlhgNcIJZJ2gkYEaeLMHZHnm4o+yXA9ixNcNmE28u1rVr2JwBVQ
         7xDDySmmCSqETAPK2iF6JoppcjYgDEA38dF/U4ACmO9EX7ZSA+jufUWZhBDZjhuMDg0B
         +0hZGOGYdMRcZLzCS5e6sg/YGICNPAh2+8S+LS/AS7szazbsPsJUTTzTcc03I6osgN9b
         IV8AInk/HY7ezBAUjsRSCzJbYkLFDYa4KWmcKMmeapmqa2tENondUd2pVqrFcMik5Q8g
         1LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105938; x=1795710738;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6xfc6Bqi/2u20aJyNhlxmjqkTY86JQLUFRZ5rhrgHg=;
        b=F4Z0mhVnztjoiO1wzjss8gQQhOkibdE1CXaUTgOzukiplqH0BR3DeK2mK1yM5KfYG7
         3Uubo7+cW4XaYgnd+/Gz/aavPQP79K11OXqtz8n2ZyoM5ae8hkxiCkApWhV5zZmbqFFM
         0nU+NvP9xyWKjFElEHbcr/lI+Y8Z0knnknZra+BXXWACR+SrB1w74iRIRcvSqiXmGs3V
         94aeslkMEjN73e0LbBkFvfkiMp6R8c+7x73xGy4R61H+F81UQIzw+JgmDOmQBOF0TWch
         09HGf/BOoJgQju9VsCeyBp0x/TbJ/GkRi2WgpJ2x+2Hp44ewRQ9zF80CYMovOmUZLPQY
         PUmw==
X-Forwarded-Encrypted: i=1; AL+hErEUpvgI1y7IMSlLtGp8Myk1tmVod7PktSWbCN/5vHCaml6bHoy9DmzzxTjcMpQmUINQapGuDJJT6W38xcopYddZMA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8UpvMOANpEM/6HhBaq5WMSBq+kRIngNntutOiKMGYiSL0MnP0p
	0aHuvXvVFGZc4+VSpARDBKi9FJ8pd4af9UHOZ6z0rWuiqevexGGVIRIGksECEOI8iT4=
X-Gm-Gg: AYBFou2ZRuAwJruFvVE3tpU9D/w6K4kr9xnBKmdFu/6JpKBbHtzVas4zOb543NdbpqT
	PmteAZLv5mbGuZTF83VGM9isl7/x+QkbYrBePrckWb4uJoa7hFvRBys2gjeZDRNvVXlDfe6LCIk
	qN+ywL8+hLK0k5bmLwCr4cwInGI3oWhQg9ftu8KlslHfU3MHqNevKTlQ7M/OO2Wz7VnVZPafa0+
	JtGSsAyEcTZoqQqyatHncBAdopIDHJ43O05toPfY8ECl/5rmp1V2457/CyBdv1t56dWzhLOrXLk
	5fSYYJVFzeYJbxpJ8wPWBkIfSJlUOvoGV8gicwzUKraHy05dRR/DgF2hYpQjZ11txXGos5Qo04t
	sZ5pSZbQXNuh7YPHzx39wHZWZ3WMjgSIESJMDbxqKPeF/fbiGl+bqtOpp3//zenakhSWfV+cPOx
	HooMdd9VES71gflJ+Xtdve8OGsn2Jnp1WsOrtA/Wt3p/in3d9iAMoz0iFe0DzdbRb62TEg5Aa6Z
	M41qa0FBaYOzEoIcnQcgXTUi/jo0xZU3FsKQtY7RcRpGMIyMVgUXeTAxviNTb/3zkAnfrDdkRSU
	tD9tgfF1cGSdUh6HuRFgTfRaD9bPVhykSW9mgC5fBWsZbmNSMeyA+kaJFos4bh7FEfiXKgR2EOc
	zAIzBTOldYEotYCkkIJvki1/rkDHhsK7IdY8QgA==
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr444625e9.16.1795105938264;
        Thu, 19 Nov 2026 08:32:18 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm39679035e9.4.2026.11.19.08.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 08:32:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 17:32:17 +0100
Message-Id: <DMZBY36PKSWI.2LL0TBN45MSM4@smile.fr>
Subject: Re: [OE-core][scarthgap 07/19] TEST-pseudo: test patches
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <fabien.thomas@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1795101267.git.fabien.thomas@smile.fr>
 <bdb4753f398e8ed8d036cdd38c6dd2eee5e482f4.1795101267.git.fabien.thomas@smile.fr>
In-Reply-To: <bdb4753f398e8ed8d036cdd38c6dd2eee5e482f4.1795101267.git.fabien.thomas@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 16:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250709

On Thu Nov 19, 2026 at 4:22 PM CET, Fabien Thomas via openembedded-core wro=
te:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> ---
>  ...ree-tests-when-the-function-or-sysca.patch | 157 ++++++++
>  ...-t-generate-unused-_int-paths-with-n.patch |  59 +++
>  ...ts-linux-Don-t-require-linux-mount.h.patch |  67 ++++
>  ...004-configure-Require-GCC-5-or-later.patch |  76 ++++
>  ...erialize-path-changes-across-clients.patch | 339 ++++++++++++++++++
>  ...ath-lock-in-create-and-metadata-wrap.patch | 182 ++++++++++
>  ...ted-files-under-the-path-lock-before.patch | 248 +++++++++++++
>  ...s-Add-a-parallel-create-rename-link-.patch |  87 +++++
>  ...Add-information-specific-to-file-pro.patch | 216 +++++++++++
>  ...S.md-Add-to-assist-future-developers.patch | 113 ++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  10 +
>  11 files changed, 1554 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-test-Skip-ope=
n_tree-tests-when-the-function-or-sysca.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0002-makewrappers-=
Don-t-generate-unused-_int-paths-with-n.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0003-ports-linux-D=
on-t-require-linux-mount.h.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0004-configure-Req=
uire-GCC-5-or-later.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0005-pseudo_client=
-serialize-path-changes-across-clients.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0006-ports-hold-th=
e-path-lock-in-create-and-metadata-wrap.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0007-ports-check-c=
reated-files-under-the-path-lock-before.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0008-test-parallel=
-ops-Add-a-parallel-create-rename-link-.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0009-README.securi=
ty-Add-information-specific-to-file-pro.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0010-AGENTS.md-Add=
-to-assist-future-developers.patch

This is a test patch that should not be merged like this. I'll do a
proper upgrade in the next series.
--=20
Yoann Congal
Smile ECS

