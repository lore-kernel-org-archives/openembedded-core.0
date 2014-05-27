Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 360 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 07:04:30 UTC
Received: from retry101.mer-nm.internl.net (unknown [217.149.192.107])
	by mail.openembedded.org (Postfix) with ESMTP id 036696FA5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:04:30 +0000 (UTC)
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[IPv6:2a01:3a8:100:2::8a:25])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 0971B4003F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 08:58:36 +0200 (CEST)
Received: from amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.128])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id B2EC93F4D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 08:58:30 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -0.001
X-Spam-Level: 
X-Spam-Status: No, score=-0.001 tagged_above=-999 required=4.5
	tests=[BAYES_20=-0.001] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 08:58:28 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 08:58:28 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 27 May 2014 08:58:32 +0200
Message-ID: <53843793.3030309@topic.nl>
Date: Tue, 27 May 2014 08:58:27 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Tue, 27 May 2014 07:04:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI have a deja-vu feeling about this question.

I have this recipe:

https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-b=
sp/fpga/fpga-image-miami.bb

Which includes this one:
https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-b=
sp/fpga/fpga-image.inc

I have a build server that exports its sstate-cache directory through HTTP,=
=20
and a local host that attempts to use that sstate-cache. This works fine,=20
except for the recipe above. Building this recipe takes about 1 hour, so i=
=20
really really really want to share that state at any cost. As you can see,=
=20
I've done a big shotgun blast of "vardepdsexclude" to get the recipe to be =
as=20
common as possible. Still any host wants to build its own version.

How can I diagnose the REASON that my machine thinks it isn't building the=
=20
exact same thing as the build server?


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

Visit us at MEDTEC Europe 3-5 June, Messe Stuttgart, stand number 5D20
http://medteceurope.com/index.php?page=3Dhome-en


