Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id C843B7DD6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 10:59:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5so1726995wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZGrgv97hd+tXQFNUv10Op1i0g8NQe+k5l4evX22YCJg=;
	b=tzWptoykHGLec7owvZBoe3v2ryPb/ULJ5KeRp4R+ZM/tXdAK71hmCyDHHb2HBnRzBV
	2xiiR4J/oNo+0acJ7hyARAdRJ0QCojrmeo6/X95o11DTnDvR6ErtM43diIJdBQT1+zxL
	VrM5IxuFqZ0q0LUHnStI+03Nl7yZ41h4ZnAzPFLSgX9raWbyEO70IZBO8Eb9qtWjrRXt
	Apx+P62uIsCfoqYZy3tyCminYpukAeGd5Zh5BjfHStJNDjPDmy0g7uX54bUIGfXTmmCI
	rInazR9zSjW2wvNrQjrn5uN34/s33IH2nRpWjl03G3MeQcvOCy2WxFsuU6vsiOP0yC8m
	1JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZGrgv97hd+tXQFNUv10Op1i0g8NQe+k5l4evX22YCJg=;
	b=iVc51jiX6MSbkLDlgh0/KtK7raCt0TkxevP1uAkP9GrGfoD/scCx4eo+StvnBTZOgd
	bPBoXstfEHmObcqvfPDdn+I3XeWiCZWmnoQOgqwlFriFJwKxqyxjnQL0tLYCzySTCTcB
	cXyEAobkcwqO4XWbbO1QeP8XB/BK3sKwOguQ8fsZ2ZLPVhEkP2kPVBGGIeeWvoc4V7/1
	Pfh2WwXuLBDubzvOy/Rj19rikk4Tt5dmFruUKtVQ1sMg8dHy3DJhBIIATO+t53homVF0
	ywetzjN/JJ0ul8j+72t0DlG9RR/xCuGvHMlRwoednSQsbzbOSXFf8C3ZiRRShO0l7vQc
	+lVA==
X-Gm-Message-State: APjAAAVuzWXnDRLmiWnI5kNMz+HNfI99D1yjdaFgVPAflvGBSpPNrfw2
	HZxfB/RneENT6fUlzC9jzLr9D+Ii
X-Google-Smtp-Source: APXvYqxWc7ND4THnXaXUChbvvjHHuKqnhFASYsggIF9MuVT2pArvqGg4mBnp3AYuu/i9ear/7wYnHQ==
X-Received: by 2002:a7b:cf38:: with SMTP id m24mr2000108wmg.24.1569322780097; 
	Tue, 24 Sep 2019 03:59:40 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id n7sm1943753wrt.59.2019.09.24.03.59.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 03:59:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 12:59:21 +0200
Message-Id: <20190924105925.2287-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [sumo][PATCH 0/4] Fix build with host gcc9 / latest glibc
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
X-List-Received-Date: Tue, 24 Sep 2019 10:59:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build errors popped up with Fedora 30

Andreas Müller (3):
  elfutils(-native): Add backported patch to fix build with host gcc9
  glib-2.0: Add patch from upstream to fix build with host gcc9
  cross-localedef-native: Fix build for hosts with recent glibc

Khem Raj (1):
  bison: Fix build break with glibc 2.28

 ...11-gdbus-Avoid-printing-null-strings.patch | 77 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb |  1 +
 .../glibc/cross-localedef-native_2.27.bb      |  1 +
 ...ll-_IO_fwide-if-_LIBC-is-not-defined.patch | 78 +++++++++++++++++++
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 .../elfutils/elfutils_0.170.bb                |  1 +
 ...-fsize-and-msize-with-const-attribut.patch | 42 ++++++++++
 8 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-gdbus-Avoid-printing-null-strings.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0009-libelf-Mark-both-fsize-and-msize-with-const-attribut.patch

-- 
2.21.0


