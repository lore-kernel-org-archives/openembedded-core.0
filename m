Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C9EC37E71B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 07:21:13 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r11so23067012pgf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 23:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B22PYKljbBOg9de/kgD3XkWyZDeQkwvfaTIw+UqlUbs=;
	b=S+tcwhr8nMI+dEJakUr2FiPKOzLPhUPHITvw3F8GMc8U5e4ojqp+egZNWceWSPYaSo
	b1zOXebL0WfccUht0Fr+8uI0Xd3MJw9ySpz29AWPGYI3KtLaCH2z/IGihTmWF9PPvgcS
	S+HIGUrGEBSkQ+Vs/tAb3oKjTpPyhcuqgY6UWxZGGSSzUt33HK0OQyPlPwIWuqC/9Xw7
	0RY+qhKQkC6xQZ4ZtButYWB5o+d0/FxTGyUF51d7GnK+rNemqdU3nLg82HAbrwRGSvu4
	49ye/+iHUwf5wnSUGBCVdbHFCzpigfeG2RrbBzgxC/ASQ1R6r2eZTyWvjkYLf7kbGrBi
	MXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B22PYKljbBOg9de/kgD3XkWyZDeQkwvfaTIw+UqlUbs=;
	b=Oc7tNBh6pBLbZ7O27myZw2SXsf8YKIKbn0cUVuWvAW5C7PA38486R7pdctDqQVm1If
	MHDhF4wynij7GfbRRTMJ/QQ1UeEsNlfzKMFzSl+vbxRym0cvaUOG03SlPqOg1DtlEOl/
	kJf73XvYVjPRxXuaw/s0KMvLBEIpxxMwi+3VZTsh+r7PLUahTpjGZqh/qNK5EGQVNhyc
	86k8je0RAprRdihaGljsyhy0EvRLPiTqnbuMXJPxC50eCxwaZB5i+kQcq1WsSlZemSOg
	bquuzXVagRvdKhIEqXMOjHziSjO4srx+5MpQ9XA+wD5vWATeZHOYSa9F31s5oA/kO6rB
	zyKQ==
X-Gm-Message-State: APjAAAWaGXzGcd7LDQ2kgKJYnB6eplz4QX4UV0sZ9hreRfgcKWEMEOkx
	hUkGOdQUXm7WH6ONaXNqJTWanQSmdcc=
X-Google-Smtp-Source: APXvYqyh/LP+aWTIJTDh1F9a7sNGGUfisecPK8wGMFiDgXn5h+YylyVkLAqDGCoWgrfh3lGPku/8sA==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr93761589pgm.312.1578036074347;
	Thu, 02 Jan 2020 23:21:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	y128sm64430512pfg.17.2020.01.02.23.21.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 23:21:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jan 2020 23:21:07 -0800
Message-Id: <cover.1578035913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Upgrade musl to 1.1.24+
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
X-List-Received-Date: Fri, 03 Jan 2020 07:21:13 -0000
Content-Transfer-Encoding: 8bit

Build it out of tree
Enable 64bit time_t on 32bit arches

The following changes since commit 3e108b70176dee3495f3afcea1c0c87cccf2a379:

  bitbake: cache: Lower debug level for wold build messages (2020-01-02 16:43:01 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/misc

Khem Raj (3):
  musl: Upgrade beyond 1.24
  musl: Build outside of source tree
  tclibc-musl: Add -D__USE_TIME_BITS64 to c/c++ flags

 meta/conf/distro/include/tclibc-musl.inc      |  1 +
 meta/recipes-core/musl/musl.inc               |  4 +-
 .../0001-riscv-Define-sigcontext-again.patch  | 48 -------------------
 meta/recipes-core/musl/musl_git.bb            |  5 +-
 4 files changed, 6 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-riscv-Define-sigcontext-again.patch

-- 
2.24.1


