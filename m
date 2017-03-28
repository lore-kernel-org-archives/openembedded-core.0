Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id E112A77BC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 22:22:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170328222233761_0685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 15:22:33 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=57930 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cszVT-0004QC-IK for openembedded-core@lists.openembedded.org;
	Tue, 28 Mar 2017 18:22:27 -0400
Date: Tue, 28 Mar 2017 18:22:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: is there OE support for building multi-image/component FIT image files?
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
X-List-Received-Date: Tue, 28 Mar 2017 22:22:37 -0000
Content-Type: text/plain; charset=US-ASCII


  not sure i even know if i'm asking the right question, but i already
know that i can build a *basic* FIT image file for (as an example) a
mpc8315e-rdb target, just goofing around. the .its file contains a
node for the kernel, and the dtb file, and the corresponding
configuration node, so everything is fine.

  however, let's say i was building for a beaglebone black, for which,
when you build the kernel. you get *multiple* dtb files for numerous
related targets.

  is there OE support for defining .its files that contain multiple
kernels, and/or multiple dtb files, that automatically generates
multiple configurations nodes to cover those possibilities?

  i realize you can do all that manually with the "mkimage" command,
i'm just not sure how far you can push creating FIT image files with
stock OE support.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


