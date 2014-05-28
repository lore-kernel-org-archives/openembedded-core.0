Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 108346FAA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:21:41 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so11639502pab.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=XN9bkmSDjeJzbg6gBJ6136qpL7ZyYxYfIBX5Y8nVggM=;
	b=vgSl6BpbUxQ9DKziKymlur2RIyLMGd8eacze7gGNi+nXFCrHUDw8NnurGNG3hdNdRe
	+lhsNtoSmYCZyhSU4QxIJvr/QtBDE4LbF3ie4fW1HRIS4qLAHfZBzwRIi1VWSwFqznFI
	8SJmL9GbwUk9AZLJR1gLlq+1enwsidQUlRwAd2SRu2rlQpo8gxk0AVet8PWfSIkVmJZl
	i/zmt2DnYC8NFPObBZZQOLMaFZkqkV5p4mIrw0blVft9JwSrE5RQBGFbA9rsp42noaKQ
	62lYyJoTWx7aa6mU8Wh5T90BKUQDEnCtAuaWGaDAwDRD6EbSRkHUXh6gSiZM2HiwYz0X
	UeXg==
X-Received: by 10.66.147.99 with SMTP id tj3mr2901205pab.47.1401312103048;
	Wed, 28 May 2014 14:21:43 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	ie9sm93807694pad.29.2014.05.28.14.21.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 14:21:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 14:21:37 -0700
Message-Id: <1401312099-4247-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2 V2] Update timezone files to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 21:21:43 -0000

This updates both tzcode and tzdate to latest

V2: License correction
    Solar type correction

Armin Kuster (2):
  Update tzdata to 2014c
  Update tzcode to 2014c

 .../recipes-extended/tzcode/tzcode-native_2013i.bb |  26 ---
 .../recipes-extended/tzcode/tzcode-native_2014c.bb |  25 +++
 meta/recipes-extended/tzdata/tzdata_2013i.bb       | 206 ---------------------
 meta/recipes-extended/tzdata/tzdata_2014c.bb       | 205 ++++++++++++++++++++
 4 files changed, 230 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013i.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2013i.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014c.bb

-- 
1.9.1


