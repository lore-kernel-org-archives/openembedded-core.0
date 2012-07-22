Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SsvVQ-0001gl-LW
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:43:28 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:34145 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SsvKO-0006Re-AX for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 08:32:04 -0400
Date: Sun, 22 Jul 2012 08:31:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207220828260.17793@oneiric>
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
Subject: some rather obvious syntax errors just checked into oe-core
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
X-List-Received-Date: Sun, 22 Jul 2012 12:43:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


$ bitbake -c fetchall core-image-minimal
Pseudo is not present but is required, building this first before the main build
Loading cache: 100% |#######################################################################| ETA:  00:00:00
Loaded 708 entries from dependency cache.
ERROR: ParseError at /home/rpjday/oe/oe-core/meta/recipes-devtools/python/python-native_2.7.3.bb:23:
unparsed line: 'EXTRA_OECONF_append " --bindir=${bindir}/${PN}"'

  there's a missing "=" here    ^^^^^^^^^ in python-native_2.7.3.bb

Build Configuration:
BB_VERSION        = "1.15.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
TARGET_FPU        = "soft"
meta              = "master:1eae5b6c87cd4f825dba9d2526b34231d33b1e92"

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'sqlite3-native' (but virtual:native:/home/rpjday/oe/oe-core/meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
DEPENDS on or otherwise requires it)
ERROR: Required build target 'pseudo-native' has no buildable providers.
Missing or unbuildable dependency chain was: ['pseudo-native', 'sqlite3-native']

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
$

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


