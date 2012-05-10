Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SSbE1-00034P-S5
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:48:42 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 10 May 2012 14:38:45 -0700
Received: by pbbro8 with SMTP id ro8so8221570pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=+J50Xgy0HZyyx4HdKJDfU+xuHQ6zJHPqEcZwBzZfcPI=;
	b=gIGSYob7vG6QqVQM48ZKkD29PPS05zW6AbHLdpP8n1JN/sXxDN5FhfEJhaUaFVsmbI
	MhKjRV/Vt0PXY8KMc+Pc5ezQqWKt04RL9UNUOhUg9XzBV94Lrxq3raA5XJOXMio/PjBd
	XjvsUT/PRKvpxNMR8zkPQRbm8hay0oH2PKDRzNl3RC5U6OGbYE+zVZkBgHQ5u6c2b3N7
	pUgE47kQEmPLxSiJwnWBtvQLK4p7rxslawKE7l3vy0F5ixIFugxbH12IHUl8rESrgwA0
	SfJwoU51SD470syRUDfi8Ezshp4tla8bv+X1d3HNBa+RSDi5puoVN01RikMFtpNElzcU
	hNQQ==
Received: by 10.68.72.70 with SMTP id b6mr24944381pbv.58.1336685924605;
	Thu, 10 May 2012 14:38:44 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id py6sm10623610pbc.13.2012.05.10.14.38.42
	(version=SSLv3 cipher=OTHER); Thu, 10 May 2012 14:38:43 -0700 (PDT)
Message-ID: <4FAC3559.6080609@intel.com>
Date: Thu, 10 May 2012 14:38:33 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQkWPcGNgpYWo2UmmeDTpxd836DibhhDtYvCkaZEvOee0nA25yIKt7+Qc71ZMn5P5DqC+CHe
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 21:48:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2012 02:08 PM, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> ---
>   .../recipes-core/expat/expat-2.0.1/autotools.patch |   21 -----------------
>   .../recipes-core/expat/expat-2.1.0/autotools.patch |   24 ++++++++++++++++++++
>   meta/recipes-core/expat/expat_2.0.1.bb             |    6 -----
>   meta/recipes-core/expat/expat_2.1.0.bb             |    6 +++++
>   4 files changed, 30 insertions(+), 27 deletions(-)
>   delete mode 100644 meta/recipes-core/expat/expat-2.0.1/autotools.patch
>   create mode 100644 meta/recipes-core/expat/expat-2.1.0/autotools.patch
>   delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
>   create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb

Hi Marko,

As the maintainer of the expat recipe, I appreciate your submission. 
However I'm a bit wary of removing the autotools patch - have you build 
tested this change for all of our QEMU architectures? I think it may 
still be needed.

Scott

>
> diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/recipes-core/expat/expat-2.0.1/autotools.patch
> deleted file mode 100644
> index c0ac10b..0000000
> --- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Avoid using expat's m4 files
> -
> -Upstream-Status: Inappropriate [Other]
> -Workaround specific to our build system.
> -
> -Signed-off-by: Kevin Tian<kevin.tian@intel.com>
> -Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> -
> -diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
> ---- expat-2.0.0~orig/configure.in	2006-01-10 19:10:46.000000000 -0600
> -+++ expat-2.0.0/configure.in	2006-02-10 19:12:24.000000000 -0600
> -@@ -50,9 +50,6 @@
> -
> - AC_CONFIG_HEADER(expat_config.h)
> -
> --sinclude(conftools/libtool.m4)
> --sinclude(conftools/ac_c_bigendian_cross.m4)
> --
> - AC_LIBTOOL_WIN32_DLL
> - AC_PROG_LIBTOOL
> -
> diff --git a/meta/recipes-core/expat/expat-2.1.0/autotools.patch b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
> new file mode 100644
> index 0000000..0e59969
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
> @@ -0,0 +1,24 @@
> +Avoid using expat's m4 files
> +
> +Upstream-Status: Inappropriate [Other]
> +Workaround specific to our build system.
> +
> +Signed-off-by: Kevin Tian<kevin.tian@intel.com>
> +Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> +
> +Updated to apply over expat 2.1.0
> +
> +Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> +
> +diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
> +--- expat-2.1.0/configure.in	2012-03-04 01:45:53.000000000 +0200
> ++++ expat-2.1.0/configure.in	2012-05-10 21:04:44.000000000 +0300
> +@@ -51,8 +51,6 @@
> +
> + AC_CONFIG_HEADER(expat_config.h)
> +
> +-sinclude(conftools/ac_c_bigendian_cross.m4)
> +-
> + AC_LIBTOOL_WIN32_DLL
> + AC_PROG_LIBTOOL
> +
> diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/expat/expat_2.0.1.bb
> deleted file mode 100644
> index 30b5684..0000000
> --- a/meta/recipes-core/expat/expat_2.0.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require expat.inc
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
> -PR = "r1"
> -
> -SRC_URI[md5sum] = "ee8b492592568805593f81f8cdf2a04c"
> -SRC_URI[sha256sum] = "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e765e3e983a2e5e93"
> diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
> new file mode 100644
> index 0000000..727769f
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat_2.1.0.bb
> @@ -0,0 +1,6 @@
> +require expat.inc
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
> +PR = "r1"
> +
> +SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
> +SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


