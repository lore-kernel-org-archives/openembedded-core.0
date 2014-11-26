Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id BD3DB60601
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 13:43:04 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id A6D3B3F8A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:43:04 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:43:04 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:43:04 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 26 Nov 2014 14:43:18 +0100
Message-ID: <5475D8E7.3030507@topic.nl>
Date: Wed, 26 Nov 2014 14:43:03 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
	<1417004047.12520.10.camel@linuxfoundation.org>
In-Reply-To: <1417004047.12520.10.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Wed, 26 Nov 2014 13:43:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/26/2014 01:14 PM, Richard Purdie wrote:
> On Tue, 2014-11-25 at 20:27 +0000, Paul Barker wrote:
>> Hi all,
>>
>> Does anyone know why the configuration files for opkg are split into
>> opkg-config-base (containing just '/etc/opkg/arch.conf') and
>> opkg-collateral (containing just '/etc/opkg/opkg.conf')? It looks like
>> the split dates back to openembedded classic.
>>
>> If there isn't a good reason for this perhaps now would be a good time
>> to merge all this back into the 'opkg' recipe and package. I'm happy
>> to put the patch together, just checking if it sounds like a good idea
>> before I do the work.
>
> I think at least one of the above was intended to allow distro specific
> package feeds to be preconfigured as as such belonged as a standalone
> config file.
>
> The architecture file is also machine specific, we wouldn't want opkg
> itself rebuilding for every machine so that is probably why its
> separate.
>
> Three different things on the other hand seems excessive. We probably
> could survive with some merhing with opkg and the remainder being
> machine specific.

It's only excessive in its default state. Once you have a proper distributi=
on=20
with an online feed, it makes perfect sense to have separate packages:
- the opkg "core" files which are the same for everyone.
- the machine-specific list of supported architectures (maybe extended with=
=20
distro-specific extras)
- the distro specific config files containing the location of the various=20
feeds. These may also be machine specific, for example due to a package lik=
e=20
Opera being only allowed to run on machines from a particular vendor.

I for one would not want to see any of these three merged.


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


