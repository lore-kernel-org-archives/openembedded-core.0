Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id B8DB260CE0
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id ay11so1812984plb.0
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Jv8XSE6KZnoOP1UzB+WTn44BGRbCn4M+jzO77H4H0Bc=;
	b=Xe1qzBBPEG8ILG2TNOcn9Xmx/ZpqytA0jbNP/moHI9njnrras3hD7Vb+QRjpWrtPZW
	2+fXxsaENGb5KOogLJybTS+Yqbqt/+iVXDwBdUDA4X5NMjYsEyRm09PzFpwkt3DDNcBY
	3ugWgHwftgfZLjli47awkV+M0kdkCmqFi0BEbYq+k0OSmvealbz144IjpZtRtoFSlRwt
	G3xGf0NTVqDKnngd20BEiOFjOTo/DlMG3l2YsfI9E+0JKSbaxoWJCdD9yaxbySmfLBgP
	1plcqBn29HveRJeCpYnU9x5mBNCoH1VkEC9yePRlhZr5rFar6of3ODwJnm53Lv5ThRmJ
	p58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Jv8XSE6KZnoOP1UzB+WTn44BGRbCn4M+jzO77H4H0Bc=;
	b=S0BWzv+Im2ZB11EoF7DG8h1R+gkVaM6x8VDbcPCi4U8k8xA4J6+ODTOlCjem+Jdd1I
	Vk/Crhh+yBQwN7tt1YTKeOCBYsimCpnd2NWd9itG7RNiQQcWlXa3zJv0ONeU+gHYU6e0
	F1dkFohIv9mhnP4uyvE5bDVIrNbU0SCJenrf5/sO8vr7ADL7LGa0RIbiFAaskZO8pm6P
	tx2cn0CzFWp7A5BcTr+jR7lcjK0tElQyxxez1yNSMtfl+lZbelTP6hjjT1JUx7zmWF5b
	MJ4iaum7r+cQzyppHCArhEvpGZO1G13DsCHR+R++P+Df+gaHn1oTjTNfeTy/1hAFEys3
	bDkA==
X-Gm-Message-State: APjAAAXOCDS+/tx4pn56zidvkcrxkDpJroSlKEG4zosZMDrx3zzjAQdx
	0aeuePS+qtTqlwJMv8iIzLIF+/0l
X-Google-Smtp-Source: APXvYqwKTb/HBtYLUBD2QE8aNteW4bCyfFJdsl4FjnK0jxtda18pHSUqsHsR3lwVknqocUWOJPClSQ==
X-Received: by 2002:a17:902:a984:: with SMTP id
	bh4mr8868740plb.281.1581264614867; 
	Sun, 09 Feb 2020 08:10:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.14
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:42 -0800
Message-Id: <d67f25bb0c9e6e634f7d475d353cd6dfae92175d.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 14/29] mc: Set zipinfo presence determinstically
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This value was floating causing differences in generated files.
Set it determinstically.

(From OE-Core rev: 11d7a9e37c1d3fc21396a98fefc9d34c0b9e784b)

(From OE-Core rev: 8f77075425e2ef9c3b5adbf8e5b29e7cfd7b9b7a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/mc/mc_4.8.23.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index 71f61b4848..5667038a18 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -27,6 +27,7 @@ EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
+CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
 
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-- 
2.17.1


