Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 23F676AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 18:44:56 +0000 (UTC)
Received: by qgew3 with SMTP id w3so49383543qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=DeftZXXIES8EMTvHgTfplfBM2agFmloTjWpfreHbeD0=;
	b=fBBMBvk7KI464hcY20FngaTBApUIrJeOZKfoA0c4tExGIStnogO/zyN2CbCjovbhdP
	DF8okORrsY6dp8Q35mD4/lsOlDj4ZUeY+Y92LAk0+Qe7xxgfay2X9U1hoDFVgKbRNv2W
	pzuvhTyc9JlrhPYjFS2h5Tma3dm9sCwxqwJBwcQCn/R8IeQpniT4Oocc1Io3Bhl++r+b
	QPhQ/Jhs3gqhy4mXMuwgGYZqaQjxS++XErkeld9jQpTqwCZJbGWEkNwZRKrhpNAbO6Hq
	sguway3BFn3sOR8Z8B2VVFBxx54KzT6FswfNc5AnuzMItLYi7QIAEfh55zNIVBIgLcLC
	wrrA==
X-Received: by 10.55.55.72 with SMTP id e69mr48403352qka.78.1432579497673;
	Mon, 25 May 2015 11:44:57 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id h60sm7308413qgh.18.2015.05.25.11.44.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 11:44:57 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 May 2015 15:44:44 -0300
Message-Id: <1432579485-8765-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] distutils.bbclass: consistency between error message and setup.py's command
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
X-List-Received-Date: Mon, 25 May 2015 18:44:57 -0000

setup.py was called with build as argument, but the error message
would report build_ext.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/classes/distutils.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 6ed7ecc..c0bb573 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -12,7 +12,7 @@ distutils_do_compile() {
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+         bbfatal "${PYTHON_PN} setup.py build execution failed."
 }
 
 distutils_stage_headers() {
-- 
1.7.10.4


