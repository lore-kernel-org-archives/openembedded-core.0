Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id EE03F72F95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:12:58 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170320111258289_0485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:12:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=20378 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cpvF6-0004VV-OR for openembedded-core@lists.openembedded.org;
	Mon, 20 Mar 2017 07:12:52 -0400
Date: Mon, 20 Mar 2017 07:12:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703200703010.7706@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what are OE's options for a PPTP server to use instead of poptop?
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
X-List-Received-Date: Mon, 20 Mar 2017 11:12:59 -0000
Content-Type: text/plain; charset=US-ASCII


  colleague wants to add a PPTP server to image, and is familiar with
poptop which (AFAICT) is not listed in the current "supported" OE
recipes. i found a recipe for it:

http://cgit.openembedded.org/openembedded/plain/recipes/poptop/poptop_1.3.4.bb

but i note that do_install_append() suggests the logwtmp module is
broken.

  while poking at that, are there more current solutions to provide
the same functionality? i can see "connman" with the option:

  PACKAGECONFIG[pptp] = "--enable-pptp
    --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"

  i see also accel-ppp, but it claims to be currently blacklisted:

  http://layers.openembedded.org/layerindex/recipe/2315/

anyway, suggestions for equivalent PPTP servers to poptop? thank you
kindly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


