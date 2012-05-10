Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSKtl-0001z6-NJ
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 06:22:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2012 21:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138914960"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2012 21:12:46 -0700
Message-ID: <4FAB403E.7040700@linux.intel.com>
Date: Wed, 09 May 2012 21:12:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336517492.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336517492.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/3] Kmod fixes
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
X-List-Received-Date: Thu, 10 May 2012 04:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2012 03:53 PM, Khem Raj wrote:
> This patchset fixes upgrade paths form kmod
> Updates to .8 release that should fix meta-oe PR being ahead of oe-core
> Packages libkmod in base_libdir instead of libdir
>
> The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:
>
>    kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/kmod
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/kmod
>
> Khem Raj (2):
>    kmod: Update to .8 release
>    kmod: Use base_libdir for installing libkmod
>
> Martin Jansa (1):
>    kmod: fix upgrade path from module-init-tools
>
>   meta/recipes-kernel/kmod/kmod.inc    |    4 ++--
>   meta/recipes-kernel/kmod/kmod_git.bb |   12 ++++++++----
>   2 files changed, 10 insertions(+), 6 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


