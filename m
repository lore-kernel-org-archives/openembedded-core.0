Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B79F17E636
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d17so7522085wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MvqmskFOqglImbLVP74C0Bz8ZprCjVKlx4gzdB74QL8=;
	b=W8z4LDfuguMv0gyKiSEs61cYerKXsc2mcCQvJtasCBmbvUw8lFPz6aV8ghzJHDUUmO
	9GGWU0qk1KCSUphqfWlSd4DvNIH7qRfhOtWy+X5XcKsYsxufb2dE8Hfci8PtbnD1RMLH
	HEYvJPTQWLToPgu41O35NZK6/LOUD5cocHyPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MvqmskFOqglImbLVP74C0Bz8ZprCjVKlx4gzdB74QL8=;
	b=Upx6hpEzPcKBIvxEr7vE3yTgMBNjCbQ7B9QkytJ1SYK4K4r8FiUX4Vx4gkb/HYrNHK
	rW6H/votPhxup2VeaKRX8ZQmwVN2hDfhTDbnDTZhMBBz+D5xy4T4eLj2SC61WbDXlktN
	29nttEBL13EdTmOxm0UKCvkautw/mfbwtFA+QN9O0Q6JesDPnDHS2/gwfKJWVXMg5MCH
	PiZky/GRBTBGuLCyoz4VCVShcFPyQuATNsfjUEGXo1Z2FYYOnRqqgmMv6LJ2vORXHjxV
	wGMVc+YSmQOhb6EerX2kE4Iu/Vo25lLyz1bnNd35t+3r/tisDzfjAeLuu22jmw75J79M
	z4Mw==
X-Gm-Message-State: APjAAAX3bmhTe5RcGYlBw7wikAtAQ+j1ZMgT6BJHiDt4m9QJwx5Hvvz/
	QmtxigZWR8yRbNS9ns3JQ/ir7dIt3eA=
X-Google-Smtp-Source: APXvYqxFBf8di1+09pEuSirXCfZnFQaS0Mz64q5TljnpjpbtY0vXjiDZiQNnWMS3kA672A4D0Onr6w==
X-Received: by 2002:a1c:a544:: with SMTP id o65mr8420747wme.84.1559384732270; 
	Sat, 01 Jun 2019 03:25:32 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:23 +0100
Message-Id: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/8] quilt: Add patch depends for quilt-ptest
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:32 -0000
Content-Transfer-Encoding: 8bit

This fixes the ptest to work in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 150df3d572f..dbf722be2af 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -85,5 +85,5 @@ RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
                         perl-module-text-parsewords perl-module-overloading \
-                        bash util-linux-getopt \
+                        bash util-linux-getopt patch \
                        "
-- 
2.20.1


