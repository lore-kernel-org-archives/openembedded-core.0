Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 1959 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jun 2014 18:27:10 UTC
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8B31365DB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 18:27:10 +0000 (UTC)
Received: from [99.240.204.5] (port=40204 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1WzUvN-0008FJ-7K for openembedded-core@lists.openembedded.org;
	Tue, 24 Jun 2014 13:54:29 -0400
Date: Tue, 24 Jun 2014 13:50:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1406241348150.12872@localhost>
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
Subject: OE build of qemux86 fails for linux-yocto: undefined reference to `.LASF1122'
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
X-List-Received-Date: Tue, 24 Jun 2014 18:27:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  doing a test build of core-image-minimal for qemux86 using current
git pull of openembedded-core, and got:

|   LD      init/built-in.o
| drivers/built-in.o:(.debug_info+0x106096a): undefined reference to
`.LASF1122'
|
/home/rpjday/oe/builds/oe/qemux86/tmp-eglibc/work/qemux86-oe-linux/linux-yocto/3.14.5+gitAUTOINC+602be954ac_41d5fe27dc-r0/linux/Makefile:827:
recipe for target 'vmlinux' failed
| make[2]: *** [vmlinux] Error 1
| Makefile:133: recipe for target 'sub-make' failed
| make[1]: *** [sub-make] Error 2
| Makefile:26: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed

  i'm about to try again to make sure it wasn't a transient glitch,
but has anyone else seen this?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

