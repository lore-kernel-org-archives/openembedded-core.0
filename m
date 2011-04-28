Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QFYmA-0000ys-2U
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 23:29:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2011 14:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,283,1301900400"; d="scan'208";a="635534394"
Received: from vorpal.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2011 14:26:45 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DB9D856.7030709@windriver.com>
References: <4DB9D856.7030709@windriver.com>
Date: Thu, 28 Apr 2011 14:22:41 -0700
Message-ID: <1304025761.2171.432.camel@vorpal>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: OE-Core and MacOS X
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
X-List-Received-Date: Thu, 28 Apr 2011 21:29:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-28 at 16:12 -0500, Mark Hatle wrote:
> I've started working on getting bitbake and OE-Core building on MacOS X.  So far
> what I have are some pretty hacky patches.. but they should be a reasonable start.
> 
> I've pushed my changes to the git://git.pokylinux.org/poky-contrib.git
> repository and the "mhatle/macosx/bitbake" and "mhatle/macosx/oe-core" branches.
> 
> The way I am doing builds is:
> 
> git clone git://git.pokylinux.org/poky-contrib.git oe-core
> cd oe-core
> git checkout mhatle/macosx/oe-core
> git clone . bitbake
> cd bitbake
> git checkout mhatle/macosx/bitbake
> cd ..
> . ./oe-init-build-env build-macosx
> 
> 
> Then you edit the conf/local.conf, add the following to the top of the file:
> 
> BUILD_ARCH = "x86_64"
> TARGET_OS = "linux"
> 
> PREFERRED_VERSION_pseudo-native = "1.0+git%"
> PSEUDOSRCREV = "481c6ff64f8aa6de01d3cb4042914f8e9f8d0abb"
> 
> PATCHRESOLVE = 'noop'
> 
> DISTRO = 'poky'
> 
> 
> This allows me to build through the stage 1 part of the build (pseudo) and onto
> the second stage.. it gets the 'gmp' and fails.
> 
> On my Mac OS X machine, I need to install the following items (beyond the normal
> BSD tools):
> 
> gawk, git, mercurial, sed, tar and wget

Sounds like you've made a good start at this Mark, cool! I had heard one
OE user state that chrpath can't be built on OS X which lead me to file
this bug: http://bugzilla.pokylinux.org/show_bug.cgi?id=806

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Center



