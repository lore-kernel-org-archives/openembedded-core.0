Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnGy5-00018q-MN
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 22:53:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 13:43:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57409565"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 13:43:47 -0800
Message-ID: <4F15EB93.9090301@linux.intel.com>
Date: Tue, 17 Jan 2012 13:43:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
In-Reply-To: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
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
X-List-Received-Date: Tue, 17 Jan 2012 21:53:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 12:30 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> This recipe is needed by guile.
> And guile is needed for autogen.
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-support/bdwgc/bdwgc_20110107.bb |   38 ++++++++++++++++++++++++++
>   1 files changed, 38 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
>
> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> new file mode 100644
> index 0000000..1aaa5b8
> --- /dev/null
> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "A garbage collector for C and C++"
> +
> +DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
> + used as a garbage collecting replacement for C malloc or C++ new. It allows\
> + you to allocate memory basically as you normally would, without explicitly\
> + deallocating memory that is no longer useful. The collector automatically\
> + recycles memory when it determines that it can no longer be otherwise\
> + accessed.\
> +  The collector is also used by a number of programming language\
> + implementations that either use C as intermediate code, want to facilitate\
> + easier interoperation with C libraries, or just prefer the simple collector\
> + interface.\
> +  Alternatively, the garbage collector may be used as a leak detector for C\
> + or C++ programs, though that is not its primary goal.\
> +  Empirically, this collector works with most unmodified C programs, simply\
> + by replacing malloc with GC_malloc calls, replacing realloc with GC_realloc\
> + calls, and removing free calls."
> +
> +HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
> +SECTION = "devel"
> +LICENSE = "custom"
What's custom?  Is this the correct LICENSE name to use here?
Beth comments?

Sau!

> +LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc"
> +
> +SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-7_2alpha5-20110107.tar.bz2"
> +
> +SRC_URI[md5sum] = "4f3c130fc71ff23584edaa19a37739ee"
> +SRC_URI[sha256sum] = "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
> +
> +PR = "r0"
> +
> +S = "${WORKDIR}/bdwgc"
> +
> +do_install_append (){
> +	rm -f ${D}${datadir}/${PN}
> +}
> +
> +inherit autotools
> +BBCLASSEXTEND = "native nativesdk"


