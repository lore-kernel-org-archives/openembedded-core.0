Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUqPE-0003S2-LS
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 02:53:17 +0100
Received: by mail-iy0-f175.google.com with SMTP id k25so8117917iah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2011 17:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/UH7D5L/TEdNc6ZzBU6SA/SQD8QZxnJsi5IS1Jq7mVs=;
	b=YYKCjLt9Ob4VJ9Ic09YSlGnjLHNCLLmME9glVe6ltPJMSaMQnIAhxSP1p2xuwUofFn
	SoMkcleEwi7fX40OOi3bl2PEdlSUqBRFJ5LFh+vQs9ZtT5JyXlyU4t+HJ/EX7q2NNhak
	v3N9/p4J9QkmKdxLDiXDe28z8d5HW/h0z0puo=
Received: by 10.231.82.131 with SMTP id b3mr2386596ibl.74.1322444801412;
	Sun, 27 Nov 2011 17:46:41 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id eh34sm39080026ibb.5.2011.11.27.17.46.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Nov 2011 17:46:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Nov 2011 17:46:34 -0800
Message-Id: <1b53350820cd64520aac5ad6d09f387001cd8716.1322444142.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1322444142.git.raj.khem@gmail.com>
References: <cover.1322444142.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] default-distrovars: Define SDK_VERSION and DISTRO_VERSION
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
X-List-Received-Date: Mon, 28 Nov 2011 01:53:17 -0000

runqemu scripts check for them and when using just oe-core
these are not defined anywhere

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 79c6e14..6f5f1c0 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -46,4 +46,5 @@ NO32LIBS ??= "1"
 
 # Default to emitting logfiles if a build fails.
 BBINCLUDELOGS ??= "yes"
-
+SDK_VERSION ??= "oe-core.0"
+DISTRO_VERSION ??= "oe-core.0"
-- 
1.7.5.4



