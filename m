Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 327BC6004D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:33:52 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s17so8767593plp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=nXdfb0ELWGaD4wNaCRVLN81OUwK+EHc7AbLp7ZAMr+k=;
	b=LRlHOuEPkur79zbUe5QL1uBFa3X0O+4Wjbpb81Yv7/1JfcDyxROSLGyTT3jHx+g4Bx
	qapdfSiM46H96zBk8AgLSovXXsLITQ2nXlselPfqqZ2t25zF1h22VWsJKfTS1ykVLz8W
	5LNacpF893SZEg/Ikt/1tRIU6HPV2Bzt59Al2xxH2cOPbXvcNmke6U3PDh1Om3Zd4bkA
	RwCpIGDPlADuNSxdnJ1fYNeDf4XTKTkrM3G/eJrf2g1d94sZRsncFXLrgmlBjQJXXjDC
	Ud5PgJdOZXuhL9/aUk8qfxL87dxYL1/VjJ7iobcPyeU+Lf2otlFW6xRapIICbPY/DgOD
	vmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nXdfb0ELWGaD4wNaCRVLN81OUwK+EHc7AbLp7ZAMr+k=;
	b=G79dvFEGoTwRBbnKOua+RYXoG5PX0Egh4ItT1A73917otfov6bThAf3AnGyaxHRT73
	BGH5YYFQ4rxyfmifQzEuqD+VLzbZZQyFYqwh32ewRu175bZf3jSsIlQq7Pz4P0ZPqLwM
	aoL6ZOE1hFoq+InSqnx16KEGic1L0sf/T12w+qsTRH93/c25Hr5VNdEisweG7v8Vv1kC
	Ml6Gtd9MSVJ2OFLSSo6hBggIzjjcjmwbt8BQfeS4oSNWv+7HuGU7F0HT6XmG6RYkCO1Q
	BqLEKvFx4+xVr/hNDxNughP7FzLzMVoi0qoxOtHdPFsM/CbCUKZnqlvzKXzjAfJUnEeF
	0PFQ==
X-Gm-Message-State: APjAAAVDrbV6GZ2yAuUWLPUM4d9Tvd+d2/gAyRTHdid0SKaKsYQ7sJ2F
	J4dalr0j9dfB2NyPeBboOl7zFL4J
X-Google-Smtp-Source: APXvYqxBpWupKOz8bqX0RhdJku4iyoMnGJ/KYh5vRJJIf4CxfRA0284dzl1NE/EErjIeKd+N9oAh2w==
X-Received: by 2002:a17:902:bd86:: with SMTP id
	q6mr30741436pls.275.1571103232943; 
	Mon, 14 Oct 2019 18:33:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	b20sm22710629pff.158.2019.10.14.18.33.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 18:33:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 18:33:41 -0700
Message-Id: <cover.1571103112.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud 0/7] Thud pull request
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
X-List-Received-Date: Tue, 15 Oct 2019 01:33:52 -0000

All these have been already reviewed by the community.
Passes AB -full

Please merge to thud

The following changes since commit e6728a873f1eef335a9e21bdface304f13f0c952:

  uninative: Update to 2.7 release (2019-10-07 19:27:17 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org//log/?h=stable/thud-next

Dan Tran (1):
  gnutls: Fix CVE-2019-3829 and CVE-2019-3836

Dmitry Eremin-Solenikov (1):
  kernel.bbclass: fix installation of modules signing certificates

Muminul Islam (3):
  glibc: Security fix for cve <CVE-2019-6488, CVE-2019-7309>
  libsolv: Security fix for CVEs: <CVE-2018-20532, CVE-2018-20533,
    CVE-2018-20534>
  curl: Security fix for CVE-2019-5482

Peter Kjellerstedt (1):
  arch-arm64.inc: Lower the priority of aarch64 in MACHINEOVERRIDES

c-thaler (1):
  kernel-devsrc: check for localversion files in the kernel source tree

 meta/classes/kernel.bbclass                        |   2 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   2 +-
 meta/recipes-core/glibc/glibc/CVE-2019-6488.patch  | 274 +++++++
 meta/recipes-core/glibc/glibc/CVE-2019-7309.patch  | 207 +++++
 meta/recipes-core/glibc/glibc_2.28.bb              |   2 +
 .../0003-Fix-Dereference-of-null-pointer.patch     |  33 +
 .../0004-Fix-Add-va_end-before-return.patch        |  36 +
 .../libsolv/libsolv/0005-Fix-Memory-leaks.patch    | 158 ++++
 .../libsolv/0006-Fix-testsolv-segfault.patch       |  41 +
 .../libsolv/0007-Fix-testsolv-segfaults.patch      |  47 ++
 .../0008-Fix-Be-sure-that-NONBLOCK-is-set.patch    |  37 +
 ...0009-Don-t-set-values-that-are-never-read.patch | 113 +++
 meta/recipes-extended/libsolv/libsolv_0.6.35.bb    |   7 +
 meta/recipes-kernel/linux/kernel-devsrc.bb         |   9 +
 meta/recipes-support/curl/curl/CVE-2019-5482.patch |  68 ++
 meta/recipes-support/curl/curl_7.61.0.bb           |   1 +
 .../gnutls/gnutls/CVE-2019-3829_p1.patch           |  39 +
 .../gnutls/gnutls/CVE-2019-3829_p2.patch           | 871 +++++++++++++++++++++
 .../gnutls/gnutls/CVE-2019-3829_p3.patch           |  36 +
 .../gnutls/gnutls/CVE-2019-3836.patch              |  35 +
 meta/recipes-support/gnutls/gnutls_3.6.4.bb        |   4 +
 21 files changed, 2020 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-6488.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-7309.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0003-Fix-Dereference-of-null-pointer.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0004-Fix-Add-va_end-before-return.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0005-Fix-Memory-leaks.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0006-Fix-testsolv-segfault.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0007-Fix-testsolv-segfaults.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0008-Fix-Be-sure-that-NONBLOCK-is-set.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0009-Don-t-set-values-that-are-never-read.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2019-3829_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2019-3829_p2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2019-3829_p3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2019-3836.patch

-- 
2.7.4


