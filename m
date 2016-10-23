Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3427197B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 14:16:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161023141645377_0685
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 07:16:45 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=43580 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1byJZn-0004Ln-E2 for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2016 10:16:39 -0400
Date: Sun, 23 Oct 2016 10:15:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610231006540.1835@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: clarifying issues building two SDKs, based on different target images
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
X-List-Received-Date: Sun, 23 Oct 2016 14:16:46 -0000
Content-Type: text/plain; charset=US-ASCII


  if you can tolerate it, a few more questions about building SDKs
before i sit down and start burning through machine cycles configuring
and building for the rest of the day.

  first, given that:

"SDK_RDEPENDS=${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"

do those two variables map *precisely* to the target.manifest and
host.manifest files generated when building an SDK? they *appear* to,
i just wanted to ensure there wasn't some subtle mismatch that might
confuse me later.

  next, i assume that if, in the same build directory, i choose to
build two standard SDKs differing in only the target image:

$ bitbake -c populate_sdk core-image-minimal
$ bitbake -c populate_sdk core-image-sato

all common files between the two SDKs will be reused in the final
construction. so if i build an SDK based on core-image-sato, turning
around and building one based on core-image-minimal should take very
little time indeed, correct?

  finally (and the one i'm most unsure about), if i build those two
SDKs, i'm *assuming* that the x86 nativesdk content will be the same;
it's the target PPC sysroots that will be different (obviously, the
sysroot for sato will be noticeably larger than the one for minimal).

  what happens if i try to install those two SDKs in the same
directory (/opt/poky.2.2/)? would that even work?

  and now, off to read more manual ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


