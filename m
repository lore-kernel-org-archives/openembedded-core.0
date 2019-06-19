Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4519E7E0D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:44:46 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id k21so26256929edq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cx7vPnHZphZ7HPXCMIUNpqpVuPlXDhqlxULeXm7CMS0=;
	b=WQMOKOMzeTFyHqdqdg1YMUJO2yDkrfSzWQOx6tsfaABgTqOC3ysezN3Gc8fJaStE0P
	P2jx3vOHNaQTbw7HK0kgRxj6sgkM3ox0uJYLynXHRspUvgzCQVENhYjrf8cphR+Dfy1M
	GGPSSLpDYlAJ6XBnPOc3cWAdWM6yupq36H5qGaXcVrxlRM+n/XQjoYfEmBs1QtwhLVnM
	yYn9fjN4Xs29Yn7GYVfj63y6TqUPk3bL5tS8U/U3jjXXIfJMtSbXpy1czmRAaRVBjQU/
	NjHbixBdQ4UjfEACwc755IO3TAdZREJBTE2CxUnEK6Hj1d0fRz97M/TYQNmfjlERDfJm
	qerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cx7vPnHZphZ7HPXCMIUNpqpVuPlXDhqlxULeXm7CMS0=;
	b=XmlRJSCyxLNSnus6VhHOztF/O0olXMfeFMhiY225FUkaXevsMqI6nnlz4QldQFFJcK
	JTRvMNZ0RXaN2x8wVfXnUDWF2VMdBq8GFGK8c+zPsOw3H4HSyRGDIrFpH7BOUZq7XCMe
	85cMtbPAAGhGUD9nd0ek9pFA3/fAPIA78UE9bzCYyXcpVfWEljsfd5M1fcqTtFcDg501
	hzXCRcwbtuHL/MthkKcylyFhGgNYBmmhqMacGdFhxhV/9E4B07DJBigXE5IOmLNmGtwQ
	zSTHAL+lfj5mycf7euhpTsH/iNP3lohh5A4UsT8sH32wXL3gVQ5GYqqXVP2cQzrKTFQi
	DauQ==
X-Gm-Message-State: APjAAAVQW3ucL5MhQB2n+mKn3Mdk06h+p2dzCpOYZOjriW5o5djNTdlD
	DK/ycIHy/S9Vaus9FAvt4soMWVNkkLg=
X-Google-Smtp-Source: APXvYqz0QgyLIg/0z48RY5ZKyqZ9qm831l45QaohwJPWW01v4vVwpjoLoy53uwNaSoFoqlTCOQ2PTg==
X-Received: by 2002:a17:906:f43:: with SMTP id
	h3mr1404494ejj.143.1560937486717; 
	Wed, 19 Jun 2019 02:44:46 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x8sm5527821edx.67.2019.06.19.02.44.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:44:46 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 11:44:36 +0200
Message-Id: <20190619094436.2024-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619094436.2024-1-ricardo@ribalda.com>
References: <20190619094436.2024-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH 2/2] dpkg: add missing running dependency
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
X-List-Received-Date: Wed, 19 Jun 2019 09:44:46 -0000
Content-Transfer-Encoding: 8bit

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index fee7a75814..ec9eadd21a 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl pager"
 RDEPENDS_${PN}_class-native = ""
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
-- 
2.20.1


