Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQk8M-0006hS-3P
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 21:27:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2012 12:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="237296290"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2012 12:03:30 -0700
Message-ID: <5086EA02.7070401@linux.intel.com>
Date: Tue, 23 Oct 2012 12:03:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, daniel@fooishbar.org
References: <cover.1350898066.git.ross.burton@intel.com>
	<af1365a98c78c547e373195e27c538f71c963dd3.1350898066.git.ross.burton@intel.com>
In-Reply-To: <af1365a98c78c547e373195e27c538f71c963dd3.1350898066.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] atk: Update to 2.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 19:27:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2012 02:30 AM, Ross Burton wrote:
> From: Daniel Stone <daniel@fooishbar.org>
>
> Newer Clutter releases want 2.5.3+, so upgrade to the stable 2.6.0.
>
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} (74%)
>
> diff --git a/meta/recipes-support/atk/atk_2.4.0.bb b/meta/recipes-support/atk/atk_2.6.0.bb
> similarity index 74%
> rename from meta/recipes-support/atk/atk_2.4.0.bb
> rename to meta/recipes-support/atk/atk_2.6.0.bb
> index 4a2d853..be797c7 100644
> --- a/meta/recipes-support/atk/atk_2.4.0.bb
> +++ b/meta/recipes-support/atk/atk_2.6.0.bb
> @@ -7,15 +7,15 @@ LICENSE = "GPLv2+ & LGPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                       file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
>                       file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
> -PR = "r1"
> +PR = "r0"
>
>   DEPENDS = "glib-2.0"
>
>   inherit autotools gtk-doc pkgconfig
>
> -SRC_URI = "http://download.gnome.org/sources/atk/2.4/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "2184a140f71d50276669d6eda5cce5db"
> -SRC_URI[sha256sum] = "091e9ce975a9fbbc7cd8fa64c9c389ffb7fa6cdde58b6d5c01b2c267093d888d"
> +SRC_URI = "http://download.gnome.org/sources/atk/2.6/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "6b34e2a63dda4429b5692be7ca3aa5bf"
> +SRC_URI[sha256sum] = "eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f"
>
>   BBCLASSEXTEND = "native"
>
>
Merged into OE-Core

Thanks
	Sau!



