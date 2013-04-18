Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USoNr-0002az-DN
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 14:56:17 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:45771 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USo6t-0001eh-KR for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 08:38:43 -0400
Date: Thu, 18 Apr 2013 08:38:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1304180833040.10184@oneiric>
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
Subject: tweaking insane.bbclass to handle MIPS SEAD-3?
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
X-List-Received-Date: Thu, 18 Apr 2013 12:56:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  students from a class of mine last year are currently playing with a
MIPS SEAD-3:

http://www.mips.com/products/development-kits/mips-sead-3/

and asked for some assistance getting oe/yocto to build for that kit.
they started with the routerstation pro content, and just wanted to
reproduce the same rootfs to run on the SEAD-3 (they would use the
provided u-boot and kernel for now). the biggest issue was changing
the endianness of the build.

  got an email this morning, they have a working rootfs, i asked for
details on everything they had to do, but for now, here's the final
issue they dealt with:

"Attached rootfs created for RS Pro, but with mips32el (little endian
config) and soft floating point. I had to comment out the endianess
check Python code from the insane.bbclass file to get the build to
work."

  so if someone wants to adjust insane.bbclass to recognize and handle
a SEAD-3, go for it. i'll post full details when i get them in case
there was anything else relevant.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


