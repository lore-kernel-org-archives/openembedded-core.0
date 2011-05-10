Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJqZf-0006sg-SI
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:18:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2011 10:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="640749336"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 10:15:33 -0700
Message-ID: <4DC972B4.2030503@linux.intel.com>
Date: Tue, 10 May 2011 10:15:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304431099.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1304431099.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/2] fixes to bug #412 and #856
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
X-List-Received-Date: Tue, 10 May 2011 17:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2011 07:01 AM, Dexuan Cui wrote:
> From: Dexuan Cui<dexuan.cui@intel.com>
>
> [YOCTO #856]
>      Commit 320a641df18024265c3d2b3b08251a231f9fd6a0 omitted the line when being
> merged into master branch.
>
> [YOCTO #412]
>      lttng-viewer: explicitly add linkage to lttvwindow.
>      Without the fix, lttv-gui inside target can't run, complaining
>      "undefined symbol: LTTV_VIEWER_CONSTRUCTORS".
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: dcui/distro
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro
>
> Thanks,
>      Dexuan Cui<dexuan.cui@intel.com>
> ---
>
>
> Dexuan Cui (2):
>    task-core-tools.bb: properly enable lttng-ust for ARM
>    lttng-viewer: explicitly add linkage to lttvwindow
>
>   meta/recipes-core/tasks/task-core-tools.bb         |    3 +-
>   .../lttng-viewer/add_linkage_to_lttvwindow.patch   |   42 ++++++++++++++++++++
>   meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |   10 +++--
>   3 files changed, 50 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
>

Pulled into core and master and staged for bernard

Thanks
	Sau!



