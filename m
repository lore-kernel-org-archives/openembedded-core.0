Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FE8C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 16:34:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.105605.1701794052177022312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 08:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m469CIr7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DAA1C0009
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Dec 2023 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701794050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=kcLywPr0zLynMk2b/1aJypDTu47GKIA5ADcJVt0WKg8=;
	b=m469CIr7ok+MhSgTtMFR6K2RzAI5kv2M7KPSxgaqx8cUpkgdMPOCx7pakkWTyq/jBslKM6
	OrKZVW9zS6J98jA5uQsWbJcABaGNOYVsokMQaC2nsq+awHhjc3V00EjNZ8c4SJ3IKSRkBL
	me/A8j9kidNZxbaZyfTCYoCVaoqHBgp4QfcEnp4VCoRkA7/zYpaWoBrzVpxygaOdJqYnWM
	Mar8DJxKEuP1darDzv9M267ke0P1xCpDk/f+QAcoFDv2hiqn1+4JQtTlzOrDnk4/oP4OEi
	EWdfDYBN1P3rnblzvMzvgtVNBri+QemLz2pJcrBZtUoWsPNXzlaxTJngmoaBuQ==
Date: Tue, 5 Dec 2023 17:34:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Subject: CVE checks for meta warnings
Message-ID: <202312051634105ba1b1d7@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 16:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191848

Hello,

Running cve-check against oe-core now generates a few warnings:

WARNING: automake-native-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.5 = branch_1-9 for CVE-2009-4029
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m1 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m2 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m3 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m4\/m5 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m1 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m2 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m3 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m4\/m5 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m1 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m2 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m3 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1.14.2 = m4\/m5 for CVE-2011-0715
WARNING: automake-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.5 = branch_1-9 for CVE-2009-4029
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2003-0577
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2004-0982
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2004-1284
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s_r11 for CVE-2006-3355
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s_r11 for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s for CVE-2009-1301
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 = pre0.59s_r11 for CVE-2009-1301

https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/823/steps/15/logs/warnings


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

