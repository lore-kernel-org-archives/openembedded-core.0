Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8AC60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:05:12 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id f1-v6so9948225plt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/3RWy84qhfy/PZPBU0bG4rMIuogAxWRwgaBJLnaXHLo=;
	b=I8/DJwd2+NQnO4B9iAd4Y/x8qlqGI4r+2IhooCNDI4tRsdCyPDck91tEByNhE6Ng//
	KXCaj5CF9jCzAH+wAHyH4GVJdJag3Y8d5RmvdPSV8URERrU3GchH2viWjYtCeYgVHLxI
	X0bq9hbmQSOPK5VeVxGxbp4QK3SjmXlPZru2dvTiA0U0+GRKEu0f9I19E9HIle5JYu8m
	3qXnpDB7N8eIRgmx/o0yIolKT30n1EE91EhEWpghWBLeYEMzCMGmMeCI2lh/NwbIFAot
	by+arOOzRENUUYNomLGfdI0/C/HMjp+2DKur3cBIU7CO6T7CJJip86bUQOlCAOnbfPiW
	HZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/3RWy84qhfy/PZPBU0bG4rMIuogAxWRwgaBJLnaXHLo=;
	b=hVyii+nhRVVw6qe5UqkwdoEDwrNCYSm9yK3PvzXJ03vAokvwd64IJuZMGnlOk93dJa
	H/i7sKzm1EjlnuQAbGzZw+yPZ1qA/VKxmtGNmHt7JmR+r38psiadZw52FSQNwIcD5jgd
	QQ77+P6HtS3ZZtPBttmboIyEptsIuf2ddHPWjctWerm1YCi+nkR58utgX/TYGXemPFpb
	qij9d78WADWHs96V0oeQZJwt1qL9UU6qtQmFO4NKwR8CDusECpx8XtYKU7nNPPZn0arB
	WwAjOztpvBIwTdzQPERVh2fcIV9baa+v3fq+YXb/gPXf6NWT1QEQkHA09xTF0IUBReej
	Dzig==
X-Gm-Message-State: APzg51Ac+IhwAFKERTV+F467eY5dp4Cm/vFPZ85o/Zt3yL8VjjFYmk0s
	50BuU+zO8jyhtaFuzwfJB8kcYqs8
X-Google-Smtp-Source: ANB0Vdb8xcWYLn/AkXRgJD9LBmmnxnuHlukTWMUgJ5jKhta+7+7WqNVu4QuIaL7HebVJ5Ojax8yjSQ==
X-Received: by 2002:a17:902:d898:: with SMTP id
	b24-v6mr3271714plz.218.1536595512999; 
	Mon, 10 Sep 2018 09:05:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	9-v6sm27860853pfc.20.2018.09.10.09.05.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 09:05:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 09:05:04 -0700
Message-Id: <20180910160504.34929-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] serf: Document and add upstream status field for 0003-gen_def.patch
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
X-List-Received-Date: Mon, 10 Sep 2018 16:05:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/serf/serf/0003-gen_def.patch | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/serf/serf/0003-gen_def.patch b/meta/recipes-support/serf/serf/0003-gen_def.patch
index e37e9034b0..0ea2cca9df 100644
--- a/meta/recipes-support/serf/serf/0003-gen_def.patch
+++ b/meta/recipes-support/serf/serf/0003-gen_def.patch
@@ -3,6 +3,11 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Sep 2018 11:12:27 -0700
 Subject: [PATCH] gen_def
 
+This is partial port because half of this patch is already present in our
+patches
+
+Upstream-Status: Backport [https://github.com/apache/serf/commit/8f07c9626106873a594fd07e7c257e9080d8660b]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  SConstruct | 2 ++
  1 file changed, 2 insertions(+)
-- 
2.18.0


