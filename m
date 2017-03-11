Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3575D7770D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 21:30:10 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id v190so54524058pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 13:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zurphGDh7NC9jcm2TvAlGofmWSvZ68AOpU1cc02Z2s4=;
	b=m2B2VptdUUgz2SFg2llYgLBtXRnOUs5ahNrm/8lM7Wc95jSCVogdiuc9ueNhx+601r
	kFgaO924Xi8nbeMVYoCDlpTr6U21TLttDVodviZwG2+ecZXGIQFvg9bnA7LJ0z6k/O7D
	0nTWuWouDko6dvAro4id2us2IW+081xN8w2NsapsRFNot6dUYbFi6WB1P9ALYeIRXJgi
	0wfoujW2YcNbCWkyHHL3Z9vXauuM08jSpCBG+19uZXXEdHwiXtV2GKEZD4nNo88jTG6B
	oGpja5HQF6TU3ZSZ7boF1oHWSbWQueBcPDy1OVkulRhJBotjQyGJdETSlzk9o3mjdfVt
	chzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zurphGDh7NC9jcm2TvAlGofmWSvZ68AOpU1cc02Z2s4=;
	b=pKBTcnT1NwfPAI9JTnM5hFFOKGFXKYpx85oZP+noWDyH1ijSgnU4n4Lgyqc176Ht7l
	jzxYJMyjEpY/kYMryDD1CbeTiOCQati986eLCsWlk99BToosmx9++MMapWTyTIX/9FZL
	KOZpTfeEI22f74wlylGmdSuxxszLpPqEzTAWoKo29/8PB2rY5MM1im8s6XOey0NtqK9a
	5NaXiQPu5iZfFvk1NJt8F9PU7SQx03TdBKc6MkcVvXIZA+ZY17pwPw0l4pm7yKfu0Qrt
	BSY0jRaokvGRycC4Ql7JgVgHSubWhjnwgEbrdKvgg/nw26WrO3MYYgEwwcJA04VoL9HM
	vN/w==
X-Gm-Message-State: AMke39lTqDDiVkJ3toLfDl/ja2msmF6AoPm0+ESqMMiJvlwkIlv0XvdPhJxpLDc4bshWIg==
X-Received: by 10.98.56.2 with SMTP id f2mr28920602pfa.130.1489267812401;
	Sat, 11 Mar 2017 13:30:12 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	x2sm25702137pfb.49.2017.03.11.13.30.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Mar 2017 13:30:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 13:30:02 -0800
Message-Id: <cover.1489267743.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Sat, 11 Mar 2017 21:30:12 -0000

The following changes since commit a47e64d985a610535449730806651f5bfd75d9ec:

  libcomps: add a recipe (2017-03-11 16:08:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (1):
  mesa: Contain configure search for llvm

 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.12.0


