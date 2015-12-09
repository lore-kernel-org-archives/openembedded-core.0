Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 670EA60616
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 01:10:04 +0000 (UTC)
Received: by oixx65 with SMTP id x65so19089677oix.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 17:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jOEqE6uJRDgFNkB1HFaoQWKvVy15Meg8+fY/8LBlBls=;
	b=Y0/6BsReXO1tSXH+fdc4gm82DiGp7NVcWkVsrXpHkZ+cwMo+O40Emr4UsF79E6XdV9
	ZFlk1vBex0kGMde8YDhJVQqcjNrDUI7zsXIhuU6OXwx5pQD+3NsQ+gu1pvHHEdw2V1+l
	TdHHHO3oEm7bT/b1llt2zkFMr/k+jE7wgqmdNZbnsPK92VzVYlTArbndbW1eD7rPyyJA
	R+atMrDim1ICiVEkf2H/jSdIr1sNI8rAlUahbTl+Y7WwKH1Dleg0EnrE2vHSYWFxdXLm
	MrHHCJR3aZCD/zW3AQkNQKntEM7ChK3DwYS7iBvg7K1poUzuSNRaV3ahS9klH3TaYR6C
	G38A==
X-Received: by 10.202.199.23 with SMTP id x23mr2003303oif.121.1449623405551;
	Tue, 08 Dec 2015 17:10:05 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id t84sm2540098oie.1.2015.12.08.17.10.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 17:10:03 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 17:09:55 -0800
Message-Id: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] feature-arm-thumb.inc cleanups
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
X-List-Received-Date: Wed, 09 Dec 2015 01:10:05 -0000

Drop legacy interworking over-rides and cflags.

Andre McCurdy (3):
  feature-arm-thumb.inc: drop ARM -vs- thumb comments
  feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rides
  feature-arm-thumb.inc: drop 'no-thumb-interwork' tuning feature

 meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 -----------------
 1 file changed, 17 deletions(-)

-- 
1.9.1


