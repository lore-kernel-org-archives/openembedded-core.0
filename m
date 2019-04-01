Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 00FA07D208
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:13:45 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id z126so1999345itd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 16:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ctIR9bAtN/X09u6X+PueAGPdvvmU4qRdBF823vNkBjU=;
	b=B8igy5qvdVgZSLW4EjP1sg3wBMj0K7tlKOA59T4vOfXZmm4kdWWxan2tTyRwcYB9vJ
	X7ixFtDKa691pzPK2DEoLk+8EFkxPnU6ckLerkrzIesTfcjrPKgtVQbk4+QVNVo2bO7g
	WHxEs9UhJqhCFrMwzVUh6aNwopy32wNHXeO6gItFqCI5e/pFv0GuniU1oxlAvcnTboT4
	irhWGo1inx+kNwWMD/auGULvRkjfPSHbDF6vHhiqKKkOYt3QAVPC4ZB/Cdde+8aptM8H
	BkzLJrsBy1bTVZ5vIjlwQEmJUDkZTbXDQh4d875Yf9u6RlEk38g7ctCB0FSqhnEKwO0G
	Eyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ctIR9bAtN/X09u6X+PueAGPdvvmU4qRdBF823vNkBjU=;
	b=eNATKJ3ieugt98ruZVx4rMTfhCp1yDP+4OunVum5CbmQ6mT+96ojBeSY5DiBKFn0ge
	MRQkhOCMw2eMwiIAfsLx3FvJJMcxdMOxkwvFxCc7XbPHv3gEYomVXJj8OLQFcrpGeJ6Y
	AzCmYc1iDN7JowKTW5pmhTjUxDLHX4RnKTLzFcuB2QRYzeCdO1s6TOIz48ugoVWKSGyz
	CTYbSTqwTcBqFXFvLxEBzmO8soTOZqG45Intk7XX53f9Ksr1fTr/uH9UXkSv5cv752mx
	XShHVeTAR8oHSNbqiDxPtb2mRWKHVZ60jQysYAGNQ5C33mEuwZVycCIsvkDfWgsN8pkY
	7BVA==
X-Gm-Message-State: APjAAAWgf7w7li+pDy2ASyWxJDOiTzh2qpd7vMgByVYSBAA3GeSf1M3r
	6ewM12w/Hl2jKByU5UI0j4Hx6FSb/DkU9pPS2hscAhOLU6s=
X-Google-Smtp-Source: APXvYqy7zahZZhWFv5j65s8EdcMKPMY7p+46XBXqOuP5/jsKxYDzvezTuhnbYOrVD8OEQbjaZdeEnbCEatp8iIrp/zg=
X-Received: by 2002:a24:1749:: with SMTP id 70mr1922454ith.50.1554160427071;
	Mon, 01 Apr 2019 16:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190401222438.26872-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190401222438.26872-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 00:13:36 +0100
Message-ID: <CAJTo0LZ7PSj5_X8t_n2C9sMktpOfYd79q6M69q4b3vpRkih4=Q@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: update to 0.1.11
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
X-List-Received-Date: Mon, 01 Apr 2019 23:13:46 -0000
Content-Type: text/plain; charset="UTF-8"

For me:

ERROR: libcomps-0.1.11-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-tmp/master/work/corei7-64-poky-linux/libcomps/0.1.11-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch 0002-Set-library-installation-path-correctly.patch
patching file libcomps/src/CMakeLists.txt
Hunk #1 FAILED at 52.
1 out of 1 hunk FAILED -- rejects in file libcomps/src/CMakeLists.txt
Patch 0002-Set-library-installation-path-correctly.patch can be reverse-applied
ERROR: libcomps-0.1.11-r0 do_patch:
ERROR: libcomps-0.1.11-r0 do_patch: Function failed: patch_do_patch

I've always wondered why some people have this as a silent "it's
already applied" and others get a fatal error.

Ross

On Mon, 1 Apr 2019 at 23:24, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libcomps/{libcomps_git.bb => libcomps_0.1.11.bb}          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>  rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.11.bb} (92%)
>
> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
> similarity index 92%
> rename from meta/recipes-devtools/libcomps/libcomps_git.bb
> rename to meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
> index ff6820851f..cf6f46484d 100644
> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
> +++ b/meta/recipes-devtools/libcomps/libcomps_0.1.11.bb
> @@ -9,8 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
>             file://0001-Add-crc32.c-to-sources-list.patch \
>             "
>
> -PV = "0.1.10"
> -SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
> +SRCREV = "d868a79b76fb980d1371c28124ae07f00d2b63a9"
>
>  S = "${WORKDIR}/git"
>
> @@ -22,4 +21,3 @@ EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIR
>  OECMAKE_SOURCEPATH = "${S}/libcomps"
>
>  BBCLASSEXTEND = "native nativesdk"
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

