Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9D27671CA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 05:53:27 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id i88so45108468pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 22:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CEaUrDTRLBnrhmYdG2MFCbaGPKAJpH1IkHE+YDvun5I=;
	b=OMK79PWKRBKbrL3ZbtTJHtNbhgBA2lAc/UbZEy9J6ahTxI90AmXdU/VWTerAD6kMit
	lZ4ufSgHFiSyI4FkDm01N9oyEkpajninsyyRCvSztcWtdkZldsk4VMU14zKrq6ZsKZIc
	c8f3c42nymdt6WvFlHT6eLJ8HwSKZpkzqVwT/FaTqLhlLmk/2QtOBq6fPCwpqn/lklMV
	BGP5h9R545nQpzZ7RDFnPY03h8CBY1rVPcl7dagC+JqkzcegJDviim39nr36ahEIOP/7
	4EKN9QxMgncoQT5PDOjahS2OF1wFqy6oUw+ZjW4ERjBeUwmRoODB6z3wNve5mK+ZJD76
	coag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CEaUrDTRLBnrhmYdG2MFCbaGPKAJpH1IkHE+YDvun5I=;
	b=QtmTO7eR1GAtEsXH80E2QfP8cw2xrptQqzfB9UIl9LKlMeR1O5iQIEK1LUeE2cglrV
	761PG7o+nERkQTPvF8vxZXJTaKvJ7UJazf0AwqpVUca4SI9vFoSzEMnFdZxaW0wmprXi
	iblERP4kGbPY7livf8kvRQ49U1+HcTEjaKtyCPo394MQZuGQk+4riKqGamVyz/qXoyiH
	WTHzp4X91TfGKu+8ESXrXv27P4Gzkw8iXxvJAZDjfPiBfQg0KAnzFyasTYB1CH/BKiRH
	ZQbpr0mkqgZkzEbzK5En3/5V5poaug8wyvks9oShdWyD3kTNnd9ir+nOk4kSp6nsQxsx
	UKyQ==
X-Gm-Message-State: ABUngvfrU0V+v12NQi+7sQHbXEIlTyTmyhXm0N8kzFGbOlyrMZ6On2XAwP5ed+otXsjVIQ==
X-Received: by 10.99.100.132 with SMTP id y126mr19623230pgb.177.1478238809551; 
	Thu, 03 Nov 2016 22:53:29 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:3d81:a694:3206:326e])
	by smtp.gmail.com with ESMTPSA id
	o185sm16857784pfb.24.2016.11.03.22.53.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 22:53:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 22:53:26 -0700
Message-Id: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Time zone update to 2016i
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
X-List-Received-Date: Fri, 04 Nov 2016 05:53:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These applied on top of 2016h I sent on 10-23

Armin Kuster (2):
  tzcode: update to 2016i
  tzdata: update to 2016i

 .../tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb}     | 8 ++++----
 meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb} (69%)
 rename meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} (98%)

-- 
2.7.4


