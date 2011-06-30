Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcQff-0004e4-QN
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:29:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jun 2011 16:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,455,1304319600"; d="scan'208";a="22146809"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by orsmga001.jf.intel.com with ESMTP; 30 Jun 2011 16:25:23 -0700
Message-ID: <4E0D05E3.90800@linux.intel.com>
Date: Thu, 30 Jun 2011 16:25:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308902512.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1308902512.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH v2 0/4] Integrate ccache-native
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
X-List-Received-Date: Thu, 30 Jun 2011 23:29:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2011 02:53 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> 1) Add ccache as a native tool and put its recipe files to:
> 'meta/recipes-devtools/ccache';
>
> 2) Set 'CCACHE_DIR' in 'bitbake.conf' and create the dirs for every
> package before task 'do_configure' started;
>
> 3) Add 'ccache' for all SDK images;
>
> 4) Remove duplicate 'ccache.inc' from 'meta/class/'.
>
> The following changes since commit 7cd2ac0e40d854bab9a32512018aff6172500c0e:
>    Beth Flanagan (1):
>          common-licenses: Additions and corrections
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/ccache
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ccache
>
> Wenzong Fan (4):
>    ccache: Integrate ccache-native to poky
>    ccache: Set CCACHE on a per recipe basis
>    ccache: Add 'ccache' for SDK images
>    ccache: Remove duplicate 'ccache.inc' from 'meta/class/'
>
>   meta/classes/base.bbclass                    |    1 +
>   meta/classes/ccache.inc                      |   11 -----------
>   meta/conf/bitbake.conf                       |    1 +
>   meta/recipes-core/tasks/task-core-sdk.bb     |    1 +
>   meta/recipes-devtools/ccache/ccache.inc      |   16 ++++++++++++++++
>   meta/recipes-devtools/ccache/ccache_3.1.5.bb |    8 ++++++++
>   6 files changed, 27 insertions(+), 11 deletions(-)
>   delete mode 100644 meta/classes/ccache.inc
>   create mode 100644 meta/recipes-devtools/ccache/ccache.inc
>   create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.5.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


