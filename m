Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 566D17887A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 17:46:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 09:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,397,1508828400"; d="scan'208";a="186382085"
Received: from iechin-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.136])
	by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2017 09:46:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Thu, 14 Dec 2017 06:46:50 +1300
Message-ID: <6448477.1AR2tBDtHh@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <9f22104c-91c0-750b-0a57-dee30d779d47@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
	<9f22104c-91c0-750b-0a57-dee30d779d47@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] devtool improvements
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
X-List-Received-Date: Wed, 13 Dec 2017 17:46:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Thursday, 14 December 2017 3:53:22 AM NZDT Alexander Kanavin wrote:
> On 12/05/2017 03:41 AM, Paul Eggleton wrote:
> > A set of improvements for devtool, mostly aimed at improving the
> > handling of recipes that fetch multiple source trees (i.e. have multiple
> > tarballs or repositories in SRC_URI), with a couple of other fixes
> > thrown in.
> 
> Unfortunately, this badly breaks 'devtool upgrade':
> 
> ======
> ak@kanavin-desktop:~/development/poky/build$ devtool upgrade openssl -V 
> 1.0.2n
> .....
> WARNING: This recipe fetches more than one source tree. Each source tree 
> will be tracked in a separate git repository.
> NOTE: Extracting upgraded version source...
> ERROR: Execution of 'git checkout devtool-base -b devtool-1.0.2n' failed 
> with exit code 128:
> fatal: 'devtool-base' is not a commit and a branch 'devtool-1.0.2n' 
> cannot be created from it
> =====
> 
> I would strongly request that this patchset not be merged into master 
> until the issue is resolved.

That's interesting - the devtool upgrade tests apparently passed so clearly we 
have a hole in our tests. I will look into it.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

