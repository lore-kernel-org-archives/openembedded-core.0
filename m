Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id F31757F33D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 11:35:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l2so72614647wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 04:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HQ03e014IoKI35RCEjSeIPEWk82vgVzyxn+mhN+Xqmg=;
	b=VHkzODRniBEWqekp1seejrL8pgyB3sVRKNZtsbQwskjmnevOJvgHtGrD/pUsmUxXae
	nX6Jv/xtQyRFa+hcrzPXt+q/JoTkbmfTMV5WGyUV/H9w9/kyTq7woLQXHc72UQ6+gCEg
	E1YbI3B88FiYPtYI/aGTjU8c9P25ou5LAbokqolr4MYnlG3cv9O2WhNAUaTSVvz/V8ek
	97eiMLmviOo3mXO/1jCRivKEGyKLnhv5SDxAaI72RQBGgPWY38dG0uSw8JZR8wNBiv8E
	vnxM0YgwFa95LMdL7Dubs/I5avxCyJHQp5/NfqA57lzsg4yr4KjeMEXew9SAlSGixN1/
	gA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HQ03e014IoKI35RCEjSeIPEWk82vgVzyxn+mhN+Xqmg=;
	b=tjriAeZIdcHsRapo9U5Vsb5a76KJK9vaAkHO5hH7vnIdRdH91XSnTTQ925EtDvK719
	of9RmhfVExefE6Znb/7wk/nG6PPK+FMvP5YWHNaAlnvWMpM8US9DTrx5K1sIsyihv8Xe
	8K7s545KwUrX+IuwBvI54DD4SRbVNgde+z3LSS3IRvK8fOBtCc0ltkI/MzLZzgQcc7+N
	TAUZw66O1gjdfd3KVr00RfZDf+w2GCc5hgprm0Jx5OBAM7KCYE0BVwjJcLL6T3no4fkK
	k61W2M9SszAwc3E/sIUZztJ3kpv4ObPOcR3iUkkVpGlyxuGNNditDRgjhwGv0EuDL0Ld
	okeQ==
X-Gm-Message-State: APjAAAUCBegzrLFvI26znBXeEHiVdCaUIy0ihK3yRh5wcqGyCHLtEUOJ
	OhG7OpEToHWrWxqQL/qayIiqjyAHp38=
X-Google-Smtp-Source: APXvYqwVulaYro2eWavJTk5/oDIgrzIRo2zBRC8sWN1cr+ktYfE1+whzSCuUJwBL9Vx43epH5tEvCw==
X-Received: by 2002:a05:600c:c6:: with SMTP id
	u6mr19030755wmm.153.1565004927414; 
	Mon, 05 Aug 2019 04:35:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	k9sm15227233wrd.46.2019.08.05.04.35.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 04:35:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 13:35:22 +0200
Message-Id: <20190805113522.31021-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libedit: fix upstream verison check
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
X-List-Received-Date: Mon, 05 Aug 2019 11:35:27 -0000

The default works fine; not sure why the line was added.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libedit/libedit_20190324-3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
index 01e7f360096..6a599ebca55 100644
--- a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
@@ -18,6 +18,4 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
 SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
 SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
 
-UPSTREAM_CHECK_REGEX = "libedit-(?P<pver>\d+(\.\d+)+)\.tar.gz"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


