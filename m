Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id C82BF73F87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:50 +0000 (UTC)
Received: by igh16 with SMTP id 16so35608310igh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0yNrat8IsgfIi3a9oXZO1nzFD3gPzxocgJE3pdYEPcg=;
	b=DQ0eYuTSt0IBAeMeXWzErkqrApC/rMpnhlTsvPTn0LxsyNsPivWDtQZDQ61za/zv0q
	/rgvF3UIvo9JORDd7jjeGu+XcBgxOFLNluuE755+HCgRv7E0l/RQckcc7iVDa7UGEEC1
	yXtAgydfv8353viSXFG1uENl2EwRgAWN9FJRxbt77Jw30mX93CVwfCXTDg7iMPGZcEIi
	yUBpOqGhA7UbSZzuiKMfHiKHkbph9bPnlxdA02/ECKghxAE3WqKpMlSx9Y0tCmc0eG7Y
	iNdD732rdgu7Z9/exABOO/UShPeV8xIl7sSoU1FcHEHyuuwbtVXhNdoiFBusBWwTPy9w
	d4ew==
X-Received: by 10.50.78.232 with SMTP id e8mr38647186igx.24.1436215850616;
	Mon, 06 Jul 2015 13:50:50 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:03 -0700
Message-Id: <1436215810-23722-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 06/13] flex: fix typo in do_not_create_pdf_doc.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:52 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
index 02ececb..032833ae 100644
--- a/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
+++ b/meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inapropriate (embedded specific)
+Upstream-Status: Inappropriate (embedded specific)
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
-- 
1.9.1


