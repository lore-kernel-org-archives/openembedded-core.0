Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1B565CAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 20:29:17 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so4454842pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=nA2/9GSsUHSH6XcfWFBO+DOhF82M1PkR62RZ6THN2fM=;
	b=R2w20QBHCGZaqiI9aE5JIlXfbGbIQPYSilIiktURf5ehcyHdloW9Thsq/6vsPal6U1
	/RMkF7Y3V9Bn1ip+mLQI1UKj6kCFyc1/A6c5OKPLHHvh+Q0f5Kg6HcKE3eh8lk9nJcai
	ki6Dx06n7lHN8vKYm8Zt2pjhafWh/wsl+5H/cWqOw5bs5YxTuD3UeYXCR2ZF3vf9dgg/
	xw9ZoltqoC7ni/DXUH7iszDGebhfSS92JbQTQBGB3JXuTrgud/M/uY/AWzpoes3Tck19
	rA5RacqkcvlpUpGTmjDXkBqrDBMw+EQs4uW9c6eSLupAcp0nLzlDF3ahn6jI5+mSX3f7
	Djvw==
X-Received: by 10.66.228.106 with SMTP id sh10mr415957pac.108.1414009757897;
	Wed, 22 Oct 2014 13:29:17 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id k9sm15031331pdj.41.2014.10.22.13.29.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Oct 2014 13:29:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Oct 2014 13:29:12 -0700
Message-Id: <1414009754-26738-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Update timezone recipes 2014i
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
X-List-Received-Date: Wed, 22 Oct 2014 20:29:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Armin Kuster (2):
  tzcode: update to 2014i
  tzdata: update to 2014i

 meta/recipes-extended/tzcode/tzcode-native_2014h.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014i.bb | 10 ++++++++++
 meta/recipes-extended/tzdata/tzdata_2014h.bb        |  6 ------
 meta/recipes-extended/tzdata/tzdata_2014i.bb        |  6 ++++++
 4 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014i.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014i.bb

-- 
1.9.1


