Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 819497722D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 05:53:13 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id j125so5415680oih.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hU2pxcrEo12mzl3G5E4aUjOlwAdtgZKEzwL9NoPYKWk=;
	b=wZ1A32GIuwqyEZbCN+yevGswV+346VQ1knP1bY/ds2xa0ntAqHZ3j+5nFMWTtUEGFk
	tCoy2HqmB7YCx4LUq1w6GqI+QXzFGDRec1ZdyeusPoz10zPcIzSVn0CrLVH2Ii6FE++X
	NwCZhuRkFTzOTosOVXXOeJuktvHa+sorn0rnpboQb4m/MIxN6VZFQ6CPecaNjq9t1rue
	TXKUH5tmZZ7/dGe0NPyU4Ng/MiposxP1mNLgiHepxstEjJtcIseibNQ7X3PjpR0ZwE3i
	Vl9W90zEn9d/gueijsSU9CzWQfsFecfkiUJjxBpWoQgRuAxvU0MSlMdJvAMDuowdJJZ6
	OlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hU2pxcrEo12mzl3G5E4aUjOlwAdtgZKEzwL9NoPYKWk=;
	b=aUM0VxJilW1oGMU+k6GG2IxaP4585v+CYLdAAuxg9vDhU3Id6Lxcnu8LoyDZ80ppoR
	3Wmo9EFOH4xJSoe6UPGclciw8wOJj5BT9WBC1gKFfxZimJ72NAkuqUgufLacaiobpwKD
	7Miu8+I72udXSf6O4gVocEnJiv548mU5pOLBKzLWyiNKPh+6wEvt1rqk12jGv0xeN+X7
	PVchH02SB/ZRLKtmIiEX1xRfnTZr7O41oDe8BbqUM4Du2mGvppmr46K5LB8et8tiBGi+
	yPgkyNZqvyV4XUifIiqno+2OjpsJmUFY1IOXQk3WAPlbhFOUUpV60pUe/RK+Za1y61HS
	kYbw==
X-Gm-Message-State: AD7BkJIBE6LGqMNoCA67iuRBad8f99jjyhhVIFP4qGqalSGexV0lEG+qujzemAo9dB8w9Q==
X-Received: by 10.202.204.129 with SMTP id c123mr3923171oig.112.1456552393660; 
	Fri, 26 Feb 2016 21:53:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cd5sm10867528oec.15.2016.02.26.21.53.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 21:53:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2016 21:53:03 -0800
Message-Id: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] poison TARGET_CFLAGS etc for native builds
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
X-List-Received-Date: Sat, 27 Feb 2016 05:53:13 -0000

The first patch fixes known problems with grub-efi-native
incorrectly leaking target flags into the native build.

The second and third patches fix related grub2.inc issues.

The final patch is the important change. It doesn't highlight
and new problems (ie apart from grub-efi-native) for my typical
builds, but needs wider testing.

Andre McCurdy (4):
  grub2.inc: dont export TARGET_CFLAGS etc to grub2 configure
  grub2.inc: avoid passing -isystem to native builds
  grub2.inc: drop bogus dependency on xz
  native.bbclass: poison TARGET_CFLAGS etc for native builds

 meta/classes/native.bbclass     | 16 ++++++++++++----
 meta/recipes-bsp/grub/grub2.inc | 19 +++++++++++++++++--
 2 files changed, 29 insertions(+), 6 deletions(-)

-- 
1.9.1


