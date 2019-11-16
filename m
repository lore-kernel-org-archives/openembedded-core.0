Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 634E16D728
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 23:38:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id bb5so7306568plb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 15:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=82NDivepvxCW2Nb/3O9QrNVdqfvKSu5Tku8TcK82e7w=;
	b=H+1MnwJt6OX9cM/ncqK4nhJHDT3ov3I4Zw/b+n80GNkNCpeVrK+jRREinvnyQwxw+j
	2jDoF6gsv1RKYy7bBYoaR3apWYAK14xUvfUi3gp7A4g6edlwQyjDk0KXpqnxaKHIzwDX
	2Tkpe+Xfzr/FAlfdBiYwI8uIrP+IwTSKzT3dUWa6l2e+JbcOWHd447awrl+1qZKT5Tvy
	yBfbcUazVefmjxwIt58NAnll9KtK45VE3uBiKp9vRkEoYo9l2apHqIsclYhETgWVy8MB
	i25B0SdRpVfLzUjwtL53KXU/+7AC53NmOKXGau4i9NKtMTVY4mUXHM4W5C+VhZ/cXSck
	WePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=82NDivepvxCW2Nb/3O9QrNVdqfvKSu5Tku8TcK82e7w=;
	b=Ut0nOM8VYWPbFmk6pjQvWs/EWE9g0WWbPriOfAxdEGCXhCqGkcFfiNvCG3JQVge0Sy
	QNkdBaPmB2IiZnz52div8lfP8KUJMYtnFL4nMztIuEmD7n6bxQPPKbKzNsH6JPkwwtHR
	Fz0v7s1Zmfqh0mogEfOFuyrvUp/N42TkOKGHc8nfmQ3TH3ga38V4V0fMGr8MOu8CG1+a
	yRrtCFa/apBOD49jLAv/iTVC4BJk8MnATn8psATXE0M0QN1gWrDxS/xKUga9EXXd3DQK
	2Dqj+aSG4KCdRIYcz6xeWjaEn/HcLd5zyWANW2Li3z2LcPXovYvgCLGw8HZEESc1U7kL
	6b+g==
X-Gm-Message-State: APjAAAVNs622k0pgBJvtnh34f+OQZTJ2PCTRb0j/HVoxQ/lM+jyjoarz
	sOEpDE8tptaJiJcgal2CNCJfkRuy
X-Google-Smtp-Source: APXvYqwcsNQIibTboRDL2Cgfw+lek+/Q5HT4IS2Ii3c/O7NOZEVDS2lhE/70w1ITon91IBiiVear2w==
X-Received: by 2002:a17:902:744b:: with SMTP id
	e11mr22128528plt.208.1573947483057; 
	Sat, 16 Nov 2019 15:38:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:994f:cb85:728d:a91c])
	by smtp.gmail.com with ESMTPSA id
	j5sm15929538pfe.100.2019.11.16.15.38.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 15:38:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 15:37:58 -0800
Message-Id: <1573947480-31325-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [v2][PATCH 0/2] qa crashme
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
X-List-Received-Date: Sat, 16 Nov 2019 23:38:02 -0000

Instead of reworking the ltp class at this time, 
here is the crashme test from Manual in an automated form.

Armin Kuster (2):
  oeqa/manual/compliance-test: move crashme to runtime
  oeqa/manual/compliance-test: remove crashme tests

 meta/lib/oeqa/manual/compliance-test.json | 48 ---------------
 meta/lib/oeqa/runtime/cases/ltp_stress.py | 97 +++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 48 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_stress.py

-- 
2.7.4


