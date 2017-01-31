Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 861A173173
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:24 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id z134so206576018lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nz1AqvXjkg7SJrYsQ192GVzxw6hkO7MCY7lfoqKM2q4=;
	b=UjWJY/T8bpM2zMBL0ilxMb6/3relw9A0r+j5Hfj2aOJfBUe7yo8AzzAyfjScSch1aW
	ln6Gs8sqxv2Kwj6zgQQC19VTs97WvcSb+ZXLCwUHUGFs+a7/HH7iv6caAiy9SNEiNS0s
	7eg1u057t0C2JIsUtSJTBDiAHngvpPnqqQvI/2Q5nYffSbonZS63IWz8nsXkq/fzue6Q
	UDc3zrIkBJI1417Q6KCm9rrnhd9LE4LO+BNim8ZxYMDewNPzGtHNi56vGpUqOjsNqQge
	b8hQ8TvRNutLOb+d4krQbd/LjptkLnu4JeRDSbuFmmQfWsRnmyFZ6ZYu4ndN2FAx3ZEk
	Cz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Nz1AqvXjkg7SJrYsQ192GVzxw6hkO7MCY7lfoqKM2q4=;
	b=PyFzYp/ZIxgV51EfffKx8X4ifZs3LKi12p5f7Fbeftae30T5/2/8/ZjbXJDXuUilKU
	8kw04V9LS+AexeM0lLyU/DKV+/t37mo7DVKCcLliBsYMUsfYodbiPGKwriXCAOBhgiC3
	L7+ksnquVCffagFCygv+bCfHv/PxwPE2VklrpHMofRoVnebbThPFlXV0uYZoKxkShmUT
	EYU7L17PUcrv9SpDhXe9ZhGM31ijTivfSsrpaEl7oAwLpU7+9kUj08NaepuS39SKey7u
	fL0qdRdKFXEBVxlw127zlG2eXdwTs29YQQo0A0fL05NM2XuIjHWvTC8zvQg++svisMAC
	4N+w==
X-Gm-Message-State: AIkVDXIJriNEtU5ZrfUM3cTFz5zVjyV7Ej1+ai7MtlokH+d+Bp1+wEUqIVCmmFoqfcpNVg==
X-Received: by 10.25.76.196 with SMTP id z187mr8308012lfa.60.1485847104406;
	Mon, 30 Jan 2017 23:18:24 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	y10sm4333728lja.22.2017.01.30.23.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:23 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:14 +0100
Message-Id: <9633dfd3e39ac0c5d89fe3b6c5a3fb2e4ae9e023.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485846907.git.anders@chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 5/7] python-3-manifest: add _compat_pickle to python3-pickle
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:25 -0000

This allows us to depend on _compat_pickle.* wihtout having to add the whole
python3-misc.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 555ac88..8b64069 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -167,7 +167,7 @@ FILES_${PN}-numbers="${libdir}/python3.5/decimal.* ${libdir}/python3.5/__pycache
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.5/pickle.* ${libdir}/python3.5/__pycache__/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/__pycache__/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so ${libdir}/python3.5/pickletools.* ${libdir}/python3.5/__pycache__/pickletools.* "
+FILES_${PN}-pickle="${libdir}/python3.5/_compat_pickle.* ${libdir}/python3.5/__pycache__/_compat_pickle.* ${libdir}/python3.5/pickle.* ${libdir}/python3.5/__pycache__/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/__pycache__/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so ${libdir}/python3.5/pickletools.* ${libdir}/python3.5/__pycache__/pickletools.* "
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 770ef75..1a06896 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -329,7 +329,7 @@ if __name__ == "__main__":
     "decimal.* fractions.* numbers.*" )
 
     m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
+    "_compat_pickle.* pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
 
     m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
-- 
2.10.2


