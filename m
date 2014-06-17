Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFF36FFE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 17:01:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jun 2014 10:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,495,1400050800"; d="scan'208";a="558978048"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.19])
	by orsmga002.jf.intel.com with ESMTP; 17 Jun 2014 10:01:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 17 Jun 2014 18:01:11 +0100
Message-ID: <1432900.z2xv1kAz2d@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1403011121.15037.82.camel@phil-desktop.brightsign>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
	<5258152.VaR4PfleNb@peggleto-mobl5.ger.corp.intel.com>
	<1403011121.15037.82.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] update-rc.d/useradd: Add additional dependecies
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
X-List-Received-Date: Tue, 17 Jun 2014 17:01:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 June 2014 14:18:41 Phil Blundell wrote:
> On Mon, 2014-06-16 at 15:47 +0100, Paul Eggleton wrote:
> > a) There are a bunch of recipes that don't currently do that, and you'll
> > only find out there's a problem at do_rootfs time (or worse, if we went a
> > step further and didn't even dynamically add the RDEPENDS, at runtime
> > when the service fails to start).
> 
> Ah, true.  It doesn't seem that it should be beyond the wit of man to
> add a QA check for that, though.

I guess there are two ways of handling this:

1) Automatically add the dependency

or

2) Check for the lack of it and fail if it should be added

For better or worse we opted to go with #1. I wouldn't necessarily be totally 
opposed to changing to #2 if people feel it is cleaner (and it is, a little) 
but someone would actually have to do that work and then fix the resulting 
fallout.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

