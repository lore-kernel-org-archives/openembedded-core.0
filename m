Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECAF74601
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 04:21:18 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id u11-v6so1437619plq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ou2MYJkNKAsfd0g89Tb/wMExM0yyCe/JWvjW5eY4N2c=;
	b=TtsKJNfYHgtVYFMd0GpyjfNdnPGbUE4IjSD7we2jqb2Gab7J1CBw61puvCA7Fksfb6
	eAsL7IfC0FCUzPpPkLie6csdv0xfMbIp/gwX0zySxa4P8U9zlPUSmJa7AW0XHEYJiuwL
	euX5yEIh5DUCIqS1otF5An0uSPvlLKNIq+DenOIPneE9/j4EtnIAdD5kx7dQPXXKxhXC
	XFqDKDuwTplnDYzhQvbsp/ZEHj9MHRFabK5K48GwQ03FO1puKhuptx19CGRgGeFGK6W7
	t5SbG5xQKWQuAeT6dvWc9p0ITA5r5maQYI9tr4dwCHx8crnsDj9KSPtBDreavvE8hUaZ
	ow/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ou2MYJkNKAsfd0g89Tb/wMExM0yyCe/JWvjW5eY4N2c=;
	b=c01ZahAr8OvHxiyEglmnT5qj9Z9W7we7B+uCe1VhPSVzZneFVroeOU9692MnDQ6ZFa
	K8tA5S0Chx/wQlqLLVViB0xbuCUTNEkLDrlH6cbJXqJq3RwDy0B1DnedNb12cOUnKXRd
	ghGtidZI8uV2av3RuTMzhqYH3BwTomgSNpH6/Hegy5AEH71ojK7Xrphc99+Kakl9w7Jn
	6IgmeJ/m9Zw8v7AEMssXnomJeYXKOKG2NltPAms0TkSp+RyRZ8AFzdcox1t20tEZDcIX
	yK9wDmsycmRPs+/d7qIGAgnHd/e0Rqn5pT7M1f/IgtSJGHW5rgVGs0F2o8UJpb2/Jhit
	s9Sw==
X-Gm-Message-State: AOUpUlEQCwFpbNGI1OheZdelx2NKO1YUdZrEVp+IDWrBOexXDC3etLQv
	p02j7rC/zjFiHDUZbluDaodwSbjH
X-Google-Smtp-Source: AA+uWPx7Gs+yxgzto50ICPwC1dQIHAbVozvLPH6ZD8CFOHxG9tbmItMxgvVQ5oGwVamVk4R9vpBhXg==
X-Received: by 2002:a17:902:280b:: with SMTP id
	e11-v6mr26804787plb.298.1534393279222; 
	Wed, 15 Aug 2018 21:21:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	t9-v6sm43185791pgi.87.2018.08.15.21.21.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 21:21:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 21:21:11 -0700
Message-Id: <20180816042111.30579-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] piglit: Upgrade to version from 2018-08-13
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
X-List-Received-Date: Thu, 16 Aug 2018 04:21:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index c186ca9259..df810a33b4 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-# From 2018-06-18
-SRCREV = "431bcc74ff54521ed1c498af9b13e629f949bda6"
+# From 2018-08-13
+SRCREV = "57859e15dc8ba4034348b04d0b72f213b74d6347"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.18.0


