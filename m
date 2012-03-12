Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S79Py-00052v-19
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 18:52:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Mar 2012 10:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137534168"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2012 10:43:38 -0700
Message-ID: <4F5E35C9.4090005@linux.intel.com>
Date: Mon, 12 Mar 2012 10:43:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCHv2] bluez4: add dependency on libcheck to enable test modules
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
X-List-Received-Date: Mon, 12 Mar 2012 17:52:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2012 04:32 AM, Chase Maupin wrote:
> * The later versions of bluez such as 4.98 require libcheck
>    in order to build the test packages as enabled by the
>    --enable-test option passed in EXTRA_OECONF.
> * Failure to have the libcheck package availalbe results in the
>    configure script ignoring the --enable-test option and not
>    building the test modules.
> * Adding libcheck, which is greater than the minimum required
>    version of the check library of 0.9.6 allows building the
>    test modules.
> * Build tested for am335x-evm MACHINE type and run time tested
>    by back porting this fix to the oe-classic and arago setup
>    and booting on am335x-evm.
>
> Signed-off-by: Chase Maupin<Chase.Maupin@ti.com>
> ---
> * Updated in version 2:
>      * Bumped the PR of the bluez4_4.98 recipe.  I assume this is the
>        way to handle changes to the .inc file since there is no INC_PR
>
> ---
>   meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
>   meta/recipes-connectivity/bluez/bluez4_4.98.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
> index 9158687..fbbe0bf 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                       file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                       file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
>                       file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
> -DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0"
> +DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>
>   ASNEEDED = ""
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.98.bb b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
> index 2412b1b..9a4c682 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.98.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
> @@ -1,6 +1,6 @@
>   require bluez4.inc
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI += "file://bluetooth.conf \
>               file://sbc_mmx.patch \


Merged into OE-Core (with spelling mistake fixed)

Thanks
	Sau!


