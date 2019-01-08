Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 508466BE3A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 20:42:57 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id c73so2465749pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 12:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C+T6feZr2kTYLWllUAZFCNIEGsh1oPMs7FKXT5JE5gA=;
	b=S118kVYHCozjD8DRLUU8qHngLJb1soXv9EXEoOSnqnOSk5iBJ1GSQdz4EOX1a4d9zI
	W2VanqE62wtYJLJibXHUE4Y88IBS/kqJlXlJgW5uYQuGJ8IJknEMPzlaTeKM97XQ66Hy
	Bc9R4qNm94ZD5p03+UIrOupciIg9GZLD++EiaAr9DSARQ0Ce5HugHvksbxo36F1VM1zs
	y7hTSA86HXBRarR/olbYnGR5qznNpyXpZFTdEhyHUYZ6gBsYPpYfOvwAA3p+YueaL515
	IeqdwXzJYElqI5a+qRIjcB/cnGpEyJPygMSiHKRrEeTj0g1sNbx7dmWBEAIwWPqmLHC+
	5eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C+T6feZr2kTYLWllUAZFCNIEGsh1oPMs7FKXT5JE5gA=;
	b=gb2ilgeb4kIA0fSsD0giQXRY8ovYXSCu4IfWQC5QbrY+DD/YhVaNkKiTlHCjCDa5YH
	Q2bYkP6+Eai4iFg77xnIAQIZExyfzv39raebxMXbrfPjgekpLuutv0dua4W1yDQKbcsK
	Rd443TzvP8KEaVIssMs442p0QF56K1DXERrg3BVjjQKb/AgiQctwVB5e6dL8OoOcZZeZ
	YLFugTBZWnUKsl8fZgrHMK+avki5NOCV6gpM51slRTsH5ULXanWTMXzI7mrJ/ToYJ85y
	NR8QIO4WFV1giZAmaQVLpMEIhJbwDjwzDHLYxZvHS82gswpqlAZZ+/BS9PSNLYGt3xp/
	Q7DA==
X-Gm-Message-State: AJcUukdU2AvtBDWGC83ud6zUxY5QnkLqnO+r8ak5xY70JXpNblgrSvdC
	x99nrRYUDUtnY7WLLjnmi6y1mV3u3B4=
X-Google-Smtp-Source: ALg8bN66T8eNwOc5lc47+ktWSCVj5bKKu7PrEYbZIqQBOTlIk/CV3QUKfJuySRu2l2kD5JZGaVEuVQ==
X-Received: by 2002:a63:a064:: with SMTP id u36mr2874016pgn.145.1546980177765; 
	Tue, 08 Jan 2019 12:42:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	t5sm109789607pfb.60.2019.01.08.12.42.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 12:42:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 12:42:47 -0800
Message-Id: <20190108204249.8087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] musl: Update to master tip
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
X-List-Received-Date: Tue, 08 Jan 2019 20:42:57 -0000
Content-Transfer-Encoding: 8bit

Detaild log
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=21a172dd36cae7a08492fd3a7500d7bf0daee13e..de7dc1318f493184b20f7661bc12b1829b957b67

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 33d6e69130..cba4d06766 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,11 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "21a172dd36cae7a08492fd3a7500d7bf0daee13e"
+SRCREV = "de7dc1318f493184b20f7661bc12b1829b957b67"
 
-PV = "1.1.20+git${SRCPV}"
+BASEVER = "1.1.20"
+
+PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.20.1


