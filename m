Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2C47F6AC0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:10:41 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id y13so10289384pdi.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U1UmYfFHp0jtSZy6D2GykK4ZtwLaw+excZXt3xDG7eU=;
	b=y51/LNVQgFGiRQikouVpwuxvBUfb3KQnbX/NWA4iCDkQRTJsuvHz4nBytykPhPf6RE
	neYvl+j2F/9CRnAx5JtTi65912DqSEj3gt7B7UBI2/Zqgkac9dZON1et1e0/bH8A3sUv
	eorFNLHuWftyIqmsa4aAKZvROSa8ibmU0XTG6U9A+WFb/kHB+sL73IT5d03L0Xui95dY
	yzJjo4YS2mn1yisYu8zIurncMYGtdSS71eWfSFWMFibuBGu2LUmVsU4Iz9zOrkVzTwIZ
	/TjhBRvIhtsu231dGK6qoBvIySTKY/YOuKKryu9PcNb13azBmYHlZATJpP1muYASDdpf
	z17Q==
X-Received: by 10.68.57.140 with SMTP id i12mr40986417pbq.115.1415718642460;
	Tue, 11 Nov 2014 07:10:42 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	mi8sm19562178pdb.91.2014.11.11.07.10.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Nov 2014 07:10:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 07:10:33 -0800
Message-Id: <1415718635-25408-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] update timezone to 2014j
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
X-List-Received-Date: Tue, 11 Nov 2014 15:10:51 -0000

These are minor changes:

Changes affecting current and future time stamps

Turks & Caicos' switch from US eastern time to UTC-4 year-round
did not occur on 2014-11-02 at 02:00.  It's currently scheduled
for 2015-11-01 at 02:00.  (Thanks to Chris Walton.)

Changes affecting past time stamps

Many pre-1989 time stamps have been corrected for Asia/Seoul and
Asia/Pyongyang, based on sources for the Korean-language Wikipedia
entry for time in Korea.  (Thanks to Sanghyuk Jung.)  Also, no
longer guess that Pyongyang mimicked Seoul time after World War II,
as this is politically implausible.

Some more zones have been turned into links, when they differed
from existing zones only for older time stamps.  As usual,
these changes affect UTC offsets in pre-1970 time stamps only.
Their old contents have been moved to the 'backzone' file.
The affected zones are: Africa/Addis_Ababa, Africa/Asmara,
Africa/Dar_es_Salaam, Africa/Djibouti, Africa/Kampala,
Africa/Mogadishu, Indian/Antananarivo, Indian/Comoro, and
Indian/Mayotte.

Changes affecting commentary
The commentary is less enthusiastic about Shanks as a source,
and is more careful to distinguish UT from UTC.

Armin Kuster (2):
  tzcode: update to 2014j
  tzdata: update to 2014j

 meta/recipes-extended/tzcode/tzcode-native_2014i.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2014j.bb | 10 ++++++++++
 meta/recipes-extended/tzdata/tzdata_2014i.bb        |  6 ------
 meta/recipes-extended/tzdata/tzdata_2014j.bb        |  6 ++++++
 4 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014i.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014i.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014j.bb

-- 
1.9.1


