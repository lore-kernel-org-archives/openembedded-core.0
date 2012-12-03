Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TfQr9-0001VD-Bf
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 08:54:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2012 23:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,204,1355126400"; d="scan'208";a="175307540"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.44])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2012 23:40:00 -0800
Message-ID: <50BC5750.6080300@linux.intel.com>
Date: Sun, 02 Dec 2012 23:40:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
	<778e45862ea1d877e03abf4b29468fddbe388107.1354480962.git.raj.khem@gmail.com>
	<50BC2C87.9090905@linux.intel.com>
	<CAMKF1spM=0zDXLdpO0WReiidVk29n7UUew3sOngA3ce23PHinQ@mail.gmail.com>
In-Reply-To: <CAMKF1spM=0zDXLdpO0WReiidVk29n7UUew3sOngA3ce23PHinQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] util-linux: Update from 2.21 -> 2.22
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
X-List-Received-Date: Mon, 03 Dec 2012 07:54:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2012 09:57 PM, Khem Raj wrote:
>
>
> On Sun, Dec 2, 2012 at 8:37 PM, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>         2.21 has some linking issues with gold on uclibc where mount
>         program does not work. Its some sort of underlinking.
>
>         2.22 did not solve that problem completely either
>
>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         ---
>            meta/recipes-core/util-linux/__util-linux.inc        |   18
>         +++++++++++-------
>            .../util-linux/add-aarch64-__support.patch           |    4 ++--
>            .../util-linux/uclibc-____progname-conflict.patch    |   14
>         +++++++-------
>            .../util-linux-ng-replace-__siginterrupt.patch       |   14
>         +++++++-------
>            .../{util-linux_2.21.2.bb <http://util-linux_2.21.2.bb> =>
>         util-linux_2.22.bb <http://util-linux_2.22.bb>}   |    8 +++-----
>            5 files changed, 30 insertions(+), 28 deletions(-)
>            rename meta/recipes-core/util-linux/{__util-linux_2.21.2.bb
>         <http://util-linux_2.21.2.bb> => util-linux_2.22.bb
>         <http://util-linux_2.22.bb>} (88%)
>
>         diff --git a/meta/recipes-core/util-__linux/util-linux.inc
>         b/meta/recipes-core/util-__linux/util-linux.inc
>         index f2f9a04..00b332a 100644
>         --- a/meta/recipes-core/util-__linux/util-linux.inc
>         +++ b/meta/recipes-core/util-__linux/util-linux.inc
>         @@ -8,16 +8,16 @@ SECTION = "base"
>            LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
>
>            LIC_FILES_CHKSUM =
>         "file://README.licensing;md5=__9c920d811858a74b67a36ba23cbaa9__5f \
>         -
>           file://COPYING;md5=__59530bdf33659b29e73d4adb9f9f65__52 \
>         -
>           file://Documentation/licenses/__COPYING.GPLv2;md5=__8ca43cbc842c2336e835926c2166c2__8b \
>         -
>           file://Documentation/licenses/__COPYING.LGPLv2.1;md5=__bbb461211a33b134d42ed5ee802b37__ff \
>         +
>           file://COPYING;md5=__b234ee4d69f5fce4486a80fdaf4a42__63 \
>         +
>           file://Documentation/licenses/__COPYING.GPLv2;md5=__b234ee4d69f5fce4486a80fdaf4a42__63 \
>         +
>           file://Documentation/licenses/__COPYING.LGPLv2.1;md5=__4fbd65380cdd255951079008b36451__6c \
>
>         file://Documentation/licenses/__COPYING.BSD-3;md5=__58dcd8452651fc8b07d1f65ce07ca8__af
>         \
>         -
>           file://Documentation/licenses/__COPYING.UCB;md5=__263860f8968d8bafa5392cab742852__62 \
>         -
>           file://getopt/COPYING;md5=__c3a41733416fb80af7ba1b7e1f7125__51"
>         +
>           file://Documentation/licenses/__COPYING.UCB;md5=__263860f8968d8bafa5392cab742852__62"
>
>            inherit autotools gettext pkgconfig
>            DEPENDS = "zlib ncurses"
>            DEPENDS_append_class-native = " lzo-native"
>         +DEPENDS_append_class-target = " libpam"
>
>
>     Forgot to ask in my other email, why the dependency on libpam here?
>     Should this not be under a check for pam in DISTRO_FEATURES?
>
>
> it did not build without pam. Try it out may be I was wrong.

Seemed to work fine for me with Poky, was this a non-distro setting?

Sau!



