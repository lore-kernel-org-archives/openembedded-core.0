Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id B908C65D59
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 06:18:46 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 8F1E93F570;
	Fri,  5 Dec 2014 07:18:45 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Fri,  5 Dec 2014 07:18:45 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Fri,  5 Dec 2014 07:18:44 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Fri, 5 Dec 2014 07:18:58 +0100
Message-ID: <54814E43.3080602@topic.nl>
Date: Fri, 5 Dec 2014 07:18:43 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<CAP9ODKrh_p=yv7x2hWg7QcV_4vG2xvF+7WgcckMqf=FU457ovg@mail.gmail.com>
In-Reply-To: <CAP9ODKrh_p=yv7x2hWg7QcV_4vG2xvF+7WgcckMqf=FU457ovg@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Busybox mdev improvements
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
X-List-Received-Date: Fri, 05 Dec 2014 06:18:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 12/04/2014 09:47 PM, Otavio Salvador wrote:
> On Thu, Dec 4, 2014 at 8:27 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>> This first series fixes the touchscreen support. A patch to automaticall=
y
>> have mdev mount storage devices will follow soon, I'm still testing it.
>
> I enjoy this idea but please put this one in a specific sub-package or
> with a setting in /etc/default/mdev to enable/disable it.

By "this" you refer to the automatic mounting? No problem, and a good=20
suggestion too.

Another problem I solved in various projects is the automatic loading of=20
kernel drivers. It makes mdev automatically load modules and firmware, e.g.=
=20
when plugging in a USB device, and adds a script to scan for hotpluggable=20
devices at boot. It's only a few lines, but these make mdeve provide most o=
f=20
udev's functionality.




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


