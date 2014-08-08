Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 35A9065EDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 19:32:04 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140808193203472
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 19:32:03 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=45905 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XFptO-0000b4-P5 for openembedded-core@lists.openembedded.org;
	Fri, 08 Aug 2014 15:31:58 -0400
Date: Fri, 8 Aug 2014 15:31:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408081529290.23581@localhost>
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
Subject: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
X-List-Received-Date: Fri, 08 Aug 2014 19:32:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Given that there are no machine-specific files for the tslib recipe
anymore, might as well remove this line.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  still not totally sure i know what i'm doing here, but git history
shows that any machine-specific tslib files vanished long ago, so
there's little reason to hang onto this. i'm willing to be corrected.

diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
index 05d58b6..6d8c7dd 100644
--- a/meta/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
@@ -32,8 +32,6 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
 }

-SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
-
 # People should consider using udev's /dev/input/touchscreen0 symlink
 # instead of detect-stylus
 #RDEPENDS_tslib-conf_weird-machine = "detect-stylus"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


