Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 22E9A6AB93
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 01:39:59 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so5478562pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 18:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=qVL3txkF2on4uEHA5jlwc6Yyc4FNOEK/k0WFabJiq2k=;
	b=Z+DY5IWdQSnq1/CBiTxXGh6XW+nijF0pB5iE2Y1rWAnD7R5XIjjbUQu8Gtss7R4Dfj
	ZBnDN3ogFWOoMUXnJEn+ySQfYxlal6s/iAq2p+Mnum3DYY3HlPoVvfb9Ss5Os1HRc+UD
	aaq7EuYQMx0rM4UpmA2j24FDXckLuK2wF/jCdgCSDa0fd+3Ne9vba1wJedTy5/M5RJHJ
	foJ43EDnFi+NR5znwPwKFjPOj63gPYJbNCPtBbJ58tO6Gzwmm2GdXVxx69MK5ynWq/LI
	LDVwzVTOOPfUjzZDcd4pBRzKBL9tImAXBPHOvUm7p3hFESidAetXgnIptoOEb3swwaFY
	IKFg==
X-Received: by 10.68.178.129 with SMTP id cy1mr26652066pbc.73.1372729200334;
	Mon, 01 Jul 2013 18:40:00 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([58.212.12.45])
	by mx.google.com with ESMTPSA id
	fl2sm26472695pab.23.2013.07.01.18.39.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 18:39:59 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Jul 2013 09:35:20 +0800
Message-ID: <4783685.hnM3VA9Ozj@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.6-1-ARCH; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Subject: systemd
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
X-List-Received-Date: Tue, 02 Jul 2013 01:39:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi, All:

I want use systemd, add following into my own distro.conf
     DISTRO_FEATURES_append = " systemd"
     VIRTUAL-RUNTIME_init_manager = "systemd"
     DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"

but when do_rootfs for my own image, I got error:
     error: package update-rc.d is not installed
     error: package base-passwd is not installed
     error: package run-postinsts is not installed

Any idea? Thanks!

-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

