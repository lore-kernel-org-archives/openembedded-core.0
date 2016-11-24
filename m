Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E66B071A65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 18:59:54 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 10:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="35297016"
Received: from kimjoey-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.104])
	by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2016 10:59:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 25 Nov 2016 07:59:51 +1300
Message-ID: <5251131.puhPuqrAHf@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1479973589.6873.15.camel@intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
	<1479973589.6873.15.camel@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 18:59:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 24 Nov 2016 08:46:29 Patrick Ohly wrote:
> On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
> > Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky,
> > and
> > there is no passwd, so that user can login easily without a passwd, I
> > think
> > that current status is more unsafe ?
> 
> Both well-known password and no password are unsafe. User "root" with
> password "root" is not even "more" safe already now, because tools that
> brute-force logins try that. Choosing something else would be a bit
> safer for a short while until the tools add it to their dictionary.
> 
> Poky is also targeting a different audience than OE-core. Poky can
> assume to be used in a secure environment, OE-core can't (because it
> might be used for all kinds of devices).

I don't think that's part of the design goals on either side, it's simply 
about making development easier. The feature is clearly labelled "debug-
tweaks" because it's for debugging not for production. It could be that we 
should make it do other things like append a notice to /etc/issue to avoid 
people leaving it on for production, if that is a concern.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

