Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A318E6B03C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 18:36:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2013 11:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="344694718"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 11:36:46 -0700
Message-ID: <51E04CBD.9030302@linux.intel.com>
Date: Fri, 12 Jul 2013 11:36:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Fix typos
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
X-List-Received-Date: Fri, 12 Jul 2013 18:36:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2013 08:10 AM, Emilia Ciobanu wrote:
> Add/Update PV variable into git recipes
>

Have you checked that these change and the other do not cause packages 
to go backwards?  We need to make sure on-target updates still work 
correctly.

Please send an updated patch set consolidating all your changes.

Thanks
	Sau!

> The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:
>
>    meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib emac/add_pv_to_recipes
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/add_pv_to_recipes
>
> Emilia Ciobanu (6):
>    rt-tests: add PV variable into recipe
>    kmod: add PV variable into recipe
>    hwlatdetect: add PV variable into recipe
>    lttng-ust: add PV variable into recipe
>    connman-gnome: add PV variable into recipe
>    mtd-utils: add PV variable into recipe
>
>   .../connman/connman-gnome_0.7.bb                   |    2 ++
>   meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    2 +-
>   meta/recipes-kernel/kmod/kmod_git.bb               |    1 +
>   meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb       |    2 +-
>   meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb       |    1 +
>   meta/recipes-rt/rt-tests/rt-tests_0.85.bb          |    1 +
>   6 files changed, 7 insertions(+), 2 deletions(-)
>

