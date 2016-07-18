Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id D756F60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 17:56:17 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id c199so16757344oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ucWOOtGjb4GrYclxSWIloddTl6izvzQTxf3FwMsVNqs=;
	b=byjmhN+5Pio6G1AOyW9qp4wXMJ5eiKrB5NS4nUDZq/yT7szNbCb/3ZdtTUtqNfI/nY
	EtHzbwKlnf079nXDGs9qOZcHKE1bxKCCUSbHdljMbReeaUZPk2QN2lliz645rRfnfxoQ
	KyIlDIHLqlj5mO7aL6TqcHirqC3LgUnl8+zHMNA5McSiEpUp/rdClWA1SeyKT+XejkkH
	rH/mobPAVUWlbOcsTGovEecECRdhqC8+QbjsmekrfkLO+b2RZ2lPaaqlsEt/vr/T6lEU
	iIaDkwQ9T4CPLX2mdJQwE5lhzgS1yHv0oAjql2aTgb+nB8EFtVwBeMOWbL4/6zAkAipf
	XSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ucWOOtGjb4GrYclxSWIloddTl6izvzQTxf3FwMsVNqs=;
	b=EohS7iHWXMbPu8qO/CBqklN6uAXWc0PhGnnm8u90cXQDmOVpnWJmXTA743eECuI1QB
	mwWVE5CCEy753T6dtPVOg7tPp46AQhlD6EeW28t0RJWZu+ZAzsic00gVYK2TiyhFYaDK
	bkQrfqlrIdE6TB9VG9+4hqK37wbgTM0zk4JlTHlYCuOUp/ynR6TCXhpO664vqzYQ6iDe
	TWwZzoMfjHorGOXlLkbUNjpCNLu7qdUuuHBC2oQWLp6htQHahVeYwHCBrLiH8/oIqyux
	2D63hKGDaRN/ku1Db7fUaGfNgrb+W3lmIR9XHW3BcweFAAaiuiG8fdh4k48oJ2qexhia
	ZWfg==
X-Gm-Message-State: ALyK8tLm/Q7Zo+9VrbWgTdaMTfdGkepix2SisrU+pc5ZgEpYZAAbhGi4CDeaIXDd5CfV7w==
X-Received: by 10.202.78.68 with SMTP id c65mr9265840oib.184.1468864577530;
	Mon, 18 Jul 2016 10:56:17 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 59sm4771887otw.9.2016.07.18.10.56.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jul 2016 10:56:16 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 12:54:44 -0500
Message-Id: <cover.1468862824.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: marex@denx.de
Subject: [PATCH 0/3] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 18 Jul 2016 17:56:18 -0000

Add support for building fitImages that include an initramfs and booting
on x86.

The following changes since commit da7a2c7b00b40a8759dbe9f4ab6df3e337e3d6b6:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:11:57 +0100)

are available in the git repository at:

  git://github.com/gmccollister/openembedded-core master-fit
  https://github.com/gmccollister/openembedded-core/tree/master-fit

George McCollister (3):
  kernel-fitimage: add initramfs support
  kernel-fitimage: Add x86 support
  uboot-sign: Handle .rom signing the same as .img

 meta/classes/kernel-fitimage.bbclass | 344 +++++++++++++++++++++++++----------
 meta/classes/uboot-sign.bbclass      |   3 +-
 2 files changed, 246 insertions(+), 101 deletions(-)

-- 
2.8.0


