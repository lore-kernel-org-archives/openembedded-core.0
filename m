Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4DADB65CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 17:56:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so54377214wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 09:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=22eem8f4E7Q2lCts/8MV+P6d/GvQm3fDmA/QJXgLwDE=;
	b=H8i8ftekdrk4ZEiaECJcEoIGUVnueVxdyoEGQSABwlYYuaOwhL29N4NZKkzWMvk/YM
	OwMvbFINjmV5JJToYOWQLtfZM2p5cM6coD7n5333Kd7lnq1MC3//jtHXMg8uopta4Jln
	ki57Ci+ygZ/xH9YMNCKoxxkDtPJeu2+ynbjuh/3fmOycXaXXNxBLEdRRGnNCOElVb0I9
	9iBVJ/XSkUVq4V133K6WKdnMV6YiLYqabgjpTTOFkyGgrG1iwhT12mtxQ0ZHAvFj4BVp
	yBLJzvM8uz5StxAbqjxHNhNbm/8O26hC1RJqgLB1w+hpeO4hUaWsy4o/n5apBr52DIxP
	BB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=22eem8f4E7Q2lCts/8MV+P6d/GvQm3fDmA/QJXgLwDE=;
	b=DWpC9SXj8OyJGuRzkpbsNI0A93ZcXczs1X3+daNjs1t+tKajSo/fp64+mf1iaWJYdS
	UcaOKb1NX4sdyqvDoYCU2o3dL0nLcqX1BZzxWnQu01UHE/Q9lIJMA03BEl7gZw3G/PHo
	JI5Cd7Yuqr5TBRna0lrP2AwT/Vu5KvkL9KFbnZIp7AiBDCdCySOOpL9wrwN5AxL0YR1L
	4YfjgyH6jj1Tt/1YYXNPASEV33jpMocoBys50SZbBAL54KFIzxSxnnDaLcWvv8VMxMQq
	CJj0bkvWQAjKmGPOQCZSVnPbMfR8+KlYUhl/uRGutC7iqQCh0vaQ8D2GmnOT2ZLpIB2b
	vgmA==
X-Gm-Message-State: AIkVDXJQhVIhoR/geP/RYaWo7rrQu9RFlcobQxOEDyaF5uVrxC0f6+BXD4V2GLHev36Rvw==
X-Received: by 10.28.153.201 with SMTP id b192mr60803917wme.61.1483552565730; 
	Wed, 04 Jan 2017 09:56:05 -0800 (PST)
Received: from localhost.localdomain (p579F760B.dip0.t-ipconnect.de.
	[87.159.118.11]) by smtp.googlemail.com with ESMTPSA id
	di9sm99538997wjc.37.2017.01.04.09.56.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 09:56:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 18:55:54 +0100
Message-Id: <1483552554-25685-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483552554-25685-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483552554-25685-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] alsa-utils(-scripts): fix compile on build machines with python-docutils installed
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
X-List-Received-Date: Wed, 04 Jan 2017 17:56:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
index 07c25c4..e6dd5b0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb
@@ -26,6 +26,12 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2bf94d3e3410dcc74bb0dae10d46a979"
 SRC_URI[sha256sum] = "127217a54eea0f9a49700a2f239a2d4f5384aa094d68df04a8eb80132eb6167c"
 
+# On build machines with python-docutils (not python3-docutils !!) installed
+# rst2man (not rst2man.py) is detected and compile fails with
+# | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.
+# Avoid this by disabling expicitly
+EXTRA_OECONF = "--disable-rst2man"
+
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
 # please close bug and remove this comment when properly fixed
-- 
2.5.5


