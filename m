Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 118C0620A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:51:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 09:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,715,1363158000"; d="scan'208";a="341200198"
Received: from unknown (HELO helios.localnet) ([10.255.12.254])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 09:51:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 21 May 2013 17:51:23 +0100
Message-ID: <11605555.E9oYV9MnH1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369135176.6695.15.camel@phil-desktop.brightsign>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-2-git-send-email-tf+lists.yocto@r-finger.com>
	<1369135176.6695.15.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/8] clutter.bbclass: helper class for clutter and friends
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
X-List-Received-Date: Tue, 21 May 2013 16:51:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 May 2013 12:19:36 Phil Blundell wrote:
> On Tue, 2013-05-21 at 12:04 +0100, Tomas Frydrych wrote:
> >  meta/classes/clutter.bbclass |   23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta/classes/clutter.bbclass
> 
> Do we really need a new class for this?  Can it be merged with gnomebase
> somehow, perhaps?
> 
> If clutter really does need its own specialised logic then maybe clutter
> and cogl should both stay in recipes-graphics/clutter and just share
> an .inc file.  It seems a bit sad to clutter (no pun intended) the
> global classes directory with this sort of thing.

Have to say I agree; given that this set has been merged we could take this as 
an additional patch if it works for Tomas?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

