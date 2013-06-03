Return-Path: <danismostlikely@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id A5A54621EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 23:12:42 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id eh20so8427450obb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=rU9fq2LFl3calHPUgLZ25XECs9da72DWGMwFK+P5+SA=;
	b=hz7xgbi3Po6PYI+YjC57zp7qb7MBdUug5WOp07Zf2umUsayAhyUy2vkNTKuEsDHiyX
	/9f3d0+k38K8LIXo+UEyftiXSJU0++OdwPOyQD5uyW0IyC5m7cdbafjQf7ywyD2RJ739
	xEkXGaLuLY5dQ4eki77AdqeszUpR/q9o7I2w68eZ3JtszTqz/g/wNRVM3fNdA/OUThFL
	tt44R8PVgZJgWFtxuRUr2jBjDC5N+WzVEEJPMA7IYrVheGSxUO7j/g5FQgJyp75+PdgR
	ZbtbZ2mmrb+j0JTfTo/1p+3VX8RnLF31TghwnmJmZfiwmHyzjZzPwaJaVjcSlrsw9wSe
	TOog==
X-Received: by 10.60.98.134 with SMTP id ei6mr11387220oeb.21.1370301162998;
	Mon, 03 Jun 2013 16:12:42 -0700 (PDT)
Received: from mediabox.gateway.2wire.net
	(71-17-188-15.sktn.hsdb.sasknet.sk.ca. [71.17.188.15])
	by mx.google.com with ESMTPSA id oe10sm3315459oeb.6.2013.06.03.16.12.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 16:12:42 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2013 17:12:26 -0600
Message-Id: <1370301147-4582-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: Make python aware of IPv6
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
X-List-Received-Date: Mon, 03 Jun 2013 23:12:43 -0000

I found that gateone would crash with a socket error when Python
isn't compiled with IPv6 support. This patch enables it when
DISTRO_FEATURES includes ipv6.


