Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6Zgx-0003EC-Tk
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 05:11:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Sep 2011 20:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,420,1312182000"; d="scan'208";a="58533546"
Received: from unknown (HELO [10.255.15.16]) ([10.255.15.16])
	by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2011 20:05:54 -0700
Message-ID: <4E7AA612.2060308@linux.intel.com>
Date: Wed, 21 Sep 2011 20:05:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316659695.git.dongxiao.xu@intel.com>
	<683e143afdf821e4531850e2ae4c0dfd3e25798c.1316659695.git.dongxiao.xu@intel.com>
In-Reply-To: <683e143afdf821e4531850e2ae4c0dfd3e25798c.1316659695.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 1/1] libglade: fix the python environment settings
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
X-List-Received-Date: Thu, 22 Sep 2011 03:11:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2011 07:51 PM, Dongxiao Xu wrote:
> @PYTHON@ will points to the abstract path in sysroot, which should be
> replaced by "#!/usr/bin/env python".
>
> This should fix the sato-sdk rootfs error.
>
> Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
> ---
>   .../libglade-2.6.4/python_environment.patch        |    9 +++++++++
>   meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    4 ++--
>   2 files changed, 11 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
>
> diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
> new file mode 100644
> index 0000000..6f2cc36
> --- /dev/null
> +++ b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
This patch needs a patch header.

Sau!

> @@ -0,0 +1,9 @@
> +diff -ruN libglade-2.6.4-orig//libglade-convert.in libglade-2.6.4/libglade-convert.in
> +--- libglade-2.6.4-orig//libglade-convert.in	2011-09-22 10:18:28.991164003 +0800
> ++++ libglade-2.6.4/libglade-convert.in	2011-09-22 10:18:55.431164003 +0800
> +@@ -1,4 +1,4 @@
> +-#!@PYTHON@
> ++#!/usr/bin/env python
> + # -*- mode: python -*-
> +
> + # yes, this requires python 2.x and an XML parser module (eg. PyExpat)
> diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
> index d5b41f2..b0e0339 100644
> --- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
> +++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
> @@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
>                       file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
>
>   SECTION = "libs"
> -PR = "r0"
> +PR = "r1"
>   DEPENDS = "gtk+ gtk-doc-native"
>
>   inherit autotools pkgconfig gnome
>
> -SRC_URI += "file://glade-cruft.patch file://no-xml2.patch"
> +SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
>
>   SRC_URI[archive.md5sum] = "d1776b40f4e166b5e9c107f1c8fe4139"
>   SRC_URI[archive.sha256sum] = "64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec"


