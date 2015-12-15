Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB722601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 17:28:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Dec 2015 09:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,433,1444719600"; d="scan'208";a="861303403"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.48]) ([10.219.5.48])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2015 09:28:30 -0800
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56704DFF.9070804@linux.intel.com>
Date: Tue, 15 Dec 2015 11:29:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449422732-12975-1-git-send-email-matt@madison.systems>
Subject: Re: [PATCH 0/2] Debian multilib packaging fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 17:28:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Matt,

I'm starting to look at your patches, in what arches/combinations you
test the patches?

Kind regards,
	alimon


On 12/06/2015 11:25 AM, Matt Madison wrote:
> I ran into sevearl issues while trying to build an ARM multilib rootfs
> using Debian packaging.  After several go-rounds, it looked like the
> cleanest solution was to tweak how DPKG_ARCH gets constructed and
> to have the DpkgPM class in oe/package_manager.py use that variable
> to locate multilib variants (similar to RpmPM).  I also took the
> liberty of expanding the Debian architecture mappings so the names
> align better with what's documented on the Debian wiki, for those
> cases where a direct mapping is possible.
> 
> Matt Madison (2):
>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>     function
>   package_manager.py: fixes for multilib deb packaging builds
> 
>  meta/classes/cross-canadian.bbclass |  2 +-
>  meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++----------
>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>  3 files changed, 37 insertions(+), 17 deletions(-)
> 

