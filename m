Return-Path: <praveen.lisieux2011@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C2CB7616D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 17:19:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id u6so5573467wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 09:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZlG/z0jnVrsdD1RerslAVb3A6K6iCjAEsTcgMmBzu20=;
	b=fVHnSmnwOhNXUhaNOxRMCaThNWigsZFu+Ps3ClSgA0gVxoOc5nvtxO82h4v36SEHBT
	Ujs4QyAqhRMBJg6/NBJnDVeYiZBIo/RSJnkPKNfcjFs6r7AtAzeDQPs17iN2/3ehiLij
	WXlFvZzdnG1rgreV5x9smiXtpNonPgQ5aYqnewi43jjvhL7e9ZmKme3PmONW9G/ubx58
	gQwR/0aR6M3ZbhIMLPRw5IMU++z316/ZihV2THRFLI9lMZdgqpi4I1pj6HNHOfAiC+7u
	Gje2UTTXxsGPrzCEXMNuUhIGszvFaoXyWkPBMR3k6XbILm52GMEVr0+pGR1ZWA8LBdvk
	SHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZlG/z0jnVrsdD1RerslAVb3A6K6iCjAEsTcgMmBzu20=;
	b=tMLpOme++MMwJTQbwUL8Ur1QMjBKt8XwdkNPbs82AS7sDLC86UbGCoF6F6Jzu0gfuj
	h6nm2x44oPBvAUUMnLP3Dyqb0DeJ+lVcKzEEAaeRfPRq3JXYdKV/OchfQdK2472peIzp
	kVeP8OtAqrl2NxLX/T65t5sIQoSbB+ik8QyFp2Fec2bEvH+Pft1d0jZfB25PuOu+Y5q5
	+SjqWlbCyb7wlRkI1G3ekciVZ/aCZo22jPhGRxCzKfZ6XRKNHxIjr/zqb4D8+t6ZLOhi
	c74yvWAXd+0MgcdpzaLpkFtgqV79iRbK/Mbt/6atf1hJmplAAt5FZ717ErmGNhMcvK4c
	lebA==
X-Gm-Message-State: APjAAAWSOAi3w1jAL9QJKdf7V3T+EN6gpka4FJ9ifIGY4EWvnyQwD2tD
	vVrZImdh2Zg+qZQYEwSZSLzPApNv34g=
X-Google-Smtp-Source: APXvYqzItVH9cLrFsBiRiH5WrXaS5MVV9xtcKb0K5MpA4pXYRmQEuWaGxPGmaQr57ezjqV029MmhZA==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr55741091wrq.412.1582391991304; 
	Sat, 22 Feb 2020 09:19:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:810d:a480:2458:1031:f776:113e:d3f])
	by smtp.gmail.com with ESMTPSA id
	h10sm9311604wml.18.2020.02.22.09.19.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 09:19:50 -0800 (PST)
From: Praveen Muthusamy <praveen.lisieux2011@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 22:49:32 +0530
Message-Id: <20200222171932.11494-1-praveen.lisieux2011@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V3] alsa-utils: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Sat, 22 Feb 2020 17:19:52 -0000

From: Praveen Muthusamy <praveen@linumiz.com>

Signed-off-by: Praveen Muthusamy <praveen@linumiz.com>
---
 ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
 .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
index 9144af628a..8bbc5d3ef3 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c4628bae7632937eac2de4cf2a3de82e"
-SRC_URI[sha256sum] = "0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d"
+SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
+SRC_URI[sha256sum] = "44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.17.1


