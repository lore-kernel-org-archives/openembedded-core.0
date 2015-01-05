Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 92D8B65CF4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 08:30:00 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id B2D103F825
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:29:59 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: 0
X-Spam-Level: 
X-Spam-Status: No, score=0 tagged_above=-999 required=3.5
	tests=[BAYES_20=-0.001, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en sco
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:29:59 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:29:58 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 5 Jan 2015 09:31:11 +0100
Message-ID: <54AA4B86.9040905@topic.nl>
Date: Mon, 5 Jan 2015 09:29:58 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <54AA4536.7030101@topic.nl>
In-Reply-To: <54AA4536.7030101@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Mon, 05 Jan 2015 08:30:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI think I found it. The kernel bbclass changes "S" to point elsewh=
ere. Moving=20
the statement
S =3D "${WORKDIR}/git"
to after the "inherit kernel" line makes the compile run again.



On 01/05/2015 09:03 AM, Mike Looijmans wrote:
> I updated to the current master of OE-core, but I can't get the kernel re=
cipe
> to work any longer:
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes=
-kernel/linux-zynq/linux-topic.bb
>
>
> (I got similar problems in other projects too, I'm focussing on this one =
first.)
>
> Several things were changed in kernel.bbclass, but I don't understand wha=
t is
> being expected from me now to get the kernel recipe in working order agai=
n.
>
>
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | NOTE: make -C
> /home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z01=
5/usr/src/kernel
> O=3D/home/mike/zynq_platform/build/tmp-glibc/work/topic_miami_vice-oe-lin=
ux-gnueabi/linux-topic/3.17+gitAUTOINC+0feb6e4839-r0/build
> oldnoconfig
> | make: Entering directory
> `/home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z0=
15/usr/src/kernel'
>
> | make: *** No rule to make target `oldnoconfig'.  Stop.
> | make: Leaving directory
> `/home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z0=
15/usr/src/kernel'
>
> | NOTE: make -C
> /home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-vice-xc7z01=
5/usr/src/kernel
> O=3D/home/mike/zynq_platform/build/tmp-glibc/work/topic_miami_vice-oe-lin=
ux-gnueabi/linux-topic/3.17+gitAUTOINC+0feb6e4839-r0/build
> oldconfig
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>
> Please consider the environment before printing this e-mail
>
> Topic zoekt gedreven (embedded) software specialisten!
> http://topic.nl/vacatures/topic-zoekt-software-engineers/
>



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


