Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id A49746D701
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 12:02:27 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 667A93FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:02:29 +0100 (CET)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:02:28 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 13:02:28 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Wed, 20 Nov 2013 13:02:29 +0100
Message-ID: <528CA4D3.6020109@topic.nl>
Date: Wed, 20 Nov 2013 13:02:27 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <528CA4B0.3060907@topic.nl>
In-Reply-To: <528CA4B0.3060907@topic.nl>
X-Forwarded-Message-Id: <528CA4B0.3060907@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Wed, 20 Nov 2013 12:02:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/20/2013 12:09 PM, Mike Looijmans wrote:
> On 11/20/2013 11:38 AM, Martin Jansa wrote:
>> On Wed, Nov 20, 2013 at 11:01:36AM +0100, Mike Looijmans wrote:
>>> =EF=BB=BFI get this error every time I try t build the current oe-core =
master:
>>>
>>> ERROR: Checksum failure fetching
>>> https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.xz=
;downloadfilename=3Dtslib-1.1.tar.xz
>>>
>>> ERROR: Function failed: Fetcher failure for URL:
>>> 'https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1.tar.x=
z;downloadfilename=3Dtslib-1.1.tar.xz'.
>>>
>>> Checksum mismatch!
>>> File: '/home/mike/zynq-next/build/downloads/tslib-1.1.tar.xz' has md5 c=
hecksum
>>> d41d8cd98f00b204e9800998ecf8427e when 14771f8607b341bb4b297819d37e837d =
was
>>> expected
>>>
>>> Now the weird thing is, that when I fetch the thing using wget, I get a=
blob
>>> with the right checksum:
>>>
>>> # wget https://github.com/kergoth/tslib/releases/download/1.1/tslib-1.1=
.tar.xz
>>> # md5sum tslib-1.1.tar.xz
>>> 14771f8607b341bb4b297819d37e837d  tslib-1.1.tar.xz
>>>
>>> Is oe-core using some other flavour of wget or what else could cause th=
is kind
>>> of fetch error?
>>
>> Have you tried to unpack both tarballs and compare content in them?
>
> Nope, I just assumed they're two somewhat different copies of the same
> software (e.g. one of them has a "downloaded from here" remark or so).
> Anything in particular I should look for?

After upgrading I tried again. The file as downloaded by bitbake is complet=
ely
empty. Nothing in it. The md5 sum of this empty file is
d41d8cd98f00b204e9800998ecf8427e indeed.

I'm now using bitbake 1.21.0 (current master) and OE rev
0eb947454e1c92467283e6f1adeca67c7c57698b to build with, with the above resu=
lts
still.

(I know I can just move my own file into the download directory and get on
with it, but i'd rather actually solve this problem).

There's a direct connection to the internet, no proxy (just a router) that
might have been caching things.

Any suggestions?

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

