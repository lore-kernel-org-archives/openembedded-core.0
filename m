Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1963171CB7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 09:02:10 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170311090210993_0685
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 01:02:10 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=39920 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cmcua-0001D3-Nw for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 04:02:04 -0500
Date: Sat, 11 Mar 2017 04:02:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703110359080.18131@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] fs-perms.txt: Two cleanup tweaks for consistency.
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
X-List-Received-Date: Sat, 11 Mar 2017 09:02:12 -0000
Content-Type: text/plain; charset=US-ASCII


* Remove duplicate entry for /srv already defined earlier in file.
* Use "${localstatedir}" rather than "/var" for consistency.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'm assuming neither of these changes would cause any trouble.

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 3d00e86..c8c3ac5 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -63,8 +63,5 @@ ${localstatedir}/volatile/tmp	01777	root	root	false - - -
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -

-# Set 755-lsb
-/srv				0755	root	root	false - - -
-
 # Set 2775-lsb
-/var/mail			02775	root	mail	false - - -
+${localstatedir}/mail		02775	root	mail	false - - -

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


