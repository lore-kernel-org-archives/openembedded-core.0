Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 65F44731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 20:54:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 04 Jan 2016 12:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,522,1444719600"; d="scan'208";a="853420397"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.151])
	([10.219.5.151])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2016 12:55:00 -0800
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
References: <1450449271-28582-1-git-send-email-matt@madison.systems>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <568ADC82.4040009@linux.intel.com>
Date: Mon, 4 Jan 2016 14:56:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1450449271-28582-1-git-send-email-matt@madison.systems>
Subject: Re: [PATCH v2 0/3] Debian multilib packaging fixes
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
X-List-Received-Date: Mon, 04 Jan 2016 20:54:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Matt,

Sorry for the delay in the response, i'll test again your patches with
the new one and the same error appears when build
core-image-full-cmdline or core-image-sato.

	MACHINE ??= "qemux86-64"

	IMAGE_INSTALL_append = " lib32-connman"
	require conf/multilib.conf
	MULTILIBS = "multilib:lib32"
	DEFAULTTUNE_virtclass-multilib-lib32 = "x86"


I'm reviewing if this an error in the meta data (because
core-image-minimal builds) or in the class.

Best regards,
	alimon

On 12/18/2015 08:34 AM, Matt Madison wrote:
> This adds a third patch that fixes the problem where APT couldn't
> resolve dependencies between when two packages of different architectures
> both depended on an allarch package.
> 
> Matt Madison (3):
>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>     function
>   package_manager.py: fixes for multilib deb packaging builds
>   package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages
> 
>  meta/classes/cross-canadian.bbclass |  2 +-
>  meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++----------
>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>  3 files changed, 39 insertions(+), 17 deletions(-)
> 

