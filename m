Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrw1H-0001jV-TQ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 19:59:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Aug 2011 10:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,363,1309762800"; d="scan'208";a="37913695"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by azsmga001.ch.intel.com with ESMTP; 12 Aug 2011 10:55:09 -0700
Message-ID: <4E4568FD.8090605@linux.intel.com>
Date: Fri, 12 Aug 2011 10:55:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/7] Miscellaneous fixes
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
X-List-Received-Date: Fri, 12 Aug 2011 17:59:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 11:23 AM, Christopher Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> A variety of unrelated fixes I've had local for a while.
>
> The following changes since commit a752b23767189f2678367e47ca0b41f49c56a631:
>
>    sstate: Add level 2 debug so its possible to see what sstate is doing (2011-08-11 17:19:51 +0100)
>
> are available in the git repository at:
>    github:kergoth/oe-core misc-fixes
>
> go here for github's branch comparison interface:
>    https://github.com/kergoth/oe-core/compare/master...misc-fixes
>
> Chris Larson (7):
>    busybox: don't strip the main binary
>    insane: add linux-gnu to the platform data
>    nativesdk: inherit relocatable
>    sanity: shift the required utils into a variable
>    package: include SECTION in the pkgdata
>    package: allow setting a section for locale packages
>    cross: also empty PACKAGES_DYNAMIC
>
>   meta/classes/cross.bbclass                  |    2 ++
>   meta/classes/insane.bbclass                 |    3 +++
>   meta/classes/nativesdk.bbclass              |    2 ++
>   meta/classes/package.bbclass                |    6 ++++++
>   meta/classes/sanity.bbclass                 |    4 +++-
>   meta/recipes-core/busybox/busybox.inc       |    3 ++-
>   meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
>   7 files changed, 19 insertions(+), 3 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


