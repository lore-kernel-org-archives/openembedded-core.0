Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpO4U-0002B3-BV
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:25:05 +0200
Received: by ghbz2 with SMTP id z2so2534922ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 11:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=R6s91/8jsCs5mWhxeAamuESeVGqutKDwCQZLZ6Tjy30=;
	b=W8Dufcn3HOzrDO4iYLkVdNRLHehHNs/MROjV1GJscF05vPBM/2FT4mG9W6bMZQ6jsi
	Db1Lf8aK9w4Peuk6sb2nMGYAzffAEIuC/+brMYmeibd/YCT/fhvs8QVeZgZfeK/LWO+9
	Kvum5ZS9+zBYDgePPC5cKZXQYADLZck2qERTeEVHHhRhjpptKc+WmpQBdw6F2zG8100s
	yrXTVU+3PdMAQitNvJcXrz7rN1/iDjRhdBmPQZR4eWsXqeNXjR4L0zRtdsGX0qeoG3tg
	dHCsQOGa8Xi9saMmu5nuFOJq6tlCGlg+oBl/Pv9egaWMz57uVFxubEfLqYyxds5AKquA
	rozA==
Received: by 10.50.222.137 with SMTP id qm9mr18472231igc.64.1342116828412;
	Thu, 12 Jul 2012 11:13:48 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id if4sm35476igc.10.2012.07.12.11.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 11:13:48 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 21:13:37 +0300
Message-Id: <057b3acd6ebffefffcced5dc3889138ab7c7af59.1342116650.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5f8d84b63b15ef27f5bad8187db54cdd7d55fea6.1342116650.git.andrei@gherzan.ro>
References: <5f8d84b63b15ef27f5bad8187db54cdd7d55fea6.1342116650.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342116650.git.andrei@gherzan.ro>
References: <cover.1342116650.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmDFXO1Q4gSZTl3rZP05SkaN7YMvphZAPQqaMLFTjWHblmw67o1M2IzpVQ2gMdP3oG+x7/8
Subject: [PATCH 3/3] image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 18:25:05 -0000

Having XZ_COMPRESSION_LEVEL on -e -9 and -T 0 will make xz eat more
than 6Gb memory. Reduce this to -6 to make xz to use about 471Mb
on the tested machine.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b19ad3b..727d8d6 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -122,7 +122,7 @@ def imagetypes_getdepends(d):
     return depstr
 
 
-XZ_COMPRESSION_LEVEL ?= "-e -9"
+XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
-- 
1.7.9.5



