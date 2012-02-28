Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2SCm-0002Eg-2C
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 19:55:20 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2012 10:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112346885"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2012 10:46:51 -0800
Message-ID: <4F4D211B.5030808@linux.intel.com>
Date: Tue, 28 Feb 2012 10:46:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330400946-22941-1-git-send-email-james@digitalmatter.com.au>
In-Reply-To: <1330400946-22941-1-git-send-email-james@digitalmatter.com.au>
Subject: Re: [PATCH] mtd-utils: Don't use host 'ranlib' or 'ar'.
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
X-List-Received-Date: Tue, 28 Feb 2012 18:55:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 07:49 PM, James Limbouris wrote:
> If ranlib, ar, or cc are not supplied to make, it attempts to use ${CROSS}xxx.
> Since ${CROSS} is not set, host ranlib may run, producing an unusable .a file on some platforms.
>
> Signed-off-by: James Limbouris<james@digitalmatter.com.au>
> ---
>   meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
> index 519472c..4228b51 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
> @@ -11,9 +11,9 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf
>
>   S = "${WORKDIR}/git/"
>
> -PR = "r0"
> +PR = "r1"
>
> -EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
>
>   do_install () {
>   	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}

Merged into OE-core

Thanks
	Sau!


