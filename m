Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 906907823B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 03:27:49 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id o86so809992pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 20:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wFMHXJj6Q59+WpVQGZ7UppV89tkiQf+dCT93RYXgDfg=;
	b=aTzhqSlzB6JnNGDj0ekO5Kj+tKFTNbfBOiOL5e6JGCufyg+L9B/KIshpG5Q0A6Z/yt
	r+HZC61h0d/3LdzMvIIWNJAgw2K5x1rj1bW7+2JBiGgOhpOBPwtZo1AxOtuTYQ7x5YoM
	Y1FD7errxLLdT3pvgPO7R7WjyQFbPZpdqLkC3BZGfMjkp9bthAU6NAo6hZrn4fv3S8Ii
	A1sEXNTgl2vrhFWoBTG0tkpFUVfjMb9s1s41jIcVWY0klGgWuMkIz4TcyayglCpQEz9I
	E5RMjrpyNqtwmihQVzpA3Slz3uELWVVuIJKkL/egYlRHORw1xxRZ5uwDvRNJ0MTStsJ/
	0LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wFMHXJj6Q59+WpVQGZ7UppV89tkiQf+dCT93RYXgDfg=;
	b=JzYXykXA4WgYmjFCExdbqvIY0R/2l9KSThC4cMQv8jW75E60lLLFfsNyzJ4WdtSVrA
	bH53WbDsWpsPAjuMPtn0wBg9XWeGHXqwtLOkj/FVm6jNCpUs5dz/zBCe4N7jsj7aNQs/
	oNz9xmU0l3zYP9grnIKv8R/NasfJwg04LySI3xNJQ36Vsr2mnwEjThkVxGTeeApM7cXi
	U6xHHT/P6rxxvkEO2U4papspxTRHaQJhoUgS+sK8xhQkParbeA19DzNDUUZlyrFenFLd
	WcHtpQ5ZFA96Tg82hnU+wL+aEIUHAoxBRY9BlDSwcCEldCgIe7vxWc9s/vY9FKOjHhQE
	l2pA==
X-Gm-Message-State: AHYfb5jGcHxLgvA0BlIyxaKPg7hEul7yCZDhx6kDzpFpuFF9xlsU1Eso
	iR0WSjuJzjYbY6d+nQY3MlSugIDZhg==
X-Received: by 10.98.30.7 with SMTP id e7mr270797pfe.329.1502854070706; Tue,
	15 Aug 2017 20:27:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 15 Aug 2017 20:27:20 -0700 (PDT)
In-Reply-To: <03c66574d747ad8186978debb07bce4a2ffc7726.1502846743.git.kai.kang@windriver.com>
References: <cover.1502846743.git.kai.kang@windriver.com>
	<03c66574d747ad8186978debb07bce4a2ffc7726.1502846743.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Aug 2017 20:27:20 -0700
Message-ID: <CAMKF1sr+QhxS-4cGJGsh1Vaj0U-J4gp=t+VVtZBE9b1wocypZw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss: 3.30.2 -> 3.31.1
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
X-List-Received-Date: Wed, 16 Aug 2017 03:27:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 15, 2017 at 6:26 PM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade nss from 3.30.2 to latest stable version 3.31.1.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} (96%)
>
> diff --git a/meta/recipes-support/nss/nss_3.30.2.bb b/meta/recipes-support/nss/nss_3.31.1.bb
> similarity index 96%
> rename from meta/recipes-support/nss/nss_3.30.2.bb
> rename to meta/recipes-support/nss/nss_3.31.1.bb
> index 6683e5c..955862f 100644
> --- a/meta/recipes-support/nss/nss_3.30.2.bb
> +++ b/meta/recipes-support/nss/nss_3.31.1.bb
> @@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
>                      file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
>                      file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
>
> -SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30_2_RTM/src/${BP}.tar.gz \
> +VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
> +
> +SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
>             file://nss.pc.in \
>             file://signlibs.sh \
>             file://0001-nss-fix-support-cross-compiling.patch \
> @@ -24,10 +26,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30
>             file://disable-Wvarargs-with-clang.patch \
>             file://pqg.c-ULL_addend.patch \
>             file://Fix-compilation-for-X32.patch \
> -           file://0001-Fix-warnings-found-with-gcc7.patch \

Did you forget to delete the patch file ? it should be deleted if not
needed anymore.

>             "
> -SRC_URI[md5sum] = "42c22dd8ec6254f846259f1d8dd2eb76"
> -SRC_URI[sha256sum] = "0d4a77ff26bcee79fa8afe0125e0df6ae9e798b6b36782fa29e28febf7cfce24"
> +
> +SRC_URI[md5sum] = "ebb44f1394250d2cf6ec3c2e3d71fa20"
> +SRC_URI[sha256sum] = "933439214dc03ee60e86d1419c19e1568998b0776dde987f41fa70ced6cd08dc"
>
>  UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

