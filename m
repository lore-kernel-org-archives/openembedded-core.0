Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC396E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 19:21:32 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id jq7so82361140obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QzxdNbz66ywYCL7RCYU642LJcD39c/zFMW+UXzJJimA=;
	b=qFFLc/SjPcUMjAHmVNh8ik8q+KM+uQgd7iDzhE4Kb7moM3qzexEFsTYEKZpPjluxB5
	Qoq8rYjYkkxFmN9fUWUOco1Vp2Q9XhX12WWrF1vlGwuunL3CHcIoheZ04+hf4i/GwXks
	RelBM9jifXp5adDuCyjctDL736sNyhyvZl2j+CRlkgLg3Z+n/NWhB8KH/rzRloVguU1n
	oMvdhv5ixolZGkvp9muG5ssipiAg2tkRgjiF3kntW0i3+FR586B50/0QeP7XCLRd9/i2
	Rfpt9r00DYRjy905NkeOUIAtpDR5YUlGHN0zHStBXHfazk6EizSEKkg72JzTYuvizQRL
	FMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QzxdNbz66ywYCL7RCYU642LJcD39c/zFMW+UXzJJimA=;
	b=FCQaotTXDisjbM1ZUocP7+pkBsQK2ALd0ph/RhmVpCCcHw7ShPUsUfAthr70Co1pPE
	jdpN+pbrQp4U76W2neB0Cvd3bCXmCDzZ/Dhz/KVEGY45T4mms/dW2xjyJjYrzTIAxj0M
	4AMaPKV6PnqH21/00KSD8xcBnLrY6RDupZtUQ2xpVtSkQ5gnOTW7bkRbUx/moK/Ui/Mc
	xHZm03ji61xWTY6YUfnPJ988NsqoBFfvOmhGDWtn91MiZZgKYFNwBQ0Mi4cwmq4TjzQR
	FCpNWhpu1Vxf88myu95RMfp6UXRnxh1Vb236Hv8QCBWgIRERMi+qbNKTFTBAhL0iwlL5
	Yu4Q==
X-Gm-Message-State: AG10YOTbVhNwPBUEKq5dGCNBYDAqvtA/xF5zSyZ83VvczGst/Av5pEoX4xJcGtPNUXYzFA==
X-Received: by 10.182.241.134 with SMTP id wi6mr7860162obc.81.1455823293180;
	Thu, 18 Feb 2016 11:21:33 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w127sm4626409oiw.17.2016.02.18.11.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 11:21:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 11:21:23 -0800
Message-Id: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] libsoup-2.4: cleanup + disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 19:21:33 -0000

Andre McCurdy (2):
  libsoup-2.4: minor formatting improvements
  libsoup-2.4: disable libsoup-gnome by default

 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

-- 
1.9.1


