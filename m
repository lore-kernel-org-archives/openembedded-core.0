Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B10078211
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:52 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i14so1642437qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=emz9hTAFlqzX/QrubI9T2Zbhu/6kD0RKacMb6PXSYeo=;
	b=SFMdg9tTmaHUV2wUiXOQb3prCTNcdKnti3wgqCOXXoPvcXrRzTiX0lAyX7BsU3LQKN
	o3FPv6OQ5IX+h5QdhNe0hRS7T+ZyeYMbblYS+SH6pzpWREc0vi7FqzE4q6UeQEroC7lS
	NHlNVxQJrl6Q2Ev/ksiRpCfO5HzVU+/vUNHLaOUXm6Q68/Ek7+dx5TghykAoH4bzW6Tz
	2FL2I/PF++Lgyr6ctY2Q2FYgUwjxgPiXQANcHypBN0aYbGICJR5uYsppKHjJrecjUrK3
	8VgjCwx2QLfy0D3QNlW9H1livwilOyAN0kMCvK6+9gPyX6yOoN7glS9RhkJvt5fOcM5i
	yKrw==
X-Gm-Message-State: AHPjjUhc41bHY/oTtO6Kgruxl4/lswQ9WCHwpAPzwbg1XX28g2XQzoHN
	qjJyoKacpAPwdmFA
X-Google-Smtp-Source: AOwi7QBR2URevg5ss9i/alyPbS0KQOw2FJjyM66bLzK2J9D7dMJDJg4aLLCFEtA/Jas/COQnH3HBJA==
X-Received: by 10.55.16.198 with SMTP id 67mr4302906qkq.116.1504881954104;
	Fri, 08 Sep 2017 07:45:54 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id k20sm1309290qtj.2.2017.09.08.07.45.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:53 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:48 -0300
Message-Id: <20170908144454.14308-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 06/12] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Fri, 08 Sep 2017 14:45:54 -0000

This adds support to return the proper ARMv5 format.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- rebase on top of new "goarch.bbclass: Replace logic for setting
  GOARM"

Changes in v3: None
Changes in v2: None

 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 0f0d8b6a60..0c22f80518 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -50,6 +50,8 @@ def go_map_arm(a, f, d):
             return '7'
         elif 'armv6' in f:
             return '6'
+        elif 'armv5' in f:
+            return '5'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


