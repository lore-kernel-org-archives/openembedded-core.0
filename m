Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id C865C6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 15:51:30 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fe3so101169313pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=1GhEXP17HsP+AGRIwAUAm0rkiLL3mDwslHY3+LlVpSk=;
	b=1B8XN1/jutWoXyjE3H0SGbtFBR2flrTY3zGml5oqwvqc3nNUCnrLv7AKlzk5jNBd5+
	+K9+tBs3PuBMAOv+Lw6Va3ppWoUXiwRlBqiaYPs71B487uObYUZ7mAPUk8vppfHW3+LL
	SD8qX8g9a8hKpTBfHM8PiTLfL32oZa+o367LZBgm8frMvtHfpwQ6vF6+bgPJBSLDkyOS
	OLaXcNZwpbBL4XNSi74J9OErVQVnuBZX1T8Ik4aR6RewzOjtaif/99c8rPGE32DyX1XG
	gKwPaauMpR8XOnCp2CtP4MUKb8+k2V9XROApxXh9pJ+PuvcQySIZRgLHVuYTAmzwl4mq
	ybOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=1GhEXP17HsP+AGRIwAUAm0rkiLL3mDwslHY3+LlVpSk=;
	b=HyQkal7pkYwyh7kJ7f5tQ2ZDXfgf/WFCvcZ6HaRwJet+CJOTQtvEtkLmW5JKcY3e2C
	j1BpbsyRT2+M0q/DA1bi5UwC0dRjGSWDkkpKvJPaotxxw7A5xXDzOMou10U67m6vz/ra
	Et7gc4Q1ygVwtPeRWE453xY8e45+evUyyQETqg0P3aPbjEahZeaGKqUVfZaj/7ghq19c
	IvmsaKyq51Pjw7HKoThVd6SQ1P98RTusZj9XCOJ64Q0xvMdjnehOoGuiBVw3Ed0v9QYA
	uCqMXrsxZG98yOFtrcqNNfLUNMFrJqax3imyqawMJHed4ccfqxFlVZqzt2CNWFGuK2Vu
	w3yQ==
X-Gm-Message-State: AD7BkJLMz/itUdK9QG5QEYQMRGTrykzceRLUgtAkNwT6LxYuAk/MnWDOLiwg9PqjyTUFcw==
X-Received: by 10.66.253.68 with SMTP id zy4mr43842714pac.81.1459180291084;
	Mon, 28 Mar 2016 08:51:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:714a:4e59:1cde:8924?
	([2601:202:4000:1239:714a:4e59:1cde:8924])
	by smtp.googlemail.com with ESMTPSA id
	16sm36717843pfk.28.2016.03.28.08.51.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 08:51:29 -0700 (PDT)
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F952F7.2010409@gmail.com>
Date: Mon, 28 Mar 2016 08:51:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Aarch64 u-boot with gcc .5x
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
X-List-Received-Date: Mon, 28 Mar 2016 15:51:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I have an arm64 odroid c2 board.  If I build u-boot with the current OE
5.3 gcc it hangs at kernel load time. If I use 4.9 gcc it works fine. A
5.3 built kernel boots fine with a 4.9 built u-boot.

The vendor supplied u-boot is hacked up and am leaning it that direction
as the culprit so I am looking for data points.

Is anyone using a current u-boot with 5.3 gcc on an arm64 machine? if
so, any special tweaks to get that combo to work?

kind regards,
Armin

