Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEQG-0002Iu-5J
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:09:40 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 16:02:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92656010"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 16:02:15 -0800
Message-ID: <4F039707.4030200@linux.intel.com>
Date: Tue, 03 Jan 2012 16:02:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324661415.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324661415.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] Upgrade chrpath and libevent
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
X-List-Received-Date: Wed, 04 Jan 2012 00:09:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2011 09:31 AM, Scott Garman wrote:
> Hello,
>
> This pull request upgrades the chrpath and libevent recipes. It has
> been build-tested on all 5 of our qemu architectures.
>
> Scott
>
> The following changes since commit c38693f78c968ab5f4bb557c20d1c8c55393ed6b:
>
>    opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:09 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-final
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-final
>
> Scott Garman (2):
>    chrpath: upgrade to 0.14
>    libevent: upgrade to 2.0.16
>
>   meta/recipes-devtools/chrpath/chrpath_0.13.bb     |   23 ---------------------
>   meta/recipes-devtools/chrpath/chrpath_0.14.bb     |   23 +++++++++++++++++++++
>   meta/recipes-support/libevent/libevent_1.4.14b.bb |   19 -----------------
>   meta/recipes-support/libevent/libevent_2.0.16.bb  |   22 ++++++++++++++++++++
>   4 files changed, 45 insertions(+), 42 deletions(-)
>   delete mode 100644 meta/recipes-devtools/chrpath/chrpath_0.13.bb
>   create mode 100644 meta/recipes-devtools/chrpath/chrpath_0.14.bb
>   delete mode 100644 meta/recipes-support/libevent/libevent_1.4.14b.bb
>   create mode 100644 meta/recipes-support/libevent/libevent_2.0.16.bb
>
Merged to OE-Core

Thanks
	Sau!


