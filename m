Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 596 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Oct 2015 16:35:40 UTC
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 19BBF77129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 16:35:40 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20151022162543473_0684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 16:25:43 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [173.38.117.90] (port=37608 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ZpIh9-0002Ec-HA for openembedded-core@lists.openembedded.org;
	Thu, 22 Oct 2015 12:26:27 -0400
Date: Thu, 22 Oct 2015 12:25:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1510221223420.24305@localhost>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] Add entry for qemumips64 to local.conf.sample.
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
X-List-Received-Date: Thu, 22 Oct 2015 16:35:42 -0000
Content-Type: text/plain; charset=US-ASCII


For whatever reason, qemumips64 isn't mentioned in local.conf.sample
as a valid target machine.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 3ae24ab..92ee7a1 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -20,6 +20,7 @@
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemuarm64"
 #MACHINE ?= "qemumips"
+#MACHINE ?= "qemumips64"
 #MACHINE ?= "qemuppc"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


