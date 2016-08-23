Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D1B337318C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:48:59 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id v123so10199308qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=XhDvucZ3dE6x+VeDfOcgkrMljaytoheUgekn+qwOnXc=;
	b=j2J7TBymnosyKuBwmQpNCL97HvIxgaOY/fJ+5hBwDSca61/33Rb5xAWcGPiYFwHs9E
	xjthKVlcafivvYZHZIt1z9d8IXRiVUlat5LUVA17MqEvIihOo5d09nFo0SuX82BGAfYn
	r6jzcvqRtI317TEDxm/n+tYzM2soZ3+ohhxo3mrp+knK7wz/nM8k/fKbVGImJi33SOUM
	1+79BP33be3Iy8OmqHMMXSUauLTxiX2Y0VOf4i/yyyVVr94fPy9D0z8EiqcMNOvY9yAT
	I51KqotgLqh1NLq7FuSu90EsTdU4ZPXYR4KyabPkpXhVxwQW7ICz8k+4/ACcSb5fSLKr
	oWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=XhDvucZ3dE6x+VeDfOcgkrMljaytoheUgekn+qwOnXc=;
	b=YF+3hVBlqJblitcqys5zyGEW1mRMaceV83boRvmzQTDOHllFvNXyor2RJng0VzuI15
	TshdqNRmtDdVXfoM26Txp3P4FAVkbCmBHI5lHBDGdyWcxFy664JSE9rYgdZW71LXXZMI
	S9iYInqUCQdAGiWGK1EF10jXuuhujD5GlkRaXMbA6FB+YC6KZBGXWHcvK1L7QUnnO9O8
	+AIDrLlDw/6W+UyQ/XWFzJb5nLMAfB8IOrbqOryy+V2d0Ky8PPX0Id54yug5sIk7Rpvg
	c9imKKfh/j/57moHd5eLMrIrycXrcdA39ecglwsux2OQN2wIaIsBzRyx08gDAGhum9+s
	/kbQ==
X-Gm-Message-State: AEkoout62jzHQ4xv3uv/M5pn5/lGkK1L/EJLBOJcYHcC1RH2KYYhVftwuMCTR2yl/a2Upw==
X-Received: by 10.55.74.84 with SMTP id x81mr28682234qka.91.1471952940216;
	Tue, 23 Aug 2016 04:49:00 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	m62sm1540951qke.13.2016.08.23.04.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 04:48:58 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 08:48:42 -0300
Message-Id: <1471952922-2124-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2] python-3.5-manifest: Rename Queue module to queue
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
X-List-Received-Date: Tue, 23 Aug 2016 11:49:00 -0000

The Queue module has been renamed to queue in Python 3.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index b9c2fec..3e07a11 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -247,7 +247,7 @@ FILES_${PN}-textutils="${libdir}/python3.5/lib-dynload/_csv.*.so ${libdir}/pytho
 
 SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
-FILES_${PN}-threading="${libdir}/python3.5/_threading_local.* ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.* ${libdir}/python3.5/Queue.* "
+FILES_${PN}-threading="${libdir}/python3.5/_threading_local.* ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.* ${libdir}/python3.5/queue.* "
 
 SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 3a88018..33e3680 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -370,7 +370,7 @@ if __name__ == "__main__":
     "test" ) # package
 
     m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
-    "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* Queue.*" )
+    "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* queue.*" )
 
     m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
     "lib-dynload/_tkinter.*.so lib-tk tkinter" ) # package
-- 
2.1.4


