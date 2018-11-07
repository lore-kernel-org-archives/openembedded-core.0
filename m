Return-Path: <max.oss.09@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6A53744AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 13:25:15 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id x2-v6so13407530eds.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 05:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qbKfJ85KLAuFe6BcbTgS+o5qucwCnevuBUK+Adb41Vk=;
	b=qP75h7kEoTQ+Xbx74p6tJk9wo87Qn6OzujPOd1AB6OQ5lRySQ/lA83zZ8MR56UCgSr
	R0cYn1GcHpQ3oYDn8vlDxiKMTpxlc+lI+PGxv3JG/1IIKzNUfbRqxgBXrwJx4dgN1p0M
	ricEWFQ2A5e8aSsvjy39Z4XZI0yzAWVeYCqF/f4cDuwkYOnemcmuBUHKg1pVGWyoN9rr
	JJXhARny2ITgGLnf6UdSd2AUqDEyJi+NI5y907dW2U31ISKZ8lTKNWhzUzRL85ovN5BI
	Yi5FY/a8wmOn116Ui8vfbk9LF+8XZpvkl2fjDVwwEyY/oEbL7IKwC4q37dXzU7bmOPsK
	Cjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qbKfJ85KLAuFe6BcbTgS+o5qucwCnevuBUK+Adb41Vk=;
	b=dzoCF/cmFBNmCCCLMGdb4pmJOhMTPgLtF/3ApmTf596WzpsHoSzDtVdwNAw8cQ0Y/Z
	Sf/cfkbGtmda0be4ynkVa9AizV5QmlhfYPER8VXNyfkz7mCS2Wd6pLkL+/ltx9qp4/dZ
	F5fLwjIBWICjN9umVPDOAynHOcRu3fU7e0oGpzRv01yAONDJXc4Svyd/apIVPzMBNj0p
	hPVNTHchtRGlynL9mojTIORVZyGq65lzTUs1s+fEu7y3PFr7i+gItoxTCKdR3Cpdtl7L
	ouYnND2pl0QsqMUl3snwwXOfHZ11QwPfUZrDCtrhp/xxVl9yVOtucROBy2oSV394Ti/R
	kKkQ==
X-Gm-Message-State: AGRZ1gLg9ZRxWeoHGYZD30Ya8FiXKLcKErK+7O79JTBZ+xBgaXXKmF5V
	bMRx475UJd2lhcbKRY7hEIBoSMx9
X-Google-Smtp-Source: AJdET5cSs4Ephd+J1F+GPkFGMcpWKRTrE+IGm5jZZaKZCAweCorjBZ49Nw8WnGmI95EcLuCYuLSfXg==
X-Received: by 2002:a50:b282:: with SMTP id p2-v6mr157635edd.199.1541597116093;
	Wed, 07 Nov 2018 05:25:16 -0800 (PST)
Received: from linuxdev2.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	b18-v6sm139820eju.38.2018.11.07.05.25.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Nov 2018 05:25:15 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Nov 2018 14:24:06 +0100
Message-Id: <20181107132406.61577-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [rocko][sumo][PATCH 1/1] mobile-broadband-provider: fix SRC_URI
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
X-List-Received-Date: Wed, 07 Nov 2018 13:25:15 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Fixes build for older versions of git which don't follow redirects
properly if the .git suffix is missing.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 77c353cc9bdfbf1b6453b2579b72726db05eb69c)
[Fixup for rocko/sumo context]
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../mobile-broadband-provider-info_git.bb                              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

The inital patch 8382cdc088 changing the gnome git repo URL was
backparted to rocko and sumo, however the follow up patch was not.

This provides the backport of 77c353cc9b.

Max

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 57f521a6c4..b595d5700c 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -7,8 +7,7 @@ SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
 PV = "20170310"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info;protocol=https"
-
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.13.6


