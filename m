Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id A2686731C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:41 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id 14so1750048qgg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=I1YGVPYh4SSJ+f5w9TyKUpWDFKDnqAssq7z2HnQiihY=;
	b=LhtK3NpXUsOXwKnTG80v/GNEBirFDjNMgUakMBla2OOPGfwyiY7HwO1KM14eRID8ZZ
	IBP5SldA790cv0/ecupYqFc1P6dMiDwZ9uuN9Ce0eIZ42qBUuiSze+eKz0VUqxo9zMpD
	jJPx8AKe5Ao2xwDeOQ5uDkZcOvKd4AcALeh45wg6hsUaFc+UfWBhJhWXsLnGkJjq3xUH
	5d49gDf6J/urV+CcVZK6WzjwjMHEkDGvhtqMQwoZX7wlLhP/dh2hKFkhdwBctEMrtaFU
	BZWI2yP6OuSxjJ1sWzvg9JOQ/M07n3BHQKL5tBkPpUX7uU3xN/Cwhf9C/7Q506WKp99Q
	xYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=I1YGVPYh4SSJ+f5w9TyKUpWDFKDnqAssq7z2HnQiihY=;
	b=QgyVsnIiHMKBHaG1ulAY4vdFRi7TFOPVgKSHtQCJlKfCkxui5lK8O6fXKEZ72Bqn7H
	ZcNN30UDv4m6nh1JzRfvkgqApP92gN+kFqsUtFsTi2DF+GzPXIEVB8IffrkpoYRZbbKV
	96rG8HFHTMqZJRTh0DLZ2Y4PU/jovlZBrxwJ0Yqu5nQveAXHGVl9RDCS3o/N/6BEJ26l
	tayQNffR7f99lO++dOXhI5AAOk8reOzDa0mb/oKP7vgJz6wDxgUI16ArfMW8tw4ZHtOk
	v+1SkkWjKeLv1S4LB9vTsY8piUInpZvcJD59soEJD+LptjjMMBeLVaa/irKiFGeumB06
	9Mkw==
X-Gm-Message-State: AG10YOQqW67ZM2q67hT1GrimsRZVnpzXcnEGjUmlmkplDaRzwgcb2DYoReoWKhhNWPqTRg==
X-Received: by 10.140.221.17 with SMTP id r17mr53413633qhb.94.1455126222348;
	Wed, 10 Feb 2016 09:43:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:30 +0000
Message-Id: <bee44628d8ab5d54f4c414ad5978312fad4604bb.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 3/9] musl: Upgrade to tip of tree
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:41 -0000

Add explicit runtime dep on bsd-headers-dev
so we dont miss them in dev images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index c731a8f..d4413f5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "369b22f9c4aebba2b8fe905db8469b2667572ee1"
+SRCREV = "756c8af8589265e99e454fe3adcda1d0bc5e1963"
 
 PV = "1.1.12+git${SRCPV}"
 
-- 
2.7.1


