Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id DDA606C17B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 19:05:03 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b20so12291154lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=21PcmgFqaNB3Svdu92PDGpZXvpIDm1pa1rsyGaO3j7c=;
	b=ZhC6Qma2nFR2r5s1vzOJYfXPbGipA7EZ665ETWSdDT7NmP65ubPCEIACuaW9H1nUTs
	1UOXrt28o0LNPc7Ub37kRMVt9acA2NZPBmPpdLa3Kk3CR/KNBKjEf27G5j9awCTex/MM
	gDSFwFRhTvKvHKcwP9dmrqmNVt370uXc7UmVD1kTDf9zxYeviFDoT7au58o2IaYdIjI4
	srd07hFdAOkXRpz0jFAl2syEpN0GS0LxV2ojjb7pPOD3Q5jpDDZykI4+y6vM7c9mJ8Ew
	UEeS0fLEcD/LDYoqqyhZyeD/WCszAOqBnO/A/pFEQvt7FRNyysb98Ts8226nSEHBpZAW
	TB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=21PcmgFqaNB3Svdu92PDGpZXvpIDm1pa1rsyGaO3j7c=;
	b=iIV43mMcnry6hTvUCG07qML2XPgiJo8n5iSU5q9I8Pn1llm16e8KU2OCAtFWAkR8+t
	Na7yQ42hgYOeMxiLEwCTUsTNAV1DrHy1zUQEHWMLZDzZwWXaihT+JnT2vPFxnI7vQKDj
	LeTiddysbn/73JDirVG4km93C5lF1stonOhiN6wtpf34/Iun/3B9dIb4/mnss42TT4ud
	77WM2WgAwu4/Yif2S8yzzafAEe9CbHSd8MdiIDwmF0VyyViEsJFGJ6LqfQ97aG/YFSex
	S6SYgUgar9JvEtjWtYc1Sm8kuTHeQBoDFhwImdh+rOsRYyYHtSJtLLo33293ZymcdUVT
	PcYA==
X-Gm-Message-State: AGRZ1gJLJ2jbudKQtIp2EDSii56RwSBu5e4RlExovoJzkZgJh6LXH8pA
	C7mTb1V3ME07Dtq4GLNLDEYImqHNuI8=
X-Google-Smtp-Source: AJdET5eY0u/YuQ8ReQ4ipZPoadGUUWOF5Mg4hx2a7jibc3n7M0Yxn2OEjLwW3IOyqPUOZkc3IzbZBg==
X-Received: by 2002:a19:5349:: with SMTP id h70mr326207lfb.50.1542222304115;
	Wed, 14 Nov 2018 11:05:04 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	k1-v6sm3894683lja.59.2018.11.14.11.05.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Nov 2018 11:05:03 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 20:04:59 +0100
Message-Id: <1542222299-14545-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] image.bbclass: add a missing blank
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
X-List-Received-Date: Wed, 14 Nov 2018 19:05:04 -0000

From: Ming Liu <liu.ming50@gmail.com>

When calling d.appendVarFlag, a blank is needed or else it could mess
up the later appended variables.

Reported-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 452b1ad..8b5bbbb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -500,7 +500,7 @@ python () {
         d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
-        d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE ' + ' '.join(vardepsexclude))
+        d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
-- 
2.7.4


