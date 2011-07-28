Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmMK0-0001Wu-6j
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 10:52:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2011 01:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,281,1309762800"; d="scan'208";a="35426903"
Received: from unknown (HELO helios.localnet) ([10.255.17.224])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2011 01:47:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 09:47:41 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E30FD0C.7040503@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B1A8AF9A65@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B1A8AF9A65@shsmsx502.ccr.corp.intel.com>
MIME-Version: 1.0
Message-Id: <201107280947.42048.paul.eggleton@linux.intel.com>
Subject: Re: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 08:52:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 28 July 2011 08:48:43 Cui, Dexuan wrote:
> Saul Wold wrote on 2011-07-28:
> > On 07/27/2011 10:25 PM, Kumar Gala wrote:
> >> For some reason when I get to do_rootfs for core-image-sato when using
> >> rpms I run into an issue in that:
> >> 
> >> ${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}
> >> 
> >> Isn't expanding or taking the assignment in
> >> meta/conf/machine/include/tune-ppcFOO.inc but just using what it
> >> found in meta/conf/bitbake.conf
> > 
> > I believe that I am seeing this also with an atom-pc build, where the
> > PACKAGE_EXTRA_ARCHS seems OK, but ends up just being i586 instead of a
> > list of ARCHS that includes core2 (which atom-pc should be).
> 
> Hi, I'm suffering from the exactly same issue... :-(
> I don't know why PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} isn't expending
> yet.

It seems to me that ??= gets confused because the variable name needs 
expanding. If you change the ${DEFAULTTUNE} reference to core2 in 
PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}" it all works. I 
don't know if that indicates a BitBake bug or whether we should try to work 
around it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


