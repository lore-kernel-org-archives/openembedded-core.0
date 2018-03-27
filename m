Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B16778678
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:40:48 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 91-v6so5229854pld.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 17:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5wwgDtHW0PoZdSqC9fsxjeYswoM5kBzPf2t7odYyB9Q=;
	b=oWUeAE+HHaYGxfllCg+54HbXiidbhF5IwcfOEyUJnnQokfOIc9l4pwMAYrkxjbNFyu
	F9yuCotTf/0p65ixSa8qJEMgiyJU1kjDFv/9QlFMNN66nc+tS7FGAVLf2nSUYRf3RcVn
	lionX/FR/3PU4K7ieKZLdozWQI6b8cok+JkY5B/LBxCYEQnmj3lFBG0fk2u+w0xhKxnV
	yDYKwpgyZcsImsu6QBUWn0cSHLkRnV7uSZKsBjm9bTqlFh+kwGIarvVIJ5HcqQQ6WN2J
	sEruJgRajwFSdA4AQ3nlVyeetdzyS/dG0mOwf67hCV+0eo4trpK661t+GRetkPwhUG2j
	mUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5wwgDtHW0PoZdSqC9fsxjeYswoM5kBzPf2t7odYyB9Q=;
	b=pEGqgR76wb1bWfV7kMLIe8RFt8G9sDeZ63Jns2YFvTwofDP9s5IUb9MYleEeDPiBF9
	6IMh4avHptFbxW27GDsUFtXHU6h/TdE1Zyg3oO51ghNAlbHQxvni2yQCx0ut6Q4ITz0Q
	J/Tx1qgoxaxexJDZH3hVh2Yys0LlwqfRkj4ML8wW2jMCuhKC1o3R4wucncV4D/KESab/
	UERmrPbbDDcWGhjWSt5WGd3at92/omd2EsYIwXMqPa6pN7P0wrd9Z6w2yBPbvOujGk23
	cY+1dSpJDSr3QVXJLiCI74cMkHxAqa7aa9Mvy5yH16pRghVUr5vUKPpgmXRb9J1s7lX2
	vXbg==
X-Gm-Message-State: AElRT7HNHP9Ld7JiFu0+9HIhmG3g2qfr1Qs2grQoE/U2hPuGxie1JYtD
	2Tw5U8Es+Ttzum2tWwFFRqm0clVj
X-Google-Smtp-Source: AIpwx4+HYIKmyKkiE70qjTH52rWCG2UFmynbQwWOKsU/NdL2pep3UTKY4c8ZjLcCbbPOSLjNQ8orzw==
X-Received: by 2002:a17:902:7b8a:: with SMTP id
	w10-v6mr2628282pll.181.1522111249781; 
	Mon, 26 Mar 2018 17:40:49 -0700 (PDT)
Received: from ip-172-31-22-0.ap-northeast-2.compute.internal
	(ec2-52-78-229-153.ap-northeast-2.compute.amazonaws.com.
	[52.78.229.153])
	by smtp.gmail.com with ESMTPSA id 76sm30976pge.5.2018.03.26.17.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 17:40:49 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2018 00:40:37 +0000
Message-Id: <1522111237-1869-2-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522111237-1869-1-git-send-email-changhyeok.bae@gmail.com>
References: <1522111237-1869-1-git-send-email-changhyeok.bae@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/2] distcc: Change SRC_URI
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
X-List-Received-Date: Tue, 27 Mar 2018 00:40:48 -0000

From: Armin Kuster <akuster@mvista.com>

ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any source.
ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch

[v2]
upstream deleted the branch and the hash no longer exists.

Took the git snapshot from yocto and created a copy on my github.
There was no offical 3.2 release, only rc versions.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index ea3d7c1..ff0e22f 100644
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


