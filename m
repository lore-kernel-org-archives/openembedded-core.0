Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33B8A6A463
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 06:08:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2013 23:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,691,1367996400"; d="scan'208";a="367152900"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2013 23:08:02 -0700
Message-ID: <51E78642.1040402@linux.intel.com>
Date: Wed, 17 Jul 2013 23:08:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1373988362-10097-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1373988362-10097-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Thu, 18 Jul 2013 06:08:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2013 08:26 AM, Cristian Iorga wrote:
> This sets of patches adds bluez5 recipes as experimental packages.
> BlueZ 5.X is not an upgrade for Bluez 4.x, as such, no upgrade is
> provided/possible.
> The two versions of the BT stack also conflicts each other.
>
> In V4 RREPLACES is removed from the recipes.
>
> Cristian Iorga (2):
>    bluez5: new package for v5.7
>    bluez4: conflicts with bluez5
>
>   meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +
>   .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++
>   meta/recipes-connectivity/bluez5/bluez5.inc        |   68 ++++++++++++++++++++
>   meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |    5 ++
>   4 files changed, 91 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb
>

Looks like there is a world build failure also:

http://autobuilder.yoctoproject.org:8011/builders/nightly-world/builds/210/steps/Building%20Images/logs/stdio

Please investigate

Thanks

Sau!


