Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id B3A7F609AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 06:10:08 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 49D34401EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 08:10:08 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -0.5
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 08:10:07 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 08:10:07 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 22 Apr 2014 08:10:07 +0200
Message-ID: <535607BE.90003@topic.nl>
Date: Tue, 22 Apr 2014 08:10:06 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5352B5E0.3080509@topic.nl> <535605FA.6080905@windriver.com>
In-Reply-To: <535605FA.6080905@windriver.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: nfs-utils does NOT rdepend on bash
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
X-List-Received-Date: Tue, 22 Apr 2014 06:10:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 04/22/2014 08:02 AM, ChenQi wrote:
> On 04/20/2014 01:44 AM, Mike Looijmans wrote:
>> To my surprise, a megabyte sized package "bash" was installed on target =
when
>> I installed nfs-utils to start the NFS server.
>>
>> Commit 664ae3dc52fd7fc8c6f64e6cf5e70f97dedd332d claims the package needs=
 bash.
>>
>> It's simply not true. It does not require bash at all, it runs just fine
>> with busybox's ash shell for example.
>>
>
> How about the start-statd script?
> It begins with '#!/bin/bash -p'.
> If you de-bash it, I think we can remove the dependency.

I'll take a look, shouldn't be hard. And it is not required for the server=
=20
anyway, so if the bashism can't be easily removed, I think start-statd shou=
ld=20
be moved into another package so that only that part will draw in the bash=
=20
dependency.

I'll try to create separate patches, one "de-bash" patch, and one to fix an=
d=20
simplify the server startup script.



>> I don't understand the reasoning behind that commit. There's nothing in
>> nfs-utils that really needs bash, it runs fine without it.
>>
>>
>>
>> Also, there is an error in the startup script, I can submit a patch for =
that
>> if you like. The script is needlessly complex too.
>>
>>
>



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

Bezoek ons op 7 en 8 mei tijdens High-Tech Systems Den Bosch (stand 24)
http://www.hightechsystems.nl


