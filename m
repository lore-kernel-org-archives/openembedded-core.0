Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 530D271C7A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 15:16:52 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id m68so5329637pfm.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ezc3KyFWq6JHq9FR4fkV2SlwZk3CoH90uACNZ1HEoGk=;
	b=gPg0BSwRp2c3/soiKosz06p5X+JN6bcZCE1gRzF/q5LZZgzx0JWtjaFhAM1EivLs2i
	aQEjbHaOIXBpjAM3BgsVMHbtGIF3PKHTtGJmZked/hM9uk3VFb7aF+bHZMc1Ot7A3jR2
	u2sPQqKBl5fiDzWA8CPYIuCbGQ+9g+weNjlKLVBAl9MaTNDpfAi1r2xGaF25lMh26lwf
	6g98Vd2MDxSRIndsyLq0HVxCmsqy5FjxXpam7VVn+C58/O5VJX3oWrQoYPEkkDS6l9DG
	71lMiU93sJ2Am/Gyth6nWArr9rDXkzMapNK4/bajIMBz+hLHu8M7X7dNo9hQLX3pA2sz
	VaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ezc3KyFWq6JHq9FR4fkV2SlwZk3CoH90uACNZ1HEoGk=;
	b=drKlbSY5DmVNKChwzY2WbYkq1eSAS2A/QuczgRdxCKVRxp/kt0lof9EjY4kpJ5+olf
	CVY1rv6N2HaOnIkNUHSHAO+xwa+O/om9Z4RuSFwsrePJeFYNXR6pahMAUpDnAZ1dPkE0
	ZRkXgml1zH3sdbVAk2tL2FDS6LrXwD/PEtWuepTE0UezoeYvHLqMgMDwIujx6gUYEcSs
	dTBX7ho7RK57uzbunlX3/wwBMdBrwaQhnoMaRKJiLdT77BI/Bl9MNX7bkaRx2iZHvoKr
	ucseev5GMeQ0fHINBV5g1MNLAJvKQps9A2fwGsJA0sc81dC40DZMI5yiILBH25jDwfIv
	cQJA==
X-Gm-Message-State: AElRT7F01s40W+C1qRE2kLtXpJZZmW5Rrtpn0MxEC5+1MlYPYbmSQlsj
	PNMI0kVFaCwroeIC0UvHDnq5WsDPNKiDlaNZ/Zc=
X-Google-Smtp-Source: AG47ELu3SJBKCy3ES8PNaPss9fMHuK7ixpB1MefBJWzZPOWnRcVMQTaptCYUCEdmWVlT7KQCFtT50sms4Dzq9C58v/I=
X-Received: by 10.98.202.10 with SMTP id n10mr2381137pfg.220.1521299814076;
	Sat, 17 Mar 2018 08:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Sat, 17 Mar 2018 08:16:23 -0700 (PDT)
In-Reply-To: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
References: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Mar 2018 08:16:23 -0700
Message-ID: <CAMKF1speHQU8vNbdiXSrbE2zy-keJX1e9evsEBiYcbPq5Jw3vg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix upstream version check
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
X-List-Received-Date: Sat, 17 Mar 2018 15:16:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 17, 2018 at 4:15 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Exclude x.y.90* pre-release versions in particular.
>

Looks ok. So I guess it pokes at master branch right ?

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-core/glibc/cross-localedef-native_2.27.bb | 2 +-
>  meta/recipes-core/glibc/glibc_2.27.bb                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> index f1e4a657cf4..6344c7acd05 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
> @@ -19,7 +19,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
>
>  SRCBRANCH ?= "release/${PV}/master"
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> -UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
>
>  SRCREV_glibc ?= "23158b08a0908f381459f273a984c6fd328363cb"
>  SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
> index c4042d16fe2..827857dfc84 100644
> --- a/meta/recipes-core/glibc/glibc_2.27.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -12,7 +12,7 @@ SRCREV ?= "23158b08a0908f381459f273a984c6fd328363cb"
>  SRCBRANCH ?= "release/${PV}/master"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> -UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
>
>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://etc/ld.so.conf \
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

