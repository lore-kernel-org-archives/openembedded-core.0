Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7549F606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:54:09 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id f93so32155961lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=H1Y/VrdDFS9e+9e8uCaf/RGNWtoAGXBhXwzVsvvydgs=;
	b=Ec06CBZc+Fd/4KsQGbV10pcZOnECFvLggnj0tOWEdwN1C1enZHVFtXUjSdeXDo6RYI
	kFl7cuHp7u4fxVtizmdIqNMeW2BsGD1NfGqamod+cf9XL2ibnL4px6Xhsbh00QFPVhKf
	KyZIoDSdeEuo33jHnhTywJqnXyfhpTlkPlPej85uO0sy4mg9UCG4hWr/RbbdLkgwlkWb
	EblHwwj2OgqcNp3loapqI3wDnnIe+zVkHOSiJZVwkYojy+HMtr7bi3poHbmR9PBCQHhk
	+AhmtQgW8SbTSCzJMJum0p466KEMlKUwAJp395GiaEzI4ih8XYfueoc58nZvy0MkU9aj
	aUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=H1Y/VrdDFS9e+9e8uCaf/RGNWtoAGXBhXwzVsvvydgs=;
	b=lIrYEafFOcQyIfxqhAy5/NfRrb1l8/DC7bXn7A1EKKJT0Lp7MA9HEbVhFN6xQ+oIyW
	cQAG9xvhMkJ4wDLxRLBMuU3icN8TisHN4aldDx7b9grqoq4rUMaOMLv9ggiFfoUXqEP3
	LiT0KYHrtIE4eezlMzGFBBhEhMJUjrvliR88j84gexFlQQgFhMJwv5lPQYVLfxmefCm1
	tgut06SRSBllY/8otZbzd/m5rkaHT7uJYNYGnOT/3QrDtAgveR5sG/nB8QUEylNHyBn5
	+H3gqQWk9aLavF4gB9CFQQKtpDzpepP9QBmMANdtgl4M5b2oW5sHwF02R42UhINJzrs+
	NXSQ==
X-Gm-Message-State: ALyK8tJIhYAXDsMoV4Ljb1DDLo6DcGrFF9GawLP1iMCc7LMBDJd8WKtI5mBMFatiEx3JoA==
X-Received: by 10.25.85.212 with SMTP id j203mr21881316lfb.31.1469001249376;
	Wed, 20 Jul 2016 00:54:09 -0700 (PDT)
Received: from localhost.localdomain (cm-84.208.203.118.getinternet.no.
	[84.208.203.118]) by smtp.googlemail.com with ESMTPSA id
	s187sm334770lfd.3.2016.07.20.00.54.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 00:54:08 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 09:53:39 +0200
Message-Id: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Wed, 20 Jul 2016 07:54:10 -0000

Hey,

on our krogoth build the systemd network service does not start, and it
seems to be because of missing users, which has already been fixed on
master. I've cherry-picked the two patches that fixed the problem for
us. Note that they are not written by me, but by other people on this
list. I hope they can be applied to krogoth.

Regards
Kristian Amlie


