Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C38277C31
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 02:16:06 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y192so7920644pgd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HP6KmfFJ8uDNzDkRW0XrLhRnzASv2QgFcRm/PTg9BTE=;
	b=g85p6Xx/4p1M/fVaSpjxwZA/uWuyTmYYX3GyOZWvuVlVR/C+KiLX11fRWxPQgThQ78
	ADWl+OvZd2pvlzoswdrSE7xytoc0abVOqGZU5kGIAtZ642JWTZEIb+FuhAmcp10rai0i
	Cy3slSXjrMnTBl1U49Wv80GodAfdwrtM9OfEWJgT0oLseTIksfdOpXCGiLk9aZrkTBmK
	owSxdNtHyp+EVwmrt9w735ClJQRdO5UnrJPQjc7tzm16xzxsMis+h7sdz0UFO2LPHH6D
	IdzzQfCj6JWhXGoU7/75VUcmiZN0oGAm6wGrMDLRjjDfq7Ng9TsB27PTrV74LaJLGCef
	psoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HP6KmfFJ8uDNzDkRW0XrLhRnzASv2QgFcRm/PTg9BTE=;
	b=EjLR68Jyt/dNG3kGNWFv9Q/wAoNrZh/LGLu/3hyvbBeN/FHQNnAouiZ6RNkP8PCw5K
	77RNFa+SbpmXoyxPC1yJIIUiXDXbkOMheuCdwLJjJ/Y42YKxCpshbCQ9TDYzxgK2OsV+
	62LQLo3YyhYuHLwtK4yAFJRBdqdEBQaFnemWi+jIc0sUT21Vrpa92gOtcQm/8RuthwjJ
	9DN5V9bymy48gPksN2NXXrO25ubvz//Xek/uFZoN9KFL4PiXqh5uNgNb82s1MoFrFRJ5
	ZuSuKjLNPCUpEEqVLqeUUbG8oJEussF3Tilo8mD8+F+Nioo2y3eR7ii4xZeDsTDWiVkC
	CrAg==
X-Gm-Message-State: AMCzsaW5U89mHhAS++td8DFvFNJyDOwCXfCwDoOQJ5pdizF1zwlHiDbY
	ufSvhVLR2m+8p65XkZJ0Iiqq0w==
X-Google-Smtp-Source: AOwi7QB1h83UTnDY04LuBtRguaVuC+nHcqveuKtpij0PJb4gnQyfnuK7ioKRnmS51P0RiX/54CR0PA==
X-Received: by 10.99.115.79 with SMTP id d15mr5197786pgn.343.1506996968227;
	Mon, 02 Oct 2017 19:16:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	20sm19427476pft.109.2017.10.02.19.16.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 19:16:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 19:15:58 -0700
Message-Id: <1506996960-17686-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty][PATCH v2 0/2] coreutils: musl build fix for gplv2 coreutils recipe
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
X-List-Received-Date: Tue, 03 Oct 2017 02:16:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two minor patches backported from meta-gplv2 for the gplv2 coreutils
recipe in oe-core morty.

v2: Add Signed-off-by's to both patches + reference upstream
meta-gplv2 commits and add _6.9 suffix in both commit messages.

André Draszik (1):
  coreutils_6.9: fix musl compilation

Richard Purdie (1):
  coreutils_6.9: Disable broken man pages

 ...-need-charset.alias-when-building-for-mus.patch | 46 ++++++++++++++++++++++
 .../coreutils/coreutils-6.9/no-man.patch           | 21 ++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  2 +
 3 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/no-man.patch

-- 
1.9.1


