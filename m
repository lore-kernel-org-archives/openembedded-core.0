Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNnpP-00037G-MV
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 16:43:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Nov 2011 07:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="82454829"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 08 Nov 2011 07:36:51 -0800
Message-ID: <4EB94C93.1080100@linux.intel.com>
Date: Tue, 08 Nov 2011 07:36:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
	<ea69345b97a6115caa6b77782f2fd58dd9eb2507.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <ea69345b97a6115caa6b77782f2fd58dd9eb2507.1320675529.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-core 2/6] kbd: import from meta-oe
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
X-List-Received-Date: Tue, 08 Nov 2011 15:43:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2011 06:19 AM, Martin Jansa wrote:
> * replaces console-tools used in keymaps
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/kbd/kbd_1.15.2.bb |   19 +++++++++++++++++++
>   1 files changed, 19 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/kbd/kbd_1.15.2.bb
>
> diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
> new file mode 100644
> index 0000000..36e68a0
> --- /dev/null
> +++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "This package contains keytable files and keyboard utilities"
> +# everything minus console-fonts is GPLv2+
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=587ce626d15bd61699a64a6b8a5afefb"
> +
> +inherit autotools gettext
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"

Apparently this is not currently fetchable, do you have an updated 
location?  I found something at fossies.org, but the COPYING file is 
different that your checksum, so I am not sure of the differences.

Sau!


> +SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
> +SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
> +
> +PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
> +
> +FILES_${PN}-consolefonts = "${datadir}/consolefonts"
> +FILES_${PN}-consoletrans = "${datadir}/consoletrans"
> +FILES_${PN}-keymaps = "${datadir}/keymaps"
> +FILES_${PN}-unimaps = "${datadir}/unimaps"


