Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1E07E919
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:32:58 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b7so1287385otl.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ApHXiLwnt2ZdnLadoiFKQX0oRfqoqAdQIH5uL4nz5xI=;
	b=pYSvx8YBiLxp1VX3cCEgES78+pjsT6Fr21jR3y+gRQdqNDFym79PlLBDLBdluxAz0U
	w9pV7FgAlfbOFdN3cWYcW+RrU6UOCQd/Bv4SMLweZHKMHQDYUQkfe0nlcqON8GI0QJwy
	hyg0hO7hQZtbWIw5oaZxtb2fVU/HrzY1Bo8hGv4DHO11nicrYtcb7tfPLj7p7YES9rWn
	BD/HRhIL14JM8zzRFrx+V3QXX0PvXZ4JPm2QSbIfOgWEThjAZa/gijUSzj7LG1ZPezoC
	F/o+/TfA188RdvHwtvWoc56F6Cq+bjVM6m4oho5tjtnCP/NTcT7YE2hOtGplWT+fsw2O
	DGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ApHXiLwnt2ZdnLadoiFKQX0oRfqoqAdQIH5uL4nz5xI=;
	b=JQZvLKJO9ZWidYMETzcikLQC5bLCwhOxNVc73mB3xvufQM6yaESQz5lilvt05cdFjB
	9vIy6Y+fh+ernqmYLJpTly21JhpRDtG7z5316irIVJhLOTQnR1LF5FEQ5GxSdq7bazFP
	hqsK1tzbwNdkmtMZs3M85WmIq6wniQHtnvkBR5MLBhlIMHeHOwdSd6ScZb1bkIBn5Frb
	rTMY/iN6jkyy6JFFEP+dR3HOv1PyF5zlbJ7maEtHBtJ4R6NCgukbR0eVj0T+wSubeKP+
	0JUqS89S5XvzgT2sy0CBiU1g0terk0AxUymb3mThwWJb3BvMWRcYHnSJrgnaTQWIgiOH
	3/SA==
X-Gm-Message-State: APjAAAUIRmmhDnGKl0InQZzMxx80lgPXuG+9jvSO0ASp6XcOPQsEsUiO
	GJnC3xjOshJeU6/Kcn+UN6J4pvI3
X-Google-Smtp-Source: APXvYqz/5rDE/YDLuDLNSp/EjLrKbjORZsFSrArHulU+FR/zHWHwQ6J36dhGo2gjwyoPiNDMM/QL3Q==
X-Received: by 2002:a9d:6a08:: with SMTP id g8mr18746428otn.344.1560483179126; 
	Thu, 13 Jun 2019 20:32:59 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	q3sm708383oig.7.2019.06.13.20.32.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jun 2019 20:32:58 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 22:32:39 -0500
Message-Id: <cover.1560482696.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Use scsi-debug kernel module for util-linux's ptest
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
X-List-Received-Date: Fri, 14 Jun 2019 03:32:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches will allow the use of scsi-debug kernel module for
eject/mount related tests of the util-linux package.

The following changes since commit e00d88475d0ed7b161f5f58dd13bc9a72e3efdf9:

  bluez: fix test case failures with GCC 9 (2019-06-12 21:08:52 +0100)

are available in the Git repository at:

  git://github.com/justanotherboy/poky bug13301p2
  https://github.com/justanotherboy/poky/tree/bug13301p2

Mariano López (2):
  util-linux: Stop udevd to run ptests
  linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES

 meta/recipes-core/util-linux/util-linux.inc       |  4 ++++
 meta/recipes-core/util-linux/util-linux/run-ptest | 14 ++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb  |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  1 +
 meta/recipes-kernel/linux/linux-yocto_4.19.bb     |  1 +
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      |  1 +
 6 files changed, 22 insertions(+)

-- 
2.21.0


