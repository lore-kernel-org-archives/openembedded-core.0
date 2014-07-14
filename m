Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Jul 2014 12:13:20 UTC
Received: from retry101.mer-nm.internl.net (vif1-retry101.mer-nm.internl.net
	[217.149.192.107])
	by mail.openembedded.org (Postfix) with ESMTP id AFD4E70194
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 12:13:20 +0000 (UTC)
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[IPv6:2a01:3a8:100:2::8b:25])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 21BE441171
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:07:29 +0200 (CEST)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id F33184011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:07:20 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: 0.8
X-Spam-Level: 
X-Spam-Status: No, score=0.8 tagged_above=-999 required=4.5
	tests=[BAYES_50=0.8] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:07:19 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:07:04 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 14 Jul 2014 14:07:12 +0200
Message-ID: <53C3C7E8.2000806@topic.nl>
Date: Mon, 14 Jul 2014 14:07:04 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: UBI filesystem creation fails silently with 4k erase size
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
X-List-Received-Date: Mon, 14 Jul 2014 12:13:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI have a NOR chip that reports a 4k erase size, so in my machine.c=
onf I entered:

MKUBIFS_ARGS =3D "-m 1 -e 3968 -c 7040"
UBINIZE_ARGS =3D "-m 1 -p 4096"
UBI_VOLNAME =3D "qspi-rootfs"


When I create an image with "ubi" in the IMAGE_FSTYPES, the build runs and=
=20
does not report any error, however it did NOT create the ubi filesystem ima=
ge.

If I change the parameters for a 64k flash using:

MKUBIFS_ARGS =3D "-m 1 -e 65408 -c 440"

the ubi filesystem is created (both ubifs and ubi files).


Where can I find what went wrong? I'd expect big read error messages tellin=
g=20
me that it failed to create an image for my device, but I cannot find such=
=20
message anywhere.

So my questions are:

1) Why is there no error message when image creation fails?
2) Where is the log/output from the mkfs.ubi commands?
2) What could be wrong with my mkubifs parameters?

Mike.


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

Topic zoekt FPGA experts
http://topic.nl/vacatures/word-jij-onze-nieuwe-fpga-expert/


