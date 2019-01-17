Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id D0ABA7C1E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id e26so8310287lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e47//lSC7gbKWbgxZJQTNOKuuu847nE+6NKINKVbskw=;
	b=CXmGSQ5YbgzZ9gVO2bpv305uwkUxXzoQWEKaXt+zSii6Ri2EB1kea8j+oQwp3fwlxN
	vzkdzB6MngYfFa3FPNV1l3cNHdedUlf6Fy85jiAQcI6tKVeziHT2/6qSBPKatgSiRQZF
	ZHbd5i736P2M0qYhHmgG7K53gqSNRUOXXGs7kiFVIqoLYzS1jktMKful9gtVkHcJuHW+
	mPi/VZh3XkR819nQmpFl+ONv0W3gHAsdXFGROC5XFFKm8duMnc3/UPHyGxO/Xu636Kdm
	LGIO530rd7YXgiRy5d7yR9ZeweUBSwYUkc8LsW0vDV+c9yeFg/DXhzhkbaGMLsufe0DV
	TFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e47//lSC7gbKWbgxZJQTNOKuuu847nE+6NKINKVbskw=;
	b=hVKoPP8bcbuHaiP1xY3WGdkkmcUgrW1+50yhzzw9YZpmimizliWYpFBYADrycVWcJC
	jmZREp/oqF1BgXTXNdiqIEHeVboYl3xFlzObpjA34Qd/lxnswhr2oA6iWp8XiTLs3Y0V
	l/5/GI3oHzmyAxfMhN4GOXP1FYTvlY9BAYCYn4pMahGW5xGW+Qvbef2h3uDZJFTwag3w
	53NVnVgVm99jpFv/p8dEZyrWa0bR9Ye7gk+/HN9Zh59VUdcRFrdZv+30DUml6ghozhCS
	WYp011qjtEC976GxeQaP3/dENl+CHGA2ZIlaYytFFlYzhnVTRRZCsKoEM6Qt6kRCMfry
	+WGQ==
X-Gm-Message-State: AJcUukdCupz24k6kKVCIUUotYEFP+gTF+vzrhZtCMJZpNh0TANETb3sP
	hBwhpDhuAcMcxHKOrIXmEatufsxW
X-Google-Smtp-Source: ALg8bN65gVlA/6xQRaXnRNQoUUiztz8BtDPZrrxw1DCK4V4ynoCC7J2tMs4o5wpdrAElorUyjnqHaw==
X-Received: by 2002:a19:d242:: with SMTP id j63mr11134518lfg.26.1547743235988; 
	Thu, 17 Jan 2019 08:40:35 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:55 +0100
Message-Id: <0bcd55a4c4b0edb814c300ce0c8822c44e4bc85d.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 10/27] qemu: drop --with-gtkabi option, as it is no longer supported
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:36 -0000

Recent qemu versions support gtk+3 only.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f943b9ee5a2..6db1facc9a5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,7 +95,7 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --with-gtkabi=3.0 --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.17.1


