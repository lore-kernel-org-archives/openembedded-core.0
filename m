Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4B673243
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 10:30:09 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so61863999igc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=svD2GjBS20BDN3Zr+wKtVpvnUOqxAk/986jkNSvd8Ok=;
	b=JXDqH7Z9yi4O9BamB5rz5zb25R9Rb322at+7nxa6gpMaAtTHKO/hpZWp0CYebtJ17Z
	pGAU1aQEctu1I6wYeh15qF+uJPV/szWJ4maOzdXee/G2AhA3jU5dAVgHbELt9cOwHnVq
	J6inOOxbc/6bfItQhc3kiKQrCHaqlUv6oXlt6n79vIWhoGjXZD4qbOMGIlPYDihuanQ8
	DsrfCSv+6jghUOnaEnDe90UGuQwe+f5gMtLMTm3TDOhBFKJDABAklKaI1Jn2zjoCYvj5
	YRzkBUnpIz+W1rchKNNs8xQC+xOBVYBWHgk8ToGUq1/t7z0MIt5q/f3qiKPcixDiBM5K
	n0sA==
MIME-Version: 1.0
X-Received: by 10.50.66.172 with SMTP id g12mr540385igt.78.1442745009656; Sun,
	20 Sep 2015 03:30:09 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Sun, 20 Sep 2015 03:30:09 -0700 (PDT)
Date: Sun, 20 Sep 2015 12:30:09 +0200
Message-ID: <CALbNGRTZJYeAwLJteymkcTt7qjhG+3gq1RGk3HkG7DdXfSmzoA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: First run postinst broken
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
X-List-Received-Date: Sun, 20 Sep 2015 10:30:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

on images build with current master the postinsts for first run on
target are broken. Looking into

'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service'

I would expect

'/etc/*-postinsts'

in the image created for packets creating

 '<package>.postinst returned 1, marking as unpacked only,
configuration required on target.'

in log.do_rootfs. I grepped around but could not find the place
creating the files '/etc/*-postinsts'. Where are these files supposed
to be created?

Meanwhile I'll start a build with working configuration to find out
where they are created...

Andreas

