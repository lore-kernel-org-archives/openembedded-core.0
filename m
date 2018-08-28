Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE8EA78DD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:50:37 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s17-v6so1044301plp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=woopAoc+36xY5OUznPtsm7zp//AggP8C3SsFKElRRvQ=;
	b=tDn4rqe+LkmN6X/3nPJcFdaRWnGynwyOMlt4Tx/AMOyFarbiC1tBK+bSDEpP7lp+go
	eXZEHNDWaaP6wH2tH5Emnb1qRpUVVF7zoxsF0m52yP1GxeOVRzVkclhoCoPDIJGaiyeg
	kxMuqvNnrF3afeutAEfa8nPMw9XTYmM+IGVkcJiXACkKZ9kHhiwT3vdTIXaqF19u5mzD
	fcqcfY2K+fhXiBtFI9+6mX8ssjmQATRtj1qZhujA14z4au281XI6IMP6YMh7R8rZ9n1O
	gE/SmcDQkZvcHvchrAJLGHqxYIc1prOaDOf142Vs2i1du131zRv0Fjf7z+tVVRNEd/9q
	ZxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=woopAoc+36xY5OUznPtsm7zp//AggP8C3SsFKElRRvQ=;
	b=AInaLVtoIgPq4hw1AnHBarI/3i7RENBc2nOqZcJqatso2jTs2ICxa9/SP+HisLbAF0
	H57LUFnsFLWYHx759ctavdPy3xGm7Z9GWir9QLYDvdxnd48EqBe0b5BgDUYQ/KNsd47P
	BLsOnxmLXW/lXmwDite/yXI3POF0RlCYwbFg6rhGseEjE5KMs0HKDLwOR/S1kQMeMR16
	HOOI153JaU6qRRUvD6vmLZIC/k/riy8J1fFBlmgv9DQ7zsU30gxphNZgALdEnCo6UNna
	Yn01KkfViUIUxOWisoDk6S5/6r/Im9Q0apO85IoEspFE7E6iXvMaM0c1H1/DEvmoA5mg
	FkjA==
X-Gm-Message-State: APzg51D/a2qBL2VuPebkr/3XfMR7WzC2/gZrE7Plw4MVroLiC6XICjgl
	oNVd1cTc/Xu3ERXBmxzCMGnmynYW
X-Google-Smtp-Source: ANB0VdbmyqvGiOZdyBBS4YB7g/3wX8z4NC8G2UMcmbgnL+dH7vJKc79InUgH5pIqI1u3QayKMrqByA==
X-Received: by 2002:a17:902:a24:: with SMTP id
	33-v6mr2449948plo.293.1535478638496; 
	Tue, 28 Aug 2018 10:50:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	i1-v6sm5136645pgj.38.2018.08.28.10.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 10:50:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 10:50:30 -0700
Message-Id: <cover.1535478536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2 0/4] Misc Fixes
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
X-List-Received-Date: Tue, 28 Aug 2018 17:50:38 -0000

Musl has some important fixes
distutils fix is taking care of some missed flags
for C/C++ plugins, helps builds with PIE/PIC
Systemd patch fix is found out by clang

v2:
Add gpgme fix

The following changes since commit a5439ff9627d309f6980947f5ee573d85e672228:

  cpan.bbclass: make RPATH fix more general (2018-08-28 10:27:15 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (4):
  distutils-common-base.bbclass: Define commonly used compiler variables
  systemd: Fix qsort_r patch for function return mismatch
  musl: Update to latest
  gpgme: Inherit distutils3-base

 meta/classes/distutils-common-base.bbclass       | 12 ++++++++++++
 meta/recipes-core/musl/musl_git.bb               |  2 +-
 .../0002-don-t-use-glibc-specific-qsort_r.patch  | 16 ++++++++--------
 meta/recipes-support/gpgme/gpgme_1.11.1.bb       |  4 ++--
 4 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.18.0


