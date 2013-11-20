Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id D0A266C73D
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 11:09:20 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id A6CAE3F595;
	Wed, 20 Nov 2013 12:09:21 +0100 (CET)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed, 20 Nov 2013 12:09:21 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed, 20 Nov 2013 12:09:20 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Wed, 20 Nov 2013 12:09:21 +0100
Message-ID: <528C985F.60806@topic.nl>
Date: Wed, 20 Nov 2013 12:09:19 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <528C8880.7070806@topic.nl> <20131120103815.GJ3708@jama>
In-Reply-To: <20131120103815.GJ3708@jama>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: tslib keeps failing on checksum
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
X-List-Received-Date: Wed, 20 Nov 2013 11:09:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/20/2013 11:38 AM, Martin Jansa wrote:
> On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
>> =EF=BB=BFI get this error every time I try t build the current oe-core m=
aster:
>>
>> ERROR: Checksum failure fetching
>> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz;=
downloadfilename=3Dtslib-1.1.tar.xz
>> ERROR: Function failed: Fetcher failure for URL:
>> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz=
;downloadfilename=3Dtslib-1.1.tar.xz'.
>> Checksum mismatch!
>> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has md5 ch=
ecksum
>> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e837d w=
as
>> expected
>>
>> Now the weird thing is, that when I fetch the thing using wget, I get a =
blob
>> with the right checksum:
>>
>> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.=
tar.xz
>> # md5sum tslib-1.1.tar.xz
>> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
>>
>> Is oe-core using some other flavour of wget or what else could cause thi=
s kind
>> of fetch error?
>
> Have you tried to unpack both tarballs and compare content in them?

Nope, I just assumed they're two somewhat different copies of the same=20
software (e.g. one of them has a "downloaded from here" remark or so).=20
Anything in particular I should look for?

> If you have older version of bitbake, then it could be that you have
> broken tarball in downloads directory.

I seemed to be using 1.19.1 (as reported on startup), so I've upgraded to t=
he=20
master which reports to be 1.21.0, cleaned the build dir, and will try agai=
n.

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.

