Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QL0gb-0001BJ-8s
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 00:18:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 15:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,366,1301900400"; d="scan'208";a="642494492"
Received: from unknown (HELO [10.255.12.119]) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2011 15:15:26 -0700
Message-ID: <4DCDAD7E.6060401@linux.intel.com>
Date: Fri, 13 May 2011 15:15:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305234110.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305234110.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/1] a fix for gcc 4.6.0 target recipe
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
X-List-Received-Date: Fri, 13 May 2011 22:18:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2011 02:03 PM, Nitin A Kamble wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: nitin/misc
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Thanks,
>      Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>
>
> Nitin A Kamble (1):
>    gcc: fix target gcc runtime issue
>
>   meta/recipes-devtools/gcc/gcc-4.6.0.inc          |    2 +-
>   meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
>   meta/recipes-devtools/gcc/gcc_4.3.3.bb           |    2 +-
>   meta/recipes-devtools/gcc/gcc_4.5.1.bb           |    2 +-
>   meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb  |    2 +-
>   5 files changed, 5 insertions(+), 4 deletions(-)
>
Merged into oe-core and poky master

Thanks
	Sau!



