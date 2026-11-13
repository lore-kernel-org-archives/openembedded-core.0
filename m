Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2248.1794613956479878860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 15:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=g0jE/rXA;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24769635e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 15:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794613954; x=1795218754; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8fOJVfrFFZbrAmJ79CbaNybnM6+9GNY4rlbPS3cKkG8=;
        b=g0jE/rXArqsxBinFmUwWmvyKciUeNJi9Szj4v7zvx65tSW4+IT0+w1e1bJLd3I3fSn
         XF3mQ93c1LawjB35OU8fVdg9DMGQ2gQaiHc6mTiX3NTQxcpXpRsOh6nckmJ+VIMZyAEK
         aoOMBVFR1oVWQR/NhJR4nAy6DiVyWpTvNqocrVRBfzxnW/ryHWfazTdzxwsfqdLusJfh
         6mvg1bedCZAwGv7PUi8uUJ9HWVaOWOvpt1SvGg1/MUkwBhqneGJ4SWZpLvlIhyEb8lll
         JBSmufPYhbhq1Yq9RNzDq4pFnl/jQVDLzuKkE+eYo3KIdX6WrLMfnBfkFPoJsF5W9xR/
         DoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613954; x=1795218754;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fOJVfrFFZbrAmJ79CbaNybnM6+9GNY4rlbPS3cKkG8=;
        b=g41OfknFduOp9wSOu5qDXk0gJ/AuvhQo/jUP9Hvv2V418hAXlBAMkld96XhumVfhdE
         E36K8mzLHnH2B6vOK2S4Zg4jLzOWC7hCKOw5vc3lsS7Omw2VR464IQXz6YS1pUczTJfG
         u7KRt6ephnAhitVtlEJtWJM8+xoeAuWKYGu2nXiX8tKQB2qs/hjYm/4hbMMIVrqg16Iw
         vQRBwxyCDUozdXacQRwJAsfsSY0qSIYVtjbHBlkz+dfgp/kAgcscEvtSZxR6nClDnzW1
         DD8xiscwa7IJQUfba3WU68F5aISw9iYTnLzkAWffJjScwfPk4HgINdJS9H9Eokv9rd43
         qhUA==
X-Forwarded-Encrypted: i=1; AL+hErExvTy2GlXTTF4AX+jx/iex8UtexLPhrKomxjYSa90ndC+EAOjZokgZKxZ4ShOOJh1ehSihT3/6ACMhfLh3/lJNGQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/K2wm8OmOM93pe3PvXevvnHl/9vCtvXoiRokCBQQnRc5iLhXBW
	C0LJVS6IDB73HshBC05rmPka97VK8xSsPt9AGsqsM4lCKbLWpItz//IJqZ6djjDbob0=
X-Gm-Gg: AYBFou0xpzZxpOA+DglXqkw79HzsEONZSAZ2F6VkPfcSiu2T1oZvqlePW/jQyX1walK
	jevH1rmgOTlYfqX5rmzv3HJJvPer4KZJNB9WxAxF0HsSHFQzrb6dm/Ua3tyVXb4qtz/yT9J+oIt
	pKIsjmXJM2qQiBIoJw+EGOMhSkavGbIbLN9VlQ3un1/TstlZCZk36OelGuijdHOzW9PN54vtIR6
	+gGum0mjKYPX/rSMO95D7Cu4gCrNSR3q29T5Qn3XIGZFPb2nIVs9mujsQLSZytW4KTZbE04ahjC
	saIvS4XEUrTx4jtkw8nBJKYzgamQieOYMMIEN5gD5xQjsfD23nLPXHYJqyYK07hC2Ei405yWZYR
	h8HXaADKS6dj0MA/Yr/IVg0WpuobvxtYPspv8ZAVgcdQtys2iwe4WikXFsCAxkRxtpknA35o0SZ
	7ZCpMlrbQ2N/yzpoxI+xmWnKP7vg0dE+bNSRA3vtsnRjp208Rl9FNYRuSDx5Pc5w92sIz09LKFF
	DjcLdY5ju6ZT6aVrg4XrIO2/EpM3r9kGSNj046W8VNBx/QpBZIuN2hRMr+SdTEl09lFNH69UD0z
	dRZTzFbRhc26ODl2RkZK27/I/zd9nRLsHHzrb/bRQpr5I7JJLXhQtKv00gYx9GhjerLCBsPmila
	uJwUqNHuVY1haF4c2cw==
