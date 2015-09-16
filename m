Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id C93B060053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 05:00:13 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so197406932pad.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=owbP86DtE5UrmS3LnECPBEwVmmJ14+C+UoUKWNPJ2EI=;
	b=gza/eXtHPyPg81p24yYAQK37ktCDDxfNjKm10+zx6m4Ih9acrnV84f2sd2g9q7/GuU
	c08h4amkuCuENflj1bOFtpQIsTXU3242cW2OwFvkyz5e1Ibg9Nmp70rGy4CHl0DfQdNC
	g8+zgMoDxCSBW07nxNmj2wBnYcVZ+UVK1pxAF59RRAq1dmxWw1HFhT0b57qFPbMAydiY
	Y8cwfA3MZOiDRpJ/R/g7JZaujjUqh8YC6GbWT6/TC21X0ND5590Xh0itNfvZ6g3i8e9w
	mpO53TjBJg7B47sNSoAFtU3Jqz0xM4LTm5dY/dMMrCmbd/CFqxMX/ox+7DUBsyF80DIX
	rMQg==
X-Gm-Message-State: ALoCoQkHeMoiGcNf/rk5dfadHplwH85RAmIkOvRqWc6ikmimQSeOK5UjxytsBpBAVXusdHoavVBl
X-Received: by 10.66.146.69 with SMTP id ta5mr54815006pab.46.1442379613429;
	Tue, 15 Sep 2015 22:00:13 -0700 (PDT)
Received: from nathanbox.home.gateway ([103.26.61.212])
	by smtp.gmail.com with ESMTPSA id
	lg7sm25143220pbc.1.2015.09.15.22.00.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Sep 2015 22:00:12 -0700 (PDT)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 14:59:57 +1000
Message-Id: <1442379599-27186-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH 0/2] runqemu: Update qemuzynq and qemumicroblaze
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
X-List-Received-Date: Wed, 16 Sep 2015 05:00:16 -0000

This patch set updates the runqemu scripts for qemuzynq and qemumicroblaze,
fixing support for network interfaces and configuing qemumicroblaze to use the
QEMU inbuilt device tree.

Nathan Rossi (2):
  runqemu-internal: Fix qemu networking for qemuzynq an qemumicroblaze
  runqemu-internal: For qemumicroblaze use the QEMU provided device tree

 scripts/runqemu-internal | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.5.1


