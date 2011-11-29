Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVQ2C-0008Gi-H7
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:55:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 07:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="80920416"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 07:49:11 -0800
Message-ID: <4ED4FEF7.4020800@linux.intel.com>
Date: Tue, 29 Nov 2011 07:49:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322444142.git.raj.khem@gmail.com>
In-Reply-To: <cover.1322444142.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/3] Fixes for python-native and runqemu with uclibc
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
X-List-Received-Date: Tue, 29 Nov 2011 15:55:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/2011 05:46 PM, Khem Raj wrote:
> These patches fix a problem with python-native
> and other patches to get runqemu working with uclibc
>
> The following changes since commit a14b41f4de3ea6c3f00ff7a1d0441483e40b28de:
>
>    default-distrovars: Define SDK_VERSION and DISTRO_VERSION (2011-11-27 17:32:00 -0800)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc
>
> Khem Raj (3):
>    default-distrovars: Define SDK_VERSION and DISTRO_VERSION
>    toolchain-scripts.bbclass: Make it work when TCLIBC=uclibc
>    python-native: Fix gcc compiler detecting logic
>
>   meta/classes/toolchain-scripts.bbclass             |    8 +++++-
>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>   .../python/python-native/unixccompiler.patch       |   22 ++++++++++----------
>   .../recipes-devtools/python/python-native_2.7.2.bb |    2 +-
>   4 files changed, 20 insertions(+), 15 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


