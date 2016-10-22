Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1773A71AFE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 16:06:37 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161022160638457_0485
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 16:06:38 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=42354 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxyoa-0001Yf-D7 for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2016 12:06:32 -0400
Date: Sat, 22 Oct 2016 12:05:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Sat, 22 Oct 2016 16:06:39 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm about to dive into SDKs seriously for the first time, so a
shamefully dumb question to make sure i'm starting with the correct
understanding.

  starting with up-to-date OE master branch, i selected

MACHINE=mpc8315e-rdb

now, as i see it, i can create just the SDK with either of:

$ bitbake meta-toolchain
$ bitbake -s populate_sdk core-image-minimal

(in that second command, i'm assuming the choice of image is
irrelevant, i just always use core-image-minimal out of habit.)

  i'm assuming those commands are entirely equivalent in terms f
generating the SDK, given that meta-toolchain.bb consists solely of:

  SUMMARY = "Meta package for building a installable toolchain"
  LICENSE = "MIT"

  PR = "r7"

  LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

  inherit populate_sdk

so the more efficient of those commands would be just

$ bitbake meta-toolchain

  also, i did notice the generated host.manifest and target.manifest
files created along with the SDK -- am i correct in assuming those
files represent, respectively, the TOOLCHAIN_HOST_TASK and
TOOLCHAIN_TARGET_TASK values?

  anyway, as long as i'm starting with the right info, pretty sure i
can take it from there, accompanied by the SDK manual:

http://www.yoctoproject.org/docs/2.2/sdk-manual/sdk-manual.html

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


