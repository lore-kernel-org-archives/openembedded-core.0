Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6pVA-0008Rf-9w for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 22:04:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK4wXo029130; Thu, 22 Sep 2011 21:04:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3DRx2w+4ToFK; Thu, 22 Sep 2011 21:04:58 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MK4m60029125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 22 Sep 2011 21:04:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 20:58:32 +0100
In-Reply-To: <4b97e6b25906806eef1131e851abc9526d81d0db.1316717234.git.dvhart@linux.intel.com>
References: <cover.1316717234.git.dvhart@linux.intel.com>
	<4b97e6b25906806eef1131e851abc9526d81d0db.1316717234.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316721518.28323.1.camel@ted>
Mime-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] shared-mime-info: add libxml-parser-perl to DEPENDS
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
X-List-Received-Date: Thu, 22 Sep 2011 20:04:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 11:49 -0700, Darren Hart wrote:
> Fixes [YOCTO #1514]
> 
> Building core-image-minimal on qemuppc (and likely others) can fail in
> the shared-mime-info configure step with the following error:
> 
> checking for XML::Parser... configure: error: XML::Parser perl module is
> required for intltool
> 
> Adding libxml-parser-perl to DEPENDS allows share-mime-info-native to build
> successfully.
> 
> Testing: build tested the native version on qemuppc. I run into tool chain
> build failures before I can get to building the target version.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Joshua Lock <josh@linux.intel.com>
> ---
>  .../shared-mime-info/shared-mime-info.inc          |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> index 64eef9d..e206305 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> @@ -5,8 +5,8 @@ SECTION = "base"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>  
> -DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
> -DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
> +DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native libxml-parser-perl"
> +DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native libxml-parser-perl-native"
>  
>  SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"


There must be some underlying problem here. intltool-native should
depend on libxml-parser-perl-native so it should already be built. We
need to fix the underlying issue, not the symptom :/

Cheers,

Richard



