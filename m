Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYIw-0005io-6m
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:59:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2012 08:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="145116162"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2012 08:47:06 -0700
Message-ID: <50535179.6020208@linux.intel.com>
Date: Fri, 14 Sep 2012 08:47:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Matthew McClintock <msm@freescale.com>
References: <1347484023-28661-1-git-send-email-msm@freescale.com>
In-Reply-To: <1347484023-28661-1-git-send-email-msm@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind_3.7.0.bb: fix missing leading space on _append
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
X-List-Received-Date: Fri, 14 Sep 2012 15:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2012 02:07 PM, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> index 651ae60..3def11d 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>
>   X11DEPENDS = "virtual/libx11"
>   DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>   	   file://fix_issue_caused_by_ccache.patch \
> @@ -22,7 +22,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>             "
>
>   SRC_URI_append_powerpc = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
> -SRC_URI_append_powerpc64 = "file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
> +SRC_URI_append_powerpc64 = " file://valgrind-3.7.0-fix-error-of-reading-debug-info.patch"
>
>   SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
>   SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
>
Merged into OE-Core

Thanks
	Sau!



