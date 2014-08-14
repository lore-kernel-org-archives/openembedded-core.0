Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 966DE6059A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:13:57 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 7DB043F8D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:13:57 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:13:57 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:13:55 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 14 Aug 2014 13:14:06 +0200
Message-ID: <53EC99F3.1070004@topic.nl>
Date: Thu, 14 Aug 2014 13:13:55 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>	<CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>	<CAP71WjyHMhzdRWmxNwM8Ot=t1O0qFvONyaKqpWSaeEZU_+PKVQ@mail.gmail.com>	<CADV-EXF_+nNXPUEY0hJ3akxNCb0HeD+tHAYAiVcq9hACCv-ExA@mail.gmail.com>
	<20140813112531.GU14848@jama>
In-Reply-To: <20140813112531.GU14848@jama>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: Two distros with same MACHINE
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
X-List-Received-Date: Thu, 14 Aug 2014 11:14:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 08/13/2014 01:25 PM, Martin Jansa wrote:
> On Wed, Aug 13, 2014 at 02:09:36PM +0300, Yevhen Kyriukha wrote:
>> 13 =D0=90=D0=B2=D0=B3 2014 =D0=B3. 13:51 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C "Nicolas Dechesne" <
>> nicolas.dechesne@linaro.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>>>
>>> On Wed, Aug 13, 2014 at 12:46 PM, Yevhen Kyriukha <kirgene@gmail.com>
>> wrote:
>>>> I have 2 distro configs that use different PACKAGECONFIG settings for
>> the
>>>> same package. I'm building all distros for single MACHINE. Do I need t=
o
>> set
>>>> different TMPDIR to build these two distros or I can use same dir?
>>>>
>>>
>>> yes, you should. i generally recommend to use 1 build dir for each
>>> combination of <machine>, <distro> and <OE version>. keep in mind that
>>> TMPDIR are 'cheap', assuming you are sharing ssate-cache, downloads
>>> and using rm_work..
>>
>> Thanks!
>
> I don't agree with separate dirs for <machine>.
>
> Sharing the native sysroot and huge part of deploy/ipk/<common-arch> is
> very useful for lowering disk space usage.
>

I'd name it as one of the major improvements over classic OE, being able to=
=20
build multiple machines while sharing common things.

As for disk space, I found that it helps to occasionally remove the tmp dir=
=20
and start over. That usually yields a few GB back. It would be nice if rm_w=
ork=20
tried harder to remove stuff.

M.



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

Bezoek ons op 9 en 10 september tijdens Technology for Health Den Bosch (st=
and 53)
http://www.technologyforhealth.nl


