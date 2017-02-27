Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id CA5537197B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:36:32 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170227113632896_0485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:36:32 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=48118 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciJbP-0000OV-0O for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 06:36:27 -0500
Date: Mon, 27 Feb 2017 06:36:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702270627460.23179@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: in meta-yocto-bsp kernel recipes, why individual settings for COMPATIBLE_MACHINE?
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
X-List-Received-Date: Mon, 27 Feb 2017 11:36:34 -0000
Content-Type: text/plain; charset=US-ASCII


  more nitpicky pedantry ... under
meta-yocto-bsp/recipes-kernel/linux, i see a number of
COMPATIBLE_MACHINE settings:

  COMPATIBLE_MACHINE_genericx86 = "genericx86"
  COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
  COMPATIBLE_MACHINE_edgerouter = "edgerouter"
  COMPATIBLE_MACHINE_beaglebone = "beaglebone"
  COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"

given that every one of those conditional assignments match *exactly*
the respective target system, how does that effectively differ from
just writing (issues with RE matching aside):

  COMPATIBLE_MACHINE = "(genericx86|genericx86-64|edgerouter|beaglebone|mpc8315e-rdb)"

i can certainly see how one might need to use conditional assignments
for COMPATIBLE_MACHINE if one has, say, extended the definition of
MACHINEOVERRIDES to classify target systems into compatible subgroups,
but that's not what's happening above. is there something more subtle
going on there that i'm missing?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


