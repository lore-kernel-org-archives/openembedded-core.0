Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UBsJZ-0006li-Py
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 20:41:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Mar 2013 11:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,769,1355126400"; d="scan'208";a="263542331"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by azsmga001.ch.intel.com with ESMTP; 02 Mar 2013 11:25:21 -0800
Message-ID: <51325221.5050802@linux.intel.com>
Date: Sat, 02 Mar 2013 11:25:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1361273568-30066-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1361273568-30066-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng : update to 1.60.0
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
X-List-Received-Date: Sat, 02 Mar 2013 19:41:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


While this is a straight forward patch, it causes some problems with 
depender's of libpng, since the library name changes from libpng15 -> 
libpng16 a lot of both -native and target packages fail to compile.

I know in the past we would do a load of PR bumps to all these packages 
to address this issue.

This is because many packages encode the libpng15 information into 
libtool (.la) files, when the sysroot is populated with an older build 
or sstate cache, the libpng15 info remains.

There already is a link from libpng.la, why does this not get used by 
libtool and stored in the .la file?

I am sure there is some strange magical history around this issue.

Thanks
Sau!


On 02/19/2013 03:32 AM, Andrei Dinu wrote:
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>   .../libpng/{libpng_1.5.14.bb => libpng_1.6.0.bb}   |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-multimedia/libpng/{libpng_1.5.14.bb => libpng_1.6.0.bb} (50%)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.14.bb b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> similarity index 50%
> rename from meta/recipes-multimedia/libpng/libpng_1.5.14.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> index b2b82d3..951e34a 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.5.14.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> @@ -3,17 +3,17 @@ DESCRIPTION = "PNG Library"
>   HOMEPAGE = "http://www.libpng.org/"
>   SECTION = "libs"
>   LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=58c8238139ee86082f8d29eb89304241 \
> -                    file://png.h;beginline=207;endline=321;md5=4f17771edaee8bb3c17a95d7faaa3681"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=03b8ec701cb796c0ec84af22f884edef \
> +                    file://png.h;beginline=207;endline=321;md5=e829cebefd08488ba5142ea5faea6821"
>   DEPENDS = "zlib"
>   PR = "r0"
> -LIBV = "15"
> +LIBV = "16"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
>             "
>
> -SRC_URI[md5sum] = "94284b01d62ca43c5eb3f6702db08ed8"
> -SRC_URI[sha256sum] = "1459488e1b58d3be1c798453cf40c522c05bd66b61156cd51f469f17dff87b54"
> +SRC_URI[md5sum] = "3ee623b9a4d33bda7310a5124080b14d"
> +SRC_URI[sha256sum] = "5e13c31321083b03956b5ff298bacffab7a7ad35c34c122acef314593944b97b"
>
>   inherit autotools binconfig pkgconfig
>
>


