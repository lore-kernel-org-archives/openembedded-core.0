Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id E9D9365CDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 12:40:23 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id ACA523F6A2;
	Mon, 20 Oct 2014 14:40:23 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon, 20 Oct 2014 14:40:23 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon, 20 Oct 2014 14:40:22 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 20 Oct 2014 14:40:38 +0200
Message-ID: <544502B6.5040808@topic.nl>
Date: Mon, 20 Oct 2014 14:40:22 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5444F848.3040307@topic.nl> <1413806657.17752.154.camel@ted>
In-Reply-To: <1413806657.17752.154.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Going beyond MACHINE?
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
X-List-Received-Date: Mon, 20 Oct 2014 12:40:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 10/20/2014 02:04 PM, Richard Purdie wrote:
> On Mon, 2014-10-20 at 13:55 +0200, Mike Looijmans wrote:
>> =EF=BB=BFThe short version of my question: Can I define a "level" that g=
oes beyond MACHINE?
>>
>> My problem in detail (and I suspect there are more systems with similar =
problems):
>>
>> I have an SOC called "topic-miami". There are currently two variants: Th=
e 7015
>> and 7030. They are identical but for one component: They have a differen=
t FPGA
>> part (the 7030 is bigger and faster).
>> Both run exactly the same kernel and bootloader, and all other software =
and
>> libraries are exactly the same.
>>
>> Currently I have MACHINE=3D"topic-miami-7015" and then SOC_FAMILY=3D"top=
ic-miami"
>> so I can use "topic-miami" as override word for all packages.
>>
>> However, this means I get two kernels, two bootloaders, etc. even though=
 they
>> are exactly the same.
>>
>> The only package that currently differs is the one that delivers the
>> bitstream(s) for the FPGA. These are big, too big to fit bitstreams for =
both
>> models into flash and leave room for applications, so just installing bo=
th
>> into the rootfs and pick the correct one at boot time is not really an o=
ption.
>>
>> Maybe I could define some extra PACKAGE_ARCH for the bitstreams (which m=
ake
>> sense, as this is sort of firmware for a different platform). But how wo=
uld a
>> user then pick the right value for this variable, since MACHINE seems to=
 be
>> the only thing he can really choose?
>>
>> Any thoughts and ideas are welcome...
>
> One possible solution would be to inject another PACKAGE_ARCH (as the
> intel gmgd graphics does for example), then mark the MACHINE specific
> packages as being that package architecture. They'd then only get built
> once per package architecture yet your bitstreams would still be machine
> specific. You could probably do the "remarking" using anonymous python
> injected at the machine level.

Sounds doable, but I can't find anything about "intel gmgd" in any layer.=20
Which machine are you referring to here?




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


