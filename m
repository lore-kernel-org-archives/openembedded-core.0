Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F033471633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 18:23:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2015 11:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,426,1437462000"; d="scan'208";a="793025119"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.66]) ([10.219.5.66])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2015 11:23:17 -0700
Message-ID: <55E0A71B.5040504@linux.intel.com>
Date: Fri, 28 Aug 2015 13:23:23 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alex Franco <alejandro.franco@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
In-Reply-To: <1440626255-29614-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 0/3] Empty-image functionality
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
X-List-Received-Date: Fri, 28 Aug 2015 18:23:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Acked-by: Aníbal Limón <anibal.limon@linux.intel.com>

On 26/08/15 16:57, Alex Franco wrote:
> Enable creation of core-empty-image (a recipe that inherits image
> without any extra packages) or similar empty images, whether RPM,
> DEB or IPK packaging is selected.
>
> [YOCTO #7664]
>
> Alex Franco (3):
>    Empty image: core-image-empty recipe, Rootfs fix
>    Empty image: package list splitting and iteration
>    Empty image: filesystem allocation
>
>   meta/classes/image_types.bbclass             | 10 +++++++++-
>   meta/classes/license.bbclass                 |  2 +-
>   meta/lib/oe/package_manager.py               |  5 +++--
>   meta/lib/oe/rootfs.py                        |  8 ++++++--
>   meta/recipes-core/images/core-image-empty.bb |  7 +++++++
>   5 files changed, 26 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-core/images/core-image-empty.bb
>


