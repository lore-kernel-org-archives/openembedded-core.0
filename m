Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fZ4-0004QG-Tk
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:36:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Mar 2012 09:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120675269"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by azsmga001.ch.intel.com with ESMTP; 19 Mar 2012 09:27:18 -0700
Message-ID: <4F675E65.5040906@linux.intel.com>
Date: Mon, 19 Mar 2012 09:27:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331897967.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1331897967.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] qemugl fix
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
X-List-Received-Date: Mon, 19 Mar 2012 16:36:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 04:57 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> RP,
> This fixed [YOCTO #1927]. Pls. help to review and pull.
>
> Thanks,
> Edwin
>
> The following changes since commit be0f9dd483af2a2f55b2ae8ef9ca172e7c90819c:
>
>    python-imaging: bring in fixes from meta-oe (2012-03-16 10:57:09 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/fix2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2
>
> Zhai Edwin (1):
>    qemugl: Hide some GLX extensions by default
>
>   .../mesa/qemugl/extensions_emulation.patch         |   34 ++++++++++++++++++++
>   meta/recipes-graphics/mesa/qemugl_git.bb           |    5 ++-
>   2 files changed, 37 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-graphics/mesa/qemugl/extensions_emulation.patch
>

Merged into OE-Core

Thanks
	Sau!


