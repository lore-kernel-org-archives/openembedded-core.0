Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D428377E87
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 00:24:07 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s5so4497988wra.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 16:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IX9Ss+QnG+1niCTQPI97MkSTFxqt+nyg31UWhTE8HWg=;
	b=IDMyJFsKHBpimufTLMSQ8j8cKSfuT/7xupQkE+EkAllN02hWOH1MyeFOFa/rFpGhIa
	1M2eRdUoAujVYgTGLWwlLXrGsIP0JhNgqPy5jIQH7WZULzWYAEvdbU43W/Qo0pUBJPv1
	e9JE57ST8t1GWUtZtsAt3U5ar2l4lEqLiCkS1NlA1Izx+MNAcjQQfDaKI5bw4j2/Ptmr
	JlJp/uD84mDEPd6qURt3bpohWmAQTOP6SwmPQk9thOSSy103ZVjYiltHISepMcXG3wzW
	NmGzyNB2+FB1ZKQOpITvQGcgjpvL2DSgaq1pG6rj8pJllSPPr/A+6BnV0SnQh3AJV9rF
	0BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IX9Ss+QnG+1niCTQPI97MkSTFxqt+nyg31UWhTE8HWg=;
	b=EHOPAwKNEQIWwAIcz0snQeerZpy2S2X5a4GYoVyEMBQcMNWoSiZcUfxkRyzrEBK1dX
	eaVK0m/BHb98+YLyNasFjeFecKK+FX7EMoI8oyozmWCUQQUGg+u/p4CUa+RhSRUTCU1m
	6C3AWIse11XfxxkKQTNSryBtVft5KEipQhd7f9zycsY84qe9TKlJJaHpyBpCKlALnD/P
	1CVINlXMCwxqh3Nk1ypt0f9BCIlT72x3JjDIcKFwqC4Quuy3P3Z0jZAS0ZkgJ20mjweg
	hmzoG8qUKr5wmWY1UaHMOThZtYaHHGatOCW6PA0cGfN9edHXpv+POwY2TFSyhM8barQ2
	AvGQ==
X-Gm-Message-State: APf1xPB7+sNtzieqAT8+SHMSz38Q19y18G6oKggUpvPJLf1aJouJVcB7
	BH1+/qFuqnWjLewwGltRdhBh8Q==
X-Google-Smtp-Source: AH8x225H7W+wo7zUIAPq7znSgBciXVeL89eIhiS8LF8jmqrZVKmLzr05AC0Z+s1Yq4ToEDv2g0xDoA==
X-Received: by 10.223.145.33 with SMTP id j30mr2304107wrj.172.1518827048677;
	Fri, 16 Feb 2018 16:24:08 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s126sm10011899wmd.43.2018.02.16.16.24.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 16:24:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Feb 2018 00:24:09 +0000
Message-Id: <20180217002409.88-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [rocko][PATCH] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Sat, 17 Feb 2018 00:24:09 -0000

* this doesn't work correctly as discussed in:
  http://lists.openembedded.org/pipermail/openembedded-commits/2018-January/218460.html
* some of the issues were fixed in master since then
  but not all, so revert it until it's completely resolved

This reverts commit eac21f981337bfaddb2d67161a1ff049158041ce.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/waf.bbclass | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index acbda278a2..c4698e910a 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -25,23 +25,8 @@ def get_waf_parallel_make(d):
 
     return ""
 
-python waf_preconfigure() {
-    from distutils.version import StrictVersion
-    srcsubdir = d.getVar('S')
-    wafbin = os.path.join(srcsubdir, 'waf')
-    status, result = oe.utils.getstatusoutput(wafbin + " --version")
-    if status != 0:
-        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % status)
-        return
-    version = result.split()[1]
-    if StrictVersion(version) >= StrictVersion("1.8.7"):
-        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
-}
-
-do_configure[prefuncs] += "waf_preconfigure"
-
 waf_do_configure() {
-	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
+	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
 }
 
 waf_do_compile()  {
-- 
2.15.1