X-Received: by 2002:a05:600c:e546:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4bb55a87279mr70307015e9.35.1794613954502;
        Fri, 13 Nov 2026 15:52:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00d795e58479169e39.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d795:e584:7916:9e39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm22786155e9.10.2026.11.13.15.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 15:52:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 00:52:33 +0100
Message-Id: <DMUHJWSRQ76T.6J7L5GYY9LLU@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/1] rsync: upgrade 3.4.1 -> 3.5.1
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Jaipaul
 Cheernam" <jaipaul.cheernam@est.tech>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261030042054.1345082-1-dkelaiya@cisco.com>
 <20261030042054.1345082-2-dkelaiya@cisco.com>
In-Reply-To: <20261030042054.1345082-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 23:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250189

On Fri Oct 30, 2026 at 5:20 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Consolidate four OE-Core master upgrades into one Wrynose backport
> using the published rsync 3.5.1 release tarball.
>
> The TSC approved this exception to the stable branch policy for rsync
> on Scarthgap and Wrynose [1]. The upgrade avoids carrying the large
> security backport series and includes the regression fixes following
> 3.5.0. It also aligns the version with master and Blacksail.
>
> The release includes the earlier security fixes from 3.4.x and the
> 33 security fixes in 3.5.0. The affected version ranges differ between
> those CVEs. Version 3.5.1 fixes path handling, standard-stream access
> and other regressions introduced in 3.5.0 [2].
>
> Backport Changes:
> - Upgrade directly from Wrynose's 3.4.1 recipe to 3.5.1, folding the
>   intermediate version updates and source patch refreshes together.
> - Remove CVE-2025-10158.patch because its fix is included in the
>   release sources.
> - Refresh the three retained source patches and add the optional idn
>   PACKAGECONFIG from master, disabled by default.
>
> Upstream 3.5.0 security fixes:
> CVE-2026-53802 CVE-2026-53803 CVE-2026-53785 CVE-2026-53784
> CVE-2026-53793 CVE-2026-53795 CVE-2026-53796 CVE-2026-53797
> CVE-2026-53799 CVE-2026-53800 CVE-2026-53801 CVE-2026-53783
> CVE-2026-53786 CVE-2026-53798 CVE-2026-53788 CVE-2026-53789
> CVE-2026-53791 CVE-2026-53790 CVE-2026-53792 CVE-2026-53794
> CVE-2026-70461 CVE-2026-70458 CVE-2026-70456 CVE-2026-70457
> CVE-2026-70459 CVE-2026-70464 CVE-2026-70455 CVE-2026-70453
> CVE-2026-70452 CVE-2026-70463 CVE-2026-70460 CVE-2026-70462
> CVE-2026-70454
>
> The original upgrade authors are credited as follows:
> - Richard Purdie: 3.4.1 -> 3.4.2 and 3.4.2 -> 3.4.4.
> - Jaipaul Cheernam: 3.4.4 -> 3.5.0 and 3.5.0 -> 3.5.1.
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/248203
> [2] https://download.samba.org/pub/rsync/NEWS
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> (cherry picked from commit 7ae818a6c3635bff7701c339174b6d281a507462)
> (cherry picked from commit 3f583855eece3b022dec3703e6622eedac0159e9)
> (cherry picked from commit 5a5de1c212718d3918dfbe9b6ab770dd76316d6f)
> (cherry picked from commit 6367a867b6a6079bf83eeffcc8bca5f5ec22b7ab)
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  ...-prototypes-to-function-declarations.patch | 78 ++++---------------
>  .../rsync/files/CVE-2025-10158.patch          | 36 ---------
>  .../rsync/files/determism.patch               |  6 +-
>  .../rsync/files/makefile-no-rebuild.patch     |  6 +-
>  .../rsync/{rsync_3.4.1.bb =3D> rsync_3.5.1.bb}  |  4 +-
>  5 files changed, 23 insertions(+), 107 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patc=
h
>  rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb =3D> rsync_3.5.1.bb} =
(95%)

Hello,

I prefer we do not squash commits when cherry-picking from master:
* It is easier to compare with master and,
* if a bug triggers in a user system with the update (which might be the
  case here), bisecting through intermediate versions might help.

Given the near upcoming 6.0.5, I'll cherry-pick from master myself.

Thanks! (and sorry that did not worked out)
--=20
Yoann Congal
Smile ECS

