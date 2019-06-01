Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8647E641
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f204so3519115wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/ntqparBmPHZgi0UiO+IRox9h1nZN5MTZO/lyDaSCQo=;
	b=hgUav1UZ6srXrUmXFzzM2LvouFAJCdErBZL8LLm2BNdnsmbrxoG5L3lPc6082qgRgv
	SYIDYhOF5vfy4tGkKkDvsZoTtkVcIBen2/hlbxbH4xv2rXNDklvBSZXt+OcMe25ZhKnF
	bAhlDpFQQeS/O2L6vHYlR8Dc0nUcLH2FgVbD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/ntqparBmPHZgi0UiO+IRox9h1nZN5MTZO/lyDaSCQo=;
	b=uJzfMy3Vt7ptz0f4Eja4/DzYM0abTZHibsQbTno/gmfYCla097NcVpgmIaXydzwgsC
	yUpV18Tc2xIbDeBrJbqw1w6eQOmtzidVNq1uOhybP0xHD+rnlTmJBodeqd4C0Vqn4Nvg
	TmYOCi4FEr9tv7rkLANwIunTfLc/4zPv7cw7DE0g/QPfBG4TQr7v9ayQDWOctjDO+Zls
	FcMLrKAq36YcLGKzA5nKUUCDjBTxxBevj/GaYgVWQfZLUJNJ8lLRn6qSiZz8bWg7MzcV
	65yk+cr4dogUUX6Tf0MtZyYz0JkBJA8zb0ystjTtt3d9G9Kw4eBjoViK7QwetrQlvvqX
	B10w==
X-Gm-Message-State: APjAAAUHUjvFcpamLKSY2OsEQiRT6RN9Mwn6aelbPZeEh8FoUslkQpgT
	YAH5YF2Hff0X0GWIltx1othCnaYl85Y=
X-Google-Smtp-Source: APXvYqzxAsJtY+kaxjIO88LylUOsYD0AkMfftxbCZRV1CiaWpFQ/a9XerCSNIY/mLPJ+B22h3vpZ9w==
X-Received: by 2002:a1c:b757:: with SMTP id h84mr3035405wmf.127.1559384733622; 
	Sat, 01 Jun 2019 03:25:33 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:25 +0100
Message-Id: <20190601102530.5995-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/8] libtimedate-perl: Fix ptest dependencies
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:33 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when running the ptest in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 7129c647cb3..7219c7d11eb 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -15,7 +15,7 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
-RDEPENDS_${PN}-ptest += "perl-module-test-more"
+RDEPENDS_${PN}-ptest += "perl-module-test-more perl-module-utf8"
 
 SRC_URI[md5sum] = "b1d91153ac971347aee84292ed886c1c"
 SRC_URI[sha256sum] = "75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86"
-- 
2.20.1


