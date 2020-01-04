Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD927F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:17 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s64so24794266pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q2rRXwGkv+8Zubgohigs5Exc0Nxhya7VJ1Oc7Z4LrtA=;
	b=hRBfyCOQbmApLI7ZaxiZxepBd3HhAqz80im0T2ZJVGRx0dlYUdtBz5JGIOQoHMRsH+
	j6m7bk1V+e+DMf3wKpzMykwBwUn5zzYvfsw5L8WKbFsHTk4Ax2j0+sXKscJcm469NUV6
	w3M25i8f5gem0KQO/kepdVgP9jO8DIeGBEfdPjIhSq47XmUufiGjMtjsfPCikC9IS35H
	zuVQopYrJ91g/kVuaw7GVfOVnCJ3XmcOR2TktDbxYxkrC7jl4B4mLG2hPF2tvhphVwwZ
	2kAkrNvB2mBtHqBkrPij1isOJgk6G3iCr9QrSGtD2j4j4WSGXJS/VPGloinF1uf2hVum
	psjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q2rRXwGkv+8Zubgohigs5Exc0Nxhya7VJ1Oc7Z4LrtA=;
	b=ryJc6fGtVjG4LMrZOjQkp4YxuueGJIzWPIVan16wcmQpAYXd5kkuDfN2IeeXuqnDGP
	7/vcf/QwHhrfnWRDNpCAoLIe/qrdZLAsj/RI6XxouS8Lr23LrhDwg0XmDl2ndwb9+8EV
	Ov0ZN1ig1Ab4YOBMvlpRxix+Xxceswiz/hoh4swxUfrpxJF8/DV68fdHaovfLJYrfB89
	yjRAGfsSNT5vYnU/sw7M5LGJcRAnsu2cvPwLgUel1c1mLNz5irxzNgaeOgKPmF1WT4zG
	SNwSxsKCwmeIhAwPgVdm15+qrnntjvsYEjPrgpkRHC8MKRHPocCHzHi3q9ahtIV2z4+A
	4O+Q==
X-Gm-Message-State: APjAAAWyDgl4epw4e8tUhJWSCOnDtkB7QKVBNl9AivFe3vheZljkXCWT
	iGraLYc5wC7z4jxy4miM4m5Tm9RdGao=
X-Google-Smtp-Source: APXvYqw7OpcFvszgFbGs2aWXTHwjYWOx5jPn89i1EKJmfs/FKvHnO/cQ+hDd9kAbUMEvqjxIf/O8yA==
X-Received: by 2002:a63:c40c:: with SMTP id h12mr82921306pgd.77.1578155178149; 
	Sat, 04 Jan 2020 08:26:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:46 -0800
Message-Id: <c5f285f83ea1e322d5124847904adf488d3e790a.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 05/29] sstate: Ensure mkdir happens before mktemp
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:17 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids a directory not present error.

Fix a comment typo whilst here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1360d8d7d99b70a80c8cdbc1fc6d9e6752483139)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 79ae392116..b5267f00be 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -747,14 +747,13 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 # set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
 #
 sstate_create_package () {
-	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
-
-	# Exit earlu if it already exists
+	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
 		return
 	fi
 
         mkdir -p `dirname ${SSTATE_PKG}`
+	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
         # Use pigz if available
         OPT="-czS"
-- 
2.17.1


