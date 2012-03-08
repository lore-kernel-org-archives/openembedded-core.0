Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1S5mG4-0001F3-7f
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 23:56:28 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S5lZt-0001mW-KP for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 17:12:54 -0500
Date: Thu, 8 Mar 2012 17:12:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203081704020.4991@oneiric>
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
Subject: want to confirm that include/require is a pure textual substitution
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
X-List-Received-Date: Thu, 08 Mar 2012 22:56:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  currently writing a tutorial involving OE and working up to yocto
and want to verify a couple things.  i'm reading the OE manual,
section on include/require:

http://docs.openembedded.org/usermanual/usermanual.html#recipes_require

and want to verify that that is purely a textual inclusion, so that
*anything* that is common across a number of .bb files can be
centralized in a .inc file, correct?

  and on that note, a larger question about the OE manual itself.  in
that same section, there's a reference to the cherokee package, and
the alleged .bb file:

PR = "r7"

SRC_URI_append = "file://configure.patch \
                  file://Makefile.in.patch \
                  file://Makefile.cget.patch \
                  file://util.patch"

require cherokee.inc

do_configure() {
        gnu-configize
        oe_runconf
        sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/*libtool
}

  unsurprisingly, that's out of date as the current .bb file is
simply:

require cherokee.inc

PR = "${INC_PR}.0"

SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
SRC_URI[sha256sum] =
"042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"

but that's not my point.  since i want my tutorial to walk someone
through various files, given the split into the oe-core and
meta-openembedded layers, i'm thinking of using examples strictly out
of oe-core since there's more than enough there.  but the cherokee
example is in the meta-openembedded layer, and that distinction
doesn't appear to be made early in the OE manual anywhere.

  is there a plan to revise that manual to incorporate the
distinction?  is there a newer manual elsewhere?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


