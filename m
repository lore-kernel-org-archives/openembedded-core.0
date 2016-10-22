Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id BB23271A96
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 07:41:00 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161022074005432_0485
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 07:40:05 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=60622 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxquN-0006gZ-DB for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2016 03:39:59 -0400
Date: Sat, 22 Oct 2016 03:39:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610220333510.8533@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: in what recipe context can "bb" show me TOOLCHAIN_HOST_TASK?
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
X-List-Received-Date: Sat, 22 Oct 2016 07:41:02 -0000
Content-Type: text/plain; charset=US-ASCII


  a question about chris larson's nifty "bb" utility ... i recently
figured out that, to get rpm-build into the SDK, i needed to add:

TOOLCHAIN_HOST_TASK += "nativesdk-rpm-build"

to my local.conf. now i'd like to use "bb" to display the full
value of that variable, but i'm not sure what recipe context to use to
do that. as in:

$ bb show -r core-image-minimal TOOLCHAIN_HOST_TASK
Parsing recipes..done.
TOOLCHAIN_HOST_TASK=" nativesdk-rpm-build"
$

that just shows me what i appended. in what environment or recipe
context could i run that command to get the full value of the variable
when the SDK is being built?

rday

p.s. same question if i was using "bitbake -e".

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


