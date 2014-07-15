Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id A30B6701BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 17:21:23 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20140715172123532
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 17:21:23 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=56262 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X76Pm-0005Fq-74 for openembedded-core@lists.openembedded.org;
	Tue, 15 Jul 2014 13:21:18 -0400
Date: Tue, 15 Jul 2014 13:21:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407151319550.16952@localhost>
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
Subject: [PATCH] Change to correct spelling of "local.conf.sample.extended"
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
X-List-Received-Date: Tue, 15 Jul 2014 17:21:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index d64ba7f..8c58271 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -2,7 +2,7 @@
 # This file is your local configuration file and is where all local user settings
 # are placed. The comments in this file give some guide to the options a new user
 # to the system might want to change but pretty much any configuration option can
-# be set in this file. More adventurous users can look at local.conf.extended
+# be set in this file. More adventurous users can look at local.conf.sample.extended
 # which contains other examples of configuration which can be placed in this file
 # but new users likely won't need any of them initially.
 #
@@ -148,7 +148,8 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 #   - 'image-prelink' in order to prelink the filesystem image
 #   - 'image-swab' to perform host system intrusion detection
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
-# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+# NOTE: mklibs also needs to be explicitly enabled for a given image,
+#     see local.conf.sample.extended
 USER_CLASSES ?= "buildstats image-mklibs image-prelink"



-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


