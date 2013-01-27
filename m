Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TzZzs-0007jY-Rk
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Jan 2013 22:42:40 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:54275 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TzZkm-0004VU-KY for openembedded-core@lists.openembedded.org;
	Sun, 27 Jan 2013 16:27:04 -0500
Date: Sun, 27 Jan 2013 16:26:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301271622090.24073@oneiric>
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
Subject: how to tweak a kernel recipe file to point at a local git repo?
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
X-List-Received-Date: Sun, 27 Jan 2013 21:42:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i *thought* i had this figured out but something's not working quite
right today.

  trying a build that involves the meta-ti layer (although that
shouldn't be relevant), and here's the salient part of the recipe file
linux-omapl138-psp_2.6.37.bb:

===== snip =====
BRANCH = "03.21.00.03"
SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"

COMPATIBLE_MACHINE = "(omapl138)"

SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
        file://defconfig"
===== snip =====

  now i already *have* that repo cloned on my local hard drive, so
what would i change in the recipe file (just temporarily) to point the
fetcher there?  i would only need to do that once since i've set up my
builds to automatically build tarballs from all fetches so, once i
clone that repo once, all subsequent builds would use the tarball in
my "own mirror" directory.

  first, i set up a tracking branch in that local clone for the branch
"03.21.00.03".  so what's left to change in the SRC_URI?  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


