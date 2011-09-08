Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1VeG-000162-1l
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:51:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Sep 2011 20:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="46295944"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2011 20:46:27 -0700
Message-ID: <4E683A93.3070000@linux.intel.com>
Date: Wed, 07 Sep 2011 20:46:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1315326300.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1315326300.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Update prelinker to latest upstream version
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
X-List-Received-Date: Thu, 08 Sep 2011 03:51:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2011 09:26 AM, Mark Hatle wrote:
> Update the prelinker to the latest (yoctoproject) cross_prelinker version.
>
> This syncs to the latest Red Hat version, provides a new rtld emulation, and
> now can identify bad GNU_HASH entries to help detect a bug in the hash
> generation observed on PPC64.
>
> The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:
>
>    icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/prelink
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink
>
> Mark Hatle (1):
>    prelink: Update to latest upstream version
>
>   meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>

Merged to OE-Core

Thanks
	Sau!



