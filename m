Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B60EB6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 23:58:07 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 186so204673332iow.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XF8WVgB4VFZflvTCrfDrDHWd7+Is44HfmNS+9K4DiZE=;
	b=Ucq7wpTNx9aCBxbUIE6yyF/3gqMQ8sVVte+yppRU66y2sxf0PFDa77dyKTseLPY8mY
	WTppb5bAEGfW5z9nKFTxqwksdz8JohK0wnPVyVZhVc0OVGDnS2fb7dNn+Ay6vCtp+Lr2
	gZpl4xzBgBloaMWDQA9WbbSg+WYmf0sl+AoRj9j5Bvta7hNYZS7u61BoeI0CHWehVYkl
	Jz1/yqeJrE/N9MDhr//OcMLq6vI5v0Qky18iPsB6YeTAoNKJQ0Daq4TnII0CgQwEEiAj
	/O72XeGPGi1c7If1QT6vd3qgKGxTKvaobLDgf6jmsd4a1VOJ/Wmonr603NFEU/+AB2hp
	6hlw==
X-Received: by 10.107.153.11 with SMTP id b11mr29193750ioe.95.1450828687799;
	Tue, 22 Dec 2015 15:58:07 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 4sm10079020igz.2.2015.12.22.15.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 15:58:06 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:57:57 -0800
Message-Id: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] valgrind fixes
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
X-List-Received-Date: Tue, 22 Dec 2015 23:58:09 -0000

Andre McCurdy (3):
  security_flags.inc: disable -fstack-protector-XXX for valgrind
  valgrind: don't restrict to armv7a
  valgrind: include aarch64 in COMPATIBLE_HOST

 meta/conf/distro/include/security_flags.inc       | 2 +-
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.9.1


