Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id BE2FD7FECD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q9so2082798wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=m/ukTiZQS2OsDXQnIBOXveZTvvh8azpdsLPkZPG6Yp/sLU4sZ6+ZWUd+VaRrq9HkOV
	zrr6ia3UezAAtcLliNbm2yZo7OxIMBTyixB27GyXPGNvhNUV48sQnE1SkKxSHbEixrsM
	4yTyemeUVOYa8nrw42jgQgv5HLtAPWz1lZBhh/13H7yP75PhWnJDN+Al81YUbDN2iRAT
	0Eokf3PUrfAnANm3/t3ni5o4jEqWKVtahJz2/Vh8ZA2TryC75Znk/Tc6RFu9N0fA9sQR
	Bk5B5fYhMEemv7TbOM7Sc178slYzvkY4nRToCc+NQ7LK2L/dcq4A3I+IfOx2An/jcwAX
	g4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=TgKNoPEc1rST4VKdux9aSCDj6GkJPdiNRB02OPavMWXkfGjrFPM2wFOqW6DPyEInhm
	UUbwELKzLP9tiG5FDBaLy5lxbm0flpEeZeItCvQkEmlVqWMOk4cxNPZYOIrBTFeVFpUV
	yqzW87VM4EUgHPBvIRG9p8DLk6wCFy4xHyRku1kr0QCb0Ib/vwHX/l7IqJRIxO8X9hc5
	ut5YxxNLRmEbgCDk7DlHVxkBtsnNkYdfSdqojg9Qb75mfOxNdZ6nhpmazGcNuqd0EJ6D
	S0nQIbnfWjQolpPTxCJTkWASALwVRFHF6l1f8IN/3rIZoyRNxvtDFZTfKxLTdvW3IARn
	sWmg==
X-Gm-Message-State: APjAAAU3Cavhit9ermsunl1AwuBRvfubiHpL4X5la6CmjrDMm+7Xh0HC
	V8ZxaV+8t/5qwyrTrfErZUvtcyfvuGw=
X-Google-Smtp-Source: APXvYqwk4ZCoi5TMlroxJ1am8lNxw3H5gFV/uwsoVM8YDXRLy74S/71RvPQHvZ0ESCsqoNxxEQglAw==
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr3855064wmb.91.1576679886414; 
	Wed, 18 Dec 2019 06:38:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:36 +0100
Message-Id: <20191218143758.129308-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/25] psmisc: revert to default autopoint exclusion
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:07 -0000

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


