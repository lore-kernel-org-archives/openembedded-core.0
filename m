Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPI1m-0003Sa-Po
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:42:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 May 2012 11:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137544620"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2012 11:32:38 -0700
Message-ID: <4FA02C46.80709@linux.intel.com>
Date: Tue, 01 May 2012 11:32:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335480719.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/2] Misc fixes
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
X-List-Received-Date: Tue, 01 May 2012 18:42:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2012 03:53 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> This fixes are for issues discovered with gcc-4.7&  eglibc-2.15
>
> Nitin
>
> The following changes since commit c84c6bc074e0fdeaebce99152cdb4b1e7e92543d:
>
>    tcmode-default: make eglibc 2.15 as the default libc (2012-04-26 12:49:25 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Nitin A Kamble (2):
>    eglibc: package mtrace separately
This needs a comment update and check that it really installs to the 
*-sdk images.

>    tcl: fix target recipe build issue on older distros
>
Merged TCL to OE-Core

Thanks
	Sau!

>   meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++-
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>   .../tcl/fix_issue_with_old_distro_glibc.patch      |  109 ++++++++++++++++++++
>   meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    5 +-
>   5 files changed, 121 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
>


