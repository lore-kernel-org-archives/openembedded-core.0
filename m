Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROYNI-0008Ka-Rf
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:25:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2011 09:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,489,1315206000"; d="scan'208";a="88629735"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2011 09:18:58 -0800
Message-ID: <4EBC0782.5090004@linux.intel.com>
Date: Thu, 10 Nov 2011 09:18:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320807056.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/4] More useradd cleanups
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
X-List-Received-Date: Thu, 10 Nov 2011 17:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 06:56 PM, Scott Garman wrote:
> Hello,
>
> Richard pointed out that USERADDPN is no longer needed in
> useradd.bbclass. While removing that, I noticed that I was actually
> injecting the user/group preinst script into *all* packages whose
> recipe inherits useradd. That's not what we want, and is the reason
> for the USERADD_PACKAGES variable. So I refactored the class to fix
> that and clarified the useradd-example recipe documentation.
>
> Finally, I added another check to avoid modifying -nativesdk packages.
>
> The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:
>
>    python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/useradd-cleanup-final
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-cleanup-final
>
> Scott Garman (4):
>    useradd.bbclass: only modify packages in USERADD_PACKAGES
>    useradd.bbclass: do not modify -nativesdk packages
>    useradd-example.bb: update example documentation comments
>    avahi: remove USERADDPN
>
>   .../recipes-skeleton/useradd/useradd-example.bb    |    9 ++--
>   meta/classes/useradd.bbclass                       |   45 ++++++++------------
>   meta/recipes-connectivity/avahi/avahi.inc          |    1 -
>   3 files changed, 22 insertions(+), 33 deletions(-)
>

Merged int OE-Core

Thanks
	Sau!


