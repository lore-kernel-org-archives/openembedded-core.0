Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TTZBD-0005NM-BA
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 15:22:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2012 07:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,687,1344236400"; d="scan'208";a="235174520"
Received: from unknown (HELO helios.localnet) ([10.252.122.123])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2012 07:08:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2012 14:07:51 +0000
Message-ID: <1720082.VE0UplCuMC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121030115615.77684awm7w5p1fqc@webmail.recipes4linux.com>
References: <20121030115615.77684awm7w5p1fqc@webmail.recipes4linux.com>
MIME-Version: 1.0
Subject: Re: gtk+ native recipe question
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 14:22:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi there,

On Tuesday 30 October 2012 11:56:15 T.Michael Turney wrote:
> My first post, chose -core over -devel somewhat arbitrarily as I don't
> understand distinction of OE-classic yet.

Basically, OE-Classic is largely unmaintained (aside from critical updates to 
the 2011.3-maintenance branch) and should not be used for new work - use OE-
Core for that instead. So you're on the right path already :)

> In order to get an existing OE system (builds on Fedora) to build correctly
> on 64-bit Ubuntu 12.04 I had to modify a number of recipe files.

That's definitely not expected...

> In order to get native gtk+ to build I had to add no-demos.patch
> to SRC_URI_append.  The patch file already existed in recipes tree
> but wasn't being referenced in the .bb file.
> 
> Second change was adding glib-2.0-native to DEPEND_virtclass-native in
> same file.

So, the version in master and the danny branch (most recent stable, just 
branched the other day) already includes this. Are you using a different 
branch/release?

> Problem was manifested with unresolved reference to g_bytes_unref when
> building gtk+ native.  Ubuntu 12.04 has more recent glib install than in
> OE project I'm building and g_bytes_unref is visible in host glib but not
> OE version.
> 
> With this change and a few other similar minor changes in .bb files, the
> system builds.  However, the bitbake build line has to be invoked twice.
> 
> For example, let's say I'm building foo-image and foo1-image, and I run:
> 
> bitbake foo-image foo1-image
> 
> This command fails building gtk+ native.  

Fails how? Can you mention the actual error you're receiving?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


