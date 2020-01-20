Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0017FC98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:52:15 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p14so90702pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BP7mNei2en4aRsHiBWpZ9Msx2S+GotagnbUFvUCuArA=;
	b=s4gezvd5/+J2oQxRuXD2Iumj3ayRpYhJkfkKUnu3J/faU1j4eq/VGPn6NUbk0I6WME
	KXSjGW+gBz+x2OUyOGkYdO5ki6TYb4pOfYQ8ThBYFqbjG/4kmWGHQU5cKEFz+c10K46b
	Q3xUQZoS7R0+JA/hOEO9Q1NircEHjTN5ht4iQ4kuJ/3AkQQsx/KsoFmibf88hmEkmQzR
	UAZwexexgP5d13E0K8rEF3nXklZHq+1HiFc9xgX+OtYnw9ssQxQueCQYPRCm7nzyv37n
	JucZD0DRFrkl1dgEs97lDNzLa97uAScVGDnIonZ4eDQBnSbt1S9B19eBQCl62nkRJgGc
	C1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BP7mNei2en4aRsHiBWpZ9Msx2S+GotagnbUFvUCuArA=;
	b=GhUx0Za7zegoo0K06g3+SCr7LtJqU9HmDLmHN5TDEqPE/HqdcGoyS5OcdqO2aPeike
	zAI7Z+TGcDut3y5ySDMig7CtiWweEUrNrjXKWkFrqsGj8DAiuez+gHmY1RtJ0z4b2MSW
	8etbH1Yl3sN7MQCKACyC3bZ9lEdRdlWQSoV6WDnUT4gRjPkYZi1h850VAJqgCinHCi1q
	07HYj5du8bFEDN6RHm4jLG0j2bEQtPE7tmuIOal00QessGc8l2c8zjLhaEDSDfcOXUIH
	iXNaQ0N/r/f/ShkxVCl0KONSbXXhpdOyXqeUVWCiCn1F++e0iSF1gOu6Gio0yS2eBlBH
	zPIw==
X-Gm-Message-State: APjAAAVp6atuCV5HN6nY90q5qXR36q31oVQIbVLWok702dxZ3IiGakcg
	izpwxPqkgAH0udrYEAsZ2XpkD4bc03A=
X-Google-Smtp-Source: APXvYqylF+o56kFjbOCkQme4KSMaLorNRXt4Z74vl9xeCpXIb9yxpoi3LQ5gvCRFT78dOOfaeEYodA==
X-Received: by 2002:a63:5818:: with SMTP id m24mr875192pgb.358.1579542736532; 
	Mon, 20 Jan 2020 09:52:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id v9sm84588pja.26.2020.01.20.09.52.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:52:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 09:52:12 -0800
Message-Id: <cover.1579542573.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/3] Clang fixes
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
X-List-Received-Date: Mon, 20 Jan 2020 17:52:16 -0000
Content-Transfer-Encoding: 8bit

These changes are found with clang and makes oe-core build again with
clang

The following changes since commit 6265facc75c3d980dd39494399251bf9121c25cb:

  epiphany: Add missing mime-xgd inherit (2020-01-19 23:49:39 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (3):
  gettext: Fix overloadable error with clang
  mesa: Help compile with clang/mips
  tcp-wrappers: Remove redundant forward declarations

 .../gettext/gettext-0.20.1/overloadable.patch | 22 ++++++++++
 meta/recipes-core/gettext/gettext_0.20.1.bb   |  1 +
 ...0001-Remove-fgets-extern-declaration.patch | 43 +++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |  1 +
 ...sdetects-64bit-atomics-on-mips-clang.patch | 27 ++++++++++++
 meta/recipes-graphics/mesa/mesa_19.3.1.bb     |  1 +
 6 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.20.1/overloadable.patch
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch

-- 
2.25.0


