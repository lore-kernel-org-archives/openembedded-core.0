Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DDC386FF76
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 22:44:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 01 Dec 2016 14:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,284,1477983600"; d="scan'208";a="37840456"
Received: from besquive-mobl2.zpn.intel.com ([10.219.5.37])
	by orsmga005.jf.intel.com with ESMTP; 01 Dec 2016 14:44:31 -0800
Message-ID: <1480632271.13546.4.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: Mariano Lopez <mariano.lopez@linux.intel.com>
In-Reply-To: <5685041.Q7lPjqZr2f@mlopezva-mobl2>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
	<53d2af537516d9f542729f80a1ec12c3484a4b3f.1480525452.git.mariano.lopez@linux.intel.com>
	<1480611160.13546.2.camel@linux.intel.com>
	<5685041.Q7lPjqZr2f@mlopezva-mobl2>
Organization: Intel Corporation
Date: Thu, 01 Dec 2016 16:44:31 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 3/3] oe-selftest: Add option to submit test result to a git repository.
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
X-List-Received-Date: Thu, 01 Dec 2016 22:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-12-01 at 11:00 -0600, Mariano Lopez wrote:
> > I think this version is okay :) have you tested it in an
> Autobuilder
> > task? 
> 
> Indeed, that is why it took me a bit longer to submit the patch. I
> know this won't blow up current master.  But Ihaven't used the
> option yet, we would need a remote repo and a new autobuilder
> buildset.
So, for enabling it you still need the repo, right? is that repo
already requested? it would help to understand the timing of this
feature coming online.

