Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id B5A4A6A9CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:36 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so2223595pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mbUsg85GW2dSlZZSeD1diJlJdrdAUMYbarN71nomU8U=;
	b=sMoUSbz3VRu9+WWuiaoKarM5q/oKZ4wP6wOrBDMRIA/P/aS9ahbs2wkemRmTBSOOrU
	mi2idOXkpjGe6Ts/pCLhZ6HWpFxzSeERiDy8YPSEtGVr7TKxQ0HjRpVcntvVnI3KapkF
	etbHtl+b1Znua/znthl3RMycHqM6LnG/81Y8MZ8cYOPO7wYri43jESXaIUfvQJjtDCud
	JE+VOXmAi+xaL6CfMkZxxYdWIgi9MNNE5bNrxzJCZEleQKIqwm+55CW1kjsxcBZfPgHy
	GCenof9Q0Lq/3k1Ae6XL8ijsURzrI6BZaTIENBlo2cYCKUboikIDkAb07cqN27KmAkcA
	CRtw==
X-Received: by 10.68.136.198 with SMTP id qc6mr11680197pbb.117.1370897198108; 
	Mon, 10 Jun 2013 13:46:38 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	cp1sm11526369pbc.42.2013.06.10.13.46.35 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:37 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:39 -0700
Message-Id: <5ae1d98ddbd9e3f573cb2a0cf8e8bc6a86385ca9.1370896976.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896976.git.chris_larson@mentor.com>
References: <cover.1370896976.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896976.git.chris_larson@mentor.com>
References: <cover.1370896976.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] copyleft_compliance: handle localpaths ending with '/'
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 06b0227..adb48be 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -39,6 +39,8 @@ python do_prepare_copyleft_sources () {
         local = os.path.normpath(fetch.localpath(u.url))
         if local.endswith('.bb'):
             continue
+        elif local.endswith('/'):
+            local = local[:-1]
 
         if u.mirrortarball:
             tarball_path = os.path.join(dl_dir, u.mirrortarball)
-- 
1.8.3


