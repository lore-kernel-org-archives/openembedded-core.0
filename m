Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC43660797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:48:14 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id i5so16718808pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4btkJWqZci0Ifh8J9L/Rr4ET8kqW8WZF3hPSmTsW8+Q=;
	b=BenOAYdYmXhwnZjRIh0XBwU+ykuF24DzHrnHYOXJOq90bhB48ta62XdH5MNjjfNfeC
	SLHtRvrrZs0ly7b/WRdW/icahs8tIwe7D6o/USccnfncVRe1t/Tp+rjHGvS8tiojr0yU
	sU6EyosrGMLTMaPale5dgg6UJXNLa0vcKvBRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4btkJWqZci0Ifh8J9L/Rr4ET8kqW8WZF3hPSmTsW8+Q=;
	b=UAmVryS36mA0a4rX8wrSYOUDrXZ8Oqseq441pkrvejC6uBGFrMO8nmLwUTAo7SJSsd
	7Zs53LN6A+z/9OHwZ1jMGP/AEGtfxtYZNxjTxrbRFh9tAq7egN4GuUheNiKrYD3VgKIm
	1HrtMligEunCYfXaB8904tDXaZu9SR5BOSxJWp/MR1Mae/S0MB1+m/cwW0w9IgdD/P8L
	3GlaZ/Qv03gkt3to1ExSe7S1C4NIUc11gTb7Queg1GP7H/3UdKqB3iTFY6wnobDVn/cu
	A61Qro+gAFpC9vqRT/EE4PQt5UbQaIwxnYFGrHhLyZ9QlVE5V3n2lDNrL2ayHo34Yz6S
	QAwA==
X-Gm-Message-State: AOPr4FXvuKqOt3RNwrWnjLxO587rZ1ClOQ3JicidFF8m93s3WRw9Od44UwJ77d2WwMVV2A==
X-Received: by 10.66.164.68 with SMTP id yo4mr28006470pab.157.1462841295045;
	Mon, 09 May 2016 17:48:15 -0700 (PDT)
Received: from localhost (50-205-91-113-static.hfc.comcastbusiness.net.
	[50.205.91.113]) by smtp.gmail.com with ESMTPSA id
	ym8sm43312585pab.22.2016.05.09.17.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 May 2016 17:48:14 -0700 (PDT)
From: Ruslan Babayev <ruslan@babayev.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 17:48:02 -0700
Message-Id: <1462841284-7345-1-git-send-email-ruslan@babayev.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] fix edgerouter default tune
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
X-List-Received-Date: Tue, 10 May 2016 00:48:17 -0000

Fixes building core-image-minimal with the following in local.conf:

MACHINE = "edgerouter"
TCLIBC = "musl"

Ruslan Babayev (2):
  edgerouter: fix machine tune
  edgerouter: libffi: fix build with soft-float tune

 meta-yocto-bsp/conf/machine/edgerouter.conf                 |  1 +
 .../recipes-support/libffi/libffi/mips-n32-soft-float.patch | 13 +++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb                 |  1 +
 3 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/mips-n32-soft-float.patch

-- 
2.7.4


