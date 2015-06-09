Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DEF95732B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 10:01:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2015 03:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="743530061"
Received: from alefebvr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.139])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2015 03:01:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Tue, 09 Jun 2015 11:01 +0100
Message-ID: <14059572.S7Ebuh4W14@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <55763532.9010809@gmail.com>
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
	<55763532.9010809@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2][dizzy] python-nose and python-contextlib backports to dizzy
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
X-List-Received-Date: Tue, 09 Jun 2015 10:01:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Alejandro / Armin

When we backport things, ideally we should be backporting the patch that 
originally added them (assuming it was a single patch). Otherwise we definitely 
want some kind of context in the commit message.

Alejandro, since we're backporting to dizzy, can you also confirm none of these 
patches are needed for fido? It looks like they aren't, but I can't be sure.

Cheers,
Paul

On Monday 08 June 2015 17:37:06 akuster808 wrote:
> Alejandro,
> 
> great.  I pull these in.
> 
> 
> thanks,
> - armin
> 
> On 06/08/2015 06:56 AM, Alejandro Hernandez wrote:
> > I would like to backport both python-nose and python-contextlib to dizzy,
> > they were added to master in the following commits respectively:
> > 
> > 
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7282635343e0ccf7
> > a82ffdb35905bdc2db6093d3
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7f58a85337a0712
> > 802bdb604a58985a8800b6477
> > 
> > I would like to include python-scipy, and these are build dependencies for
> > it, more specifically for iot builds which currently use the dizzy branch> 
> > The following changes since commit 
9c4ff467f66428488b1cd9798066a8cb5d6b4c3b:
> >    split_and_strip_files: regroup hardlinks to make build deterministic
> >    (2015-05-15 18:13:40 +0100)> 
> > are available in the git repository at:
> >    git://git.yoctoproject.org/poky-contrib hsalejandro/iot_backports
> >    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/io
> >    t_backports> 
> > Alejandro Hernandez (2):
> >    python-contextlib: backport to dizzy
> >    python-nose: backport it to dizzy
> >   
> >   meta/recipes-devtools/python/python-2.7-manifest.inc | 10 +++++++---
> >   meta/recipes-devtools/python/python-nose_1.3.6.bb    | 16
> >   ++++++++++++++++
> >   scripts/contrib/python/generate-manifest-2.7.py      |  3 +++
> >   3 files changed, 26 insertions(+), 3 deletions(-)
> >   create mode 100644 meta/recipes-devtools/python/python-nose_1.3.6.bb

-- 

Paul Eggleton
Intel Open Source Technology Centre

