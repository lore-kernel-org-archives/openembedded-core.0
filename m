Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5316041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 11:08:20 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 042D53F50B;
	Fri, 26 Jul 2013 13:08:19 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -3.418
X-Spam-Level: 
X-Spam-Status: No, score=-3.418 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_DYNAMIC2=1, KHOP_THREADED=-1.5,
	RDNS_DYNAMIC=0.982, _DSLHELP01=-1] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Fri, 26 Jul 2013 13:08:18 +0200 (CEST)
Received: from TOP-EX02.topic.local (82-204-13-181.dsl.bbeyond.nl
	[82.204.13.181]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Fri, 26 Jul 2013 13:08:15 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (192.168.10.102) by mail.topic.nl
	(192.168.1.103) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Fri, 26 Jul 2013 13:08:10 +0200
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.289.1;
	Fri, 26 Jul 2013 13:08:16 +0200
Message-ID: <51F258A0.9090007@topic.nl>
Date: Fri, 26 Jul 2013 13:08:16 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
	<5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
	<20130726092812.GD3280@jama>
In-Reply-To: <20130726092812.GD3280@jama>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 9/9] Generate ssh keys at rootfs creation time in case of a read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 11:08:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 07/26/2013 11:28 AM, Martin Jansa wrote:
> On Fri, Jul 26, 2013 at 03:39:36PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> To avoid generating ssh keys every time a system with read-only rootfs
>> starts, we generate ssh keys at rootfs creation time.
>>
>> This change only has effect for systems with read-only rootfs.
>
> I'm not sure if having the same keys on all devices installed from the
> same image is always desired behavior, imho it should be controlled by
> another variable, because some people want read-only rootfs and keys
> generated in some other write-able partition.
>

Agree.

I would suggest creating a separate recipe that places a ssh key on the=20
filesystem. That would be about equally useful, and it gives people a=20
choice. During development, such a feature is very nice to have, as it=20
lets the test board keep its current ssh key. It's a recipe that I'd be=20
happy to contribute. I alread have one that puts my pulic key on the box=20
so i can safely log in and/or run automated test software with passwords=20
disabled.




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

