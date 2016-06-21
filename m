Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 47D606FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:17:21 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160621151721040_0486
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:17:21 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=55804 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bFNS9-0003z8-M9 for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2016 11:19:01 -0400
Date: Tue, 21 Jun 2016 11:16:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1606211113020.9787@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what's the proper recipe for building a qemux86 image with only initramfs?
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
X-List-Received-Date: Tue, 21 Jun 2016 15:17:24 -0000
Content-Type: text/plain; charset=US-ASCII


  first time building a qemu image (qemux86) with an initramfs-based
recipe, core-image-testmaster-initramfs, and i guess i shouldn't have
been surprised to see:

$ runqemu qemux86
Couldn't find a qemux86 rootfs image in
  /home/rpjday/oe/builds/testx86/tmp/deploy/images/qemux86.
$

which makes perfect sense given the lack of a separate root
filesystem, so what is the *proper* way to do this?

  a quick google showed me:

http://patchwork.openembedded.org/patch/101267/
http://lists.openembedded.org/pipermail/openembedded-core/2015-September/109859.html

so what part of all of that should i be looking at? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


