Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id C501571A90
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 17:08:51 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161022170852069_0685
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 10:08:52 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=43732 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxzmo-0007J9-C1 for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2016 13:08:46 -0400
Date: Sat, 22 Oct 2016 13:07:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610221306440.15028@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] testsdk.bbclass: Clean up comments, clarify image choices.
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
X-List-Received-Date: Sat, 22 Oct 2016 17:08:54 -0000
Content-Type: text/plain; charset=US-ASCII


Make it clear that SDK testing can use any valid image.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 77c9203..43342b1 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -4,13 +4,15 @@

 # testsdk.bbclass enables testing for SDK and Extensible SDK
 #
-# For run SDK tests you need to do,
-# - bitbake core-image-sato -c populate_sdk
-# - bitbake core-image-sato -c testsdk
+# To run SDK tests, run the commands:
+# $ bitbake <image-name> -c populate_sdk
+# $ bitbake <image-name> -c testsdk
 #
-# For run eSDK tests you need to do,
-# - bitbake core-image-sato -c populate_sdk_ext
-# - bitbake core-image-sato -c testsdkext
+# To run eSDK tests, run the commands:
+# $ bitbake <image-name> -c populate_sdk_ext
+# $ bitbake <image-name> -c testsdkext
+#
+# where "<image-name>" is an image like core-image-sato.

 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 TESTSDKLOCK = "${TMPDIR}/testsdk.lock"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


