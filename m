Return-Path: <ulfalizer@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id C11C071BCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 18:30:33 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id f128so14182172qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kPaoWaTSG7nGwoGrpnQvTYv73w/NhRYqjxpTFCkv37M=;
	b=dOgzzLK/T8xio9OpLcihiK92cwYS0l8eSGG9Yvu0/OAqFyJzzXbfkX8hPgs8WkzSXx
	B84FmI0IB+9+fGJ5JOIy+IP4hA+Dzlp7tR26PRLZ2dnavT5t52fcDcyO6HJgmnqJCGZF
	lfMy8wkqvX6k5duyVYlEbnjIhcMaRPSFbqIsMX8aFY++NvSCwvx6RT4iVqwN8oy4QRc1
	k1AwLYsMEw6L93esVOGEiF2UnueGhFoB/OTgmKdHuVke7HR6c8hvNIoZnqVlkqKDHMcc
	jenvLcsHORafyTHQCMWOQyGYEz1mfW7dzMQdzaU9Hm8HSVoYdUKMk08HSmpawR1qymCf
	xssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kPaoWaTSG7nGwoGrpnQvTYv73w/NhRYqjxpTFCkv37M=;
	b=eJE5FRMuzLl9FW6Bq3aKeEQ5jN1LrmZWQdPYoEDnh9pQ59O8HbHHla6cf3lj9sq3FG
	k0TxX1hufOiTavtcVzSuPmp+u2mn0UEq/CS8+mLPANeUQ94vthTheMqmIejXOaB4ZyRs
	a/rvDYDQoWfbpALb+zTRdEgJZQLhCTGq5LBcktfg4EvNKXWTuKN8ifvEki6+JAPR5L58
	Ro3XXof+r3eKVW+r8/ZFS6VvUD6hmk+CcsBJg8xU6LFAnMH8gtX2A7+++wAV31Eczxz/
	9WuDyxpOIOB1KMBbKL4czBUWVr8a41m/As7a5LPQBRuNFYcsOaS3T/Qj/8yXHXTzoaWo
	jx6Q==
X-Gm-Message-State: AA6/9RlH+pM+0JhJDlUSJuNiodxaJMZJiRk4QhOAiehBCAFPTwVeABWVn37fLEqfYy66uw==
X-Received: by 10.194.175.166 with SMTP id cb6mr11909983wjc.84.1476729035219; 
	Mon, 17 Oct 2016 11:30:35 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:31d2:84ae:c5a7:750c])
	by smtp.gmail.com with ESMTPSA id
	a1sm55188048wjl.28.2016.10.17.11.30.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 11:30:34 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 20:30:26 +0200
Message-Id: <1476729027-5072-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] bitbake: bitbake-layers: Make show-recipes show PR
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
X-List-Received-Date: Mon, 17 Oct 2016 18:30:37 -0000

Changes since v1:

Remove now-redundant default 'pr' argument in QueryPlugin.version_str().

Ulf Magnusson (1):
  bitbake: bitbake-layers: Make show-recipes show PR

 bitbake/lib/bblayers/query.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.4


