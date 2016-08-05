Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id CD78177040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 18:53:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160805185302697_0685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 11:53:02 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=53095 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bVkGl-00088Z-Jf for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2016 14:54:55 -0400
Date: Fri, 5 Aug 2016 14:52:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what must i supply WRT UBOOT_CONFIG/UBOOT_MACHINE when u-boot isn't in BSP?
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
X-List-Received-Date: Fri, 05 Aug 2016 18:53:04 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm in the situation where i want to add the u-boot-fw-utils package
to my image, but the corresponding u-boot source for the target is not
part of the BSP layer; in fact, it's not part of a layer at all (built
manually elsewhere), so it's unsurprising that, if i add that recipe
to the image, i get:

ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
UBOOT_CONFIG must be set in the ... machine configuration.
ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
UBOOT_CONFIG must be set in the ... machine configuration.

is there a short doc that explains what i minimally need to supply to
build that package? i've never been in the situation where u-boot
wasn't part of the BSP.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


