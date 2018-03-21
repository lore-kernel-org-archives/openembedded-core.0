Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id BE9D678979
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 18:25:30 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id f5-v6so3624705plj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YALjmfwFDfcBjbGDHqIkumOnmHJJg2oo2aOE4LGp9iA=;
	b=VcvWg2lCt20SYBdr9XCIC1MGgFN+ow7cjquqkQAX+e4ChLZoPEDptUXba5CPOwARD3
	9pEfwcDA4Vk74MuGSRhcRnjqqnIpmWA3TibLVL55yJhA691UxRuxDpl8RUNOADqeMsBy
	+vEfM0T+y/R1I04t27NW4gtQvC8UyUDPocj5qJqlSThvznoJFHnjP6lm3+BYt8VB9MUg
	Ov0nrKBbH7iITOe3WJii7X8YKpW2DaI1Qh0FbW+qweRy+zZk2T6800m4MszFRrzeq5T4
	/OX8lH/9otFZr16NQgAlCjB9/lMVG86s+GKFaaHZaRAZbzClYwGcoSNs5wo1jBtQf5Mp
	r2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YALjmfwFDfcBjbGDHqIkumOnmHJJg2oo2aOE4LGp9iA=;
	b=UEOJEdgORBg3Ple1BgEaNgli9thnwQdNXkKVbudgrQjLzU9eEiL4EmqTR66zjb7LmT
	Hixki87FAXEnlQgz+fjnlC8pThXsy6977so92dd0V/pVja/LmQo2NDtalPF/S/BpwbFc
	P06qhxqlwj/kskNvCusSE2ZAO7lr7b44KopM8/jOB4uuGBeb2XoC7cqJKCpVODRWNyec
	V3oIVHXBsYPTtrO2oxYSDIYiMUkzEWjdC9KX1nr7ZxFlSFevY8iswycHuJRj1zrefUAg
	5uGt0BLattACDb2Hheb+f7kT4/OLjmyTsdPQeteHLKhiWBlm/h7Y2GVu06YL1xjpCI+r
	K2uA==
X-Gm-Message-State: AElRT7EiTkH014qIa5x/xwRl7FmUF6H2/HH0ZbArCPJoGc3UCBnf99sp
	0eY1iVG8MVZ6dPoq5lrreNeBYx6woQGL0sgpHbE=
X-Google-Smtp-Source: AG47ELtIDwohXVvyVH1Y1mpm/ANbtjF4Odubnz7DQgjqvMRugL7Q8SgH81/mUZ6/a+lEZiWNY6kl/54xUU81TkDZ2DE=
X-Received: by 2002:a17:902:6e01:: with SMTP id
	u1-v6mr11787285plk.96.1521656731449; 
	Wed, 21 Mar 2018 11:25:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Wed, 21 Mar 2018 11:25:00 -0700 (PDT)
In-Reply-To: <1521617238-23436-1-git-send-email-anuj.mittal@intel.com>
References: <1521617238-23436-1-git-send-email-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Mar 2018 11:25:00 -0700
Message-ID: <CAMKF1srT=6-+Sm5Lf-eFB-8xzrZj4ktgB-TOpHAzW7Gaq97XLQ@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] librepo: disable building of tests and docs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 18:25:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 21, 2018 at 12:27 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
> Also remove libcheck dependency which was required only for tests.
>

Does this affect ptest converge ?

> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-devtools/librepo/librepo_1.8.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/librepo/librepo_1.8.1.bb b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
> index 0324104..4569885 100644
> --- a/meta/recipes-devtools/librepo/librepo_1.8.1.bb
> +++ b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
> @@ -11,11 +11,11 @@ SRCREV = "7b9b7bf388f3f059529c6f50c40b30919fef30f9"
>
>  S = "${WORKDIR}/git"
>
> -DEPENDS = "curl expat glib-2.0 openssl attr libcheck gpgme"
> +DEPENDS = "curl expat glib-2.0 openssl attr gpgme"
>
>  inherit cmake distutils3-base pkgconfig
>
> -EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
> +EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

