Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id A38EC6FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:06:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160421120644370_0685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 05:06:44 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=45889 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atDP1-000887-Rl for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2016 08:08:11 -0400
Date: Thu, 21 Apr 2016 08:06:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 12:06:47 -0000
Content-Type: text/plain; charset=US-ASCII


  looking for advice on how to most cleanly deal with the following.
currently working on BSP layer to which some folks want to add RPMs
that are currently (and for quite some time have been) built on a
centos 6 system, which means those RPM files are in rpm4 format; ergo,
they obviously don't play well with a system built with current OE/YP.
so ... what to do?

  first, current muttering is, "grrrrrr ... why did OE migrate to
rpm5?" i actually didn't really know the answer to that, so i poked
around and found this:

  http://rpm5.org/community/rpm-users/0998.html

the mention of "more flexibility in cross compilation and control"
makes perfect sense to me, but is there a more comprehensive writeup
somewhere that lays out the rationale for the move to rpm5 that can be
used in its defense?

  next bit of muttering is, "can we downgrade the OE build to use
rpm4-format packages?", which is not a path down which i want to walk.

  another option is to simply install a totally independent rpm5 on
the centos 6 box, and use that exclusively for building packages to be
installed on an OE system. has anyone done this? does it represent a
sane/reasonable approach?

  finally, my reaction to all of this is, "why not just write recipes
for all that software so it can be built by OE?" but, as explained to
me, the OE package build system is *heavily* tied to a much larger
internal build process that resides on the centos 6 box, and there is
a real reluctance to try to extract the OE component from the larger
build process. the phrase that seems to pop up is, "not a chance in
hell."

  so ... thoughts? short of ripping out that part of the build process
and properly adding it as additional recipes to the OE build, is it
possible to build and install rpm5 on a centos 6 box? as a test, i can
try it for my fedora 23 system and, if that works, at least i can
demonstrate proof-of-concept.

  anyone done this? if it's possible, it would seem to be the simplest
solution under the circumstances.

rday

p.s. does adding the smart package manager into all of this make any
difference? i'm pretty familiar with RPM packaging, but have barely
looked at smart, and i don't know whether it would have any relevance
to this issue.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


