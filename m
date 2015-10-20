Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9D44276E70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:41:06 +0000 (UTC)
Received: by wijp11 with SMTP id p11so67348979wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5mMaEQS/eky8PlCiC9/dUX+mirZEFP2SXJ1zYE42baU=;
	b=X+1fwL0n/NKxQcYs1vbp3U4m4GVMoVri9M4CmoCbld2RxC7Ob7aP6RkjU2uL60FBL2
	fklw81iu015qQHXs1QqGgHhPGFE3sTkE3eKFzNTE/X9h+F6Jvl3wZ8I1BqU7WZIif3lY
	eNXMzWeczI6dyDin1rVEnfMe9apByXOMmqIC0Cj3iXmKz0j5jNfQkq9Up6+kZzW6kTkT
	S/CbmIFtdmU1fhYVw6bjoT51G5Ae1q3KKpkJvsbIFD8mX2DH644GPkdQUWpMyhp8SCVo
	Z2CX9cPQPNg3ZXD7/LpAbYsJnz++6RtaZhhWA0CxNwiMTHwr7DhlB2oCBhUUejpULqde
	u/KA==
X-Gm-Message-State: ALoCoQm1nds86h0hr9mH2NStGyBO3E+rHgo7n+DcPe7KdrRnQQ0D1VcQa0bk7jH9mKKkdHshYT2A
X-Received: by 10.194.118.102 with SMTP id kl6mr6436594wjb.29.1445377266662;
	Tue, 20 Oct 2015 14:41:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lf10sm6209805wjb.23.2015.10.20.14.41.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 14:41:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 22:33:26 +0100
Message-Id: <1445376809-25202-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
References: <1445376809-25202-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V3 2/5] sanity: check that the host has file installed
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
X-List-Received-Date: Tue, 20 Oct 2015 21:41:08 -0000

Now that file-native is ASSUME_PROVIDED, check that it's actually present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d0b5cd0..ae86d26 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -3,7 +3,7 @@
 #
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
-    gzip gawk chrpath wget cpio perl"
+    gzip gawk chrpath wget cpio perl file"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
-- 
2.1.4


