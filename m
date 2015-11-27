Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 81D19601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 00:34:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2015 16:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,349,1444719600"; d="scan'208";a="829823345"
Received: from rsiu-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.187])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 16:34:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 13:34:27 +1300
Message-ID: <3117759.OV2fKNkn7Z@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.13-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
MIME-Version: 1.0
Cc: alexander.kanevskiy@intel.com
Subject: Re: [PATCH 0/4] extend buildhistory
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
X-List-Received-Date: Fri, 27 Nov 2015 00:34:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 November 2015 10:30:28 Patrick Ohly wrote:
> The initial implementation of YOCTO #8138
> ("buildhistory-extra.bbclass: store more information about a build")
> had some issues ("kconfig" file not preserved) but more importantly,
> additional changes are needed to support also gathering information
> about native recipes.
> 
> I am proposing to include only the "buildhistory.bbclass: support
> extending the content of the build history" patch into OE-core.
> 
> The original buildhistory-extra.bbclass and the modifications made to
> it are included here merely to provide the context for that change and
> to publish the modifications.

For others' reference, buildhistory-extra.bbclass was previously attached to 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8138 - I didn't and wouldn't 
propose introducing it into OE-Core in its current form because it's kind of 
turning buildhistory into something it wasn't designed for, though I don't 
disagree that it's useful. Happy to hear opinions from others on this though.

One aspect that will probably change in the future is how it picks up the 
kernel configuration - for 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5574 (which I hope to get to 
for 2.1, but no promises) we will need to write the kernel configuration to the 
sysroot so that we have somewhere we can look for it; if that's the case 
there'll be no need to copy it specially in buildhistory-extra.bbclass.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

