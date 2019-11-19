Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7987F873
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:26:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b11so3164502wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6XH9b3eRd3omffDX0e2cQP9Azs6Av4kIPV2iANUuVdU=;
	b=vfOa/ymTFnLaWEqkMsHdMnJZxmlYDkMbXPdctnNgnrkmY6xqhl+9/Hy4fzriqF4g/M
	lPqiGAvEaa//LOF6hxMTmv+100LdRqDDEIzyZtGRYVrjG5BIjrESgg5wjshbWfSBokH/
	hnPy7HWzRFqR5ofn61ip/cVdZGOWptr5Xb6JHKyxLWWkqsLiZM11OxxeE3oHkjiCCrB7
	Au2RGmzAG5ITpyLQdnCvH6R3QeNJn/hPAS+I1cUk+NynhMVXVw6+hpmwxsCwhdGeCcVw
	Dui+dyTRXzdxwO4ETHft1bzXxvSWjReoXWrTkSB0WSu+SsJL1euuXzYfnaaZ93tO/+cM
	Nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6XH9b3eRd3omffDX0e2cQP9Azs6Av4kIPV2iANUuVdU=;
	b=t3eh2f4EGswkK9kaKYsB/Sta26v+fhqmhNVxOKtxYnBreiQtTM40uMzOtVZJHOOU3f
	QM6AA+Ntmp8KsgC65xO1OhDTVhpRaBDG2D/BIqJ7QWebQKyx/5NmKBimrICHjnOnyLUl
	MV0mkHnEobngHHSQtKivx4bwPlAS/kLgDrumukqH77KUQw1NZvv/YuegmviFPW/DfrN0
	RbzElwFZBb3Bxn1SDBfcKqpCRk7UP7dhASRN7rJRnoRNXYvwmrIJYuK5iwK90HiCWTV3
	FnSgIU51lN7NWbiX/7OOv8C7FLJENAyvWv7gcPTaAvCEpcwmsT/0j7ITT4b6suottyMU
	s6hQ==
X-Gm-Message-State: APjAAAWTwYMRvZILpGTnp7bXK0b0D+qM+A1ybKK9lcz4MQlgx4wn/wsF
	h+Ix9o46jFSnxfFkTNI9WUFa1AiB
X-Google-Smtp-Source: APXvYqw/4jmlEGA0kuKwLT8ykSyP/k2MDtWTmLLWUm+b/H40Kcy8+A3AaeNvGIyk4hVReM88a0OOfw==
X-Received: by 2002:a7b:c088:: with SMTP id r8mr5167243wmh.24.1574169977573;
	Tue, 19 Nov 2019 05:26:17 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	200sm3447380wme.32.2019.11.19.05.26.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 05:26:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:25:52 +0100
Message-Id: <20191119132556.107508-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] libsolv: upgrade 0.7.6 -> 0.7.8
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
X-List-Received-Date: Tue, 19 Nov 2019 13:26:17 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: a00c6f1a5c2c56882684c2cf053de658a02a721d)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsolv/{libsolv_0.7.6.bb => libsolv_0.7.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.6.bb => libsolv_0.7.8.bb} (93%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.6.bb b/meta/recipes-extended/libsolv/libsolv_0.7.8.bb
similarity index 93%
rename from meta/recipes-extended/libsolv/libsolv_0.7.6.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.8.bb
index 3df89930893..8fe9ae04699 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.6.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.8.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "17ce4bc4fb52a0b32964f3b7d491c18177980be1"
+SRCREV = "5205c5683ce2c8b8288534059ba40a318a2a161d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1


