Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD3657FDC3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:31:14 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k40so3552887qtk.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=C1vXqmPddkIi8taf+JB5WNo5R0FPFFlvMSJ0R2X3NZ4=;
	b=n/ayjV3fm+yaFrNqeyj4wXi5j5NRJteRHu+nlUr1cGemVEUgqSswU60yBNAVO4WuJu
	Fy/bPKGkqhaJda0rYu9GxEWsK7CSGYHrSBGq1dkRDSB94SeGsCzVyl5TiVwnEDoBlPf4
	esFu6Zj0fHgskHO6uQ8v/he+SxhEmuq4MlTqJ0NYyd75Rk/7lFiqvIxmV8zzm1EAqeSG
	nZTvUWjLcZ/Jjl7B7dBM7/OHUmOzlkt2/ZH1l/cgUWoDWNadEbtb84OotAlbySRMhC0R
	T2dLa4Cgbf+0cXZRdXxJ3+XQYEJxYJzoOrIKy6Ok7ovqtBw9Cb94P/p4Mmt48BHIFMyy
	8yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C1vXqmPddkIi8taf+JB5WNo5R0FPFFlvMSJ0R2X3NZ4=;
	b=gb12q/B2/ym3RlNLK7f3Z1LGex2JokllSngQtBvbhLCtxiL49ydEg5bbDaWsGSnYCu
	GLUkYkz5z7i5Qn63eiRB/KaJgSeJxFtigWwV7+sxxsUN8l+pGGqOf+A+BVEFcE6YMlCc
	W8nq5YAhABwsgarcNs+MgEEfG2EpNmEz9WohwX0Q2pr5SImwSk2Z41Gf5KyN+N9uRzHU
	Px3qx7Zbtalf8ibqKDvZv2t9luXLVJ7ssl8xEo2BXsKOJ97ZLSonKdOUHXegMqy6OUqK
	kwr2tD//UIpPa4+6vPtc2vslPzR9AY2/fD1/mHiyfqm0h9WljhzNBjhJjdBXQOF+MczO
	lwLA==
X-Gm-Message-State: APjAAAV/V6iVvCd9COBCOoyoqbLc65xmvHOI+1sqJp2vEkNBTsOo+wKB
	Hrna7jNryTfoXYczkq63XYpR0qw1
X-Google-Smtp-Source: APXvYqz+Gm3S1MHmeFAGEjT8EMg1wRkuVwAI4n2rqGJcB8MDtwAd2YxZgtjBYD5kGjlkYKpexXdqNw==
X-Received: by 2002:ac8:5457:: with SMTP id d23mr17288009qtq.93.1579811475200; 
	Thu, 23 Jan 2020 12:31:15 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	w60sm1584244qte.39.2020.01.23.12.31.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:31:14 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 14:30:37 -0600
Message-Id: <20200123203037.693694-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123203037.693694-1-danismostlikely@gmail.com>
References: <20200123203037.693694-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] Allow customising buildhistory tags
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
X-List-Received-Date: Thu, 23 Jan 2020 20:31:14 -0000
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Allow setting custom buildhistory tag prefixes. This allows multiple
build directories to share one buildhistory git repository with multiple
worktrees.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/buildhistory.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index affdf272d7..eb7295570d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -40,6 +40,7 @@ BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/bblayers.conf conf/auto.conf con
 BUILDHISTORY_COMMIT ?= "1"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
+BUILDHISTORY_TAG ?= "build"
 
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
 # We want to avoid influencing the signatures of sstate tasks - first the function itself:
@@ -824,9 +825,9 @@ END
 		if [ ! -e .git ] ; then
 			git init -q
 		else
-			git tag -f build-minus-3 build-minus-2 > /dev/null 2>&1 || true
-			git tag -f build-minus-2 build-minus-1 > /dev/null 2>&1 || true
-			git tag -f build-minus-1 > /dev/null 2>&1 || true
+			git tag -f ${BUILDHISTORY_TAG}-minus-3 ${BUILDHISTORY_TAG}-minus-2 > /dev/null 2>&1 || true
+			git tag -f ${BUILDHISTORY_TAG}-minus-2 ${BUILDHISTORY_TAG}-minus-1 > /dev/null 2>&1 || true
+			git tag -f ${BUILDHISTORY_TAG}-minus-1 > /dev/null 2>&1 || true
 		fi
 
 		check_git_config
-- 
2.24.1


