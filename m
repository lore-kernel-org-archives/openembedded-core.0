Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEBF78879
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:40:48 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id w12-v6so8701868plp.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+sHtVj36X8dLOJ3vsrZ8gyMpl2EYTwq00B9P4xYWwlQ=;
	b=qXZX7VRWVn3nNQw+rGaok0vK8BMoGUbvv++jmkO7vg7MuDiPxNk3LYVmAuldmzZVhT
	zEYsvevZqctVpNM38ydI+aM7GHa4zerQy2vDVZJwuxpvejUeePfwR87DEO0wA8mGSCWc
	rrF3FVaF2iGmegIEL1fHwLWV0ikCyEtJ8mN8fyspgOPPA0mVNs31XTBEZTpsYracd/cV
	fO086wder+hSQr+BYfUB30drqNvJBvu13qGCa8HdtmdejKe049EIfQzZORv3sAjLn2wp
	Ka2h5rKEtMVKs6bD8gFkEW8Ytw57ZahoGoUVhBjzWwI3psEUE+usiyjpcu6Gc6YSmOvW
	fdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+sHtVj36X8dLOJ3vsrZ8gyMpl2EYTwq00B9P4xYWwlQ=;
	b=Z8rr4bCaNzIV2I4JLu770Y17hVovQD9oZl6OvGvpTv4FeUgHo50ysIyT1fxNfJJrgD
	fm67i6CJ5NXHIobSHvcmIq2GuUr4jB6A9dUX4uw7tJ+eGHWSuwKcjyB2wNSUEkOBkrzN
	3zpd6Ue+RNKQm8tCkpJNhyx7vDFuIHQjb190oUigO0DPvS7VLUetFYSTryeR/IrMy5xS
	4sEyqslFEXWt4CITaFTsDNDcgD+35zU/+C415bUyVSzBSlQ9Ma08u3pAtD6aNjMLTbeL
	KdwArlZCD3PiqmIcLLzyKn8/DYhkoKK1sIzoeFvG/tAbFqC1dqbuluPLSDieNyC3/Xal
	A5FQ==
X-Gm-Message-State: AElRT7H6rQ97JVAEEvypeH9ZATCmYssafl7bZHc96mUhMDgwwuJnhr72
	Zwv6mAEgL73n1iuoOEYmX3+fBA==
X-Google-Smtp-Source: AG47ELt2vbLSVVPT9G9fD6NaCqIE1kcaGyX29Pe8g2a5C1JsMH0e4ivyjfSXPupO2bWYB4nPIGJwNg==
X-Received: by 2002:a17:902:42a3:: with SMTP id
	h32-v6mr6651866pld.231.1520829649534; 
	Sun, 11 Mar 2018 21:40:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	r9sm14776027pfg.11.2018.03.11.21.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 21:40:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 21:40:40 -0700
Message-Id: <cover.1520829505.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 0/2] Fix unfs3 with musl and glibc without rpc
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
X-List-Received-Date: Mon, 12 Mar 2018 04:40:48 -0000

Distros are going to drop rpc support in glibc 2.27, therefore we
need to port unfs3 to work with libtirpc

Added bonus to fix the build with musl as well

The following changes since commit e4da78229f0bd67fd34928eafe48dbdc9e8da050:

  e2fsprogs: Add comment on why touch is needed (2018-03-09 11:09:39 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/unfs3
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/unfs3

Khem Raj (2):
  unfs3: Fix build with musl
  libtirpc: Extend to native and nativesdk recipes

 meta/conf/distro/include/world-broken.inc          |  4 ---
 .../0001-daemon.c-Libtirpc-porting-fixes.patch     | 37 ++++++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb   | 10 ++++--
 meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb   |  2 ++
 4 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-daemon.c-Libtirpc-porting-fixes.patch

-- 
2.16.2


