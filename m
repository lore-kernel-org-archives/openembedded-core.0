Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 78BEE73193
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 22:29:18 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cm16so29779083pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 15:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kBuYGvJYIhlp+SEB9fBmg4nvramL/4M10Hearf5KaEk=;
	b=erhVbJVo66PTZISWUea6XowSNpzHvNJGCPrzEeZQDi/N/TgAvsIiOnFlf9qro+w60H
	R5vYPENzKWogUPRdjA+ZbVBVAQsa8oOwOWIZwOyMqgra1FT+XhWTzgMwrrBpaYwIL+MJ
	bbRT0rbUs+Bj5xvHMXKec3J3AWR6kQ8s6P5Idbz35XRCkEjwQk76npaCVWihqnGrePcw
	EmByp9i7iYItZEy0ALE/O27OiMbGm2GDB3v5Q6yWEuA457xLmkwy3R9acV3r5tayPnXh
	yAfgxsJ28UCtK6xZqeOEvnh2UdMRlvlsQgY/m5gETW0IkuLemquMiHKGYllMf6J0p52u
	SYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kBuYGvJYIhlp+SEB9fBmg4nvramL/4M10Hearf5KaEk=;
	b=h/KXgB9qCdwfXPG4bJQ0NkPu9GCSQFByghaeRTvi/ZqKkAchYTfpLXDU2PVssshaIt
	KOlXcnjkCXfYPMXSFEWtFMM5eTqtQZiwNXxXF2s0tVYKyn77GAArxgYd7AXaJwSwnlwO
	QBpz6qavfr+7yGafO2RJmQGQGxRx62OKadjD7wZLaYXy9cGgZ1uws8GMspO0CuFJqG9z
	1V1w1C++qyxYwp2EqE3AOgoKXAegy+1ShZETlugyfJs/bNuTM/cNlnol3p2I8uzClDkB
	oqBXFjnVYyE+6xJeDw8mJkzYIXTzr7jPnpFwET/jvnK4I31dBNUBnItUm7k64ULAzw0F
	jhEA==
X-Gm-Message-State: AE9vXwMsVXcOKFT1c0SpBe+XCDAx0207metMTmcoEaQmHmtS/AATodSr5JljsfNXLrOnBA==
X-Received: by 10.66.218.39 with SMTP id pd7mr26853933pac.9.1474064958855;
	Fri, 16 Sep 2016 15:29:18 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	c66sm54410269pfd.24.2016.09.16.15.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Sep 2016 15:29:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 15:29:10 -0700
Message-Id: <1474064952-21753-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] dropbear: fix build issues with system libtom libs
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
X-List-Received-Date: Fri, 16 Sep 2016 22:29:20 -0000

There are currently no libtommath or libtomcrypt recipes in oe-core,
but they may be present in other layers.

Andre McCurdy (2):
  dropbear: fix -ltomcrypt -ltommath order when using system libtom libs
  dropbear: deterministic selection of system -vs- bundled libtom libs

 meta/recipes-core/dropbear/dropbear.inc            |  5 +++
 .../fix-libtomcrypt-libtommath-ordering.patch      | 48 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch

-- 
1.9.1


