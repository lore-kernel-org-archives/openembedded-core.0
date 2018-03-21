Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0537894E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:34 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id a19so1433053pgw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kN0HVXWZq//x4TmN3Xoy3Dh3wE1aMxOfmFUy/DglWl0=;
	b=Rwp7RvGDhfjeoK9L8gKU+EnDNpd2Aqudh9oPu7UxJXdlR2/c+S67mdwCSTpter6zRg
	mYRa7XEz6Ve8nqPBzOdg3b8+8QJzorZXq4kOHvp2/owIg+9wHYtQjlVBxajt5qJPgNVZ
	k7drj7qzA+isTELBb88PvbgQ7qbXxi/1qCbaKYs1wJtF9U1i9etZ4GkbdTYEVwH5DbmT
	FKpxsTKiNGYSyMHcy0mZX9F0mswGOWpFBuVL6/ltAYM8wX1+/t4rYZ1NyCbnQ5aTmpLL
	EVZithH5ILNeg2PkkAbPc008GtlQO+FZ6cRmUNmjJzKgYJWzu6ZRzq1N1on68xC8Iy4U
	fdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kN0HVXWZq//x4TmN3Xoy3Dh3wE1aMxOfmFUy/DglWl0=;
	b=FiKN5Mc/T+8pleMMja9vQzX8I/S+LuPvop3KwuhqDAavKbMDwpHhSj0/WVNzY+MpTH
	z/pvkO//IFLT41HQzdtk+do6pwyXhpDF2D5q7+FD6wyX44DIJGA/Eg8RYs2h0jWQgXmS
	sUK4BT87CN+2JD0dEzpX4JEq2+8BPN/jxwpseWJrLM6icq/c3GNc1pUSG/Pxn1dh8S6u
	xkIxyqLoujKmgYitcpBbm2IeVK0Vh8pNFY6WONg8xnnECC6MdbTT+9bVfevbirRhsfVV
	aYV/yYS5eolJu518MQA3fvCA4NHPihhkGjslVxieC0sPx7EyLcQl0+7tggNkhRU5KXKT
	d10A==
X-Gm-Message-State: AElRT7H0nW+Vq8617MQfSAuuoXazG2ZaUbwcZzvhtApRHZNXREKsb0wU
	W68AqsUkqnIYcf00bvclhBlnwA==
X-Google-Smtp-Source: AG47ELuN9AHE9t9LU/Nst4j+PfWInxHy8BEHvORXM1bqbxwqUrQ6hv5QKnVBW7FeFLxHMLpGkMGF7g==
X-Received: by 10.98.49.135 with SMTP id x129mr15498378pfx.75.1521600156080;
	Tue, 20 Mar 2018 19:42:36 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:23 -0700
Message-Id: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [daisy][PATCH 0/6] SRC_URI updates and minor build fixes
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:35 -0000

Daisy has now (long since) left upstream maintenance and entered into
community support. As a member of a community which still actively
develops against this version of OE, I would like to propose the
following updates.

Andre McCurdy (4):
  gmp_4.2.1: fix build for MIPS
  ncurses: fix build with gcc 5
  binutils: fix build with gcc 5
  mesa: fix SRC_URI

Khem Raj (1):
  kernel.bbclass: Remove bashism

Krzysztof Sywula (1):
  dtc: old SRC_URI died, changing to new working one

 meta/classes/kernel.bbclass                        |  2 +-
 .../ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch    | 53 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_5.9.bb           |  1 +
 meta/recipes-devtools/binutils/binutils-2.24.inc   |  1 +
 ...86.c-Werror-logical-not-parentheses-error.patch | 61 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.2.5.bb           |  2 +-
 meta/recipes-kernel/dtc/dtc.inc                    |  2 +-
 .../avoid-h-asm-constraint-for-MIPS.patch          | 57 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |  1 +
 9 files changed, 177 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch

-- 
1.9.1


