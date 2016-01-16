Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id F1EB560667
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 00:19:07 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ho8so141384583pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 16:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=hil6KzGH2polDPeCKl+C+uHNGdC8NdP5C1QQmfetyd8=;
	b=xEhw+foFS+CBtCyeg4MJkUW3I13XOswSyLuW11AHj0y2MiaQSTdbPIO18xC/twKjdL
	zl9+uV2CUd+f7QtLTCnVn/YPCAGbz/z9bUlyEUrSj2I0R/Thz03qG13IPaerKVqRwzt3
	UV7oH2j1h5jMi1lerVdKxY/zmjDjAEuVi5trJ2Xtq8r+lDLcDxbSsfv0/j7mQKSORZa3
	NvZCDA2ZAXKO77hWnZi30ECiBX/tVGKoh4ZDy8DarLx39MGwS34aFTc4m1WJruiggGG0
	fEim+gUj0PpK1tFvl1vl4XZd04pD2yyVOaIC+FGtjxRppIzvIIZUWgCLa5yBh35vHnH/
	p8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hil6KzGH2polDPeCKl+C+uHNGdC8NdP5C1QQmfetyd8=;
	b=GdiXl3uGvPVWJl8p2gIwWMcsha2TBYt1MTPg99U/vMtssMK9YFDKs2WnFBQQQll8Db
	Rn5ND/R+vuMAIqiZ1KzLwzWcCbo+FE83auDmBhN5TzwWW6ISyncCeKLyaA28c4gYe7jK
	wAYK3XnEh0yA0bv7rfJw4je/FPAWPilCGxhdzhe5yhYVecsdmS/alh2bkBBGsRxWQ2O1
	0/yz/Nog357DtcRbTIl0TOjo44TZrULOwXV20b6DwnFTX4dSc/V5Q35Ei3vyNGVdHfU0
	d/JCRSN+CK0SLA4ChNCGjN1RUEQQhnV/sjzN/vRD0DsZnYoYr6Votwt6JUtTd13vDtWz
	lyhQ==
X-Gm-Message-State: ALoCoQleGV5r9YijoDuR7pzF5Si2/HuZeAm8ojKZzmhtPb4VMg4mR/bnll6rdI3kX7haj57kUBi0cst2HDXzHLpRx2Q8GhKNZw==
X-Received: by 10.66.186.170 with SMTP id fl10mr19236349pac.134.1452903548536; 
	Fri, 15 Jan 2016 16:19:08 -0800 (PST)
Received: from bigIsland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	dz6sm17904479pab.19.2016.01.15.16.19.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 16:19:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 16:19:00 -0800
Message-Id: <1452903541-19597-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH][master][jetrho] openssh CVE-2016-1907
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
X-List-Received-Date: Sat, 16 Jan 2016 00:19:09 -0000

applies to Jethro too as both are at same version.

Armin Kuster (1):
  openssh: CVE-2016-1907

 .../openssh/CVE-2016-1907_upstream_commit.patch    | 33 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch

-- 
1.9.1


