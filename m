Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 7E50D71A79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:35:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161130113548420_0484
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:35:48 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=36518 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cC3As-0006ST-MT for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2016 06:35:42 -0500
Date: Wed, 30 Nov 2016 06:34:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611300625420.7224@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: purpose of variables like "base_bindir_native"?
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
X-List-Received-Date: Wed, 30 Nov 2016 11:35:52 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm putting together a tutorial on the structure of the native
sysroot and how it's built and variables involved, and was poking
around in both bitbake.conf and native.bbclass, and i'm curious about
one or two things.

  i could be totally wrong but it *seems* like there's native-related
content in bitbake.conf that could be moved over to native.bbclass to
reduce a little of the clutter. i'm perusing bitbake.conf and it's
hard to keep track of some of the variables just because there's both
native- and target- related settings in there. but i'll admit i
haven't finished my inspection.

  on a more specific note, in the entire oe-core layer, there are two
references to the variable "base_bindir_native" (formatted for
aesthetics):

$ grep -rw base_bindir_native *
meta/conf/bitbake.conf:base_bindir_native = "/bin"
meta/conf/bitbake.conf:PATH_prepend =
 "${COREBASE}/scripts:i
 ${STAGING_BINDIR_TOOLCHAIN}:
 ${STAGING_BINDIR_CROSS}:
 ${STAGING_DIR_NATIVE}${sbindir_native}:
 ${STAGING_BINDIR_NATIVE}:
 ${STAGING_DIR_NATIVE}${base_sbindir_native}:
 ${STAGING_DIR_NATIVE}${base_bindir_native}:"      <----- there

  so, given that that variable is set in bitbake.conf, and is only
referenced in that same file, what's the point of making it a
variable? doesn't hurt, of course, but when i see a variable, i
normally assume it's because it might be modified later somewhere, but
i don't see that happening here. is there a reason for it? same thing
could be said for "base_sbindir_native" as well.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



