Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBFm-0003EN-Bu
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:08:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 09:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173263847"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 09:56:45 -0700
Message-ID: <5005994D.8000300@linux.intel.com>
Date: Tue, 17 Jul 2012 09:56:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342167069.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1342167069.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/3] more automake 1.12.x related fixes
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
X-List-Received-Date: Tue, 17 Jul 2012 17:08:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2012 01:12 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> nongplv3 & commercial licence recipe testing revelaed more issue, and the fixes
> for these are here.
> Thanks,
> Nitin
>
> The following changes since commit 581d9dc2d148b67332a255cc1e7ce0679ff82c23:
>
>    tar: fix build with automake 1.12.x (2012-07-12 21:13:42 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/automake_update_on_master
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake_update_on_master
>
> Nitin A Kamble (3):
>    gawk-3.1.5: fix build with automake 1.12.x
>    sed-4.1.2: fix build with automake 1.12.x
>    lame: fix build with automake 1.12.x
>
>   ...atch => gawk-3.1.5_fix_for_automake-1.12.patch} |    0
>   meta/recipes-extended/gawk/gawk_3.1.5.bb           |    5 +-
>   .../sed-4.1.2_fix_for_automake-1.12.patch          |   37 ++++++++++++
>   meta/recipes-extended/sed/sed_4.1.2.bb             |    5 +-
>   .../lame/lame-3.99.5_fix_for_automake-1.12.x.patch |   59 ++++++++++++++++++++
>   meta/recipes-multimedia/lame/lame_3.99.5.bb        |   14 +----
>   6 files changed, 105 insertions(+), 15 deletions(-)
>   rename meta/recipes-extended/gawk/gawk-3.1.5/{gawk_fix_for_automake-1.12.patch => gawk-3.1.5_fix_for_automake-1.12.patch} (100%)
>   create mode 100644 meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
>

Merged this set into OE-Core

Thanks
	Sau!


