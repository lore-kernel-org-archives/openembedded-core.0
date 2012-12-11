Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiTNx-0000SH-TT
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 18:12:50 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Dec 2012 08:58:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,260,1355126400"; d="scan'208";a="179478995"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Dec 2012 08:58:15 -0800
Message-ID: <50C76627.8020007@linux.intel.com>
Date: Tue, 11 Dec 2012 08:58:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <cover.1355236839.git.constantinx.musca@intel.com>
	<5078335c2652b28a2613b3395cd95665675c1626.1355236839.git.constantinx.musca@intel.com>
In-Reply-To: <5078335c2652b28a2613b3395cd95665675c1626.1355236839.git.constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] alsa-utils: Pass udev-rules-dir as parameter
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
X-List-Received-Date: Tue, 11 Dec 2012 17:12:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2012 07:29 AM, Constantin Musca wrote:
> Fix the following warning:
> WARNING: QA Issue: alsa-utils: Files/directories were installed but not shipped
>    /lib
>    /lib/udev
>    /lib/udev/rules.d
>    /lib/udev/rules.d/90-alsa-restore.rules
>
> [YOCTO #3440]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> index 597e8b6..8f28a48 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                       file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
>   DEPENDS = "alsa-lib ncurses libsamplerate0"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
>              file://ncursesfix.patch \
> @@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb61570
>   # http://bugs.openembedded.org/show_bug.cgi?id=2348
>   # please close bug and remove this comment when properly fixed
>   #
> -EXTRA_OECONF = "--disable-xmlto"
> +EXTRA_OECONF = "--disable-xmlto --with-udev-rules-dir=${base_libdir}/udev/rules.d"

Here you have udev rules going into $base_libdir/udev and in the next 
patch its put into $sysconfdir, can you verify the correct location.

Sau!

>   EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
>
>   inherit autotools gettext
>


