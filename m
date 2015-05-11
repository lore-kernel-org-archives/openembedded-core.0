Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AA2916013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 09:36:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2015 02:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,405,1427785200"; d="scan'208";a="708279344"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.28.148])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 02:36:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 11 May 2015 10:36:38 +0100
Message-ID: <3739437.GgmXEBs0pQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <55506F1F.2010100@topic.nl>
References: <554C98F7.5090005@dresearch-fe.de> <55505221.7030002@topic.nl>
	<55506F1F.2010100@topic.nl>
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
X-List-Received-Date: Mon, 11 May 2015 09:36:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

At a guess, maybe do_populate_lic didn't re-execute for this recipe. Does it 
still happen if you bitbake -c cleansstate the recipe and try again?

Cheers,
Paul

On Monday 11 May 2015 10:58:07 Mike Looijmans wrote:
> Hmm, I cannot figure it out... I have in a recipe:
> 
> LICENSE = "internal"
> LIC_FILES_CHKSUM = "file://LICENSE;md5=cf85de037de7ae12cc2d0059741fdbae"
> 
> Then in my layer.conf:
> 
> LICENSE_PATH += "${LAYERDIR}/licenses"
> 
> I have a file called "internal" in that path. Still, I get:
> 
> WARNING: log_check: WARNING: The license listed internal was not in the
> licenses collected for ...
> 
> What am I missing still then? What does the warning mean? I thought I got
> everything right, but either the licensing rules have changed or I never got
> it right in the first place and a check was added to make me aware of that.
> On 11-05-15 08:54, Mike Looijmans wrote:
> > What is one expected to do when one justs wants to add the missing license
> > to the "licenses collected for ..."?
> > 
> > I'm a bit spoiled now, most OE messages explain what it expects me to do
> > to
> > fix the problem.
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

