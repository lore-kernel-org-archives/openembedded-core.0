Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 518CF7EDF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:32:05 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id t5so10493503ljk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=55vlbBVRJJiIGRQVAqNx4N34i9rTdAM57Op4OK0Byg8=;
	b=erVP84084lA5uC3hJaZpaPcLydXRy8Q57AP6VKEw0Yoz2IHLXhlPFyYmanCvwvA1TS
	WtwE4hDoK9C86w0b2iof4SK1cA7t3CBwzaVjtxiyk05bBjEi5qkvgB4m/cAcvWli7qxs
	WBAppcTQUpBlhYvaNbR6iF7zPehXXDT9CwzeZTtwVwRwztcjHdhvB5o46izu0NsUqdLi
	BlNPZ6R4UMLSksXIx2xWlEQLa5Wl8+QsmMW36rkT5yFafCeA5vQVLmWLGF6A9lNRV+DA
	NB67urtEtvP1ajKSLzE6PyKKpgTe+xYYcgV/DxnzboHRwv/IPwpqbcc3jigvJ8hP3c5N
	AYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=55vlbBVRJJiIGRQVAqNx4N34i9rTdAM57Op4OK0Byg8=;
	b=DHEtMXHDPzVn/XB4CVqWXE66/PcZh68aimv/bemXQYw7IYfQBDxOMNhVmlBpeTl3Ed
	l6V/xxhLsp9rA4peYlo5X1na42zPw3oIdvUaSKDjhmONd80raSkG8OcxOvOva8b/YQJL
	GcR8MFL6uCdUEe9KtirJRUsAgzOxaPJGeyubrO0I8BrUkffsrf/fG0eH5OnBc5aIdg26
	Bk6KgUchzcJZR4OKqjoCGHlOfSBfd2EPWsaRYu4v0gpgBxzUyJeOYRyX5yOHcmHV+BF6
	JTeC9CR6YnpchkghX/YUYm55L8y5byPrH2UGZLAUhAdv0o+JyYP65p1WNQO/qphct/Qm
	WZdA==
X-Gm-Message-State: APjAAAUJ18NlWWrRKZPnHTbSrYOpPIwqEtCRJvycqNQPVRV4QAdOUvC5
	talZIfe2LHrigkWHWY/vjPWgr3Eff/w=
X-Google-Smtp-Source: APXvYqzCobEjftqq5J8LLcLUezRiIwUO4q9sTjhzdhU8zS2BJyDt6iC6YEljm0Kn8sXjHg/NOidycA==
X-Received: by 2002:a2e:3505:: with SMTP id z5mr7858538ljz.126.1572618725242; 
	Fri, 01 Nov 2019 07:32:05 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.93])
	by smtp.gmail.com with ESMTPSA id o5sm3626226lfn.78.2019.11.01.07.32.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 07:32:04 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2019 17:31:46 +0300
Message-Id: <20191101143147.26812-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 0/2] fix multilib issues with UEFI bootloaders
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
X-List-Received-Date: Fri, 01 Nov 2019 14:32:05 -0000
Content-Transfer-Encoding: 8bit

Last UEFI patchset that went in broke building not-native multilib
images (like lib32-core-image-minimal). Fix this issue by listing
systemd-boot as non-multilib recipe and by fixing UEFI app naming in
multilib cases.

-- 
With best wishes
Dmitry

