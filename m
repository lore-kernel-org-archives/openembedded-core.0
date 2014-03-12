Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 529116F7C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 10:36:12 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so11159620wes.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 03:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qw+x9i+RaOfBemCTEhlQUDgcMY7/pwqYA+EErtpYfNo=;
	b=m9KKZQGBsn8If371kp7BUcaVVIInGciT/iToMBstP+z3qVedA6u2/MjGYRzgNPFvoC
	hhKq+x5qsavb39Gq71gkGS9wXLGpg/MlevRaqctHciEqOyKt7ciNFbrP0Df6GSoydAuw
	6F4QlEbzWitMhHETQjjEioDP236fSexdFlsanfsZBljT2BBVx/hglk2ASNIKvASfJQ89
	h1pv4seW0uFAMOjNDSnbcP3/Z4LmTvHBZZYTc/+OEbrq0OVZW8/0lpcPazcHrfmfmUMC
	eH3l7Or/0U7VpNIXr61JgflIdR1j02Ai0u5j1+uHcYbkP6iU1+cJeUxllx2jtEP015wV
	K0SA==
X-Gm-Message-State: ALoCoQmMPyqUrd/5vzHusySySsYxvgaCEJ3fs0eGBW0ReI/wbS1gvjIozRg8+e2uH0i9fyT+GzGp
X-Received: by 10.194.219.132 with SMTP id po4mr41407026wjc.7.1394620573320;
	Wed, 12 Mar 2014 03:36:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j8sm9893573wjn.13.2014.03.12.03.36.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 03:36:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 10:36:08 +0000
Message-Id: <1394620568-27701-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gnomebase: remove trailing whitespace
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
X-List-Received-Date: Wed, 12 Mar 2014 10:36:14 -0000

It seems that the bitbake parser is incredibly forgiving of trailing whitespace
in multi-line variables, but delete it to be sure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnomebase.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index b299500..739bf60 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -10,7 +10,7 @@ DEPENDS += "gnome-common-native"
 
 FILES_${PN} += "${datadir}/application-registry  \
 	${datadir}/mime-info \
-	${datadir}/mime/packages \	
+	${datadir}/mime/packages \
 	${datadir}/mime/application \
 	${datadir}/gnome-2.0 \
 	${datadir}/polkit* \
-- 
1.7.10.4


