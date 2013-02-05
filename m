Received: from mail-bk0-f49.google.com ([209.85.214.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7e-0003zn-CW
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:51 +0100
Received: by mail-bk0-f49.google.com with SMTP id w11so157270bku.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=WIIjGVP8pqrjdMAs2azzIcGEYPTtq2/GKzVcPqRtSbE=;
	b=b2RAChLPEiYcc7T+KWz2vB5gYAD16jOOHqx2nFfUy2cHduS48v5ED9eFbmCaQHchAj
	K9SjzU6MomrFVpTNjpKbUCJvbQ0429tyHnoTjMRImaHD0ltGhVLmHBygLLZ7mQtn/Ei3
	9MtPecl7omPeSujwSdmx7cwlTVnDuV+L3w0wUGFnO98CcDH+4rydaS4RfDIhOxnTRAdx
	WKFHsE1Qgpeo1xmCYrgYfufO876zbM5I8rFwazpJk3ilJVkNg2fe5Yzs/M0Q0BO9cFgV
	OoOm7VF/lgLGGqvI6B7O47/aiBRYZ1D0SQSpKKNGwhzputFNSY52Je797mYU8v5zqtjf
	A3KA==
X-Received: by 10.204.146.91 with SMTP id g27mr6323783bkv.124.1360079760106;
	Tue, 05 Feb 2013 07:56:00 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id v8sm6744588bku.6.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksG-0004XH-G1; Tue, 05 Feb 2013 16:55:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:41 +0100
Message-Id: <7b230a71c86898a47feacd52a4f22827df65a8a1.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 1/8] base.bbclass: Commentary typo fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:11:57 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/classes/base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4662d3b..8147a81 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -160,7 +160,7 @@ def pkgarch_mapping(d):
             d.setVar("TUNE_PKGARCH", "armv7a")
 
 def preferred_ml_updates(d):
-    # If any PREFERRED_PROVIDER or PREFERRED_VERSIONS are set,
+    # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
     # we need to mirror these variables in the multilib case;
     # likewise the PNBLACKLIST flags.
     multilibs = d.getVar('MULTILIBS', True) or ""
-- 
1.7.10.4



