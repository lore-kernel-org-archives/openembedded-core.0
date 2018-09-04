Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 45E3E753D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 21:12:55 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id x17-v6so2303935pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E01eAb0bl7hyXz9uSfb0K1WDpRKZuogUP18DlilaI/M=;
	b=kiXcKht5zg05xpz7lMbHtGm54gMX7UuazZyOwQNGKenhe588p/JKv1A4yPyiQoxTJo
	GCOx4FV/HViedGlTYK4EU0/nIRY4vwwt6TUQ8sB18kiyODTnfAMRQuFOrtJn3wsiaGNl
	kTGMa4goU3RmHN/id5s9UFSJL2Z2iXSEIUnYti8Waltez5TphvuCWL5GmYH3f9fNsMi/
	aQ2cQcZBpXliN2rIVylcOvrGfjPHocNVGJKE7c+iOIMlikH5vKRc69L3OOGvsDVC5Grk
	5M0MEHy6qimpUNEJgMnHOdi6OKb7paAf8M/W9z2ZO981f3a0zT6vtbPmqoPCVtH12JIE
	HUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E01eAb0bl7hyXz9uSfb0K1WDpRKZuogUP18DlilaI/M=;
	b=cSX+IQvHP21FFOOv7Y59c3vGf+wv5h6WlIKENcSlXFKBEBSQRMwWHDrp8NZBlb0weQ
	0cl01OsRtb71hlyjX+Q9k5VP/drhnMsNqJAtlWetI0jd3Qt25q8vnMIl8ZmMhw00HkEm
	eGIAxaZj6MV7fGFvvz3+ksl/AntlJzs2VijtyUadeJCfdG1nU7EpZlGyliAR2BuCXeog
	4GJIt0ozZ1xNm8xoqgiVW9pnuNSKw/QXfJ7fWNWXX3qU1jtnAUOXszs8regNFkfzM5xG
	xEcjakdRyet/t6uzW8SM/G+Q5eqN01rRwnRO+7kCMM2QZAQUiuoxFPHCU3aozAC08den
	aJ9g==
X-Gm-Message-State: APzg51AbgJ40h7x2EI0pxkelQ0CoQShGjv0zwlcvy6YSMRuAwc30HqLb
	IfBLQZ/+h/MhR0snJYakkOXphLE1
X-Google-Smtp-Source: ANB0VdZr0WrxpUKQIcjI9rEJfqo8V/eZxWcUCLN6TH1d8COM/OLwhsWXYyNwu1kXUIb7JDkpeuUWyA==
X-Received: by 2002:a63:4306:: with SMTP id
	q6-v6mr31976160pga.181.1536095575803; 
	Tue, 04 Sep 2018 14:12:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	187-v6sm41488172pfu.184.2018.09.04.14.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 14:12:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2018 14:12:45 -0700
Message-Id: <20180904211245.43302-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2 2/2] musl: Upgrade to 1.1.20
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
X-List-Received-Date: Tue, 04 Sep 2018 21:12:55 -0000

All 1.1.20 Release Notes

https://git.musl-libc.org/cgit/musl/commit/?id=0fa1e638e87cf257e9f96b4019b2076afd674a19

ChangeLog for this change in OE

https://git.musl-libc.org/cgit/musl/log/?qt=range&q=767f7a1091af3a3dcee2f7a49d0713359a81961c..0fa1e638e87cf257e9f96b4019b2076afd674a19

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v2: Upgrade to 1.1.20 tag

 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f4f156042a..de1cfd0058 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "767f7a1091af3a3dcee2f7a49d0713359a81961c"
+SRCREV = "0fa1e638e87cf257e9f96b4019b2076afd674a19"
 
-PV = "1.1.19+git${SRCPV}"
+PV = "1.1.20+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.18.0


