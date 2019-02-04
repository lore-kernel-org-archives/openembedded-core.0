Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3C07C216
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 14:55:28 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id f5so52588lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=lxJ8oQ0xI4l60uuXJkJd7EU+8MzCXQcDMTT8n2w3HJkUQoSaERUHAJXY8ACMKK/SBw
	4osoRizi+Zq3X3EclPMnl0snDsCdNu1kv+NmF+Q+aZtwcgmKwsXaFRtKMcgVExqoOwbR
	AlXzZj3sTUObT1T2qpjDgYeajsC9DkJJduLzs4Zgferv6IwqpQH/2R0rzzxrMsB/X+GD
	DnXrkSt4GFh6XWon5q54YQYWgnF2PBA6CqgV9iHGtByc5vj0R4qcko3a9yCC8vyedJjA
	mJZL4kUEZbXU/7HaQ9Ofd0Amz01Y6lo2bQF6DMKP2N53ndIMnjj8npOZXvqakdEEYinm
	4bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=e85VfH8oFWfyBuNtv+T3BiDp2CibzPD2FWoNSs58oDW02v9OPUL+8dcNPgO+1MngOd
	Yp7PGZXkP4wehIPHwjMv9tBX0/E2i+qjQtmmSVg/XLsAXZuqzDFC33NWR54qm1IykY5L
	+0bl4n4iatiQTt4fMLpGelLtEYhG6avh3oYVqu4qjLG/kKkPDmy7JxJblHwwYqTV93rp
	Mf84kddegKb2vwgDemsGJBQROAgTUjNPOE7fTMQv5S67IxqK1uDik9/BJ3dNt2ujZOjh
	wfXWD++jQI1kSvLUJ0p5Pv5vB6NtbF+NY5946Z6yhJChQFU3oL9psVemVr8igRh8fvHC
	I18w==
X-Gm-Message-State: AJcUukceKYo9UqPIo9Y2xnuzoRJrn4dKVuT+b9EyPmL2JzBTlF8vTadE
	T1aglWZBmvjxEllwWSPSvR53mMdV
X-Google-Smtp-Source: ALg8bN5LtPTJdAyJxJHPbPZeseDkigzG84Um3XORJP+Kw9Xe4EbFJgQHVoH2yp/x9WKq2eibi0ogbg==
X-Received: by 2002:a19:910d:: with SMTP id t13mr39042441lfd.98.1549292128508; 
	Mon, 04 Feb 2019 06:55:28 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s12sm215346lfs.37.2019.02.04.06.55.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 06:55:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 15:55:17 +0100
Message-Id: <20190204145517.124344-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190204145517.124344-1-alex.kanavin@gmail.com>
References: <20190204145517.124344-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] python: make the python 3.x version of 2to3 utility the default one
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
X-List-Received-Date: Mon, 04 Feb 2019 14:55:28 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 2 +-
 meta/recipes-devtools/python/python_2.7.15.bb             | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 81f1c24f97a..eb52e862ab3 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -109,7 +109,7 @@
             "core"
         ], 
         "files": [
-            "${bindir}/2to3", 
+            "${bindir}/2to3*",
             "${libdir}/python2.7/lib2to3"
         ]
     }, 
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index f462d087251..8df1dfd1ba6 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -131,6 +131,9 @@ do_install() {
     if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
         rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
     fi
+
+    # Python 3.x version of 2to3 is now the default
+    mv ${D}/${bindir}/2to3 ${D}/${bindir}/2to3-${PYTHON_MAJMIN}
 }
 
 do_install_append_class-nativesdk () {
-- 
2.17.1


