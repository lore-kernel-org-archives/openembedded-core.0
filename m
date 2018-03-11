Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2096A7850C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 08:07:54 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g8so5254182pgv.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hZLU5EI4tQTEfOL/YJZ57mK0Rg2qFIoajIMoxfC9Kho=;
	b=Ex8NIKQz34OSqrsohI3vVwQhn5AjVCVmtPAGEsifyz66lbflgkelBmP6avh/K6Mjdu
	3kFLysbGZWERiAMs1T67mYz1doZJrW8VOPtVClqo7ziprERAQ4CQoBVX0+It/ANTrlcy
	uUV6LvlKvQm19NKznBc+9t6F6l49Nlzg9G27NMechHCyTDDoYKjg5gHuh+Xj0cr2fJVX
	24az5++/bVajmvq7D0LeYSJgVtu6QWuV4zf3jzLnzsMT/mg2tKS18esxLh3bH/JBtwjh
	hHvFYbsv+lw02EBAFnuZar28aWIk2sMq+2Vmobzo/7JpbYCyRtp9zc5mXbkA+JOGcXwU
	EqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hZLU5EI4tQTEfOL/YJZ57mK0Rg2qFIoajIMoxfC9Kho=;
	b=l4KLTdyq17x8NxvEm1ZABoRQl8wZ0rLo0gU/s4CCag3npf7toP5dxk3rt6AsRrhwKw
	HPxNy8DtqVH5yGMHoVmjJXx4fkR1IbfREeUAFwGv813XRLT4By8y0boJDTQJJ216PqQ6
	UZ66I27TFjxZK1i77tDgYCN4k8/qvhoRqdig00du1yOO2GYiYISzP2LhsCxJCtIYG+fT
	zckM0ZFdleY6bCdmNpEyU1FFg9xOefNRYRXiiM3/kpHZK3+yPJX9IyQjmvdLeRDkTe1Y
	DOT5QjBBC68jY8UOqc8+XVjtZn3v7xUuSKRzzobKkFkewaeXDmb5l4wQfOJhZdNWzK5x
	3n0w==
X-Gm-Message-State: AElRT7HYtWBcFJCrHcm6jvdAQablzGNj+kHK4wcohRGnIkhPkJZ1ufIr
	tVeNlQJTNSKUr75K3ryzdYguyw==
X-Google-Smtp-Source: AG47ELvfe4okf1li9slNufy/EWiKslXIQyCK+zeigTGn7bvEkQVfWL9CKMsXJnwak0HdLPgaw2ZGrA==
X-Received: by 10.99.181.78 with SMTP id u14mr104313pgo.205.1520755675838;
	Sun, 11 Mar 2018 00:07:55 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	l64sm11601912pfi.142.2018.03.11.00.07.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 00:07:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:07:43 -0800
Message-Id: <cover.1520755515.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 0/4] Further fixes for riscv64
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
X-List-Received-Date: Sun, 11 Mar 2018 08:07:55 -0000

Fixes to get core-image-full-cmdline to build

The following changes since commit e4da78229f0bd67fd34928eafe48dbdc9e8da050:

  e2fsprogs: Add comment on why touch is needed (2018-03-09 11:09:39 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/riscv64-fixes-2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/riscv64-fixes-2

Khem Raj (4):
  tcmode-default.inc: Define QEMUVERSION and softly pin it
  pcmanfm: Drop COMPATIBLE_HOST setting
  site/riscv: Shunt the realloc configure test for startup-notification
  risc-v: Pin oldest kernel to 4.15 for the new kid

 meta/conf/bitbake.conf                      | 2 ++
 meta/conf/distro/include/tcmode-default.inc | 5 +++++
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb  | 3 ---
 meta/site/riscv32-linux                     | 2 ++
 meta/site/riscv64-linux                     | 2 ++
 5 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.16.2


