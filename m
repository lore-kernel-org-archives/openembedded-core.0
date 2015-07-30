Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1CD6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:57:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 30 Jul 2015 10:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,578,1432623600"; d="scan'208";a="533212190"
Received: from mjsmolax-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.11])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 10:57:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 18:57:14 +0100
Message-ID: <3191513.j5SDqNSYIE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55BA4327.1050406@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<20150730144327.GL2457@jama> <55BA4327.1050406@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 11/21] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Thu, 30 Jul 2015 17:57:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 30 July 2015 18:30:47 Alexander Kanavin wrote:
> On 07/30/2015 05:43 PM, Martin Jansa wrote:
> > On Thu, Jul 30, 2015 at 05:27:34PM +0300, Alexander Kanavin wrote:
> >> Recipe for the obsolete webkit-gtk 1.8.3 is removed in a separate commit
> > 
> > Why is it renamed from webkit-gtk to webkitgtk?
> 
> To match the name of the upstream tarball and simplify the recipe.
> 
> > That will break at least one PACKAGECONFIG:
> > meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb:PACKAGECONFIG[helpbrowser]
> > = "--with-webkit, --without-webkit, webkit-gtk"
> 
> I wrote a patch for that, and will send it to meta-oe later.

I have to say I think it would be simpler not to rename it, FWIW...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

