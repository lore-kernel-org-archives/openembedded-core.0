Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id A44E860DA2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 18:34:46 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id 12so5358293pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8Rfe4oG5npgGSrnP3H3tN0kZi8IEL9hT5GU2NzZODQw=;
	b=tzoWsSLnaOm7zmkL51J9L115VlMEGc7XLCVPWtGEH1uB7RXc3selMEtlbcDkh0zjdq
	uHGYlh5lzzmfs+EQXbk720cxEQFXUAoPKSQicYyZEjalP27hfkHxhQ3pvsslmhP/Mso4
	qaaviCQmeUOnsiVEDKU+CqlkJd8YgObGM54Gz4Q1+6MjzpWgic51qkRoJJWGTuEwLDBW
	ikLeTRQ6WkhYitmdIPnBNYBmVcqH9pKOubxdTrDSwb3WM1Qq5idTTRIVyAI7IOxGB9Wc
	U4H2rojrEmqfX3DQjdCEHAjIGlLbP26sPuDYbxhvQP2RQMX9p6gTF/wI3BjhFqZpaKuJ
	kTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8Rfe4oG5npgGSrnP3H3tN0kZi8IEL9hT5GU2NzZODQw=;
	b=VbcVQm9N8SwysC5wayrW2FCwAe7cbe4n3kyYbVV4+5+SwM3A9lpfkqc85uDZVejnXN
	IZugFNFqxfL3MdQ5BLPSTiiqjFGn6ukj51NTMVutccyseIysHQSLOGF8Y64FjjLZnnNQ
	6NS0JtNboMQnP65Ns+CPxUmCP5S64Pax9WWe1KZuvKEzTFZL/lgPpkjlUPCOJ7+8/ahK
	eR+1uPz1CVOUS50BdYr3ByLi/BXxxlJ6TzZwxqUSL2iKyot/j0uTncbq/l/a5Vr9WEbp
	fZtbkuyXsqT6Tfbu1zJVM0B4TqDWNaPy4mykAPe0uBGTeMKfievwv1Omwffk2f9Eijkg
	1L6Q==
X-Gm-Message-State: APjAAAWyUBlsylDqUJKy3Umzb0fpWxJdg2P0oYl8HrbgkEw+NkFf+48Q
	I9gEV234rssWT6KvdbtbRyXZuzPHhuk=
X-Google-Smtp-Source: APXvYqzaTKaPX+UpIq5Nul1ZqHatcM+TsihfisEB2LSbUMJG10BAkl8BBPL5SZbuNLSzVLjdUJtWEg==
X-Received: by 2002:a17:902:502:: with SMTP id
	2mr19793548plf.151.1580668487238; 
	Sun, 02 Feb 2020 10:34:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	y75sm17949976pfb.116.2020.02.02.10.34.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 10:34:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Feb 2020 10:34:48 -0800
Message-Id: <cover.1580668334.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Update musl, netbase
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
X-List-Received-Date: Sun, 02 Feb 2020 18:34:46 -0000
Content-Transfer-Encoding: 8bit

musl has few more commits fixing NAME_MAX

The following changes since commit 2b9781da7c6d60f8d0ddb36de2666b1ba702f551:

  opensbi: Remove dependency on FDT (2020-02-02 16:57:21 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (2):
  netbase: Upgrade to 6.0
  musl: Update to latest on master

 meta/recipes-core/musl/musl_git.bb                     |  2 +-
 .../netbase/{netbase_5.8.bb => netbase_6.0.bb}         | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.8.bb => netbase_6.0.bb} (61%)

-- 
2.25.0


