Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCeOA-0000nn-4B
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:57:14 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCeFR-0007cJ-QB for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 17:48:13 -0400
Date: Tue, 27 Mar 2012 17:48:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203271734090.7770@oneiric>
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
Subject: how much can bitbake tell me about my upcoming build?
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
X-List-Received-Date: Tue, 27 Mar 2012 21:57:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  so, let's say i've decided to use oe-core to build a qemux86 image:

$ . oe-core/oe-init-build-env builds/qemux86

before i go *any* further (before i even decide which image i'm going
to bake), how much can bitbake tell me about this configuration?

  i know

$ bitbake -e

can tell me my current environment, that's certainly useful.

  i can also use

$ bitbake -s

to show me the current and preferred versions of all packages (related
strictly to the current MACHINE setting in local.conf, correct?)

  what other info can i get out of bitbake?  what about image-specific
info?  is there a way to list the packages required for a given image?
some equivalent of

$ bitbake -s core-image-sato

  what about a command that lists the available images without having
to peruse the oe-core "images" directories?  and what about any of the
other bitbake-related utilities?  i can see "bitbake-layers" being
pretty useful.

  in short, without starting an actual build, how much information can
i extract using bitbake and bitbake-related utilities?

rday

p.s.  one thing i'd like is to be able to ask how much source i would
need to download for a given build before i start.  is there any way
to do that?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



