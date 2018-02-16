Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B73F371BB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:45:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2018 04:45:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,519,1511856000"; d="scan'208";a="204758441"
Received: from purabkux-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.160.52])
	by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2018 04:45:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amber Elliot <amber.n.elliot@intel.com>
Date: Sat, 17 Feb 2018 01:45:28 +1300
Message-ID: <4408675.DpA6B18zRZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <68805e627378415a915cc60f637cdf8f32c8a65c.1517336283.git.amber.n.elliot@intel.com>
References: <cover.1517336283.git.amber.n.elliot@intel.com>
	<68805e627378415a915cc60f637cdf8f32c8a65c.1517336283.git.amber.n.elliot@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/1] wic: argparse now used for help functionality.
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
X-List-Received-Date: Fri, 16 Feb 2018 12:45:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Amber

On Wednesday, 31 January 2018 07:24:42 NZDT anelliot wrote:
> The wic help output formally consisted of manually created strings mixed
> with argparse,
> which was unformatted and unusable. This fix cleans up the help messages,
> rewrites help
> functionality to use argparse, and adds functionality to show information
> for plugins (similar to canned images).

So after an inexcusably long delay on my part, I looked at this today. The 
move to argparse is a definite improvement, however I do have the following 
concerns:

* "wic help" no longer seems to accept an argument i.e. the command to show 
help for. I'll grant that it's not really needed if you know you can run wic 
<command> --help instead, but then we do still provide it so it seems to me it 
ought to work in a similar manner to how it did previously. I looked elsewhere 
and it seems "git help <command>" works that way too, FWIW.

* What's with the apparent change from "help" to "info"? That's not mentioned 
in the commit message.

* Some of the tests seem to be switched around in purpose but keep the same 
ID; some switch from --help to -h which should be the same thing. It's not 
clear to me what's been done there and why. I can understand the tests need 
updating as a result of the changes, but this seems to do more than that, and 
there's no explanation in the commit message.

* Newline should not be dropped at the end

(It could be that this would benefit from being split up, i.e. do the argparse 
switchover in one commit and then other changes in subsequent commits, but I'm 
willing to be convinced otherwise.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

