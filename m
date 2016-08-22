Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA330731C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 18:58:08 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so3075682qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=KJBxup5fm4BhiO37x4/DeW5o8sAITi6dS4xkTwiANTc=;
	b=CJgeZuh1Mi2LQduB42o5seYwhDbIyPe2Tajadf9VZ8CeQIE5dGIMOf+loMc+7WkHw2
	nNcZ5OUzSOzC0BWrNMXQq6+RAFdV+nN+SPjL8dlEkGKgu4wyUAbfTZlNmRjZsW4k4jwl
	z4+vvgJfAx6gZyfckI8hmy+pd8yFSAbX04wZmvPtIljOGiGXhDeSmKhZynkT4vY0lJFS
	A7hGwzqbJXvkwWB/fyv/Tin5T2ay2MLlpxCiO1dfm6ibv4vb3qdJrjqiZWmLj1IKjLNv
	ZfRTv2SHDXtLyx19Ni9Y2PKrv/rSA+SWnM6FBFwQzbn7o0uF+nP7nJwqT8d1MGcN8R4z
	LOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=KJBxup5fm4BhiO37x4/DeW5o8sAITi6dS4xkTwiANTc=;
	b=PDeufobLIlv0yZk7YQK+2x5C6DDyKuRnEo89KHSyo73yx3EN/+6zkITX0UPAQdPME6
	GkRY5LEVNdZrNV/7cMbmmihsOGd0Co6GbtUHECVJPQPGluyTSIhgeo2Nsj+6yzoiby1N
	rBsjdUDi50Wc+baCf3UYbLTb6QgPLadWK9xvm03v4tIZdEGGVi/KtZ2yt5gHwcpRTNz/
	KuHtrGjvc6JBZRth96PYbnD7hqh1UUremDnHqMGfUA09uwitPk5Bo5Ebsg2uiXqr6+gu
	MLQwAFqOO6kac0wl1g2OiiJ238+u1x0h1vhQXUHEPLGAD9o3Nxit86aIj3Y2OQ6iQlll
	R0jw==
X-Gm-Message-State: AEkoouuhgaDeh3Q2g3vYEW6FMq2VxLsGgch71feMe3UTwsVrOsxurS0MpwYwssFhHkfiXg==
X-Received: by 10.200.43.174 with SMTP id m43mr25754485qtm.74.1471892288246;
	Mon, 22 Aug 2016 11:58:08 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	l189sm12018766qke.27.2016.08.22.11.58.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 11:58:07 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:57:52 -0300
Message-Id: <1471892273-5919-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 1/2] python-3.5-manifest: Rename Queue module to queue
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
X-List-Received-Date: Mon, 22 Aug 2016 18:58:09 -0000

The Queue module has been renamed to queue in Python 3.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.4


