Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.218])
 by mx.groups.io with SMTP id smtpd.web10.10594.1593784224209829809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=Ev7HQoMc;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.218, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend4 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id 901CE61EFE;
	Fri,  3 Jul 2020 15:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1593784220;
	bh=T9xRcnTPUUrpMNrcPBIZeiz/2rmxKnjzaUsbzz/k9Z0=;
	h=In-Reply-To:From:To:Date:Subject:MIME-Version:Content-type;
	b=Ev7HQoMc3yCvbsFlcwDQzkAzR/5lGGE90E9T7vYVZetImceZWmntmM9e6jxDZbAMi
	 otVZFORvdwN2Yg2X3ONW1AYQJbDmzUaxrSAg+ybbHPRr+AnceUFiU7/PL5aq0NluFh
	 5XdyspvB05anI5z5GYngV4jsX4R9ELL9MQhqBUx0=
In-Reply-To: <5495a287c87c02af4ac4114c8fe69e63a7f9bc6b.camel@linuxfoundation.org>
From: "T. Ulrich" <timon.ulrich@kabelmail.de>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,	
   "Jacob Kroon" <jacob.kroon@gmail.com>,	
   openembedded-core@lists.openembedded.org
Message-ID: <02ae4ea5ea404b44bc838f840c1ab9f2@kabelmail.de>
Date: Fri, 03 Jul 2020 15:50:19 +0200
X-Priority: 3
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: add lz4 dependency and fixthe call to lz4
MIME-Version: 1.0
Content-type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"font-family: arial,helvetica,san=
s-serif; font-size: 12px;"><title></title>I thought so, too=2E<br><br>D=
idn't swoop it up in the patch i've sent in though to keep things organ=
ized=2E<br>I'll look into it next week and supply another patch if the =
same principle applies=2E<br><br>Greetings,<br>Timon</div></body></html=
>

