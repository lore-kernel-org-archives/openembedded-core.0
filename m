Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id D96C97F7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y5so1696334wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XjQf4/0mqaz75qX/2gUs1BmMHdG8S/nKzDMfUQ37r54=;
	b=Whg+v0rUfXTrvFAz2XF9CmD9RYSnz5+UKOyeOu7GpwYSr3mdL2sMwaX/1RFzhQnx9z
	GbXwRjO28b0Ujr6uq0lkPqO+9NIfCidBLfa0qyxJk6fcVEw/BlxqC9m59tUW6sVY8+zy
	p1QBN/Y7KCsnXO3M+B/zwlw2wUmtA2gnMko44D9lOk0zthqSgG4yZwncBlv0NVCd6AJO
	PQfIeXtoxT7Pxpdvn1VJV6gVA2lAEPVNv9VHKceXaB7yHL3UV2LudEoWNXwGetYImGgm
	21kr06OYUY8NXAl3YSBsOYqxfGqsPXjSanb+84+2y9gwK8Jddh5Lis0TThGqqc3p+jfp
	/XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XjQf4/0mqaz75qX/2gUs1BmMHdG8S/nKzDMfUQ37r54=;
	b=VDcwGVtmY4A67J93rNDpSgOEFrojxf/x3Ovm6iLrgYF+slNT6EdmGv3VmC/ABJeSaa
	28hvQI9UpkUQVZAcadCFxGkQtTPhusJjTbUkrdkjPEJaVtI7H8zLNK5V4qPXeqVogvcm
	HOz//5Ne6GAWnyLpiwSdKrEHLZIKA0X8xd4RX2jErNmBRF8G68Y8dMHMsRgG394WIX3A
	tNPT95fB5h8wN2FwFvZk9mAWvfA+Rq5+yVQzgkvqjGk6QpmBMs6pVBx1gaaZyUpSgASq
	DXYjAlyrtTSqBas0+1nfulaC3yF/LVAjv3jT5J1mT6s9cl4Ri555WZAdqp/QgVS7T17k
	vAwQ==
X-Gm-Message-State: APjAAAVSM2svRnXJkOGHb1FbG53wH5KNeWZsvar5hshubeo5NPCHhob9
	YnQNcg1iiqYGE+JOPU/4+Wu2hmnW
X-Google-Smtp-Source: APXvYqwcqPvjUbQSvnBjIH4NXk7hctwU7UMAyOJLTx3SteJbjxYevlmb3w9J30pRVhlajTQkIwF69w==
X-Received: by 2002:a05:600c:22d1:: with SMTP id
	17mr3509594wmg.31.1574257504278; 
	Wed, 20 Nov 2019 05:45:04 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:47 +0100
Message-Id: <20191120134455.125118-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/11] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:04 -0000

rpm 4.15 no longer allows it, which makes sense.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 4d653706b13..58b0482eca5 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -16,11 +16,12 @@ python() {
 ALLOW_EMPTY_${PN} = "1"
 
 PR[vardeps] += "DUMMYPROVIDES"
+PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
     d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
 }
 
-- 
2.17.1


