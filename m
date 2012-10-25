Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRP2h-0002Nv-NK
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 17:08:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Oct 2012 07:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,648,1344236400"; d="scan'208";a="232449638"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by orsmga002.jf.intel.com with ESMTP; 25 Oct 2012 07:54:48 -0700
Message-ID: <508952B7.7050502@linux.intel.com>
Date: Thu, 25 Oct 2012 07:54:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1351155183.git.kai.kang@windriver.com>
	<6568219d957b11739d325f2573df9266cfe228a6.1351155183.git.kai.kang@windriver.com>
In-Reply-To: <6568219d957b11739d325f2573df9266cfe228a6.1351155183.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl: update dependencies
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
X-List-Received-Date: Thu, 25 Oct 2012 15:08:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2012 02:50 AM, Kang Kai wrote:
> Update dependencies for perl modules again. When only install
> perl-module-file-glob, run perl script with "require File::Glob;" will
> fail. Update dependencies to fix that.
>
Is this just a point fix for the File::Glob issue?

As I was originally researching this issue it seemed to me that the 
perl_rdepends was incorrect, the script used to generate it did not 
actually work, please review the bug comment.

Are you going to look at the bigger issue?

Thanks
	Sau!

> [Yocto 3069]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   .../recipes-devtools/perl/perl-rdepends_5.14.2.inc |    2 ++
>   meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
> index 2707fe8..39972ca 100644
> --- a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
> +++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
> @@ -13,8 +13,10 @@
>
>   # Some additional dependencies that the above doesn't manage to figure out
>   # Please take care that exporter depends exporter-heavy, not reverse
> +RDEPENDS_${PN}-module-dynaloader += "${PN}-module-carp"
>   RDEPENDS_${PN}-module-exporter += "${PN}-module-exporter-heavy"
>   RDEPENDS_${PN}-module-file-glob += "${PN}-module-feature"
> +RDEPENDS_${PN}-module-file-glob += "${PN}-module-file"
>   RDEPENDS_${PN}-module-file-path += "${PN}-module-cwd"
>   RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
>   RDEPENDS_${PN}-module-file-stat += "${PN}-module-fcntl"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 3ede831..1e1eb04 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db grep-native"
>   DEPENDS += "gdbm zlib"
> -PR = "r13"
> +PR = "r14"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
>


