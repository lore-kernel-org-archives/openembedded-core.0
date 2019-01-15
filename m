Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4EFD57C121
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z5so3669455wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=AaSa6ueToscIP/ZZhWR+SWImVUWFx488jU63WgibZGpr8236SeyenMTks++GEIDt+o
	dm8c0T4LAJA1T6HaHNq8d52uK/aZuuklXFPjX6lyjRutjYqu3j4bBoS+/A3318kXVXDZ
	tm9XdmPRnOa6gHrOuuc4g5V1/Y1G+CoO2uD/WkwYnKykE1/PEb0fJ+KJVeM7Lr2aTP7V
	cPD/wUVh/Q4mOVgOXaSpsJyTozJBeQgC+tS8luEZfvo5DfIgjhM5xflvya3eF9ZSM7Zl
	XeN9mI+YnKU7BzS3KQCMEiTjq2PyEyAOnHco9luMPFAEaAQFHy+kFec21JjweZEWqxzX
	C4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=svx1Klwp/zq+0E9ngdM29qBkhP64UnFhvUODhykfcITVtyAdRge/r/VEkcVjCp2dsJ
	PDdiV0tbbdfimDlk0NJt7jTCPdngYBbVOCOL/UM1JZSSKjozadvHvY/duEVYJieYtk/g
	l90bKplPI2E6do+smmyrExvNqRBQY9AXh5AmLoD0MupV9q84MHai+Mw54rB/4GlsXVVN
	T/teabEDEPNbVMAJHKXX2KpoyT4c2UZMSwNTT3ng4OOecgxRJdsJ/CwPM7LQrvO8wZNp
	Xax/QurUNybdkmZxTrsOUv2NyJSXH27fmOnuEXv/Xv8OMTyImIK7PiXQVTJZOPL9fBb3
	ZYpA==
X-Gm-Message-State: AJcUukd61ZwTSThvkDMiJJpm0UhszNvkq2XfA9bB9iynZ0Dn5/X2kRgs
	8DR76aAjAQrO0Dbyro3ZyAzgO5HP164=
X-Google-Smtp-Source: ALg8bN7ejUtS+eN0CVen8tWX5MsgFNCu33292QRIeHweOrpPFSpd1RnACZK89cSPZ5vQcOYWv/KSiw==
X-Received: by 2002:adf:ea81:: with SMTP id s1mr3731988wrm.309.1547570346775; 
	Tue, 15 Jan 2019 08:39:06 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:38 +0100
Message-Id: <fc58b068b26206ebb00dfb3638a46a17fa4cc61c.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 03/22] shared-mime-info: update the database also in native builds
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:06 -0000

Otherwise glib-compile-resources fails when building gtk+3-native.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 344da7ea77c..3fe1a445b0c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -30,6 +30,8 @@ do_install () {
 
 do_install_class-native () {
 	autotools_do_install
+
+	${B}/update-mime-database ${D}${datadir}/mime
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


