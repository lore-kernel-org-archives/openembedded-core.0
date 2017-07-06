Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 478D7771EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 19:49:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d193so1370520pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tQ1ZQg+0NW8GaHMzmLvUtWF5npUeQPiwNWNC0K/uv0M=;
	b=bw250zT2K/DHcoRrX9WMCgrRvkh4Uk5KhDfmLisDb1ztNDFiDLHG9iytRsX2Cs8Tzq
	3Yf9s9my0DLNz3V1FYX5uMjRfL2WFbelQukC+dKZn6mUb+iWCfW1k2hq1S/XL+BZiu1z
	7SM0z96pk41KBiD4lPhC/oEjjdbx3SWMvzIbGeR+VpOglCKGt8YYQ7/hVxQWxq1wmT4v
	CHYhuWszlbTSSdSENnYctTDXkU5jEDclcaqVeDcBFdmP0ZEUbppPQABU6f4iPCpUf+Nm
	cpAnvTlqU7I2DcHxQpobP/N7XjxG8BHRJ6yVNfGL+vfqMHBEXXXW+ZBcxiauz1LMPLuT
	sknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tQ1ZQg+0NW8GaHMzmLvUtWF5npUeQPiwNWNC0K/uv0M=;
	b=YnGnuG26ZfQM5wgDAShCnS3RHQ3rmv2E3IXxFNyzVZBo1ST9z/qrju3ZqPY8KjyI1+
	DxE8bjm43Cr6+29tNChdwjnZF5bCRq1urPEL/TH4hHmVuQYeQpM/CG7Mj17S9RoLCXnZ
	l/nIzuW9k0Zt4D9ESt+FooiqqDMTT5jdmnJA38e2PBR7N+02rInoisqyED0l6m4AVkYx
	JXvpoIOzQt2w4K3NPw+bnk6SPaG4ETegx0+nwDC7gnoWyXvJF2MeSupBzCtDVI7TBkol
	NrBZw9MgCSQCxoUc1rKB2qXW74sqMOt7AfjI8MZpEZdwDw/XboPimANrqvXFx1MkNUaS
	t3SA==
X-Gm-Message-State: AIVw11033zg3LY/LPnJcu2f9fmeWdSSTg3970a9sxlH7+82iTCoNxf1Z
	WKe6LH4LZv8oXZ0z
X-Received: by 10.99.104.3 with SMTP id d3mr14184508pgc.278.1499370549265;
	Thu, 06 Jul 2017 12:49:09 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e124sm2347580pfc.76.2017.07.06.12.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 12:49:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 12:48:59 -0700
Message-Id: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] lsof cleanup and fetch timeout fix
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
X-List-Received-Date: Thu, 06 Jul 2017 19:49:08 -0000

For many (?) users, lsof do_fetch() results in a 90 second timeout
followed by a fallback to http://downloads.yoctoproject.org. Try to
fix that by updating SRC_URI and associated entries in
mirrors.bbclass + misc cleanup along the way.

Andre McCurdy (3):
  lsof: minor recipe cleanups
  lsof: update SRC_URI
  mirrors.bbclass: remove stale lsof ftp mirrors

 meta/classes/mirrors.bbclass            | 11 +----------
 meta/recipes-extended/lsof/lsof_4.89.bb | 24 ++++++++++++++----------
 2 files changed, 15 insertions(+), 20 deletions(-)

-- 
2.7.4


