Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F02BE73027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:26:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so966488wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 00:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D+3VwW+ytK25s6x7hPH63p+TF83UTnUsZxnkY9JvuyA=;
	b=FQTmoGc5qZTIOOUMOOkLds+orQBBbWF91mkzAaJB4noPXHpytO5NbdxpnTq2NJwk83
	TFYomS0iF9TzMY3JqroFCTTNxwCJ2JjXSwHeQl7yXFS0iPJh6zMrlY2WTuH/7UVG8x7c
	gMPB8vZSYqzOS/xXjiz9Trwwa/NgBhDItXpx3Yt7mD2ocTqzSImbfyTGA2z0M256jJmv
	R5umHSLfI571hcWuZuZKSCaE6a+sk8GV5os3zZf86Z9gV9kmJyWVu7r6oqbIaB9z6Lqb
	KQfa+paYodXDqlUCrO/p3vvPbwjKzg0iHa3GLRYeRm39s0TNUoPtICgpEsL+Fm/8jVry
	RhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D+3VwW+ytK25s6x7hPH63p+TF83UTnUsZxnkY9JvuyA=;
	b=IeUUCnLZyYZniCpbvZF5Z4VHqRIuwY497A0qAS6di5JACUNJkU9icLKck+w69KnxhX
	UjGBMnmgC+QcLXZbRifzgZSyVcJRMbnSots2RWNZcm0f4vBKxwHnciB375CEVcOykhSA
	vRkJu0MlwThmx3A3pK2zNbWDadDNEbCm8GWupj3QYsLEljgsykuiyAzWUdhLhqMAri1L
	Ut+BHjQtf4Ab8XWEinBh4mWSwL5A/6mGpHAcKissZ0gvXqRVGUPm57itTMHzd6giCmO/
	QJH7L0GksB8H3Rj6oMdJuGd4e3Gix1dus2YzzC2lplHSNNuUYTkhCim/MMXdFsvFTREk
	yOWA==
X-Gm-Message-State: AMke39niyeSdeIjnQX2/yILUbpOF42MR2jdNP8jqDTJ9j99D3n3A0Mg52YtNz3f54F1vlQ==
X-Received: by 10.28.137.203 with SMTP id l194mr1197283wmd.63.1487751987176;
	Wed, 22 Feb 2017 00:26:27 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.175])
	by smtp.gmail.com with ESMTPSA id o2sm740901wra.42.2017.02.22.00.26.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 00:26:26 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 09:26:09 +0100
Message-Id: <1487751969-17730-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] python-ptyprocess: BBCLASSEXTEND to native
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
X-List-Received-Date: Wed, 22 Feb 2017 08:26:28 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some developers might need it.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
index 931e5a7..eed24ad 100644
--- a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
+++ b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
@@ -20,4 +20,4 @@ RDEPENDS_${PN} = "\
     python-core \
 "
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


