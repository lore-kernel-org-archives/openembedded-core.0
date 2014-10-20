Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 7673F65CEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 11:55:54 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id D4A1D4016B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:55:53 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:55:53 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:55:53 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 20 Oct 2014 13:56:08 +0200
Message-ID: <5444F848.3040307@topic.nl>
Date: Mon, 20 Oct 2014 13:55:52 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Going beyond MACHINE?
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
X-List-Received-Date: Mon, 20 Oct 2014 11:55:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFThe short version of my question: Can I define a "level" that goes=
 beyond MACHINE?

My problem in detail (and I suspect there are more systems with similar pro=
blems):

I have an SOC called "topic-miami". There are currently two variants: The 7=
015=20
and 7030. They are identical but for one component: They have a different F=
PGA=20
part (the 7030 is bigger and faster).
Both run exactly the same kernel and bootloader, and all other software and=
=20
libraries are exactly the same.

Currently I have MACHINE=3D"topic-miami-7015" and then SOC_FAMILY=3D"topic-=
miami"=20
so I can use "topic-miami" as override word for all packages.

However, this means I get two kernels, two bootloaders, etc. even though th=
ey=20
are exactly the same.

The only package that currently differs is the one that delivers the=20
bitstream(s) for the FPGA. These are big, too big to fit bitstreams for bot=
h=20
models into flash and leave room for applications, so just installing both=
=20
into the rootfs and pick the correct one at boot time is not really an opti=
on.

Maybe I could define some extra PACKAGE_ARCH for the bitstreams (which make=
=20
sense, as this is sort of firmware for a different platform). But how would=
 a=20
user then pick the right value for this variable, since MACHINE seems to be=
=20
the only thing he can really choose?

Any thoughts and ideas are welcome...


Met vriendelijke groet / kind regards,

Mike Looijmans

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


