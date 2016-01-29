Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C405731C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:08:55 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id y78so4301078oif.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WX3RODoTGbzsO6dVT6UdRqVpYnmQ/DFN4llR+WiopRA=;
	b=pVKquWUmdZJLzUtn3Eks0nIEPyr4lAlTTj2ddqr9NRadqtsP9oI+nI4VrrJ8Lm9PDR
	i/RHhXYYvQC3c29Mofe94VpsfWBIUow9jdn475D+VmwQx1VyFxUJOolNVyGw/kOeeqpg
	9bGCmFCM0VBKlRj6euoNU8/jIl96smM6Dqd1LTHnBkvua5bmgnTW3oNRlbZFOBvN+Nrx
	UyjHXK/ICx8NQRTKfTVGXYZ7qvu1DJTod5tPrcDxb4lhdn8ZwmdrqFSYr1a4HkQ7Mr+U
	cL6xNdqGmkw02c8PwOBhlOVNnu4t6y8IsWwMplG6imdffJOtoI9dhzNSdrRK4XuUlvdU
	P2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WX3RODoTGbzsO6dVT6UdRqVpYnmQ/DFN4llR+WiopRA=;
	b=ZUKO207d00+lEm86UTpiDgy50QeQW3iv4FGvRdtuAEfdp+jK1aKKMVshWf0zwDMYQY
	K3fo2/LfSTR0XBEkGwNBKaZ1dMUrJawbGL6cefj4hPPW8tuDotMQLgvqD9IWrr5jb9Ji
	L8SS+lxBdwb/mTWn4a8uB4kA2urYhMjg68RPeGzs8W8kBplEsU0KAsRwmeQlnpal3t7M
	Doi+4he4irCnN0UL4TDrC9FkteuEgQGN+CarNVGiL15c5NzPl62f1LnX7gxKrYMV5vue
	5UMa7hnrm3zn1QzPUL/+pWnrie287Z4tF+aJgP21x3C7gYhPpHY5dQ5RqsFMRSorvIC+
	oLvA==
X-Gm-Message-State: AG10YOSG3I3Ccs+FkSYxxVoPWU69NpjgNZsbRqdXI2529ww9MdkekpvNMlKHUje5KHw2gA==
X-Received: by 10.202.85.7 with SMTP id j7mr8431740oib.30.1454105336365;
	Fri, 29 Jan 2016 14:08:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f2sm2724302oig.2.2016.01.29.14.08.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 14:08:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 14:08:47 -0800
Message-Id: <1454105329-11302-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] pango.inc: minor cleanup
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
X-List-Received-Date: Fri, 29 Jan 2016 22:08:57 -0000

Andre McCurdy (2):
  pango.inc: limit ptest specific do_compile_prepend to target builds
  pango.inc: misc dependency fixes

 meta/recipes-graphics/pango/pango.inc | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
1.9.1


