Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 0987760030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:19:15 +0000 (UTC)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id BD2A23F6E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 09:19:14 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.001
X-Spam-Level: 
X-Spam-Status: No, score=-0.001 tagged_above=-999 required=4.5
	tests=[BAYES_40=-0.001] autolearn=disabled
X-Spam-Languages: sco en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 09:19:14 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 09:19:14 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 26 Nov 2014 09:19:28 +0100
Message-ID: <54758D01.3070601@topic.nl>
Date: Wed, 26 Nov 2014 09:19:13 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Why does building an image for machine X delete the bootloader for machine Y?
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
X-List-Received-Date: Wed, 26 Nov 2014 08:19:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI do a:

MACHINE=3DX bitbake my-image

This DEPENDS on a virtual bootloader, which will produce a BOOT.BIN file in=
=20
the deploy directory, which is tmp-glibc/deploy.images/X/

If I then do a:

MACHINE=3DY bitbake my-image

the BOOT.BIN in tmp-glibc/deploy.images/X/ is suddenly gone!

If i do a

MACHINE=3DX bitbake my-image

then the the BOOT.BIN in tmp-glibc/deploy.images/Y/ is suddenly gone, and t=
he=20
one for the X machine appears again. The bootloader recipe is not being=20
rebuilt at all.

The machines have the same MACHINE_ARCH, they differ on only minor points (=
the=20
FPGA).

What is going on here?


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


