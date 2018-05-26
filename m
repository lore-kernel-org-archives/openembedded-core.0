Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id C9D0774812
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 May 2018 01:18:13 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id 15-v6so7975200otn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 18:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=79kSlY+whXlBEx1BE+YHDvWz0Adhe74aOijLuVYLoe8=;
	b=WikCQd1eNGvNlpFvS+l8VgJDeTfP4xNnJMcTgCfqTz9KwBCChijsJ4fevOcOO/qvm/
	2rIKDarlijANpWc5sTy/VSq7dtGfk/E62pjj+Shc7qMCt8MD4wB3BSLcK81IoKxRksD/
	5yeOAm+HkOet1JLTLtzt5QhwU/56+vPYpH2p5PHpixR8kiNstF33fM+s1Gm7qMp9EMkf
	AtznmkUIeq3B8lr7OZIPpf1eOhWNOiE6dfUE5+CP46CZKv3ZLaMTye4E34sSd6/OQ1K2
	18q8wvdrSZvKZbM+4qhI1kQ2UUdA+CFV3t0Hi9K69pI2Wqr4RokrA293Qjzu0LCXb1Bs
	8YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=79kSlY+whXlBEx1BE+YHDvWz0Adhe74aOijLuVYLoe8=;
	b=XjqZRoVbtaxvplL/GwI408yXO4IRm17ZbUYfeC8Q0YurDHMMbsg/zmB4EBby6UnvmZ
	3wtcfN/C3MUKcGF8x4lM/7S6PktPFvfAGoOGvgxah/facIcq4cIHk/MpfDnyYLeUofJi
	LXBHqkYEhNwOYfcMlhOQT3bUmVg2NlVu5lNRejsC4EZEvMdT8bUFvXCLt2qc817cjj6R
	O2oyzXmlzGS7QB4/RIPLcssseUU4Xi5I9zUcs4UcpAOh+A086pMtGP47wTbHiQgYDtMo
	B+1Kt9umKXSvJsb86p/P935DbLTzY2krN1Ouz3c1Y9SUldJ8pPyQYSpARRXh3ZCdRW2E
	OZRg==
X-Gm-Message-State: ALKqPwfRU+MH++rvZWBs+54Lr5z4iCC1zGzJN5drfJ1nRa73CSS2GRr+
	x+q0ygbCAmnMBGVtHHgLcN4KUg==
X-Google-Smtp-Source: ADUXVKIzfHcJl5hzN2GqortyWU80A1ueIIAKLdwfnEqRfczQL3NtgbqPFwEdi6O/mZHZb18ocsEAZg==
X-Received: by 2002:a9d:4a5c:: with SMTP id
	d28-v6mr2934547otj.48.1527297494507; 
	Fri, 25 May 2018 18:18:14 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n50-v6sm15726144otb.14.2018.05.25.18.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 18:18:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 18:18:06 -0700
Message-Id: <1527297488-19530-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] as-needed.inc: drop ASNEEDED over-ride for openobex
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
X-List-Received-Date: Sat, 26 May 2018 01:18:13 -0000

The over-ride has been merged into the openobex recipe in meta-oe:

  http://git.openembedded.org/meta-openembedded/commit/?id=e59a9738c24ccaeac91740d1f67c607d4ee2a217

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 9c23564..b163fef 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,6 +1,4 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-openobex = ""
-
 TARGET_LDFLAGS += "${ASNEEDED}"
-- 
1.9.1


