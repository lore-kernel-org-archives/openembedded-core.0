Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6506069C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 May 2017 23:46:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2017 16:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,306,1491289200"; d="scan'208";a="83814112"
Received: from ttan4-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.195])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2017 16:46:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 08 May 2017 11:46:53 +1200
Message-ID: <1653892.zkUvk3PjUG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1bed7e63-2374-21b5-e090-e3b111086ae9@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<1493941692.3022.18.camel@gmail.com>
	<1bed7e63-2374-21b5-e090-e3b111086ae9@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Sun, 07 May 2017 23:46:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 5 May 2017 9:16:09 PM NZST Alexander Kanavin wrote:
> On 05/05/2017 02:48 AM, Max Krummenacher wrote:
> > Around the release of morty the same happened with libwnck3 which then
> > made morty fail for anyone using libwnck3.
> 
> We probably should have a section in the release notes that lists 
> removed recipes. There are more layers than meta-oe, obviously they 
> can't be all fixed in sync with oe-core.

We have a migration section of the YP reference manual [1], which is linked
from the release notes. I strongly recommend reading this on every major
release upgrade, as it should cover changes that you need to adapt your
recipes/configuration to.

That said, there are some limitations of this currently:

1) We (and I say "we", it's often me supplying Scott with the information)
usually only get to writing it towards the end of the release cycle, so if
you're following master then you won't get much out of this, but then again if
you're following master you should probably expect to have to deal with
the bleeding edge. There is a wiki page [2] where we are supposed to be
adding items as we go along during the cycle, and we did do a few during
2.3 but there were still quite a number of things that were missing and
lots of details that needed to be added.

2) There may be upstream changes that we pick up as a result of recipe
upgrades that could cause issues for someone (depending on what you're
actually building, of course). We don't really have a way of easily tracking
these at the moment; unfortunately every upstream reports their changes
differently.

Cheers,
Paul

[1] http://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.3-release

[2] https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

-- 

Paul Eggleton
Intel Open Source Technology Centre

