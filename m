Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id AF71B7762D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:59:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170315095924588_0685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 02:59:24 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=56336 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1co5iA-0003Hp-Il for openembedded-core@lists.openembedded.org;
	Wed, 15 Mar 2017 05:59:18 -0400
Date: Wed, 15 Mar 2017 05:58:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703150554190.10811@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: is there a bitbake command/task for removing just KERNEL_IMAGETYPES?
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
X-List-Received-Date: Wed, 15 Mar 2017 09:59:27 -0000
Content-Type: text/plain; charset=US-ASCII


  sort of related to an earlier question i asked on YP list ... i'm
playing with introducing and generating different KERNEL_IMAGETYPES,
and i want to be able to remove *just* those generated kernel image
types before trying a different variation by setting:

  KERNEL_CLASSES
  KERNEL_IMAGETYPES

to different values.

  if i run:

  $ bitbake -c cleansstate virtual/kernel

that *seems* to get rid of the raw kernel binary as well, so it has to
be recompiled. all i want to do is get rid of any uImage, zImage,
fitImage files and not have to recompile the entire kernel.

  is there a kernel task for that, or can i just manually "rm" them to
get the same effect?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


