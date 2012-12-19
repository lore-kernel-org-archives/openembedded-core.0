Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1Tl8Td-0002N5-3d
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 02:29:41 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so821068pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 17:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=0mA2oXHSuwYmvXbPvIYlzoTvU1/h9l2nMohoN7VnbcY=;
	b=iYmTpX2zCgfK0v9aiNTMAO5InitZNrpJZ2m8tK4hEO3VPQsU2p8CVYL5XDKbTht0pH
	lhOkC8vUTQJ+4T2OqT0zSrivdhYN2c2Rh2ABEIDudQZngT+pm/8Rd5XJD8pWg/PEGK/h
	ag8SnFpr5vItkyhauMho3d7v+WwnZoxYOTgEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=0mA2oXHSuwYmvXbPvIYlzoTvU1/h9l2nMohoN7VnbcY=;
	b=MlRLaY7n3ot4BUWK2JS2S5bHCvCN1zCTvXnSRZwHMdZKFmFMVT9Q6Xd6AeYTfSO0pz
	SR/NrLlJPbWjCI6ZByAfwjqHuZN0tG3J9tb7zWhdIDpGNeAnz/TMl1Iuf0QOOdCQDlFr
	FhuI8496t4sVwg1Ww3tjrq3MeisKOxB3pvaEbTJelkQqbBatn4iAZxaz36RR44IwsX3m
	auT0UcdcCdxw2TP+5LpCez7oBY+wIxN/vAqfhT7zMyxmQrdP01X9/KWSf+hUsnSZfuKj
	V9FEL0FQvr2GpLJ/qWGRE16xwofE/ZbWdn2dzLiBBC/xFZwzMUbpWhmG3a8YikeiS0ez
	0ANg==
X-Received: by 10.68.243.69 with SMTP id ww5mr12685817pbc.45.1355879697802;
	Tue, 18 Dec 2012 17:14:57 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ni8sm2043619pbc.70.2012.12.18.17.14.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 17:14:56 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:14:27 -0800
Message-Id: <1355879668-22733-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmBgueH1Tyv/hPp724FY4qdgs7G2yi/MvKLhVfL1notQnS3ZoTc6mAi+oO9p5J3TfO3LdLI
Subject: [PATCH 1/2] lsbinitscripts: Don't compile
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
X-List-Received-Date: Wed, 19 Dec 2012 01:29:41 -0000

Only functions macros is installed, so no need to configure or compile

[YOCTO #3584]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
index eac4ebb..e32a50c 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -19,7 +19,10 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "functions"
 ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
 
+# Since we are only taking the patched version of functions, no need to
+# configure or compile anything so do not execute these
 do_configure[noexec] = "1" 
+do_compile[noexec] = "1" 
 
 do_install(){
 	install -d ${D}${sysconfdir}/init.d/
-- 
1.7.9.5



