Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 156966D138
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 19:32:30 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id qd12so12085359ieb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 12:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zWWUo+BqhM0qn5EIemQHN7G1fTtmpVn+VECxhRo3KdA=;
	b=ISsBy6/8SkvyR4dt+BDodDnPOqY4J6hd9FEa3rIpYz3PlRcaq6x5Rdi2/wIqqJOSfG
	OKcuE9R5f0kG4ZtiBOpdh9IBIRcPb65i5x+r8Ep1XM8NQAokp3fKQJZ5GIONCteqjTsn
	4B/07IZ0Wg98IVAHrD1/qy1tEdh8q4D4mooDCrjLB6JRilA90bqwxxVqrv1GxLTRvzP6
	G/724noBpz6DV3/3ZZR3k0PldBCw2CL0HXmvJpga6AAZwcTANNtAiNKXT3G7YjIJx2Y4
	5I3qj1N7UJdZRPLc3Q0XQn+3gUMgd19yFpahBIi94xhX0plcFLGqcbBBZfBoxKyH5LpV
	kKzQ==
X-Received: by 10.50.22.67 with SMTP id b3mr9667494igf.39.1382988751469; Mon,
	28 Oct 2013 12:32:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 12:32:01 -0700 (PDT)
In-Reply-To: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2013 12:32:01 -0700
Message-ID: <CAMKF1spfQ7hiR8S_=cboV1+p2B4yMF+vqfHpWr1bha883MbvTg@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Mon, 28 Oct 2013 19:32:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 21, 2013 at 1:56 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jmitchell@cbnl.com>
>
> libjson is now known as json-c, it keeps support for the old
> libjson namespace so it shouldn't break anything. Built without
> parallel make as it would fail when it tries to link to link back
> to itself, which is odd, but the official word is: don't build in
> parallel.
>
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> ---
>
>  v2: rebased to latest master
>
>  meta/conf/distro/include/seperatebuilddir.inc     |  2 +-
>  meta/recipes-devtools/json-c/json-c_0.11.bb       | 13 +++++++++++++
>  meta/recipes-devtools/libjson/libjson_0.9.bb      | 14 --------------
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc |  2 +-
>  4 files changed, 15 insertions(+), 16 deletions(-)
>  create mode 100644 meta/recipes-devtools/json-c/json-c_0.11.bb
>  delete mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>
> diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
> index c067183..e1a5c6b 100644
> --- a/meta/conf/distro/include/seperatebuilddir.inc
> +++ b/meta/conf/distro/include/seperatebuilddir.inc
> @@ -294,7 +294,7 @@ B_pn-libice = "${SEPB}"
>  B_pn-libice-native = "${SEPB}"
>  B_pn-libid3tag = "${SEPB}"
>  B_pn-libidn = "${SEPB}"
> -B_pn-libjson = "${SEPB}"
> +B_pn-json-c = "${SEPB}"
>  B_pn-libksba = "${SEPB}"
>  B_pn-libmad = "${SEPB}"
>  B_pn-libmatchbox = "${SEPB}"
> diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-devtools/json-c/json-c_0.11.bb
> new file mode 100644
> index 0000000..e0391f5
> --- /dev/null
> +++ b/meta/recipes-devtools/json-c/json-c_0.11.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C"
> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
> +
> +SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${P}.tar.gz"


be explicit and use BPN-PV so that if someday someone creates a
mutation with native of nativesdk then it works there too.
and keep RPROVIDE'ing libjson might make folks with feeds happier.
and use git format-patch -M next time

> +
> +SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
> +SRC_URI[sha256sum] = "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
> +
> +PARALLEL_MAKE = ""
> +
> +inherit autotools
> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb b/meta/recipes-devtools/libjson/libjson_0.9.bb
> deleted file mode 100644
> index e4951a8..0000000
> --- a/meta/recipes-devtools/libjson/libjson_0.9.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "JSON-C - A JSON implementation in C"
> -HOMEPAGE = "http://oss.metaparadigm.com/json-c/"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=30a276a476b02c2dcd0849bde417fb17"
> -
> -SRC_URI = "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
> -SRC_URI[md5sum] = "3a13d264528dcbaf3931b0cede24abae"
> -SRC_URI[sha256sum] = "702a486c9bf8e19137d484ab5c49b4ad314eb5e1fe37062a72c0a0fa39439475"
> -
> -S = "${WORKDIR}/json-c-${PV}"
> -
> -
> -inherit autotools
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 4c10aa9..475da41 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>  DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
>  # optional
>  DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
> +DEPENDS += "json-c gdbm speex libxml-parser-perl-native"
>
>  inherit autotools pkgconfig useradd gettext perlnative
>
> --
> 1.8.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

