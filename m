Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1REkjl-0002Pe-Ni
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:35:57 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:30:10 -0700
Received: by wyh11 with SMTP id 11so3191310wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:30:08 -0700 (PDT)
Received: by 10.216.4.158 with SMTP id 30mr172336wej.54.1318609804139;
	Fri, 14 Oct 2011 09:30:04 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id p2sm15063582wbo.17.2011.10.14.09.30.02
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:30:03 -0700 (PDT)
Message-ID: <4E986388.8040504@intel.com>
Date: Fri, 14 Oct 2011 09:30:00 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318009017-6186-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1318009017-6186-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] farsight2, ldconfig-native, gnutls: There is no GPLv2.1, correct the fields
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
X-List-Received-Date: Fri, 14 Oct 2011 16:35:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2011 10:36 AM, Khem Raj wrote:
> The licenses were either LGPLv2.1 or GPLv2
> make the changes appropriately
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../farsight/farsight2_0.0.9.bb                    |    4 ++--
>   meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    4 ++--
>   meta/recipes-support/gnutls/gnutls.inc             |    4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
> index a7bdc97..ee0ce8a 100644
> --- a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
> +++ b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
> @@ -1,12 +1,12 @@
>   DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
>   HOMEPAGE = "http://farsight.sf.net"
>   SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BPN}-${PV}.tar.gz"
> -LICENSE = "GPLv2.1"
> +LICENSE = "LGPLv2.1"
>   DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
>
>   inherit autotools
>
> -PR = "r1"
> +PR = "r2"
>
>   EXTRA_OECONF = " \
>     --disable-debug \
> diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> index 00edb6e..2a93913 100644
> --- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "A standalone native ldconfig build"
>
> -LICENSE = "GPLv2.1"
> +LICENSE = "GPLv2+"
>
>   LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
>
> @@ -12,7 +12,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>              file://flag_fix.patch \
>              file://endianess-header.patch"
>
> -PR = "r1"
> +PR = "r2"
>
>   inherit native
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 9257880..d73c799 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -3,11 +3,11 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
>   BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
>   DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
>
> -INC_PR = "r2"
> +INC_PR = "r3"
>
>   LICENSE = "GPLv3+&  LGPLv2.1+"
>   LICENSE_${PN} = "LGPLv2.1+"
> -LICENSE_${PN}-xx = "GPLv2.1+"
> +LICENSE_${PN}-xx = "LGPLv2.1+"
>   LICENSE_${PN}-bin = "GPLv3+"
>   LICENSE_${PN}-extra = "GPLv3+"
>   LICENSE_${PN}-openssl = "GPLv3+"
	
Merged into OE-Core

Thanks
	Sau!


