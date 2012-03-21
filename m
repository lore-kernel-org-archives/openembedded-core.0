Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SASa1-0001CN-TV
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:56:26 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SASRR-0005WR-5X for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 16:47:33 -0400
Date: Wed, 21 Mar 2012 16:47:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203211644010.8606@oneiric>
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
Subject: FILEXEXTRAPATHS advice in wiki doesn't seem to be strictly followed
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
X-List-Received-Date: Wed, 21 Mar 2012 20:56:26 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  here:

http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

there is some apparently hard and fast advice:

"Use FILESEXTRAPATHS to extend file search path: Modifications to
FILESPATHPKG and/or FILESPATH should be replaced by prepending to
FILESEXTRAPATHS; in addition, you no longer need to define THISDIR
(and should not do so). For example, to add a directory to be searched
for patches and other files which is named with PN, do the following
(note the immediate evaluation operator := and trailing colon, these
are important):

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


  but it seems the use of that variable is a bit fast and loose:

$ grep -r FILESEXTRAPATHS *
... snip ...
meta/recipes-graphics/mesa/mesa-common.inc:FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
meta/recipes-graphics/mesa/mesa-git.inc:FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb:FILESEXTRAPATHS_append := "${THISDIR}/xserver-xorg:${THISDIR}/xserver-xorg-${PV}:"
meta/recipes-qt/qt4/qt4-native_4.7.4.bb:FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
meta/recipes-qt/qt4/qt4-tools-nativesdk.inc:FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
meta/recipes-qt/qt4/qt4-native_4.8.0.bb:FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
meta/classes/utils.bbclass:	extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
$

  does this matter?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


