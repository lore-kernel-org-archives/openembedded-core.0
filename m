Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D242D7ED64
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 10:07:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2019 03:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="350453950"
Received: from wloh3-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.39])
	by orsmga005.jf.intel.com with ESMTP; 09 Aug 2019 03:07:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	Chandana Kalluri <ckalluri@xilinx.com>
Date: Fri, 09 Aug 2019 22:06:52 +1200
Message-ID: <3036117.bn4x3nByaj@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CANNYZj9BTxaV4_2Tojp16ac5d+suXmaLXWEuCeAGzfFNMe0S2w@mail.gmail.com>
References: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
	<BYAPR02MB6005A1297BC34875CB9623C0B9D70@BYAPR02MB6005.namprd02.prod.outlook.com>
	<CANNYZj9BTxaV4_2Tojp16ac5d+suXmaLXWEuCeAGzfFNMe0S2w@mail.gmail.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <brucea@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] standard.py: Provide an additional option for devtool reset
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
X-List-Received-Date: Fri, 09 Aug 2019 10:07:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 9 August 2019 8:27:24 AM NZST Alexander Kanavin wrote:
> On Thu, 8 Aug 2019 at 22:17, Manjukumar Harthikote Matha <
> MANJUKUM@xilinx.com> wrote:
> > Any update on this?  Is there a reason not to merge this feature?
>
> For what it's worth I am firmly in the camp that finds the non-deletion of
> sources annoying. When I run 'devtool reset', there is never any unsaved
> work left in there, but I am in too much of a hurry to do the extra 'rm' on
> those sources, and so much later (sometimes months later) it has to be done
> just prior to starting work on something else entirely (but with the same
> upstream component).

My apologies for not acting upon this earlier - I'm coming around to the realisation that most people want this feature and won't blame the tool if they invoke it when they didn't mean to ;)

Chandana / Manju, overall the patch is good, but could you please make the following revisions:

1) Also add the exact same option to devtool finish (since it's the other path for recipes leaving the workspace)

2) Add some testing in oe-selftest that verifies that:
(a) it devtool does not delete the source by default (this could be tacked onto an existing test) and 
(b) that it does delete it with the option specified (could also be tacked onto another existing test if it doesn't adversely affect it).

3) The prefix to the shortlog should be "devtool:" not "standard.py:" - this is a more useful functional area description to help identify what's being changed.

Thanks
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



