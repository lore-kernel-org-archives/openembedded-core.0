Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D329978F61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:45:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h10-v6so479694wre.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=EsJA/zxn2MWQ6kVwO3UebcfPjI6/gj4FCFnaBNWG8Js=;
	b=S4AQr87uhexRdueSu/AJtwDIRoxR60++nSb73sBa8B9gyc8/Elc990S6V60VopzHP0
	pdlorkBmyh95HJF+geiB7OMChxjRozbsmh3+By4NFTqwpPxaxglmmi8o4lvsz6+id1Mi
	yZ9z9dQWbmRoc7PqDpVWblZXbnaeoXd/WadUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EsJA/zxn2MWQ6kVwO3UebcfPjI6/gj4FCFnaBNWG8Js=;
	b=VMtwjBeje9ZASjaCcdAda8gIbF0gmGw5jdGl6BrFRvvIgRVr3CoykESO533Z8wf3OK
	mihGP7peYTYEKjvtIX4cQdmVq39c1EQh5WjGl1ScTMbMyrua1QAKlz++1mBjdoSfYT8Y
	1pjm1hI10tVDbCk/3bKVTRzNKWw3pZhtvEm6e26fuR134fM3mf/FQdLe+8iSzWc3fWNq
	b/8Bcb1qwZkijdNACuKS9dfRI5NT1rlTOs22u1A1iD2S0RzpNvF/vW7AVKD5qibGU968
	knKyJAvdlA5EpfV3XFIYyNJ+Q5f5eFvi8sE7Cb24sW8DRm7SwYagUlq+tBLCKnsBiUPQ
	lJxw==
X-Gm-Message-State: AOUpUlHDlWGRw3e0tIOwM5OfF+MIDxRy7n/uzW8iHZEpVJbE9V0iRzoK
	7Q7fy1VjPARkCt/tYQbrFBWyHVVXqpo=
X-Google-Smtp-Source: AA+uWPxOreLcR5wNVoLyxho3yIBgni/GW9hhwqIgNlvgRzWu4jA1gCNEf5X6yE74uld6EAMpgVF8LQ==
X-Received: by 2002:adf:a64d:: with SMTP id
	k71-v6mr15327806wrc.78.1534322736274; 
	Wed, 15 Aug 2018 01:45:36 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q8-v6sm17018076wrj.97.2018.08.15.01.45.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 01:45:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 09:45:34 +0100
Message-Id: <20180815084534.5433-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package_manager: Add definitions for riscv machines
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
X-List-Received-Date: Wed, 15 Aug 2018 08:45:36 -0000

Add definitions to the locale table for riscv architecture.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 06d1f09d9f9..858891ca211 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -109,6 +109,8 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
         "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
         "mips64el": ["--uint32-align=4", "--little-endian"],
         "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
+        "riscv64": ["--uint32-align=4", "--little-endian"],
+        "riscv32": ["--uint32-align=4", "--little-endian"],
         "i586": ["--uint32-align=4", "--little-endian"],
         "i686": ["--uint32-align=4", "--little-endian"],
         "x86_64": ["--uint32-align=4", "--little-endian"]
-- 
2.17.1


