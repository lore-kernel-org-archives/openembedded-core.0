Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjEuz-0007T7-Lp
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:21:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jul 2011 11:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="32170161"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2011 11:17:11 -0700
Message-ID: <4E25CA26.6090601@linux.intel.com>
Date: Tue, 19 Jul 2011 11:17:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310976967-7251-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1310976967-7251-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] gcc-package-target: don't fail if the .la files we try to delete are not there to start with
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
X-List-Received-Date: Tue, 19 Jul 2011 18:21:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2011 01:16 AM, Koen Kooi wrote:
> This fixes:
>
> | rm: cannot remove `/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r39.1+svnr175127/image/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.5.4/*.la': No such file or directory
> | ERROR: Function 'do_install' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r39.1+svnr175127/temp/log.do_install.19514 for further information)
> NOTE: package gcc-4.5-r39.1+svnr175127: task do_install: Failed
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-devtools/gcc/gcc-package-target.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
> index 9a91a7f..e6105da 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> @@ -84,7 +84,7 @@ do_install () {
>   	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
>   	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
>   	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
> -	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
> +	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
>
>   	# Hack around specs file assumptions
>   	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs&&  sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs

Merged into OE-core

Thanks
	Sau!


