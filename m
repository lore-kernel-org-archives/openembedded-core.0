Return-Path: <sivakumar.bs@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B12386C4DA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2020 08:52:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so2304984pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2020 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BpY3EPzNvD0mJF4GZmTTe+hhU5yrnA306TZOkZZo8kw=;
	b=bj8/sdkLiCnYUz+uRLMqFMRNQgQt2od1FX5OXd/sQNfeuQplok2ZNCQ3k+mB53NVc4
	Swi9QTYuQve+v8yGN+0MqUKSILh3tRzHufP/GXkZktN3xnyyEhtgCzt+E7+vJy7RvE8U
	9QOWBIVmZeAxhNeIvTK1VJKfuWWx1HAVT4Gq6ukjfd8OMB+OzljUNjq+ATg7V6UhCGSg
	P8LAFRkMz/PLfV9brTrNtq2wAITZ5YsUDZT5F0R7fw6xqWTpAzyyy9CO+rR8z184TSMT
	6rnXvMp19YjH0guhu9jw4xqKI93K4Oc3iWCANRbpj+hCffi2P1j3QL1aygutEKGKYBpf
	GSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BpY3EPzNvD0mJF4GZmTTe+hhU5yrnA306TZOkZZo8kw=;
	b=ISry80C5Hcp62ZcVpOB9EJf+ZffJgYXnIpOj0vM26x7wn9ytEnqnT71rAxu1GTxs78
	tAd/MNDBvFIFAbEYgSYWYUzSfHafC88vnm6f9FVSxsRNs0g2ggSXqGGUrv1iIW9UMlDV
	R6tb5k6PNQiZZevU/Flccq6N7QrUhj6Ot1HcMllLF0bJ/WVDScz8Hncpk670hG7NHZ6t
	54Q7FZPXNo/Llz1v0AYnJfC3557ItH3VJnzt0+vU/TTzokj0d7xQbldq5gQNpc6EPFTO
	bIZumKeFifB65zU+EDZcNmBnYJY5SzAzbP5Z7Vzt5tTXn9a97QJhHXTJtrUHO1FlK6zc
	z/Qw==
X-Gm-Message-State: APjAAAVvBw6yk3ibi9CpssZ1gCXvbrkF9DXdYTaRGrAHFJabxnQ8xzqV
	AJsHwuHoYj49Rt4auikbmMaXHSAaKbY=
X-Google-Smtp-Source: APXvYqxhzhoPTfPBHtKfzDbCaPRggw9IU2AKTTbXFybH3rhQaaCGHMLUFrxluPqT0k3SBAYAvIdO3g==
X-Received: by 2002:a63:5512:: with SMTP id j18mr8339033pgb.189.1579942356314; 
	Sat, 25 Jan 2020 00:52:36 -0800 (PST)
Received: from devel.timesys.com ([49.205.139.80])
	by smtp.gmail.com with ESMTPSA id j9sm8984743pff.6.2020.01.25.00.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Jan 2020 00:52:35 -0800 (PST)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jan 2020 14:22:29 +0530
Message-Id: <cover.1579940252.git.sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH 0/1] sudo: update to 1.8.30
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
X-List-Received-Date: Sat, 25 Jan 2020 08:52:35 -0000

Updated sudo to latest stable release
The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:

  bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib siva/master

Siva Balasubramanian (1):
  sudo: update to 1.8.30

 meta/recipes-extended/sudo/{sudo_1.8.29.bb => sudo_1.8.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.29.bb => sudo_1.8.30.bb} (91%)

-- 
2.7.4


