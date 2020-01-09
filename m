Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id DBCAD7FE61
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:56 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id az3so2025142plb.11
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wjgETM9Qo70ivINr3sPLd2UuPbQ5e19V876EDRAa/iQ=;
	b=A7aiXvOknJQLJ086YQxu/eofk7ynMm2rbcOJMzXuQiBPea3rsufzzLTYNk7+HG25Rm
	oSb9yyqyS57ohsadyMwihpwNdSfOpsqceZAkT2aAtG+eN/JoCNRguKdg/eHxcbt6KesA
	dFBfZxwXiAupXqIWWfl0NoQV+2W3uwgcH7TDj2CCkWIIwdSJmDdgZcJdI29TxX9PFKrn
	Yw2cujONmWiHtOnHmICKUK9Qu32sLHaer3unwz8U/xZrEuCpaC1Q2cEscOtmsB8ij/GW
	UbOZAH6ZG4Cc5WACZJakP7AY4ivATYCiLfPK+Ibb4BInyGyPWb7s+UFpi2W8cUheGnVS
	1Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wjgETM9Qo70ivINr3sPLd2UuPbQ5e19V876EDRAa/iQ=;
	b=N+K+59Hxh14z3R2KuM7ngoG0+TR/3PyeciX4445IjXLFYyVGgwnUQFYgD4OFxK+Vc0
	ykx1hj1wjQsB78TMNOAmTIIr/Hw6a06R5gCeEskE97xk6z8g4oI2vJCcWAlTjH5STXHv
	QKZs3kjvKDvQCVgCrjeQg5qWzbOTOaSXmLuWSNTqAsXvCAGg9c0/pj6u1V0Tr0C2GQda
	Md5X9qA7MD+GeQkg2NZ2xya6HPCRFQSXMirdyOgPIg565gL4d7lRUzYyBL/xzuX7CrTR
	vodwpOdZmjKu57TgB5P9VYWGERPK0YVhKSYXVDS2hX+99wfBOoUlKH7n+s8QCfd1UfQz
	vryw==
X-Gm-Message-State: APjAAAWWHvD+MexJGdo01rtXsBdy+btganNkMAkkBEFI/wJUVQWCBJZY
	yjNsO1wtyH75jiFxFQZxenoxNb9m
X-Google-Smtp-Source: APXvYqz2Urn6g0xIKetcck6qDl1RoHWXc29SwEDclSla1IPmDfOF3ktOVpTOyrk7JtKnwZuwbqHPsw==
X-Received: by 2002:a17:902:ff05:: with SMTP id
	f5mr9769951plj.197.1578545397821; 
	Wed, 08 Jan 2020 20:49:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.56
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:25 -0800
Message-Id: <a15c05fa17bcce345ce254f02c0d6dcd97f60cb8.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 06/28] sstate.bbclass: Fix for consistent whitespace
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:57 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e874d067ace03774132ba3030a898678057c1304)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b5267f00be..c0329cd5d1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -752,14 +752,14 @@ sstate_create_package () {
 		return
 	fi
 
-        mkdir -p `dirname ${SSTATE_PKG}`
+	mkdir -p `dirname ${SSTATE_PKG}`
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
-        # Use pigz if available
-        OPT="-czS"
-        if [ -x "$(command -v pigz)" ]; then
-            OPT="-I pigz -cS"
-        fi
+	# Use pigz if available
+	OPT="-czS"
+	if [ -x "$(command -v pigz)" ]; then
+		OPT="-I pigz -cS"
+	fi
 
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-- 
2.17.1


