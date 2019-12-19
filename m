Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id CE0857FDCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id b19so5405959wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LSgUstcpEviy1XPwVgDVdICI2AenJlome82KRk65xqg=;
	b=I7rkMxozQVSmG0QeIiMSY0IoVIu5gzU2io4E9i/zjwQAGUJ8cAk3ZKyGYIhK7oaNLz
	7dwlv/nKylGoqzCRKcWWTgWOSO2LZi51OCpdyu2o62YU110JgAX5C2C1OiIyD3IM87Dc
	HVUzCEbD2tJogV5aN7WUSYwkxlqWsbMzBTwIO8SF3l5rGpz9ACf+GxG0nETqm4MvsR9t
	ZQFHnwFySQ02QYEKNEVB7zvsPDIxU7mVkCSN0tW0mGBOHEu0UqVOBnhv7itPcm+YZqjo
	qrtqzBt/9NGiGILw3XLESBQskhxB03a5gsYOtjs0490YxdHmTmauXuyq72AcLe0retao
	g2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LSgUstcpEviy1XPwVgDVdICI2AenJlome82KRk65xqg=;
	b=pxyYsSKAMOz4ecUZoyZTEjpz/kj9+CTlJAA8FEFp1QFx6/RgIYw1jvmV0t6kks/gsD
	o5RYNVOKldMmG073vqkLf9ZwSRCta9sLMzJ7G2CRdiSHkkNfP3efHXE5J2bLrGlCPnqz
	HX2BF+OTUHH0Yt02L3pRzTyLxWra8A8vr97760JIAEF6mVb+4f+d5s/SxpKHFpdRmvn2
	NiqikVPcKaVnO+Y9V3jizwIbnRUblF/s/ZMzSXzkDAohjTBaXc5x5g3HXUZxv8SW3KZk
	m0by+327MQnO5Lyv/U44FCpjI2KpYW/ap7Gr/CLmSPCyxR5KgeoLr6PHXgWDBjm3sByz
	QmzA==
X-Gm-Message-State: APjAAAVB9c0dkkP/Gs7L7qEkg2Ghdofyr33kdTcsbHsgp3SFWRdFJrqY
	B9vkwuXipYp32WOnz9H2Sk9LcVs+vvM=
X-Google-Smtp-Source: APXvYqyqWRFo0dycz+LilmDMLCeAHRuZET9u3gvvtgKfbOyj2u7whWfvhg89zmICBjuAdHQaCbiOWg==
X-Received: by 2002:a1c:7d8b:: with SMTP id y133mr9734956wmc.165.1576761798911;
	Thu, 19 Dec 2019 05:23:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:51 +0100
Message-Id: <20191219132301.80034-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/16] bash-completion: upgrade 2.9 -> 2.10
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:19 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{bash-completion_2.9.bb => bash-completion_2.10.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.9.bb => bash-completion_2.10.bb} (87%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.9.bb b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
similarity index 87%
rename from meta/recipes-support/bash-completion/bash-completion_2.9.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.10.bb
index cd2c4cbba80..041af7490ec 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.9.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "60139333b25c4d54ad40323b701be130"
-SRC_URI[sha256sum] = "d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5"
+SRC_URI[md5sum] = "f376ae3266cc70017aa833c39b76f984"
+SRC_URI[sha256sum] = "123c17998e34b937ce57bb1b111cd817bc369309e9a8047c0bcf06ead4a3ec92"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
-- 
2.17.1


