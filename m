Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4416176F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:16:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so5950333wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 12:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5N0YV7X6PzGzrI9CreFmoX69lkh1WsufwFCcxR00Czk=;
	b=obavUE4FC+pJXYjqLnmjHMzi0F4oSpcEEtqHpCNEP/2lUV1/DnltkbqSP6j+e9uTvr
	vIOKUezTXmKU+Lj4hjZ8GtV6IZgIZhyT01FLgQ+tXa99zSGjfx+htnkcT8vjOGRMhOrH
	yPl+oSQLTyTlc+gDgzYpBAIyjZdhpfdznqa6sa1OIzybdxLk3dYVhnmieWM1BWU743Xx
	94XKO2gVdra28f0kQOWnDbM3POJQymVz/byCCRObc1EpInQ0m4rJDBmqn0n3beZSM1wY
	4+4pfQgUeXCXQZOfYBnuFrvcGfbAjNFX20QIvn+w77Ful+p1AyDXCEm4/ESG7mtpZyzP
	VCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5N0YV7X6PzGzrI9CreFmoX69lkh1WsufwFCcxR00Czk=;
	b=ZlcVoregkaC7sRL/JoNPr7iLzdn1Em1nmlqg+C9z9Ha8dy/4cbMCONDlIAQXgixbiP
	qNiaJTHoOnkbJaianh5Tdsk1r6wrtiYB34wh4c6yKh1HFwvcA9ZaYnbwRLjRI07vD/fv
	mT4yH0WZRI048FFsnrjWppqzr0CUlsq387iMku/qFDfrjbTw7BiBFa7hhdoq6lWbeH5x
	1/1LpTdmJ1KQYuThSCbIvIsBXHXitBG8dw9PPp+64fJ7KRYEci97DGvFkXCaTF9m3HiR
	5wOxAyiA/xGj2+xGe3A6MSkx6+W6x3hDcxy+tVcwxZJ+B1h7q9a8gGWY0Jfkf9yRt1w1
	b8vQ==
X-Gm-Message-State: APjAAAWqHuF2uX1RMPXZLejSADa0LgtokH48ai3zvToLZqs8KgBwVbtl
	DSxWsmc5tYY6Gq2jsF5jQXsWfz9O
X-Google-Smtp-Source: APXvYqy9sQRSbuivHhz49DLgIw/yx+rY26VJBQoTVOPuQBFB3qCUxL1fWuRE6bxtHJgeFBW8D3+vsg==
X-Received: by 2002:a05:600c:2056:: with SMTP id
	p22mr5279731wmg.136.1582316190388; 
	Fri, 21 Feb 2020 12:16:30 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	o77sm5531431wme.34.2020.02.21.12.16.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 12:16:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 21:15:42 +0100
Message-Id: <20200221201543.4364-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/2] jquery: fix upstream version check
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
X-List-Received-Date: Fri, 21 Feb 2020 20:16:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/jquery/jquery_3.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/jquery/jquery_3.4.1.bb b/meta/recipes-devtools/jquery/jquery_3.4.1.bb
index e1080aec1d..1bf6ef5c98 100644
--- a/meta/recipes-devtools/jquery/jquery_3.4.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.4.1.bb
@@ -14,6 +14,8 @@ SRC_URI[js.sha256sum] = "5a93a88493aa32aab228bf4571c01207d3b42b0002409a454d404b4
 SRC_URI[min.sha256sum] = "0925e8ad7bd971391a8b1e98be8e87a6971919eb5b60c196485941c3c1df089a"
 SRC_URI[map.sha256sum] = "8da74aec0fcdd7678a2663b3cc9bafbaf009e6d6929b28bb3dd95bced18206f6"
 
+UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
+
 inherit allarch
 
 do_install() {
-- 
2.25.0


