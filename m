Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 057BE65D35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 05:04:46 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id u11-v6so6826961plq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 22:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=pcyy6gBsAWXlQhDsj4Hd1v914fnS6bX+rfWElUU6sOw=;
	b=Dv5g7MPHjIBCogDhY6cZm9qwA7i+Ap16LYlHjIQTq1wPG2odFn3cIzB1S0/0YBznlZ
	VHsYMJWJp+M/fBiJ9FAbu03kYEpY3vQ+XrHmBv/3pIcvqMlVWLj1ZO2LnuPQJD1V8WYj
	HfG5x+AwikEbJKbS3M1lgbBi4wTaiCY579+d37KnwJZV5NazTKvYQ9xoyaf9lyGoXmGb
	ttl/gtWYUtMAnJkTRTH/Fb/naiGK/2O2k9bDWG/1COsIGaSdATuVGHFKjRVU2KWHE0WZ
	eMNGMQfojotpcMXzBC9Ob6UR4nPGVLlxKVptb2shuLXwzUvbzQIk2mvo16J3bYylQe2S
	g5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pcyy6gBsAWXlQhDsj4Hd1v914fnS6bX+rfWElUU6sOw=;
	b=GFYYanv2qiGik1IRQTMbztm6P529ud5kp6UWMQStVFUuMKR2FBrCoqvH4R3d7krFbj
	5Uagx7QrTMHfMomDE9XAdZ5W6Jph1LovMSOXdP7KZXPI5W2uQviHv9vv9NVzPLKMpFIr
	V4jEK3lSoexqlstZanys7N2c8cTqCyrXaRLwgEZNmYA9KRfw7RagJRfkREEcWeW/4GER
	OzoSP4/nvQp/S/sAM5eLHo0V8+r7dWzxgh7UFtSIJYKG5qX6U3jY7J3gRF4XvWpEMgjR
	PJdZIWsg6M3j9lrQ61gdnNylQcUlv6dgRaaO6pWbTHn8E+8gHZYrTyXyABkO5RJcWO/l
	hg4w==
X-Gm-Message-State: AElRT7FdMMzCTPsEjo9CTQnpHF8QE3Z5nTU5dtwIXVILmfWyJDHwjl7P
	4WZWj54Zg0mJvcdkQISZQXU=
X-Google-Smtp-Source: AG47ELsF6dOpt8pwMPpQ3QNxec8+6yW3/guFR1mc4jywvfb+pDfcThxE6vLmeQjz8ZQ7eTqKe++Brw==
X-Received: by 2002:a17:902:ab85:: with SMTP id
	f5-v6mr23972347plr.380.1521781488106; 
	Thu, 22 Mar 2018 22:04:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d51a:28df:7b7:12f5])
	by smtp.gmail.com with ESMTPSA id
	184sm16642278pfg.124.2018.03.22.22.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Mar 2018 22:04:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 22:04:46 -0700
Message-Id: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko][v2][PATCH] distcc: Change SRC_URI
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
X-List-Received-Date: Fri, 23 Mar 2018 05:04:47 -0000

From: Armin Kuster <akuster@mvista.com>

ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any source.
ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch

[v2]
upstream deleted the branch and the hash no longer exists.

Took the git snapshot from yocto and created a copy on my github.
There was no offical 3.2 release, only rc versions.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/distcc/distcc_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index b6da65a..e6f159c 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -14,7 +14,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
+SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
-- 
2.7.4


