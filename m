Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1CB7458F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:48:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y2-v6so2770298wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gZwKIrY3j2weMc69TDxZqrealVFCh0p03IfMh5YgEA0=;
	b=FMPgvitv+Zt5ekOC5gV8SVdwpMXq0MDMqaP7lZ8Y9coRLNgbkdqKwXh1j4uNkmaiAP
	lPTg8eTXzQS4iLTfUmOqbCLWMS98bEjXs2OK10mgkj0mLuqRJA1m+d12LWrYpUYWvtW9
	UrbSmCgOUkSt+lcJyxZKOPYguxq95KgQdUa2xoAAhAg/nvdQbL1w09WuKKIFMfIDCGFA
	HXyk/b+2Pm/1yzcOo34EL5ALbM19KpDFYIEfSPvJo1yRq6WCdnZJMuzQQdnpeWGEZ7uU
	7BpEYMYYIHbXgnFN3vMXPwPhMjLBFTCHO2CfAkRtaAD3Z4WCLKoC7dqDp+CzE2iTx+1z
	lJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gZwKIrY3j2weMc69TDxZqrealVFCh0p03IfMh5YgEA0=;
	b=gQWjt78A8Hvr6wmD6iD6Nb+oeha7qp1RUJbXw+i+4KiY/Tlse/Q/xyvvCtSe/FKW5j
	Iv3nt0qekFqh+k8T0AO/IAvcpix8IyVwhd72w90c1M6AZcBCg6G6a3uSaa5LVcUSIWH7
	cpOROUj0eoHcw8LEW3iNRwWW6MmBRQCjE5GOu5SFb43ATwxWcQua66UBv4f2ClsglrPM
	A2GgLhVxakCAMAKFqWAV3XQ6UYx+gO3RC5qUA4DXRBB0LQqtpVDspsUoGCSqe3nX6LeU
	qjavDEpuAkZQMeJ43qOZZUdr5sTEUlX179hZRtXTPAlqV0fqsT4uz4efkSlqIttzlvvH
	Unzg==
X-Gm-Message-State: ABuFfojfisox1vekiXV5PFJV605rRcXFaPpheXIKMoJOQNTLsTYI79z0
	zIIGY6QWiF52ZWgzkFbyfjzGvytKtsA=
X-Google-Smtp-Source: ACcGV61UeGZObIzzRu+oAfpzNaddi5ttOqVNRyO/sDm4de67MailaqC2Kucp3FGF401Ke5Kelqx4CA==
X-Received: by 2002:a1c:8313:: with SMTP id
	f19-v6mr2499443wmd.144.1537530522402; 
	Fri, 21 Sep 2018 04:48:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm6633180wmd.23.2018.09.21.04.48.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 04:48:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 12:48:39 +0100
Message-Id: <20180921114839.14837-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pseudo: update to latest HEAD
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
X-List-Received-Date: Fri, 21 Sep 2018 11:48:42 -0000

This incorporates two fixes for large inodes, which hopefully solves some of the
rare mysterious behaviour.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9103d491128..79e0b6bd21a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://toomanyfiles.patch \
            "
 
-SRCREV = "fddbe854c9db058d5a05830d3bcdd4233d95ee2e"
+SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.11.0


