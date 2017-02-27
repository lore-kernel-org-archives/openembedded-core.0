Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 5835572FC0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:05:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170227150544552_0485
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:05:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=31089 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciMrq-0001nd-Ix for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 10:05:38 -0500
Date: Mon, 27 Feb 2017 10:05:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702270953470.27827@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what means COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*" ???
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
X-List-Received-Date: Mon, 27 Feb 2017 15:05:45 -0000
Content-Type: text/plain; charset=US-ASCII


  ok, last question about COMPATIBLE_MACHINE, i promise. i
notice in
meta-oe/recipes-support/mongodb/mongodb_git.bb the snippet:

  #std::current_exception is undefined for arm < v6
  COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
  COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
  COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
  COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"

consider just the first assignment:

  COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"

which i interpret as, "if the machine override 'armv4' is in play,
then the list of compatible machines are all those which do *not*
contain the string 'armv4'. isn't that just a way of saying, "no
variation of armv4 is compatible"?

  this just looks weird, what am i missing? oh, and given the
behaviour of re.match(), could not one write that same line
equivalently as:

  COMPATIBLE_MACHINE_armv4 = "(!.*armv4)"

  i suspect i'm just confused about what's happening here.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


