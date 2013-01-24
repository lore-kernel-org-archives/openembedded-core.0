Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGf-0000rb-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-pa0-f49.google.com with SMTP id bi1so5720687pad.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Xgv/vbEBB9/r04rhjRJwXvr6H/w64IhSTNKVZsf31J0=;
	b=gFdiwuSWTKYiMqN9Y1kGlb/otfkM4N9Jd5GQ+FK1yt1vhBjKyzZgBzfbVQyXnCYXYl
	rmVUmdE7coaE10cs0kLA4XCeiRYu6pgd3Nubn0kpfm9IHee8Cl72+v7xb0amdzawpkMY
	BG2ufmnQG8hYb8HYsigrMeuPAucVphg+QJcO1Pz/p3g5qqeYgPNZJEgVPdgcvBqk8xBs
	SjJSdp3MakkWxoxDGT8eCV1EGU3ey2Eh9F4A4S3+qWF5yTgSwbZy0XrvNbDakvajaxED
	gGaSZ5TY2+ysStJS1N9ea4UhdhVkNuk6fvsmdHixJnrX8b6Zdu5Lmr7ySHbVev4BPv5o
	dSIg==
X-Received: by 10.68.231.40 with SMTP id td8mr8579268pbc.48.1359061675678;
	Thu, 24 Jan 2013 13:07:55 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.54
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:29 -0800
Message-Id: <53d918618a93a83be4afc72e49b9c1b65ca1ac04.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 08/11] tcmode-default.inc: Switch to git version of uclibc by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

systemd related functionality is tested in latest git of uclibc
therefore lets use it as default provider for uclibc as its the
most tested version on master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 8f3ba2b..81f5091 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ GCCVERSION ?= "4.7%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.23.1"
 EGLIBCVERSION ?= "2.16"
-UCLIBCVERSION ?= "0.9.33"
+UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "3.7"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
1.7.9.5



