Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id B0E19795D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:43 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id h4-v6so8467836edi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qvjZwhKV2kfrHJPDkbGrckmhSbob6C6Ig1SrtlkZyQY=;
	b=YyzniHw8Mvs+3BWgtUmqsdWA4C8HgymCgwe9iCvS9d+90R8By8aOOfixWmUHJ4EqF+
	/L2hgbAzGIZUCXMxtnKqLOgEMoASw1f3UvlppoPzqA34ms3MNbG+nFOF8/bWo85eNNfH
	ULIS1osh0AkAHWm7gdTZ4DlQwCmHIvZzKJdV/IpWakci7SLimmaFaHjNaYHHvev2y72Z
	QVgTGW4NlxIE3AyFduSY5lZYzujsHy79i+KlKman4FGlJBBmwIcXGSEgQWt/Dc4qqOZh
	WakdudJ3O5BZGZqhmxEuwMC9ghvCXFONHf39NYeAe/zru+5EO8YkYJCouVTWwWqU83By
	inaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qvjZwhKV2kfrHJPDkbGrckmhSbob6C6Ig1SrtlkZyQY=;
	b=RDgBc7aZ4INE6eni5YCYR/RkNHcPMMJSQEEzbY7Pw71Kr667dMjQ8DeT5cA475h1+n
	UgUJlwrXGY1jA5J6QDCV4sOpGkbEvA7J7O218omDVQYggZ03gJw+DY35YvN4ihRbgdbT
	Giz3RPCIMvttWZI0+HyLB8Rr9RARSSbA4cX8jCcRjXOmShq+/tfY8bcfMQc9Zg5epCCO
	1MwEC1kmzigsaohrIvHI3KU92INRKc7dHeYkmpSm23wGCcxmP7kJit56Ne2fJVYfycoe
	oHrj4ohSCSFXU3p0zMobxMVG853CY3IWBCZmLUiQoyXEsSZe8D3X/OsPy+pawzKsZm/y
	uHlg==
X-Gm-Message-State: APzg51AdxVciRTqYeaWDQjwjL4CQcecmPWcdfsLGvZLi1ubqfQgXM9C0
	EDkpfS1mp3kxYlo4APv13uX3MsD15vs=
X-Google-Smtp-Source: ANB0VdYdcBOaTBxzsoPV6SOSGJXIN3q22VUF3pTTGruuDDIPXWz580SFiXhwgIieo3uCgyPYAHYzTA==
X-Received: by 2002:a50:8dcb:: with SMTP id
	s11-v6mr2678531edh.86.1536229784122; 
	Thu, 06 Sep 2018 03:29:44 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:13 +0200
Message-Id: <1536229770-29600-4-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 04/21] dos2unix: fix upstream version check
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/dos2unix/dos2unix_7.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
index 9964315..9a71270 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
@@ -9,6 +9,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 # Release 7.4.0
 SRCREV = "1182533bde3c1fe65be2ead465e87671faa2c027"
-- 
2.7.4


