Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id CFF387FC42
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:45 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id m71so5587102pjb.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=urdAEMBZ6yRmHE0UtVFbdcYWbc+yJFsrlKjcLVC5Yuc=;
	b=eYuInl6UKyKQhQSc7wBUnXHFTwS8PveynwGa9/HsSufbnkKIsjxM+WEYJKTDxLnbax
	ef2T3lZPh8KFWdHJ4XjREgZ7HYdmjUQByREs7CDPpZtPOnLmgBqY4fYnIj8etq4YIF4Y
	jUmVmiaayZ96gOhy1WAjrzPtO0kIT8X0aVktZSDlFXivyikL88XgqR/1VRn6ErSEu6Yf
	+TRm4m0pGNi9dlgImCJVpmrJ975YgH+N5NEMi3yJTIJx7ePTcSEGSKEauw71sOhFvUli
	iNd1mqr9OvZ+H8NAuH/E4NXyzRel3/TMFkoVYCd9gzHpc+6ku+20SMI0hESMBrv64h/R
	3XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=urdAEMBZ6yRmHE0UtVFbdcYWbc+yJFsrlKjcLVC5Yuc=;
	b=nlY0H8er2u2GR4oc9yRN3MjerDnXpi54SRYvXAx3QbsAxcaihrkVL71Pg6MP2wigR3
	0QPlSSes42FPjw6IonHJL4axXsy7lY+D5DN8j7OVLg5YTA/MhYFzSID73OcciW1xGoZV
	ctvaeZ98gunL2ifiO+EFGxIfZ509QM4NGeR68NFGsEGjhTbN6X0InxRpilyHMoztHBdC
	UTfFxGHzmgSPL5+lspAVTI2LpqR4igDZaevN8pp9K+c/pcZmVr59OV26W5O22KnS1T6j
	8xgXfXlEVEybqDqAcqQwPVEVDDr6uNzGN2i2xO/nUo8xFdw9v9fuaF4oLwGge80s4CT2
	OEQQ==
X-Gm-Message-State: APjAAAVmlX+6GG5BGfkDiK+jNl25XKCrDM7zuJXOLObrR17RXtlqZlHi
	DkFRiEfu/x+hTqiLrE8czDX3YQh9
X-Google-Smtp-Source: APXvYqxE7Kkc3DxhiPigB9pV0f+J+8Ehl5/AdHltnWSx2GHQsmZ8l/NMyO3LD8zrR40ILqq0EqZu2Q==
X-Received: by 2002:a17:90a:fa96:: with SMTP id
	cu22mr35000351pjb.121.1574639446715; 
	Sun, 24 Nov 2019 15:50:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:08 -0800
Message-Id: <923a8736ddaddce1fa611aea586b4d22a32bc7bd.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 03/35] cve-check: we don't actually need to unpack to check
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:46 -0000

From: Ross Burton <ross.burton@intel.com>

The patch scanner works with patch files in the layer, not in the workdir, so it
doesn't need to unpack.

(From OE-Core rev: 2cba6ada970deb5156e1ba0182f4f372851e3c17)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1c8b222..3326944 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -62,7 +62,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check after do_unpack before do_build
+addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
@@ -70,7 +70,6 @@ python cve_check_cleanup () {
     """
     Delete the file used to gather all the CVE information.
     """
-
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
 }
 
-- 
2.7.4


