Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SzTRY-0000cv-F5
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 16:10:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2012 06:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,739,1336374000"; d="scan'208";a="177992469"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2012 06:58:42 -0700
Message-ID: <5023C211.6060003@linux.intel.com>
Date: Thu, 09 Aug 2012 16:58:41 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
References: <cover.1344411406.git.Xin.Ouyang@windriver.com>
	<b3cee5ec4889c0f001f8b32629331d7b1bb90438.1344411406.git.Xin.Ouyang@windriver.com>
In-Reply-To: <b3cee5ec4889c0f001f8b32629331d7b1bb90438.1344411406.git.Xin.Ouyang@windriver.com>
Subject: Re: [PATCH 1/1] grub-1.99: Add flex-native to DEPENDS
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
X-List-Received-Date: Thu, 09 Aug 2012 14:10:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2012 10:42 AM, xin.ouyang@windriver.com wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>
> [YOCTO #2916]
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>   meta/recipes-bsp/grub/grub_1.99.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
> index 9879651..64cefe0 100644
> --- a/meta/recipes-bsp/grub/grub_1.99.bb
> +++ b/meta/recipes-bsp/grub/grub_1.99.bb
> @@ -11,9 +11,9 @@ SECTION = "bootloaders"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -DEPENDS = "autogen-native"
> +DEPENDS = "autogen-native flex-native"
Why is it needed, you don't have any commit message as to that?

Also, Radu just posted a recipe update, can you verify if it is still 
required for the newer version and rebase if needed.

Thanks	
	Sau!

>   RDEPENDS_${PN} = "diffutils freetype"
> -PR = "r11"
> +PR = "r12"
>
>   SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://grub-install.in.patch \
>


