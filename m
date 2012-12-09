Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Thlzy-0007YD-6p
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Dec 2012 19:53:10 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:36839 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Thllx-0004lA-U8 for openembedded-core@lists.openembedded.org;
	Sun, 09 Dec 2012 13:38:42 -0500
Date: Sun, 9 Dec 2012 13:38:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212091333360.15544@oneiric>
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
Subject: should one be free to invoke "runqemu" outside the context of a build?
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
X-List-Received-Date: Sun, 09 Dec 2012 18:53:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  goofing around with "runqemu" and noticed this in the usage:

   echo "Examples:"
    echo "  $MYNAME qemuarm"
    echo "  $MYNAME qemux86-64 core-image-sato ext3"

if i try that last example the way i've set up a toolchain and am
trying to run the pre-built yocto qemu images, i get:

$ runqemu qemuarm core-image-minimal ext3
Assuming core-image-minimal really means
/opt/poky/1.3/deploy/images/core-image-minimal-qemuarm.ext3

Continuing with the following parameters:
KERNEL: [/opt/poky/1.3/deploy/images/zImage-qemuarm.bin]
ROOTFS: [/opt/poky/1.3/deploy/images/core-image-minimal-qemuarm.ext3]
FSTYPE: [ext3]
Setting up tap interface under sudo
[sudo] password for rpjday:
Acquiring lockfile for tap0...
Error: Kernel image file
/opt/poky/1.3/deploy/images/zImage-qemuarm.bin doesn't exist
Set 'tap0' nonpersistent
Releasing lockfile of preconfigured tap device 'tap0'
$

  obviously, the simple argument "ext3" is expanded into something
involving pathname components "deploy/images", which means that
particular sample usage makes sense *only* in the context of a current
build directory.

  but (as i've done), what if one simply wants to download the
pre-built images and see what they're like to run?  in a case like
that, that sample usage clearly isn't going to work.

  it might be useful to change the usage info to make that clear.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


