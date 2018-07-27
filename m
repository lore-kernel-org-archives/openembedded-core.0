Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5647F78CA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 21:04:42 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id i26-v6so2121956pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=A8RxTedTLT64eQSdE0v5jpDFeZWykJdJ2Lp8mDid59g=;
	b=Cf3HbUI4+5SRfrBGBpHIBGx1lNDHqYAKM7I7AFz9Ejl0VOal5gtFQJYz8Oepd2mFZ1
	owBFqfPyjkF+5b3FkDFpLKMc9XsDi/R40p27Gk1skzAcC5Fui7/6jWB67hdhG9egxslQ
	mXZ1I/TFOEo7stqwlZJm2plqfKreENzD6ZvnIJUBWv0iHbrnzxzISib246pPahZlJWB+
	sgOxXoKM+3pcCMLlSYZINb/uraPTHArvtzs9RQV48WoK9TRB3N1FT4t4r0n0nVS3eeon
	79KdneNzIn/o8bhyfdJj+htdXydTOIf4uYbaRp0y8LJ1urG9SU14AOMWu7Xgr9mRFDWO
	bouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A8RxTedTLT64eQSdE0v5jpDFeZWykJdJ2Lp8mDid59g=;
	b=APkvTitRsJZvxaDX+htfF7Oq+JcKyhBPg5ImmMVGo+iYbsJgiKGUrEolhAL0LgTB6e
	I1XTnhWv86fFP+OUcVKGUB0AeLDPc59SWHwrvLo4Lfv1CSkP4sv0hHT1iglD1q+J5akY
	XvFHSYiyzdFqlhqdUYVtgtlM8/a8Axfcu1puYX13LtnL8yOT+q5EluyC6lCOXRQoXp3s
	r0D6HWEGS9Qt0TmSOG9yseLYNCPLza+0huApEn2oCinihhXscxIdPn/8yzCsQGCDke07
	YEIKb7Hz5Ac0xT7vzu8R96E7Ql9SYusgRgDeDH7KXe3BZB370uBJVRVLF4PQjXQsYmg+
	S67w==
X-Gm-Message-State: AOUpUlF5DEBgUTwlnFfA5MHoMepSFH2NurNgmBGY+3dFWbHu7Cp8SbGQ
	qohg9CHkmHrrltflvTHSxhypSRzK
X-Google-Smtp-Source: AAOMgpc+5DikYvigHO9nl9c7dGfXGVdrFoJBf4zFsuy/FjDgQwKkcO1b1P6Nj5YKZYmFgcbiLtKqPg==
X-Received: by 2002:a62:89d8:: with SMTP id
	n85-v6mr8056100pfk.83.1532725483017; 
	Fri, 27 Jul 2018 14:04:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm5519065pgp.3.2018.07.27.14.04.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 14:04:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:04:33 -0700
Message-Id: <20180727210433.1580-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] Revert "gnutls: rationalise libunistring arguments"
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
X-List-Received-Date: Fri, 27 Jul 2018 21:04:43 -0000

This reverts commit 60fef4940de7f0440f1216eb2ea0ea683b3e8fdd.
---
 meta/recipes-support/gnutls/gnutls.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index b62a137e59..98ec8d9667 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -41,6 +41,7 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+    --without-libunistring-prefix \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.18.0


