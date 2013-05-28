Return-Path: <paul.eggleton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B63056A406;
	Tue, 28 May 2013 16:22:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 28 May 2013 09:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,758,1363158000"; d="scan'208";a="341420858"
Received: from unknown (HELO helios.localnet) ([10.252.121.204])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2013 09:15:20 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2013 17:15:08 +0100
Message-ID: <2106642.Q9pyc3AhWP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C70406D1D@ORSMSX103.amr.corp.intel.com>
References: <cover.1369324957.git.nitin.a.kamble@intel.com>
	<f5d15445e6981c814b2726f916feb2ead0d3930c.1369324957.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C70406D1D@ORSMSX103.amr.corp.intel.com>
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>, "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dropbear: a fix for hang in dropbearkey, built for x32
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
X-List-Received-Date: Tue, 28 May 2013 16:22:15 -0000
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 May 2013 16:10:33 Kamble, Nitin A wrote:
> Saul, RP,
>   FYI, this fix is still pending for oecore layer.

It has already been merged:

http://cgit.openembedded.org/openembedded-core/commit/?id=8f5bc47729edb8cb051d81e9ff1680cb8d2eca25

> Paul,
>   This is for the 1.4.1 bug
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4496 . Once Saul or RP
> pulls it in master, you can pull it in 1.4.1 release branch.

OK; I have done this locally.

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


