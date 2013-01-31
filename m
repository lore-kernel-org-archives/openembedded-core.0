Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0vdX-0003A3-Hw
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 16:01:17 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:59936 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0vOL-0000yC-6m; Thu, 31 Jan 2013 09:45:29 -0500
Date: Thu, 31 Jan 2013 09:45:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130131135020.GD2102@jama.dyndns-home.com>
Message-ID: <alpine.DEB.2.02.1301310935390.9110@oneiric>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310834500.31170@oneiric>
	<20130131135020.GD2102@jama.dyndns-home.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 15:01:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just so anyone else is welcome to try to reproduce what i'm fighting
with, here's my new project configuration:

BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  /home/rpjday/oe/dist/layers/meta-ti \
  "

MACHINE ??= "am180x-evm"
BBMASK = "meta-ti/recipes-misc"

and i'm trying to build a core-image-minimal.  with regular
(git-allowed) net access, the build works fine.  but i haven't yet
found any combination of BB_SRCREV_POLICY or BB_FETCH_PREMIRRORONLY or
anything else that let's me "fetchall", then disconnect from the net
to do the build.

  have at it if you are so inclined.  i'm quite willing to be told i'm
a moron for having done something silly.

rday

p.s.  just want to verify something -- bitbake really does parse *all*
available recipes, not just the ones that will be used for the build,
right?  i'm assuming i can dispense with such unneeded files by just
BBMASKing them away, correct?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


