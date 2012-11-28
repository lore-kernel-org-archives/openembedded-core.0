Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TdgIo-0006LG-GR
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 12:59:42 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:55452 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tdg53-0007Fr-B4 for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 06:45:29 -0500
Date: Wed, 28 Nov 2012 06:45:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1211280631130.31857@oneiric>
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
Subject: some simple questions/observations about package groups
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
X-List-Received-Date: Wed, 28 Nov 2012 11:59:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  perusing package groups, and a few simple questions and probably a
couple things i can submit patches for.

  first, is IMAGE_FEATURES *exclusively* for selecting package groups
and not individual packages?  since core-image.bbclass reads:

# By default we install packagegroup-core-boot and packagegroup-base packages -

for that comment to read "packages" is a little ambiguous, yes?

  that same comment seems inaccurate as well, since it refers to
"packagegroup-base" when, below, it's actually:


CORE_IMAGE_BASE_INSTALL = '\
    packagegroup-core-boot \
    packagegroup-base-extended \     <-- see?

so that's just a quick doc fix.

  again, back at the top, we read:

# IMAGE_FEATURES control content of the core reference images

but it's not just the *core* reference images, is it?  in fact, the
list of available IMAGE_FEATURES in that file doesn't include
"splash", which is inherited from image.bbclass.  should that not be
in the list?  that also means that PACKAGE_GROUP_splash is available
to non-core images.

  finally, meta/conf/local.conf.sample also allegedly lists the
possibilities for EXTRA_IMAGE_FEATURES, but that list is noticeably
incomplete.  why not just refer the reader to core-image.bbclass,
rather than try to keep a current list in both places?

  lots of pedantry ...

rday

p.s. as with other things i've put on my wish list, it would be great
if a variation of bitbake could list the available package groups.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


