Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id A3C4D61301
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:05:53 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q39so835137pjc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kO8RvZ0H27W4YyFR6zYVT91dufePfXbuK7OuWWXoZFk=;
	b=MVNFLpo/Tan4pGo0tczySP8k0B4+Xnknj+FrWNEJ+HAKeY0z1RJj8a+6o7HRqQy8yH
	RmpgOSFIQhdxJu7MUfDpHjYEqzk1PhpWoB7oKSZmNE2RwQ6qASKW198n1KESX8mQOrfW
	6IM06gaIk1JUEVYXSuJQtBtpJtHyYQJjIjkpxjenw12QmMR7mNQwXPrcmVBKna0w9stS
	RO7kaFa2bDykMgtFw2tYqBQHXzV9y+Z07l9NYEtFGNZxyhSW6P1QGymJl0qGr+j+/LUo
	TZYetKtUVjOAdCDGglGQFjRA19blqFXIEe5Om8XkFw7r60wwc4iLN+xltGluHFW+fW62
	aMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kO8RvZ0H27W4YyFR6zYVT91dufePfXbuK7OuWWXoZFk=;
	b=YzeuXhrk4QEz+H57KDGkIfn3Cdoy9Wr/0b3iJ1/VdbZavhovcYDo0E1rCCQ/SJlo6Q
	ZSJCtQeUKGZsPIzsV3TZUpU2rZbvGzaSOBZ7hTBnJiLf4+80tgoOZOptPoRvsuKrAYDy
	M3DCCgHZEklN/D9ZqZVi7i390RvocqCPxJxzmcwaVXFGeM4YWfAbRMOl2VtgMGn5qUIF
	hz4b7N5Etp1DqbV1vLjYBEMTOB2jE7pKPo72aFjD7V0RWYjHafbn4tBa4cnGEcNSM/4F
	hjIk24FhkKLrhqAz9NxGG8A7wdE/vpCAJG3ekdEQyUZ/6EviLpEiwQgwd7DByHrGIsCx
	4FFw==
X-Gm-Message-State: APjAAAVZ0RiPzGl3ABsr5/1anVsgr2JAxI4M53cpNZfKbkyHI0hiCLZB
	ch03ESQpO2wS54EXhGhxC8NGkG6C6sc=
X-Google-Smtp-Source: APXvYqwN2mp5TEZy81bfrrkOuGNrXWeO4l3kZbM+KYJ02AqFrx1d4UK8FG0n6XtRt8e9Oyh6KEREOQ==
X-Received: by 2002:a17:90a:ff15:: with SMTP id
	ce21mr3553632pjb.124.1582790754204; 
	Thu, 27 Feb 2020 00:05:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	188sm1431753pfa.62.2020.02.27.00.05.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 00:05:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 00:05:56 -0800
Message-Id: <20200227080558.3819138-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227080558.3819138-1-raj.khem@gmail.com>
References: <20200227080558.3819138-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] systemd: Do not force removing resolved from PACKAGECONFIG
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
X-List-Received-Date: Thu, 27 Feb 2020 08:05:53 -0000
Content-Transfer-Encoding: 8bit

This needs __UAPI_DEF_ETHHDR to be set to 0 which now
taken care by CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_244.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 5d863410b8..e7d2997963 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -98,12 +98,13 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss \
     nss-mymachines \
     nss-resolve \
-    resolved \
     smack \
     sysusers \
     utmp \
 "
 
+CFLAGS_append_libc-musl = "-D__UAPI_DEF_ETHHDR=0 "
+
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
 # systemd-serialgetty.bb - not enabled by default.
-- 
2.25.1


