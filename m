Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qrudp-0008UA-AC for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:31:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGQoVr013663;
	Fri, 12 Aug 2011 17:26:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12915-09; Fri, 12 Aug 2011 17:26:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGQjYl013657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Aug 2011 17:26:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Date: Fri, 12 Aug 2011 17:26:06 +0100
Message-ID: <1313166366.14274.512.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>
Subject: Re: [CONSOLIDATED PULL 00/25] Meta-RT reorg and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 16:31:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 00:49 -0700, Saul Wold wrote:
> Richard,
> 
> This set of changes fixes some current master build failures for
> RPM rootfs (from Mark) and has the Realtime update from Darren and
> Bruce.
> 
> In addition there are some updates from Chris Larson and Kumar cleaning
> up various tune and multi-lib issues.
> 
> They past my review and initial testing.
> 
> Sau!
> 
> The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
> 
>   gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 19:13:38 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (1):
>   linux-yocto: update SRCREVs for preempt-rt support + build fixes
> 
> Chris Larson (7):
>   busybox: don't strip the main binary
>   insane: add linux-gnu to the platform data
>   nativesdk: inherit relocatable
>   sanity: shift the required utils into a variable
>   package: include SECTION in the pkgdata
>   package: allow setting a section for locale packages
>   cross: also empty PACKAGES_DYNAMIC
> 
> Darren Hart (10):
>   meta-rt: refresh linux-yocto-rt recipe
>   meta-rt: rt-tests v0.73 instead of AUTOREV
>   meta-rt: canonicalize directory structure
>   meta-rt: add linux-yocto-rt_3.0 recipe
>   meta-rt: remove atom-pc support from the main layer
>   meta-rt: rename minimal-rt images to -rt, drop live image
>   meta-rt: add an -rt-sdk image
>   meta-rt: default KMACHINE and SRCREV_machine to avoid parsing errors
>   Move meta-rt recipes to oe-core (meta)
>   recipes-rt: add a README documenting the contents of recipes-rt
> 
> Kumar Gala (3):
>   automake: Update for python.m4 to respect libdir
>   xcb-proto: update based on changes to python.m4 in automake
>   tune-ppce5500: Add a set of tune files for PowerPC e5500 core
> 
> Mark Hatle (3):
>   rpm: Fix the canonical arch --target processing and cleanup
>   package_rpm.bbclass: Update the platform config and --target
>   package_rpm: Fix attemptonly and suggest packages
> 
> Mei Lei (1):
>   init-install.sh: Fix make partition and make file system issues

Merged to master in full but Darren needs to sort out the rt-tests v0.73
business ASAP as per my email now its being enabled by default.

I merged rather than waiting as there were other patches depending on
that change and it seemed a shame to reject half the patch series on
that minor detail.

Cheers,

Richard



