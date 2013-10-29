Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 13B5F60EE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 00:35:37 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id e14so12737815iej.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+5lOHlr9XoIWa5FKWelYBj8yypcWXFJIRwRmTRwddj8=;
	b=Jto5UKKXzXE2KSRFrIHqRCQ7HGyPvCvP4F1ncaK0lPWmPo6AOO3O0cQlM7oR57H5DP
	qWuqgdz5oMEurysHoyyVHYrdn1P95K0TZsrn7+U1lO7AND9+r9NKkLiJOwFTVPO63BEj
	oA4NsEgMR86tWTFkJiGyvD+a9BwfzTLj/ksgHjxvfKLMySpZ0q5+oCN1KY54CWSODTh4
	AzKd5acaVNwS8Wr4mkXLVeZSrLGY2zhOzp9XNr63+8GBSpL+SGGngkouy3ONQ/0dhiKJ
	8mjfZ855cpTfg29buEVKaTC1/ApR3PeLwUiHfDFiCu3To+Vcs3svGJqUSmx4EtOPAwh7
	w5cA==
X-Received: by 10.43.10.198 with SMTP id pb6mr3091604icb.40.1383006938781;
	Mon, 28 Oct 2013 17:35:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 17:35:08 -0700 (PDT)
In-Reply-To: <6ea9e9fe207b9c3b84a4450268ea289246b83055.1382686685.git.cazfi74@gmail.com>
References: <cover.1382686685.git.cazfi74@gmail.com>
	<b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
	<6ea9e9fe207b9c3b84a4450268ea289246b83055.1382686685.git.cazfi74@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 17:35:08 -0700
Message-ID: <CAMKF1sqG+y17HGokD0_YEsqmeiY7+2OiQN9Ld0UuSrbD0kpSpg@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libfm: allow build with automake-1.14
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
X-List-Received-Date: Tue, 29 Oct 2013 00:35:37 -0000
Content-Type: text/plain; charset=UTF-8

Marko

On Fri, Oct 25, 2013 at 12:39 AM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> Do not consider automake warnings about future incompatibility
> errors.

hmmm so disabling Werror is working around and I consider it degradation
in code quality, is there any alternative ? may be fix the code itself to not
generate the warning at all ?

>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../libfm/libfm-1.1.2.2/ignore_automake_warnings.patch     | 14 ++++++++++++++
>  meta/recipes-support/libfm/libfm_1.1.2.2.bb                |  1 +
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
>
> diff --git a/meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch b/meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
> new file mode 100644
> index 0000000..58a2f09
> --- /dev/null
> +++ b/meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd libfm-1.1.2.2/configure.ac libfm-1.1.2.2/configure.ac
> +--- libfm-1.1.2.2/configure.ac 2013-08-22 23:16:09.000000000 +0300
> ++++ libfm-1.1.2.2/configure.ac 2013-10-25 01:35:18.110323079 +0300
> +@@ -3,7 +3,7 @@
> +
> + AC_PREREQ([2.63])
> + AC_INIT([libfm], [1.1.2.2], [http://pcmanfm.sourceforge.net/])
> +-AM_INIT_AUTOMAKE([-Wall -Werror foreign])
> ++AM_INIT_AUTOMAKE([-Wall foreign])
> + AC_CONFIG_MACRO_DIR(m4)
> + AC_CONFIG_HEADERS([config.h])
> diff --git a/meta/recipes-support/libfm/libfm_1.1.2.2.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
> index 1146d16..8460223 100644
> --- a/meta/recipes-support/libfm/libfm_1.1.2.2.bb
> +++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
> @@ -12,6 +12,7 @@ DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
>             file://fix-make-parallelism-issue.patch \
> +           file://ignore_automake_warnings.patch \
>             "
>
>  SRC_URI[md5sum] = "ea3d09b23ef4c37cb84ae57ea16b8f08"
> --
> 1.8.4.rc3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

