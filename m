Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 47E047FD44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 16:00:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p17so3777710wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=hJLrdeEChp67OBIdZ/rQM155wOPoK/Lodp/EknqFVO4sV95z8xaVBG1aaNAIcO8AGu
	YzjmZCM68YsuGD4J0M2hm0ULVLSUrcwwGqzIgOK2/klkcowIwEWmr53vrpd5pPkyBK0C
	/ueRDu8JCoEol0OUn7KEL2giqCpJdndpzvRn8Gga0Rp+fhfb7/bXpzWFMe+6yFC4BOak
	hvy1EFGpISQFqzxMxdSskrj/Mv63wilHYQFSigwtchXvC6Z4ibtgdfFzkPBasQpNUJO6
	Ul8JrS7dTDRWzqsXQGtaeE/wYbCgvIls1FEMPUjIkWgEE7MoD6Fm7E1ceoPNW5UI3P90
	Ux8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=ODRq7iBOgQpt+rK1P8vv7UALViDlUTeSaKYU2FDj0weSMxskrCvmMKsqArxO2dQ/9q
	Bq1Mw6xL3xHAvM5zpQQQjWc0K8ucIB7drLCl1283A1pKNGrFmjS5tTSKH7wiKnmEBd5n
	2cWj7ReOkhw+6mHf9cf7rVBHKQoDTbpxsz23Ob+rxGen1MOvbflX+h8YcaFCS+ZBl3QR
	poWrXdPrZHDi+5YEJWQIVMyUNc9SwmGwckWhyzfsWguP8S/xGwr452tyJ+WR7bFQUNKp
	qf2TFJoe6cXjCnqT3lE9Wp7w42Q6SKAXDZw/TDtwTOzYRUxWMSES5WCfk1FNXfu+BVeY
	Q3nA==
X-Gm-Message-State: APjAAAXzcQXWyOh/VmLu5V/uAFI1iKwOhmEDWe10RHcxFdH8/lnHXi4C
	5FQ/T+5eZbrK7m94/cw14kRybDbqxus=
X-Google-Smtp-Source: APXvYqzuKY1oiCBT65euWXMMwH1anh7mxEUQWNN/OQEv9aR8grObbHKb9oPc0jTY3VBXvYZnw4e8TQ==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr6780469wmk.42.1576598421715; 
	Tue, 17 Dec 2019 08:00:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v62sm3451864wmg.3.2019.12.17.08.00.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 08:00:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 17:00:10 +0100
Message-Id: <20191217160012.42152-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217160012.42152-1-alex.kanavin@gmail.com>
References: <20191217160012.42152-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] psmisc: revert to default autopoint exclusion
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
X-List-Received-Date: Tue, 17 Dec 2019 16:00:21 -0000

Otherwise, builds break with latest gettext.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 594a10cf222..a75b04702c3 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -19,7 +19,6 @@ inherit autotools gettext
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-EXTRA_AUTORECONF_remove = "--exclude=autopoint"
 do_configure_prepend() {
     ( cd ${S} && po/update-potfiles )
 }
-- 
2.17.1


