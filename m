Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id F0E12706C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:36:20 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140722163619911
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:36:19 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [64.102.254.34] (port=51942 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X9d30-0008Tj-5b for openembedded-core@lists.openembedded.org;
	Tue, 22 Jul 2014 12:36:14 -0400
Date: Tue, 22 Jul 2014 12:36:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407221229210.8547@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: why conditional assignment of DEPLOY_DIR_IMAGE in bitbake.conf?
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
X-List-Received-Date: Tue, 22 Jul 2014 16:36:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  quite possibly another silly question, but i'm perusing poky's
version of bitbake.conf and i see this:

DEPLOY_DIR ?= "${TMPDIR}/deploy"
DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"

  now, what is the value of using "?=" to set DEPLOY_DIR_IMAGE, rather
than just "=". i know what "?=" represents, but i normally expect to
see it in a context where someone might have set it earlier to some
other value, but this is in bitbake.conf, before any of the "include"
or "require" directives to pull in any of the other .conf files. so in
the midst of all those other DEPLOY_DIR_* hard assignments, why is the
images directory a conditional install?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


