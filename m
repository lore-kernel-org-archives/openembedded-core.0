Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 069A17FCB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b19so128394wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z7OWfpMv6T1HquNyGYq27K6BVEj9U3wrMeUVjoCDBno=;
	b=mth5kN+QL3c2BJ9OUxkJI7X3a235gQNro/W36CDTKxklhntzXIXqPyiH5Q/uZO1ug7
	F/1EixiQoBsDPGjlH7PiqgCUArtDnsgsQk6+/2fIByagc/x4NegVRpsel5ue2rYuTdxe
	Zu97vdjvy63VN+rNSQuq4MgrTj/TcPpNBuGLkDhflS4ycKYXSGYBcWLkLlg/PAE1UfAY
	/3EHiz7VWnVJy52ISV7FvnTqKhpo4N4C1fHZ8zSDmIWZ8ACmDvtyE8+0Oc1olTs6Yy7o
	JNn3AeULrAzIMJ6F5IFSJ/RkCPXuzfpN7ED06UkbxdvSR5zf0layB25HUZByp7G0ctxn
	jdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z7OWfpMv6T1HquNyGYq27K6BVEj9U3wrMeUVjoCDBno=;
	b=Dm07rzSGxZJzLOMIAsFFokptYMUggzTY4CIGXm0GjK8ejGjL0qI7zPyr14eQC26lUQ
	c/zPBCNAs7Hisi1d4L6jTkCEvVWEgmySLNFLepBoFUsxvdtd5AndkV0gSWx9CIr5cve1
	R4iIPQDyUcUg2ZFVr3f3GIXndFDfSmf2I+DlygnJOdDW/UPJABwGURJ35Z6YH9ygTn82
	ZPdJlGS8nPMM+gJgh1ITb0b46ZCPrtJTy9kWPwoSuRupwifqH5Kj3sZ1ES/8GrtgnE8T
	IilmVoFHJxOm8kr1asDYE3PSSVGRf3fNCXrYEkxv0NbRuLg1D9MiRgShUOE2aPCXZjaL
	lI+A==
X-Gm-Message-State: APjAAAVvxAXsfcS4dRwVRyzNgsVF1+O1ljbT82AwH3NF0bOWyFsSQUy6
	DZS8a6oUmT+iA3gaPrA9Q3gK4IAL
X-Google-Smtp-Source: APXvYqwbyYQOkFiKzBi/AAWYrQOTNUDDJJ4lgDOuAAQ5lx0YXunxEw1N0Zlen4MLdJWI2ugWOpfw3A==
X-Received: by 2002:a1c:488a:: with SMTP id v132mr355741wma.153.1579541130381; 
	Mon, 20 Jan 2020 09:25:30 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:54 +0100
Message-Id: <20200120172510.22648-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/24] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:30 -0000

The lists of ptests are defined via PTESTS_FAST and PTESTS_SLOW;
ptests-pkgs also pulls in additional items that are specifically
excluded from those due to causing issues with ptesting.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index ff297fe324c..7490b773d2e 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -3,8 +3,6 @@ require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
-IMAGE_FEATURES += "ptest-pkgs"
-
 PROVIDES += "core-image-sato-ptest"
 
 # Also include ptests which may not otherwise be included in a sato image
-- 
2.17.1


