Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09FA67FC13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 13:18:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u2so11989945wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 05:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9LKtvNuu2V4NbTOKrv/q/MX6yfSxHnseYn5CqlorFQM=;
	b=OGcH9CITi/x6KbiZtIQSR3i/Mz3fUDgvmGVVGZL2Or5lQGsF2cUjEOQu0/X00J7Kac
	GYDh0SPbbQu4pnFZ+vM4bSTlML13xC9EYUTsGk17ozcbFJ8TOMiMDY2CEJKkPTH401xv
	Pu0YCHSWUQvmLwIbXYMwhJWKnCVjnSgYiaYwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9LKtvNuu2V4NbTOKrv/q/MX6yfSxHnseYn5CqlorFQM=;
	b=jG8eko2MomhttPkF2Z9EFsvkLHxIoYE6r2XI5liIUKSdcnomfv8s118VQA/FhAmve9
	dBy2S5WSm8DthXyytwrfn1z+yOqTL+IWBV40tDKrXAd0/1exNs8InZaZ81IuSES59wWk
	2lQuCAsptu6UK8KLalvniS/CA2FQP5RDSYM8p73kZqBheTKiDoL56fkiRJBlkd8XEs8/
	KlO6o5FCi4uPIStCsTEUvDCzLniMp/hy/Tmg7jIhBOEwcsPFV3rrXxPo1yjAIuq+qx45
	7yol8NUSy3c5Po2A+T3PI87py9176/YTILpNqn2RigGRImbk44FJFMD/LKx5IDSrGIe9
	TKYA==
X-Gm-Message-State: APjAAAUwORAssHnzs1dLroxGReTD3sNn3KRt6nAdVVLsFmguKIZNvQzg
	L3Suhob2XwpdaKYZzMTnO7w5AE1czuM=
X-Google-Smtp-Source: APXvYqwctsdLBC9owmt6n2DL22kv7OZbWMeZ5D1EmOR14+uign535Bog7eHhPNM69LNKCvmUJyv/yw==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr14605830wma.106.1579439928604; 
	Sun, 19 Jan 2020 05:18:48 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g18sm17973340wmh.48.2020.01.19.05.18.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 05:18:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 13:18:47 +0000
Message-Id: <20200119131847.22641-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pcmanfm: Inherit mime-xdg
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
X-List-Received-Date: Sun, 19 Jan 2020 13:18:48 -0000
Content-Transfer-Encoding: 8bit

Inherit the new class to avoid warnings about desktop file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
index c88e1ed8d6a..7885e0abaed 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "6804043b3ee3a703edde41c724946174b505fe958703eadbd7e0876ece
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-inherit autotools pkgconfig features_check
+inherit autotools pkgconfig features_check mime-xdg
 
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.20.1


