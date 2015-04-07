Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 26CCD73D1B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 12:46:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 Apr 2015 05:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="691410015"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.25.100])
	([10.252.25.100])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2015 05:46:07 -0700
Message-ID: <1428410766.12283.34.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 07 Apr 2015 15:46:06 +0300
In-Reply-To: <20150407124458.GA22953@jama>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496CEA@irsmsx105.ger.corp.intel.com>
	<1428406875.12283.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F496D80@irsmsx105.ger.corp.intel.com>
	<1428410191.12283.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<20150407124458.GA22953@jama>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 12:46:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 14:44 +0200, Martin Jansa wrote:
> On Tue, Apr 07, 2015 at 03:36:31PM +0300, Tanu Kaskinen wrote:
> > This would be more appropriate for recipes that only support bluez4:
> > 
> > #  inherit bluetooth
> > #  PACKAGECONFIG ??= "${@bb.utils.contains('BLUEZ', 'bluez4', 'bluez4, '', d}"
> > #  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
> 
> The last example isn't correct, because you still need to respect
> 'bluetooth' in 'DISTRO_FEATURES' before enabling whatever is in BLUEZ
> variable.

BLUEZ is empty if 'bluetooth' is not in DISTRO_FEATURES, so my example
should work fine.

-- 
Tanu


