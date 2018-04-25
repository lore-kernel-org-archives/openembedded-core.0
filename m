Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE6D74535
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:07:14 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w3-v6so53465896wrg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6XvyWv69a9dOTSIv1yFTn4hP117ukeDrobO60M36RIY=;
	b=aS2hDfk+ewhAicpO3eL1Yow46QhlvneN4VJWIWa4DNpwStHRVEUKqlPykJBkFYR8JE
	U4ngmZgddJ77COdhX681vty4qzQZnob12mFUiBTk0WwDa/vvGAh9w5IoMboWNxiGe9vl
	Hq8f2xQW38lolkMWn5gZ/pj5rZlqaQN3z27J+wXgddCSeRHlZ6ds/NTu59IDVUj68fad
	JO40tfFa5WtQhXVxNEM7brmtvUJuMNU9ffpxmd/UZkoQ9MqBWaf5flNN+pCnEuF5TCZB
	IkpHGFMrlESZ1NNROQwHgwMk87MNpvkv2VPZD8/YDe3q+ox55F4oLfvCQaCn8NpEH/nQ
	fD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6XvyWv69a9dOTSIv1yFTn4hP117ukeDrobO60M36RIY=;
	b=AYHZlx6wXuBZf01LN/RQJDnv7RilTZ8FBfl1m8kwAz73ZxFWzB4gfAl54pDgO7IWsC
	He0uIGE/qguK2L/vjb7RNQiejgOVyBQM+yq6JZ21kix9jsCiE3dPniQJTQw66iMg1WHk
	fR8jGI2sFrvMD4SioDpZbbBibqZ0NrD5dldFw1dmH46m7goem8yjzy646SsvzMDT0nwf
	CapKO63+w/MiAiEYD5LwwIB4hZnBsJus9Xo5SrGt3WTR9RM2nzog0fgOyYT3Q4OkVl9m
	6PtOTh+WkBRAcQ9/Ik4bo+LQuu1eGYXIU5Int7l2erPKLn9rBiogiK/6l+cdzwFA0g1P
	s3+A==
X-Gm-Message-State: ALQs6tCXtF59GvHaZ7cBpSJ5uGxBMNSFocdlaKo0AOfylSHHUtmkVerz
	/1kJA6OY7xuHv17cHpdUw0gNIA==
X-Google-Smtp-Source: AIpwx4/Xx7c5XN9KhDS3EIa69mwOlg5a6TFJwlA6Jog3MWdNlGxgkTV8Q9szmxRMmQi+gfvqqpzAfg==
X-Received: by 2002:adf:8f25:: with SMTP id
	p34-v6mr23007848wrb.193.1524665235544; 
	Wed, 25 Apr 2018 07:07:15 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id h12sm7287627wmc.7.2018.04.25.07.07.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:07:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:07:13 +0000
Message-Id: <1cf93aa21ed541e982ff0be611cdc25eb4568538.1524665117.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1524665116.git.Martin.Jansa@gmail.com>
References: <cover.1524665116.git.Martin.Jansa@gmail.com>
Subject: [rocko][PATCH 1/2] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Wed, 25 Apr 2018 14:07:15 -0000

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
2.17.0


