Return-Path: <Ryan.Meulenkamp@nedap.com>
X-Greylist: delayed 596 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Jan 2018 15:37:10 UTC
Received: from smtp4.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id 20D8578683
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nedap.com; i=@nedap.com; q=dns/txt; s=20161201;
	t=1516030633; x=1547566633;
	h=to:from:subject:message-id:date:mime-version:
	content-transfer-encoding;
	bh=MpzSOsXYpd8ta+8/CfOun4erCa0W403JRjcX7jO3wao=;
	b=k2Xi0Xz8dUecgC3w9z4ARQhfw0he/FIutoti+f2PHMB4UmAtagIM456R
	JgPvShYD/F/6SWmkZaEKhswkOwEBzYD/eyizYobppkvyFId8i1H6UiFrf
	vvOe5UGIsL+Kx+uJlFS0pRFHmB0p7jK9wjQPD1UlQuF1ca7oY54RMPrVI 0=;
X-IronPort-AV: E=Sophos;i="5.46,364,1511823600"; 
   d="scan'208";a="1045421"
Received: from nedap.nedap.local (HELO [10.2.16.212]) ([10.2.16.212])
	by smtp4.nedap.com with ESMTP; 15 Jan 2018 16:27:12 +0100
To: openembedded-core@lists.openembedded.org
From: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>
Message-ID: <2c8062a2-3ef8-7fec-fd9b-345d9244d383@nedap.com>
Date: Mon, 15 Jan 2018 16:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Subject: halt problem
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
X-List-Received-Date: Mon, 15 Jan 2018 15:37:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi y'all,

I ran into a problem using shutdown -h (or halt) on an openembedded-core 
(yocto) distro running on the Atmel at91sam9g45.

We used to run an openembedded-classic (angström) based OS with kernel 
version 2.6.35.14+. Here, halting the system would cause it to shutdown 
without resetting, or turning the power off, to await a manual reset.

Now we are building a new distro based on openembedded-core and yocto. 
Halting the system now causes a watchdog intervention. I tried all 
different arguments for both the shutdown and the halt command. It looks 
if though the classic based distro left the watchdog daemon running 
during a halt.

What could be the cause of this problem? In what direction should I look 
(e.g. kernel config, sysvinit config, openembedded config, processor 
specific code etc.)?

I'm not sure if this is the right mailing list to ask this question, but 
I guess one of you could point me in the right direction.

Thanks in advance and kind regards,

Ryan Meulenkamp

