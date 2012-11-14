Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1TYcWG-0004yz-01
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 13:56:40 +0100
Received: from localhost (193.41.119.134) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Wed, 14 Nov 2012
	13:42:26 +0100
Date: Wed, 14 Nov 2012 13:42:39 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Elizabeth Flanagan
	<elizabeth.flanagan@intel.com>
Message-ID: <20121114124239.GB6908@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Elizabeth Flanagan <elizabeth.flanagan@intel.com>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: License of xz
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
X-List-Received-Date: Wed, 14 Nov 2012 12:56:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


I've recently started to look into building internal images with 
INCOMPATIBLE_LICENSE = "GPLv3"

Sofar, I've mainly identified one issue, which is with the xz-package.
(This is currently a dependency of systemd).

xz sets LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"

If the info in COPYING from xz sources is correct, I guess that we
should be able to remove GPLv3 from the target packages. Would you agree
with that, or have I overlooked something?

If my interpretation is correct, I'll try to find more time to look into
the actual source files a bit more closely.


/Anders


Extract from COPYING:
 

XZ Utils Licensing
==================

    Different licenses apply to different files in this package. Here
    is a rough summary of which licenses apply to which parts of this
    package (but check the individual files to be sure!):

      - liblzma is in the public domain.

      - xz, xzdec, and lzmadec command line tools are in the public
        domain unless GNU getopt_long had to be compiled and linked
        in from the lib directory. The getopt_long code is under
        GNU LGPLv2.1+.

      - The scripts to grep, diff, and view compressed files have been
        adapted from gzip. These scripts and their documentation are
        under GNU GPLv2+.

      - All the documentation in the doc directory and most of the
        XZ Utils specific documentation files in other directories
        are in the public domain.

      - Translated messages are in the public domain.

      - The build system contains public domain files, and files that
        are under GNU GPLv2+ or GNU GPLv3+. None of these files end up
        in the binaries being built.

      - Test files and test code in the tests directory, and debugging
        utilities in the debug directory are in the public domain.

      - The extra directory may contain public domain files, and files
        that are under various free software licenses.


-- 
Anders Darander
ChargeStorm AB / eStorm AB


