Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9277FE76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:58:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d16so13534441wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bh/kJnV4xiJhOaLy2fp1+/+ZtOrdsTuN3L4Bn3VSlsE=;
	b=T6hFr+5cDsRfoEMvpvUk+3eQg7D86yYmpMMgrBsWgzmp6MC4STvCeneAPK/O1Ylqem
	Eh542+Csb9QxfrXv/h/Reoww4oUmww3KsB0X6iuRJhrgpbErVFL8R5IGivkoDiEgtB+c
	7uvXaYei/B7kc3n3q3lcAuKbZEQu0GKy5Qmq2fwz5e85It6p+EndmF9JTIlzwZ6RhGaX
	+i8FRNBzPEqvVqGr0MO+0VcpFznvDihx8eYR85uXAW4+9YFFQ0M11m3HVOHen0My3dlF
	rzrejLWCHzBEvMmKlBzgNvbh1/8DjuYOWgABqtp9tjldixSLY2A0r1w+ympYvzIrq18v
	xzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bh/kJnV4xiJhOaLy2fp1+/+ZtOrdsTuN3L4Bn3VSlsE=;
	b=avdb8Hn9pTyYSpe5+Qw/SZ9aIkfwttTetUN1npgOSf8KDxsG4VRCRFSNTNyd5rQesk
	VQfahIVDoThlSN/qFXbRvKEiJDmRo5JxavXgAIzJwdbUpHokhr33Dh0IPi0OAkR6sSyb
	OSsrArKOVijTnu7hNWIVzEEa1WDIC+vHO2aRHFO0MDwnkMAuCzOI7bAHZ+W21uBYpErg
	h1NCWoTHcY4Ia84hMUePdQNHUJRfz4ZPeirEki/zQHIUeS11pN3A7pKf+GHJeHXqnKsZ
	6b699SN8524KcI3F1SYFK9IDVCbYvNC7iMu7/3wOrgRWs7RXEcSbOudA5DS5MX0R6nBy
	aY7g==
X-Gm-Message-State: APjAAAVP9Gzk5EptuJMA0055eYJUrXihfZa+TGGb+2t4A+COCDujL824
	yHdt47MjJOR4SRo5eZF3W4616KFF
X-Google-Smtp-Source: APXvYqx/s0EtlYyimMcTdMxo2uiVCAdRRy2Xylb6RrDgB9ykGZmyPgmsybW8qrCIxu2Kf3g5lo6cYA==
X-Received: by 2002:adf:e70d:: with SMTP id c13mr23690562wrm.248.1580162335980;
	Mon, 27 Jan 2020 13:58:55 -0800 (PST)
Received: from cmtcleu60844809.rd.corpintra.net
	([2a02:8109:b5c0:3fe0:dc62:8512:95d7:1c04])
	by smtp.gmail.com with ESMTPSA id b16sm194198wmj.39.2020.01.27.13.58.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 13:58:55 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 22:59:27 +0100
Message-Id: <20200127215927.19826-3-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200127215927.19826-1-changhyeok.bae@gmail.com>
References: <20200127215927.19826-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] iptables: upgrade 1.8.3 -> 1.8.4
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
X-List-Received-Date: Mon, 27 Jan 2020 21:58:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iptables/{iptables_1.8.3.bb => iptables_1.8.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.3.bb => iptables_1.8.4.bb} (96%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.4.bb
similarity index 96%
rename from meta/recipes-extended/iptables/iptables_1.8.3.bb
rename to meta/recipes-extended/iptables/iptables_1.8.4.bb
index 96d195d9d0..cf1388ce9c 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.4.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://ip6tables.service \
            file://ip6tables.rules \
 "
-SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
-SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
+SRC_URI[md5sum] = "9b201107957fbf62709c3d8226239b0d"
+SRC_URI[sha256sum] = "993a3a5490a544c2cbf2ef15cf7e7ed21af1845baf228318d5c36ef8827e157c"
 
 SYSTEMD_SERVICE_${PN} = "\
     iptables.service \
-- 
2.23.0


