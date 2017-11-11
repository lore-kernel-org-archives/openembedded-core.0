Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6DA780F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Nov 2017 21:32:56 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id s2so9919047pge.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=jSgp/czb2xLGaxFZZnY3e/72x4OLejZKRjEXkM7FQgk=;
	b=mzo06eoZaEqswArGUMvsaeIzeA1mZKsp6y4fhK/+lTd48bWxZmvsV2oUwmOaBvqz8f
	+iqgyRZnvLjS8Doh3OXG0I3y2E9V1a1Lo2IEs+Ix5iDR5vRTHGy8IrLZ+3S7YxhyNsaW
	ZN3vxU4S+sTQt1pSXiuA7jaYTKxjZHtZAPe0geezWllNCid1tql5SU0F6g6uFECq8RWq
	gryjn7LDmKHWpGfRXd+mW3R0oUYkcS54YtDlQl61DO+2cFMwc5SYvRvnuBlQQxHtxuSy
	HezHhEiSpf+DG+DGvQqp0czRL/nWoUTr5HkyA5Ls0eH6n4cA4kbYmo7biFp7BlI29V0B
	Wofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jSgp/czb2xLGaxFZZnY3e/72x4OLejZKRjEXkM7FQgk=;
	b=VtB2Fo3ZuiX4w5arwe+MmPTHPCrwpGVERs1Loleo6ziVB5Id/lnzL/PU8bTbcmUJSv
	kmlwvbWZtjql7XCxRsNrZhOa7pfdlP2NNuCjVXEMEebkD1i8i+IBUw+YFs9IhunJaIhT
	GZrAjBU7YqrA8T4+LEFXtAPNR0v834a7c705KyrM3WyKxacjx69BvqG60Crfx4MGZ1UK
	Wz45Ju/EUqtqaGD5YCeiDO+SCYV5RGl3jylTseNfUPkSv20DBgaOXL1TE9/0iJnBX6H2
	ky4jMpVmgeyIl/8Yxtf6LOilG8ugz28jCKV7on5N5NS0okFhh2STYmkN7kqb9qIBwICc
	OgWg==
X-Gm-Message-State: AJaThX66b2QrLTblTf3EHhkREiwbZFKAzaiN+J+hVg3vLqpgfVfiei5I
	i3uGJPhDzapDb31Pi5264gI=
X-Google-Smtp-Source: AGs4zMan2E2/tYm/PsMOwgX9hr8sEPilx45ug+xrhcIcUGcix9QsaWvWWVSgCeYICbGWpbvu96wP2A==
X-Received: by 10.101.70.201 with SMTP id n9mr4338579pgr.197.1510435978173;
	Sat, 11 Nov 2017 13:32:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:f5ba:3289:44cf:7633])
	by smtp.gmail.com with ESMTPSA id
	w9sm25208899pfk.16.2017.11.11.13.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Nov 2017 13:32:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Nov 2017 13:32:55 -0800
Message-Id: <1510435976-10490-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] binutils update to 2.29.1 for security fixes
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
X-List-Received-Date: Sat, 11 Nov 2017 21:32:57 -0000

Built on AB, no issues do to upgrade found.

boot tested on arm64 target too

Planning on updating Rocko instead of backporting all 41 + commits

Armin Kuster (1):
  binutils: update to 2.29.1

 .../binutils/{binutils-2.29.inc => binutils-2.29.1.inc}                 | 2 +-
 ...inutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} | 0
 .../binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb}       | 0
 .../binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} | 0
 meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/binutils/{binutils-2.29.inc => binutils-2.29.1.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} (100%)

-- 
2.7.4


