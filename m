Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdoPX-0000g2-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 20:34:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Dec 2011 11:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="49864681"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Dec 2011 11:27:31 -0800
Message-ID: <4EF384A3.1020501@linux.intel.com>
Date: Thu, 22 Dec 2011 11:27:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324495514.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1324495514.git.nitin.a.kamble@intel.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>
Subject: Re: [PATCH 0/3] misc fixes
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
X-List-Received-Date: Thu, 22 Dec 2011 19:34:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2011 11:27 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> Here are few misc fixes for oecore.
>
> Thanks,
> Nitin
>
> The following changes since commit dee0fc1462ba18551571c3b2d0f2b443a2feca18:
>
>    multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:44 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> H.J. Lu (1):
>    gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure
>
Pulled into OE-Core

> Nitin A Kamble (2):
>    bitbake.conf multilib.conf: move the definition of baselib
This requires more information based on RP's Comment:
  "this is a major layout change for x86-64 but Nitin makes no comment 
on that in the commit"

>    binutils: fix building on distros with matching binutils version
>
Merged the binutils patch to OE-Core

>   meta/conf/bitbake.conf                             |    2 +-
>   meta/conf/multilib.conf                            |    2 -
>   .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
>   .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
>   meta/recipes-devtools/binutils/binutils.inc        |    2 +-
>   meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
>   meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   24 ++++++++-----------
>   7 files changed, 15 insertions(+), 21 deletions(-)
>


