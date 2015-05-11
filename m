Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7C65A73FD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 09:09:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 11 May 2015 02:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,405,1427785200"; d="scan'208";a="692950097"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.28.148])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2015 02:09:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 11 May 2015 10:09:47 +0100
Message-ID: <1756352.ngOcR97Dgu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <55505221.7030002@topic.nl>
References: <554C98F7.5090005@dresearch-fe.de>
	<2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
	<55505221.7030002@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: WARNING: The license listed CLOSED was not in the licenses collected for foo
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
X-List-Received-Date: Mon, 11 May 2015 09:09:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

If you want to do this you need to add a generic license file for the license 
in question, which means extending LICENSE_PATH in your custom layer to a 
directory containing a file named with the license. (However, for "CLOSED" this 
would not be the right course because "CLOSED" doesn't specify one particular 
license, hence my comment about this being a bug.)

You're right that the error message isn't as helpful as it could be. We should 
fix that as well.

Cheers,
Paul

On Monday 11 May 2015 08:54:25 Mike Looijmans wrote:
> What is one expected to do when one justs wants to add the missing license
> to the "licenses collected for ..."?
> 
> I'm a bit spoiled now, most OE messages explain what it expects me to do to
> fix the problem.
> 
> M.
> 
> On 08-05-15 14:39, Paul Eggleton wrote:
> > Hi Steffen,
> > 
> > On Friday 08 May 2015 13:07:35 Steffen Sledz wrote:
> >> Since switching from dizzy to fido we've some warnings related to some of
> >> our own closed source packages.
> >> 
> >> WARNING: log_check: There is a warn message in the logfile
> >> WARNING: log_check: Matched keyword: [WARNING:]
> >> WARNING: log_check: WARNING: The license listed CLOSED was not in the
> >> licenses collected for foo
> >> 
> >> The recipes contain lines like this one:
> >> 
> >> LICENSE = "CLOSED"
> >> 
> >> How should we fix the recipe to avoid the warning?
> > 
> > I think the part of the code that produces this warning probably should be
> > ignoring the CLOSED value. Can I ask you to please file a bug? Feel free
> > to add me on CC.
> > 
> > Cheers,
> > Paul
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail

-- 

Paul Eggleton
Intel Open Source Technology Centre

