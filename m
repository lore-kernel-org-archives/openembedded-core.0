Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 253056013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 16:47:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 20 Mar 2015 09:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,437,1422950400"; d="scan'208";a="668227932"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.21.195])
	([10.252.21.195])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2015 09:47:25 -0700
Message-ID: <1426870044.2879.4.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Mar 2015 18:47:24 +0200
In-Reply-To: <1426843840.29168.68.camel@linuxfoundation.org>
References: <550BD52C.1040601@linux.intel.com>
	<1426843840.29168.68.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Policy of explicit disabling of package features
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
X-List-Received-Date: Fri, 20 Mar 2015 16:47:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-03-20 at 09:30 +0000, Richard Purdie wrote:
> On Fri, 2015-03-20 at 10:07 +0200, Tanu Kaskinen wrote:
> > It seems to me that a better policy would be to always explicitly 
> > disable *all* features that have external dependencies that aren't 
> > listed in DEPENDS. That kind of policy should reduce these 
> > non-determinism issues. Full compliance with such policy may not be 
> > feasible to achieve, since it requires great care to check for new 
> > optional dependencies whenever updating to new upstream versions, but I 
> > hope that at least "pre-emptive" patches that add explicit feature 
> > disabling will be accepted even before anyone has run into actual problems.
> 
> This is the policy, if its not in DEPENDS, it shouldn't be using it.

Ok, excellent! I'll make a patch that adds some --disable-foo options to
pulseaudio.inc that are currently missing.

-- 
Tanu


