Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 221BB7197A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:29:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 21 Oct 2016 05:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,376,1473145200"; d="scan'208";a="892457143"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 21 Oct 2016 05:29:49 -0700
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<432da226-7470-bc72-8089-78e738f60657@gmail.com>
	<4e71b2b1-e293-81a8-b1cc-215789c0f7de@linux.intel.com>
	<118a8c0e-65d1-df2c-cda7-8ef9ade6f826@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8b45b99c-03f7-085c-f066-e190b9f67c5c@linux.intel.com>
Date: Fri, 21 Oct 2016 15:27:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <118a8c0e-65d1-df2c-cda7-8ef9ade6f826@gmail.com>
Subject: Re: [PATCH 00/19] Recipe updates and version check fixes
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
X-List-Received-Date: Fri, 21 Oct 2016 12:29:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2016 07:36 PM, akuster808 wrote:
> The issue is not updating master. It is about following the process.
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
>  Many of the changes don't comply to:
>
> "Commit with a concise and descriptive message - one that explains
> your changes in a way others get a short overview without looking at
> the code."

Key words are "your changes". When a recipe is updated to a newer
version, the commit message typically includes:

1) what is the new version

2) what changes to the recipe have been done and why (changes to
configure flags, changes to patches applied, changes to licensing
information, any other changes).

Also describing changes done by the upstream is not required for
compliance with the process.

Here's the deal: when 90 percent of oe-core's nearly 800 recipes are
kept up to date by maybe seven people from two companies, on top of all
the other stuff to be fixed and looked at, there's simply no bandwidth
for more. We plan to distribute recipe maintenance and spread it to a
lot more people involved in oe-core, and maybe then commit messages will
have summaries of upstream work as a rule.

> This has nothing to do with the correct way a stable branch would
> update a package. It is about providing some information so
> maintainers can make a decision on what to do.

Before that, we would also need reporting tools that can distinguish 
between new major releases, and new point releases in stable series. If 
I update webkit to a new major release and include a link to 
http://blogs.igalia.com/carlosgc/2016/09/20/webkitgtk-2-14/ in the 
commit log, that's not a particularly useful information for you, 
because what you really need to know as a stable branch maintainer is 
whether there are new bugfix releases of webkit in a previous major 
version that your stable release contains.


Alex


