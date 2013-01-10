Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TtITL-0006LO-3I
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 14:47:09 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:37614 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TtIEd-00021Y-2E for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 08:31:55 -0500
Date: Thu, 10 Jan 2013 08:31:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301100825400.10271@oneiric>
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
Subject: defining a new image: inherit "image" vs "image_types"?
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
X-List-Received-Date: Thu, 10 Jan 2013 13:47:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  possibly a distinction with no distinction but i wanted to throw
together a page on how one defines a new "image type" -- most
commonly, an SD card image -- and i started with what comes with the
meta-raspberrypi layer, which seems to work just fine.

  what i noticed is that that layer introduces the new
"sdcard_image-rpi.bbclass" class file, which opens with:

inherit image_types

  but then i remembered that the meta-ti layer does the same thing,
providing the new class file "sdcard_image.bbclass" which opens
instead with:

inherit image

  i realize that the oe-core image.bbclass contains this snippet:

IMAGE_CLASSES ?= "image_types"
inherit ${IMAGE_CLASSES}

so it's clear that inheriting "image" is sufficient, but the
alternative *isn't* clear.

  what's the preferred construction here?  before digging further to
see if there's something subtle or equivalent happening, should it be
sufficient for new image definitions to simply:

inherit image_types

??  have i just not RTFS far enough to see that there's no difference?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


