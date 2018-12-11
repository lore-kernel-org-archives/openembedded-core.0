Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com
	[209.85.161.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5663A6C113
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 13:21:15 +0000 (UTC)
Received: by mail-yw1-f45.google.com with SMTP id x2so5402457ywc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 05:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=imylIcbGXxt6PPL8Up0hCkBdUZUej3iyXwwLZh4F3q4=;
	b=lnoXtSaK2nCSsBEfRO7CfNYkOf9cvub/t9ZOYPLcp9H81OKR6BdzNAFCMbU3AvAPA6
	vd1REL+T4h+cp510nEm+jeqfPeX2BQGcufaxhMF8z3kVRHSMGki3qdFWNTCqA3Mima6Z
	DJ76OUW6Rr1Z8LvYhtspTU+r3NU2fFuorY+y2ypeNyxrsobnnk7GtUozNE/D6bImqDOu
	g3HScjkxYNX68/dLmxkl5BX8yxkbgTpHWXKCXedRVtogJB2E4KT4S/e0V3IxMyNbjsJU
	nM42ZuqgzPbhn6wXkLZG97szbP+lecwxq8huMUDs5OfxiDpL9lW9l9clsLyXzn0AA+1Y
	+FFQ==
X-Gm-Message-State: AA+aEWbbeje7xirxgJ2EIJ7qHkCwEOfOsO/TEF8Y9mQa6HAKbHi5xVH0
	2VhSzhDRmnwnbeToeY4GQG1gpO4G
X-Google-Smtp-Source: AFSGD/XL7K8LGKH174keisyDzIweFL2iz3oesQVJCXAi2mFLbAxwVRvN9/lctR5K35iVgkTvAly4Jw==
X-Received: by 2002:a81:3713:: with SMTP id e19mr16697967ywa.224.1544534475819;
	Tue, 11 Dec 2018 05:21:15 -0800 (PST)
Received: from localhost.localdomain ([181.220.84.254])
	by smtp.gmail.com with ESMTPSA id z37sm4358362ywj.3.2018.12.11.05.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Dec 2018 05:21:14 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 11 Dec 2018 11:21:10 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Dec 2018 11:21:09 -0200
Message-Id: <20181211132109.26344-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] curl: Add PACKAGECONFIG to enable NSS support
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
X-List-Received-Date: Tue, 11 Dec 2018 13:21:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-support/curl/curl_7.62.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.62.0.bb b/meta/recipes-support/curl/curl_7.62.0.bb
index 2baab2b503..4229fa39ca 100644
--- a/meta/recipes-support/curl/curl_7.62.0.bb
+++ b/meta/recipes-support/curl/curl_7.62.0.bb
@@ -42,6 +42,7 @@ PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
 PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
 PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
+PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver"
-- 
2.20.0


