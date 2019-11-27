Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id EA0F77FBB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f129so8309556wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XjQf4/0mqaz75qX/2gUs1BmMHdG8S/nKzDMfUQ37r54=;
	b=fdkg+SvyGwp4hGr6EbnLAGZj4fMVkdVQ5w3SSSYxwzQftNhrvCzsqFO1+JFVexyXM8
	x2pXIWNL0gpmL2hy74pqg/yoOM+YHvz3gY1dwk2gLaEd2Z8fyx1+vwDI381p9qm/1vkL
	XzJMfJTgDCnd4jXM708MpJ4wGgUsZSzCOL28WLjnRlAOD29fMEj3iRsd70QqvUYFLVd5
	t183OSH1BQFqSfsjmFEREsCdkhtwS6ozo8L013KcVDqWf7ijSDewfRs+JI5Q33OzcQ3J
	zrCUE9ukJJcls2O6H5xMcYtb/Bx7kM6ICkSlL5LUfjOoB7vhEIVMDF/AHbmGRtIEJWNm
	dUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XjQf4/0mqaz75qX/2gUs1BmMHdG8S/nKzDMfUQ37r54=;
	b=nVi6IIhk5Fz9LuR9InTSUMOpDLEKoRH8xfXziBRxFudMtLSddH/pul2cj7zPNGtYGK
	0E982Q4VCOnirN/5uajNy9TrtNZg7QCmMqi4bdo7gRB/jw3eqcHkbsd6WvHrnH5lptjm
	Bk5+6Bz8AKSCt4O6N/zxr5FBdvYAUS8bSgeE4EdvIrz1hfE00puNwiAK/yi8ABjWECYz
	vtGhBV3E+cmgPkNrfmwD29R6zyzF8MzVLEL2/ISaV42MkLQzQvWK2ioIxYva3GsrcpKc
	iIDT7d4gOkDM08+uJs7A2WvWLxPOXDHYdTAG1GUVu6ueo5FSqYgUhlkPLNyU3tPac7ib
	nmvQ==
X-Gm-Message-State: APjAAAVBAemrKzr4iVsE5oPs03k0PziS4cExBCX6CRWROv4A1b7T/APo
	//oi5h7Su0AlTz2L9qiQIXg9Sf/h
X-Google-Smtp-Source: APXvYqxhOZp4oTbSo4IUYjspQ/MRp0BkRa+mDLxe4Iuoe6bP52PkjYSamzwqoWbmeT7PzA7uN47jzw==
X-Received: by 2002:a1c:5603:: with SMTP id k3mr5675678wmb.150.1574872813587; 
	Wed, 27 Nov 2019 08:40:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:55 +0100
Message-Id: <20191127164003.115980-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/14] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:13 -0000

rpm 4.15 no longer allows it, which makes sense.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 4d653706b13..58b0482eca5 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -16,11 +16,12 @@ python() {
 ALLOW_EMPTY_${PN} = "1"
 
 PR[vardeps] += "DUMMYPROVIDES"
+PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
     d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
 }
 
-- 
2.17.1


