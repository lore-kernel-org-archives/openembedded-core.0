Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqup-0003Pr-Mo
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:39:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2012 10:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221148628"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 10:27:22 -0700
Message-ID: <5050C5FA.3080407@linux.intel.com>
Date: Wed, 12 Sep 2012 10:27:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1347387265.29443.38.camel@x121e.pbcl.net>
In-Reply-To: <1347387265.29443.38.camel@x121e.pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES
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
X-List-Received-Date: Wed, 12 Sep 2012 17:39:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 11:14 AM, Phil Blundell wrote:
> Commit 13544fbc6217fee1731a6da1e2cf94901a500842 changed the ordering
> of PACKAGES so that ${PN}-dev came before ${PN}.  However, this caused
> the FILES matching to go wrong if ${libdir} == ${base_libdir}.  Fix this
> by moving ${PN} ahead of ${PN}-dev once again.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> V2: now with high-tech PR goodness
>
>   meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
>   meta/recipes-core/eglibc/eglibc_2.16.bb     |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index edf7a75..adf31de 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -17,7 +17,7 @@ python __anonymous () {
>   # Set this to zero if you don't want ldconfig in the output package
>   USE_LDCONFIG ?= "1"
>
> -PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN} eglibc-extra-nss"
> +PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>
>   # The ld.so in this eglibc supports the GNU_HASH
>   RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index c4bc18c..ffa4d5f 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>   SRCREV = "20393"
>
>   DEPENDS += "gperf-native"
> -PR = "r7"
> +PR = "r8"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_16"
>

Merged into OE-Core

Thanks
	Sau!



