Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHdCa-0006kk-Hs
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:41:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 08:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127353877"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 08:32:33 -0700
Message-ID: <4F845291.9020205@linux.intel.com>
Date: Tue, 10 Apr 2012 08:32:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333921009-15203-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1333921009-15203-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] gdb: add --with-libexpat-prefix
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
X-List-Received-Date: Tue, 10 Apr 2012 15:41:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2012 02:36 PM, Andreas Oberritter wrote:
> From: Martin Jansa<Martin.Jansa@gmail.com>
>
> * otherwise it sometimes finds host's expat
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index a8fca6f..5dd4f74 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
>   LTTNGUST_mips64 = ""
>   LTTNGUST_mips64el = ""
>
> -INC_PR = "r7"
> +INC_PR = "r8"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
> @@ -36,7 +36,7 @@ B = "${WORKDIR}/build-${TARGET_SYS}"
>
>   EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
>
> -EXPAT = "--with-expat"
> +EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
>
>   EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
>                   --with-curses --disable-multilib --with-system-readline --disable-sim \

Merged into OE-Core

Thanks
	Sau!


