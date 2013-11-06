Return-Path: <ajlennon@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id BA4A76D44E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 18:24:48 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id q59so5272294wes.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 10:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=dvds1FCX+sLMgfgEIMtU0Ufwai2sJJXFQOtNf2em9mc=;
	b=aqcSjICG64kCT5AzFQnUd+ucSILcJWW45OT9GSCrl0NesK0ltzvS+O9GO2putxL1ze
	+PKJUzzxgRreDW/tt9tMBJw7kH88AZSCX53hyY1X7obZ8d6ntIx7TtndDjQTKiVMST3D
	L9itmNy1dPCLlLOqr3aR304m1vpl5FOZmCYLP081r98CTnPR2z82ws3uAAD3N8JNFjsg
	BZjvl7R6uf2c6HBcIlcyQBmgNd/DJWG8J0NJVCDUwDjEkF6t9QLY8iRgt97I5MyY3dc8
	uJt/aIyRD5bz6wg9w2aIaFAsZHWonyXd8fdwnnjmTIbYAElRNTLJH6jjMcxm4FFUbEFl
	Cv2w==
X-Received: by 10.181.11.163 with SMTP id ej3mr3478252wid.47.1383762289994;
	Wed, 06 Nov 2013 10:24:49 -0800 (PST)
Received: from localhost.localdomain
	(cpc16-live22-2-0-cust180.know.cable.virginm.net. [82.42.220.181])
	by mx.google.com with ESMTPSA id y20sm26583954wib.0.2013.11.06.10.24.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 10:24:49 -0800 (PST)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 18:24:44 +0000
Message-Id: <cover.1383761518.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.7.9.5
Subject: [PULL] [PATCH 0/1] sqlite3: Add support for column metadata API
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
X-List-Received-Date: Wed, 06 Nov 2013 18:24:49 -0000

The following changes since commit d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3:

  toolchain-scripts/meta-environment: Further cleanup code duplication (2013-11-06 11:02:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ajlennon/sqlite3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ajlennon/sqlite3

Alex J Lennon (1):
  sqlite3: Add support for column metadata API

 meta/recipes-support/sqlite/sqlite3_3080002.bb |    5 +++++
 1 file changed, 5 insertions(+)

-- 
1.7.9.5


