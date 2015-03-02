Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9B57673847
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 09:30:39 +0000 (UTC)
Received: from [99.240.204.5] (port=44524 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YSMgR-0002Ix-9o for openembedded-core@lists.openembedded.org;
	Mon, 02 Mar 2015 04:30:39 -0500
Date: Mon, 2 Mar 2015 04:30:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1503020424530.21001@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: uniformity in defining basic SDK images?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2015 09:30:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  reading YP kernel dev manual and section 2.5.1 contains the
following passage:

"Briefly, the kernel-dev package is installed by default on all *.sdk
images... Because all SDK image recipes include dev-pkgs, the
kernel-dev packages will be installed as part of the SDK image."

  first, if that's true, then it's redundant to incorporate both the
image feature of dev-pkgs *and* the image install of kernel-dev, as is
done in images like core-image-rt-sdk.bb:

IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"

IMAGE_INSTALL += "rt-tests hwlatdetect kernel-dev"

  additionally, the core-image-sato-sdk.bb recipe file is alone in
including:

IMAGE_INSTALL += "kernel-devsrc"

is there a reason that that core-image sdk recipe alone includes
kernel-devsrc while the others do not?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

