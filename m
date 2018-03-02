Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6439E789A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:09:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h11so3929127pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iQYJOt9hhUYHE0LAM/1W2bqJYhDt9i5FWeBk8oFUJyA=;
	b=WS8jyyPIYmlmcWB++jYgwcImS1iREyiE8bbofv/kEdzFdgvVPxwDHbqB6/9nc829MP
	q40sbUMhDmTvs+ndpedd5oFWFG7JVoX2MbIynEgb0o5Bu4Urob6DbcV6U/S4D13Qo5Rf
	vj+vcxLJ8dgPJkDVHGR+/0ExIAAMPe3rOrEv0L/fMrF5WY9M30/Cl3TO6H0Mmu9W4PXL
	rO8lAgXU2dCM0+6HCFKnoiwV0IdlhLow0qSJPpMMkP9hoCRLP4aS0Q4SUlEDwEee3VA8
	0Cp2XQ3b3sFCVBTkTYwG26AEbYQOIWetdEhRIveDsXl78KBXiwgY2eyXrXyNp4i/KftA
	1N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iQYJOt9hhUYHE0LAM/1W2bqJYhDt9i5FWeBk8oFUJyA=;
	b=d5wETfIpH+/D7b/XpV0HC+0mmhxCHKkiX6A817Bb1hwPtsRXl12Uyrl3tneU1n1JIK
	kxonzJJOvYBc84oQNNqtRUvaD1qacj+79u8RV36doJRUpI9CAIVM5+vdi2F44fO+PYbg
	qKQEhnIBNaLwavp51lUgvwkdsDoOTbvrSE7e8iRuU3sAqo1CnHPpOfrEr71oFHBtsx7t
	zXYuQevIhRJXN9PydBNBJglvS6ROky9NSMMDcz4uE1kVLgP52dw8+Gl7/9SIvJ5acZD9
	qquUIfno2BBbNFm4Vz3bx9x9KF30JQDTrJUQvqynPB0YwZPSpS2hKM9eIGrNJKiFwF7h
	s7DA==
X-Gm-Message-State: APf1xPD3aObEGeMeDBK29Zs7zYuQsqahVLGbcB+CBJG7/ybCjG8yjBge
	ME1Q26qM7OsesU/3RsC06giMPQ==
X-Google-Smtp-Source: AG47ELsJvZOY4Y1qmZlfTThdh3bOoyD7XLauh+5Kla3SZtBAaAC3diTS0ur/7O267DPdVdpx6PakaQ==
X-Received: by 10.99.62.136 with SMTP id l130mr5151290pga.28.1520014158306;
	Fri, 02 Mar 2018 10:09:18 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	k83sm16372640pfg.110.2018.03.02.10.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 10:09:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 10:09:10 -0800
Message-Id: <20180302180910.32239-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] tclibc-musl.inc: Add needed libc deps for musl for on-device SDK
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
X-List-Received-Date: Fri, 02 Mar 2018 18:09:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 9ae2a93e9b..54e1acf1df 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -26,4 +26,7 @@ LIBC_DEPENDENCIES = "\
     musl \
     musl-dbg \
     musl-dev \
+    musl-utils \
+    musl-utils-iconv \
+    bsd-headers-dev \
     "
-- 
2.16.2


