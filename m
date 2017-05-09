Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D408971A39
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 02:24:36 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id l196so10721681ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BAPX93sS2yS86JTDGkn+f63eSZGTO/6k7Lis+dphEWA=;
	b=hBnHzXsGLGiGqZDePpIGS7O9O7SO2wLezCjAvdq2iSibIpO64O1hGgskBddRlZqhhF
	VRX6uBk7q7ObXB4QaD6S2AgLKiedXTbiCAstaoSmvnUTS6xZjmQL5sbboDkcEJQJriCA
	xduwWEetVK0Xq0T3S0nPmTdYRUC+Wf+Xs7/EZ4qO96SsP687nAp+fuhBej5dcnbjFpCF
	jz1qTs09NjoK9KLay8DYYuODQa9nulhYHOtA+ztd6ssYewU6LWisDcg+xRQj8/YGHVww
	MNkfde0mRINwQKZvUt/9oxJn1npjmqbtKvJrBW/pFixQK7KpQTwiPVjDMBV6roRat9Iu
	23AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BAPX93sS2yS86JTDGkn+f63eSZGTO/6k7Lis+dphEWA=;
	b=YIz58SDgfnisyUYyYYRFa17QZIZqAtRTTASa2d2f2C+0lInPB0FfW/t2WrBGB60qSN
	PvMhYgSpfbVWpLZp/TLsLJl0mXsRFWJ95tYgdUNLltJBABCoLJezviDVyUYk6xdkG0/Y
	nw+Vxhoqpy7pxBEoRX+KnJMjF3LPoZDoY3pFWvUFIHqVEBX0gMDvwmnLNjB9wExiOITd
	wmSmP8Zhn4Xs8YixHgchBw6193ebigIYojX1l4r7SZZwQmwkviAhGkwGJIvsWfVto92m
	yH22Vlzfby+2aRItg85TmIxA7gtHaCCsZEKkb1iVoYVHmCB/b6/xZBOvvTAwor4y7coK
	GW+w==
X-Gm-Message-State: AN3rC/7Tun7Kngbd8X0idFWC1MpNfJoUp7iFcyHncxFbO9m7I4zppszi
	ukHGRxZOZhyn6AL+2l0=
X-Received: by 10.107.10.24 with SMTP id u24mr33607884ioi.82.1494296677603;
	Mon, 08 May 2017 19:24:37 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	l136sm5467988itb.15.2017.05.08.19.24.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 19:24:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 21:24:31 -0500
Message-Id: <20170509022432.23274-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170507013304.30165-1-JPEWhacker@gmail.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
Subject: (No subject)
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
X-List-Received-Date: Tue, 09 May 2017 02:24:37 -0000

No need to create a directory name "644"

