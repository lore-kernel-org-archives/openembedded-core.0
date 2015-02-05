Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id F044D72E73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:13 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so8558752pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NEoWiUfq8DPpetnK2y+mofAAN1RXTRE+tAKlGJ+f9w0=;
	b=GuxzhIHWishuLiMpCteQdJPe6nvNG7oh3YJm8/F5/c3vWgSKo0KBmILPDRE1qRzeki
	nJQ6zBRG/ebrcJJCUqTv5zGCH0jiqa6pOT4eT2uW+xhdASmHcVNoiKuDrQijR+NrzgzJ
	BJEZn6ie7LkN3DvV/4enB0wMqOn2d3rHBGHGCPW19j0Q5X4Md+D23GDKXNifiVze3I28
	sCBKixXiCoKuuprTabLolEQCCUo9JoYWI7ml6ycJCPqey516D9M/5WV1IVG2/6l6KVP1
	TOi4CdodQXP8tzC5PM4/SF9z9WIWDwNhXPs7Ib4iYOe7gQHWjB4anuH1Z3bp+pW7zBGf
	34tg==
X-Received: by 10.70.126.68 with SMTP id mw4mr5681784pdb.106.1423152375520;
	Thu, 05 Feb 2015 08:06:15 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.06.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:09 -0800
Message-Id: <d4276ec8c4b9486388cca0d0c1571adf083ac471.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 61/61] groff: fix QA issue with rdepends
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:14 -0000

WARNING: QA Issue: groff requires /bin/sed, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/groff/groff_1.22.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 63f0425..6c6926f 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -63,4 +63,6 @@ do_install_append_class-native() {
 FILES_${PN} += "${libdir}/${BPN}/site-tmac \
                 ${libdir}/${BPN}/groffer/"
 
+RDEPENDS_${PN} = " sed"
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


