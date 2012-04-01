Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SE96F-0003uQ-Oe
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 02:56:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2012 17:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="124083826"
Received: from unknown (HELO helios.localnet) ([10.252.123.233])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2012 17:47:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Sun, 01 Apr 2012 01:47:45 +0100
Message-ID: <2905489.oBl1N3jSJA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Sun, 01 Apr 2012 00:56:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 February 2012 12:50:16 Samuel Stirtzel wrote:
> There are other CMake configure pitfalls (all cross compiling scripts
> in kdelibs are commented out) but it seems that at least the most of
> them showed already during build time.

Unfortunately when I tried to build kdelibs4 I got the following:

| cd /home/paul/poky/poky/build-kde/tmp/work/i586-poky-
linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
r0/git/build/kjs && /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64-
linux/usr/bin/icemaker /home/paul/poky/poky/build-kde/tmp/work/i586-poky-
linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
r0/git/kjs/bytecode
| /bin/sh: /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64-
linux/usr/bin/icemaker: No such file or directory
| make[2]: *** [kjs/opcodes.h] Error 127
| make[2]: Leaving directory `/home/paul/poky/poky/build-kde/tmp/work/i586-
poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
r0/git/build'

Any ideas? Is this a PARALLEL_MAKE issue?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


