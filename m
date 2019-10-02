Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 99BA37E9CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 14:09:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b24so7142246wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AshmLocUMg/GD3m5zdTiZ0KCetei9A1U99/68TEP4Ko=;
	b=Sui2PhqBRIp6AKE/o6TIgepqKGEvzhsD3vHUayjn+IhFWj3Ht711jEB/NXmGyYHcty
	MgH7v41QfDHhIlYetfNGDedIkrlRwIcXStsyBcrF8K1QLIULIKtEoHfJHFdIQOHhla64
	oVRQyqEf+9L7QjA/VZvQkfmvlQj8U+OYrbids=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AshmLocUMg/GD3m5zdTiZ0KCetei9A1U99/68TEP4Ko=;
	b=jbSO/LBLmHGRW09sgdPQ4dQkMGCOSe8rvgCXFMBDamsiz1GRh5tbaV/lSJUM+DMx1z
	Dt/fg/3vg/ZvhwTwKlQz8alrb/jfPVOTazAu5ai/tH/C5zhNEpUdgLF0viOikoH4a4BC
	VfEw8Sm2l3zy7gAyz68lVEcwUpPRus7L5M6RwcpYrJePD6znXsYLiHQZytxMfvnALa1j
	+FQLDOYoW62LvN2D9tqBwZHRWXfDR4Ou6EYOrVSTvYOQl85kN7XScUcGYdb7nQu3xKWd
	On3r+TgJw51YEHtAyxdglvw9yNhMUhj0znM6G92TGFoR6i271tELVXUVKA6Tqi+u3/Ud
	fvFg==
X-Gm-Message-State: APjAAAXa0qHkr+1gF/z0D8RJVAFZOijhWD8ATNB1mFRH7KStgHmU3rBQ
	rrt//mUDzNkkamR5OfXBL2XLcuvD7zk=
X-Google-Smtp-Source: APXvYqwqIw2D3a7xFyM/0nVrtSNYEczR28t6p4viqOPk1JXp0eEwFLxtgTJYpWoYMLOPGvITLUiSbQ==
X-Received: by 2002:a1c:6508:: with SMTP id z8mr3228833wmb.93.1570025357213;
	Wed, 02 Oct 2019 07:09:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o1sm2762026wrs.78.2019.10.02.07.09.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 07:09:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 15:09:14 +0100
Message-Id: <20191002140914.30358-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191002140914.30358-1-richard.purdie@linuxfoundation.org>
References: <20191002140914.30358-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] sanity.conf: Bump minimum bitbake version
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
X-List-Received-Date: Wed, 02 Oct 2019 14:09:17 -0000
Content-Transfer-Encoding: 8bit

We need SignatureGeneratorUniHashMixIn from newer bitbake so bump the minimum
version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 92e1886990f..8b2f6553949 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.43.1"
+BB_MIN_VERSION = "1.43.2"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.20.1


