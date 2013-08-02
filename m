Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDE26A9E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 12:15:13 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id f14so478124wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 05:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=z1c5nmPyOP/xqlyClkjcjAtGfJyEZvccQ5iLGsvXRfo=;
	b=PZrVimEQaTuGCuKJwxRm9x91ZowNHZxC3R0vw++LazUJg03KBy6WRQ5b2WJ87HIIcm
	A/yZSqZuO0jB5vl5twwGqYXY+8DRShagsfa1omGJWqeP+GRBeovMir61HaUHM2ttlCXh
	C5EwjWXfDMObo/ZDXygIHAxFEUvG0ehfcAQo6nkqJRq4ZNOA+XnSRI7S1XjunvmBaO/V
	5StqbiDxBBy//Yw72+CVLC8SpDv52QRTKRny4knF3dPbqJscUmPdK5glbCuiBjA2acKI
	CYPvbfT8VgiEarmE3U8WmLPKZNh2fbfSR8bg51JQFszdOPW2bk2KVGpHDfArmD2kHb/v
	+6ww==
X-Received: by 10.180.12.243 with SMTP id b19mr1674293wic.6.1375445713801;
	Fri, 02 Aug 2013 05:15:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id w4sm2957817wia.9.2013.08.02.05.15.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 Aug 2013 05:15:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 13:15:07 +0100
Message-Id: <1375445707-28585-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnGHBNDLk4OPWcDVIgTi/Oti9+en7nXTue8BLbzl0SIa+EuUEMoNHkictwzzDEAyZqR/UWe
Subject: [PATCH] buildhistory: add a note when committing to buildhistory
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
X-List-Received-Date: Fri, 02 Aug 2013 12:15:14 -0000

If there's been a lot of changes the commit to buildhistory can take a
significant amount of time, so print a note so there's some indication of
progress.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 36e7fe1..c5bba25 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -531,6 +531,7 @@ END
 python buildhistory_eventhandler() {
     if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
         if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
+            bb.note("Writing buildhistory")
             bb.build.exec_func("buildhistory_commit", e.data)
 }
 
-- 
1.7.10.4


