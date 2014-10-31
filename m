Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B2F0660557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:11:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2014 03:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,293,1413270000"; d="scan'208";a="628904815"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2014 03:11:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Fri, 31 Oct 2014 10:11:45 +0000
Message-ID: <2081396.TZUWxDdga2@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.6-203.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <54535EF1.20202@pabigot.com>
References: <54535EF1.20202@pabigot.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: preferred remotes for git pulls?
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
X-List-Received-Date: Fri, 31 Oct 2014 10:11:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

On Friday 31 October 2014 05:05:37 Peter A. Bigot wrote:
> There are two changes (virtual/bluez and pseudo-no-host-passwd) that I'd
> like to rework and propose for master now that it's reopened.  Both are
> likely to touch multiple files.  Previous comments and the wiki how-to
> suggest that git-pull is preferred over patchwork-only for multi-patch
> changes like this.
> 
> I have existing github resources that I could use as the source. Would
> that be acceptable to the maintainers?

I think for OE-Core at least the contrib repo is preferred but not necessarily 
mandatory.
 
> If using an openembedded-hosted -contrib repository is preferred, what's
> the process for getting access?  I'd be touching openembedded-core and
> meta-openembedded at the least.

Getting push access to the contrib repos is pretty easy - just email Michael 
Halstead <michael@yoctoproject.org> asking for access specifying the 
repositories, specify your desired prefix for contrib branches (e.g. mine is 
paule/), and attach your SSH pubkey if you haven't already sent it previously.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

