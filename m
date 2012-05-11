Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStvk-0003Po-5a
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:47:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 May 2012 10:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99048766"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:37:07 -0700
Message-ID: <4FAD4E43.3020007@linux.intel.com>
Date: Fri, 11 May 2012 10:37:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336598125.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336598125.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/1] eglibc-2.15 fix for poky-tiny
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
X-List-Received-Date: Fri, 11 May 2012 17:47:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 02:20 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 6841abd17268a1c1ca5e3634f0ae9e21426ca9c9:
>
>    Hob: change the workflow about click 'Run Image' to run directly after builded a qemu image (2012-05-09 21:56:47 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/eglibc-fix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/eglibc-fix
>
> Nitin A Kamble (1):
>    eglibc: fix build with poky-tiny distro
>
>   .../eglibc_fix_findidx_parameters.patch            |   38 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    3 +-
>   2 files changed, 40 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findidx_parameters.patch
>

Merged into OE-Core

Thanks
	Sau!


