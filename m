Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TgiH3-0002Gq-8m
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 21:42:28 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:47379 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tgi36-0006ey-To for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 15:28:00 -0500
Date: Thu, 6 Dec 2012 15:27:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212061522350.31684@oneiric>
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
Subject: what exactly is the proper way to use FILESEXTRAPATHS?
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
X-List-Received-Date: Thu, 06 Dec 2012 20:42:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  continuing my trek through coding pedantry and was wondering about
the exact purpose of the common line in .bbappend files:

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

or some slight variation thereof.

  i *thought* i knew what it did, so i did a small experiment with the
meta-ti layer and netbase (since i was already messing around with
it), and i replaced the contents of the netbase .bbappend file with
the single line:

FILESEXTRAPATHS_prepend := "rday"

and checked the environment for the value of FILESPATH for the netbase
recipe and, after formatting to read it clearly, what i saw was:

FILESPATH="rday/linux-gnueabi
rday/arm
rday/build-linux
rday/pn-netbase
rday/beagleboard
rday/omap3
rday/armv7a
rday/
rday/class-target
rday/forcevariable
rday/libc-glibc
rday/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/beagleboard
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/omap3
... snip ...

  what the heck?  if that's what FILESEXTRAPATHS is supposed to do,
that is definitely *not* how it's being used in many, many bbappend
files.

  is there an explanation somewhere as to what the above is supposed
to represent?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


