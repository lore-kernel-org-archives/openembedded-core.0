Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id B10B274599
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 07:12:00 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id z7-v6so592531plo.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CpFwWNWdx7BfIg0LOVs1PV6Wifwp1VD24ayBgAdT1Mg=;
	b=XvRjwtqDW9MjdGXeLZmEMwePKoy/KZkNht3/LJAptL4f3ad4IyJofRY8VhlNXeR6ii
	POu8AL7XMUkPa4D431VmqZeNjgJNQQVXbIFRGv6AMYUiP/zy3XQHz4x8DxGdGprKE/R8
	vhQFkrRgBr4sUdE654nrY+gvTD6fljpxDWmCjiL7qjiNrX+TEVGv1cWsBNnNNBpS37xS
	K1sT6dMr5icdgP83Sc0mKd4dbhV92Q6/8UGfxO9jHKBvfdtF0sN83jkkOkx1Lh6GdC7+
	f6qetkKsWS4NVBS0webmUaMCsaJoZ3Fo1iK3DgaaAX89xAsGq4UAuXZQNvNhUxSifvzL
	CpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CpFwWNWdx7BfIg0LOVs1PV6Wifwp1VD24ayBgAdT1Mg=;
	b=eNk0Ug6KAUr10pUVyrXaKSD9Q+Lram+u2kAuIx9UHjR3SG22Aw2AaFrO4VpP/wG2B1
	okuMuDn2zbZa6r2BECfXKTl46XJ23L/0dE4j4c0vEO0ES0OwmVWd8OXGugfr9FoJneob
	XnFAvLNd0ws4EkyQxUpCdtkOYXmLlFsx24f5lBzkHQQxvzqOft7CtXFcfZqd9kA3hKs6
	z8XwcbyMkgLlCvExI+b10/y56ww+qxWBwhH1DvWuDrhvmQbDkSv4PkD5lszDdb2KbEA2
	r9P7TI9o+i3I49oGy8DMyyNPduuioUpr4Au/20RTxgBaW5/0Zks82nSqSkK40PDPj7BX
	Nd0w==
X-Gm-Message-State: AOUpUlHiMx054kS/qFWjdGRkWZWKMSxW8lPlZvOpK4lCSUMSfqgX2MoW
	80u6KCDMnH77eEzlcnEUaRTLi1qP
X-Google-Smtp-Source: AAOMgpeyMZ093CeHhZsnRniipPN5hjdyX9kpcGgap+vfgie6aLa+b5nZe3AjTfpTGRHDzODwTA/xJg==
X-Received: by 2002:a17:902:6b46:: with SMTP id
	g6-v6mr1338002plt.251.1533193921447; 
	Thu, 02 Aug 2018 00:12:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	q25-v6sm2866763pfk.96.2018.08.02.00.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 00:12:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2018 00:11:49 -0700
Message-Id: <20180802071149.19272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Thu, 02 Aug 2018 07:12:00 -0000

fix internal linux headers

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b56870cb3f..e7d0e1a66b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
+SRCREV = "f2c6dbe2442027ed8fe0fa869918e41f495534d8"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


