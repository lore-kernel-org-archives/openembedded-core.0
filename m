Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0F37DFE4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:30:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 451xw56QVQz5R;
	Sun, 12 May 2019 10:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557649814;
	bh=II1F48pexe1fqHRma/JkMw2ej1cjolPpsmG9LC4INs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwB9l0R13OSCqi72dociHDerq/EC7RhqAnKZQQpeoRpQicK6O2rCzCrA0gmaO57yh
	EwDzXsIvuUl0pFe5dW0poFXqrh2vsVDZkfx9OXDjS07jRSBJwUMa6ODGZKQzB58Fr6
	zNPSVgsGbcFWxJvL2QhxK/8unEEumjatZ6GvNUnn8BHel+tV4h2+GKTMrPOqSjG/H1
	SwVkPe6NoMfT6vUFt8dRIhWmlMG9cZ2pOhMY/MQESCKiFnO4rASeTwypjs9qrIEXGM
	vnIqyqmjjAh53QMcnQc2a8vR5rpyqQJ03IsVK6882NgoW0k5GGy5k0zCmlaZL0sIkQ
	fUP+nhaLFtb3Mw6NUSU30c3Ksp9SvL511q2HOO7UBdjDyn3W37M3SEr1AgCmnJ00Vo
	pLQMtb9BpOyR1j5v1dEet306Z5ofzBialfyrNFJi7Y4DDz9XHE3T4HBIMm7T27uKr3
	bUXPdSf5xgk3UB7zb79Pb4a6/kAXSYlPXe5+8NCb+OvlnMGpprvB5Ztp4/GdshRbaq
	tGXgoQ21JgZ5OG3Sl+Gtx2lIYHDBOFav8UXcVZ8fz29zOOWC0D2tB2W/g840wB/0Gv
	IeqNcp6bjzfOeLVFuZVb6JERix/tcfogBDE3j0semMtJ5f7KGRx8WpTpT9f8GNt0iF
	rRIUq+C+MxNtw8528oIcOeao=
Date: Sun, 12 May 2019 11:30:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190512083010.GA15611@localhost>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<6dbeb5070ef6a86368ebcf1934ff543e963ba0fc.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6dbeb5070ef6a86368ebcf1934ff543e963ba0fc.1557628550.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] bash: upgrade 4.4.18 -> 5.0
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
X-List-Received-Date: Sun, 12 May 2019 08:30:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 12, 2019 at 04:16:24PM +0800, Hongxu Jia wrote:
>...
>  ...1-help-fix-printf-format-security-warning.patch | 35 -----------------
>  meta/recipes-extended/bash/bash/build-tests.patch  |  7 +++-
>  meta/recipes-extended/bash/bash/execute_cmd.patch  | 19 ++++++---
>  meta/recipes-extended/bash/bash/pathexp-dep.patch  | 13 -------
>  meta/recipes-extended/bash/bash_4.4.18.bb          | 41 --------------------
>  meta/recipes-extended/bash/bash_5.0.bb             | 45 ++++++++++++++++++++++
>  6 files changed, 64 insertions(+), 96 deletions(-)
>  delete mode 100644 meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
>  delete mode 100644 meta/recipes-extended/bash/bash/pathexp-dep.patch
>  delete mode 100644 meta/recipes-extended/bash/bash_4.4.18.bb
>  create mode 100644 meta/recipes-extended/bash/bash_5.0.bb
>...
> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-019;apply=yes;striplevel=0;name=patch019 \
> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-020;apply=yes;striplevel=0;name=patch020 \
> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-021;apply=yes;striplevel=0;name=patch021 \
> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-022;apply=yes;striplevel=0;name=patch022 \
> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-023;apply=yes;striplevel=0;name=patch023 \
>...
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-001;apply=yes;striplevel=0;name=patch001 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-002;apply=yes;striplevel=0;name=patch002 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-003;apply=yes;striplevel=0;name=patch003 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-004;apply=yes;striplevel=0;name=patch004 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-005;apply=yes;striplevel=0;name=patch005 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-006;apply=yes;striplevel=0;name=patch006 \
> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-007;apply=yes;striplevel=0;name=patch007 \
>...

Some "git add/rm" seems to be missing around these patches.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


