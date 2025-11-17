Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915E6CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 10:07:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6158.1763374020318147593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 02:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kWEb6Lqf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 271A5C12641;
	Mon, 17 Nov 2025 10:06:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EECA606B9;
	Mon, 17 Nov 2025 10:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05A5B102F2371;
	Mon, 17 Nov 2025 11:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763374017; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wneyvTYiDPatqVfssTlVrq2sORxuiREgC8KHLqHLqvY=;
	b=kWEb6Lqf7Jc9k7/t/uMpWbGgUxUBsdxOa914eEdY8a5ukcRFz68UtaO72Ag3RwY7YWtv4Z
	rBxsw+vD0eL3aRxkLxfOzqI99KIT4nYsUuWMLCfdlQ1rry3eVvrZbTtbKFUyG6vb8T2aCH
	Dys85J0jxYp/3xVlJDdfJURg2GB5OntGWsGnXWT4iXZ6blqG4G4TTmROt9RxDXR1f1+O3z
	q5EyvJZgyc155OTQnrK1mT2G5j9RI3tknfEPipgeYrWYB5sM/az50kxEmfQwUSgdAG2sYn
	IjAD6DBPamzGj503rGXjlRvLbEYgtFxdP0h07et6YUAaJUHmY6G5r0CAgISy9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Nov 2025 11:06:56 +0100
Message-Id: <DEAVX3OYVZB6.30SG1HTWVWZIJ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] libdnf: upgrade 0.74.0 -> 0.75.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251117004228.1402-1-wangmy@fujitsu.com>
In-Reply-To: <20251117004228.1402-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 10:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226490

On Mon Nov 17, 2025 at 1:42 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> optional-check.patch
> removed since it's included in 0.75.0
>
> Add patches to fix compilation error with musl:
> 0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> 0001-utils-utils.cpp-fix-compilation-with-musl.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...FNM_EXTMATCH-if-not-already-like-und.patch | 39 ++++++++++++++
>  ...-utils.cpp-fix-compilation-with-musl.patch | 51 ++++++++++++++++++
>  .../libdnf/libdnf/optional-check.patch        | 52 -------------------
>  .../{libdnf_0.74.0.bb =3D> libdnf_0.75.0.bb}    |  7 ++-
>  4 files changed, 95 insertions(+), 54 deletions(-)
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Def=
ine-FNM_EXTMATCH-if-not-already-like-und.patch
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.=
cpp-fix-compilation-with-musl.patch
>  delete mode 100644 meta/recipes-devtools/libdnf/libdnf/optional-check.pa=
tch
>  rename meta/recipes-devtools/libdnf/{libdnf_0.74.0.bb =3D> libdnf_0.75.0=
.bb} (85%)
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM=
_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-devtools/libdnf/libd=
nf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
> new file mode 100644
> index 0000000000..3067668d82
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMAT=
CH-if-not-already-like-und.patch
> @@ -0,0 +1,39 @@
> +From 486d1c7826efb9e42bbb18b6537fd23a0a33b324 Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Sun, 16 Nov 2025 23:29:18 +0000
> +Subject: [PATCH] dnf-repo: Define FNM_EXTMATCH if not already (like unde=
r
> + musl).
> +
> +With musl, FNM_EXTMATCH is not defined:
> +dnf-repo.cpp
> +| dnf-repo.cpp: In function 'void dnf_repo_conf_load_overrides(DnfRepo*,=
 const char*)':
> +| dnf-repo.cpp:971:50: error: 'FNM_EXTMATCH' was not declared in this sc=
ope; did you mean 'FNM_NOMATCH'?
> +|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH)=
 !=3D 0) {
> +|       |                                                  ^~~~~~~~~~~~
> +|       |                                                  FNM_NOMATCH
> +
> +Upstream-Status: Submitted[https://github.com/rpm-software-management/li=
bdnf/pull/1737/commits/47ed831c1fdb32519f2d66fee91bc47f9521d1d4]
> +

Hi Wang,

There is a missing space, it should be:
Upstream-Status: Submitted [https://...]

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


