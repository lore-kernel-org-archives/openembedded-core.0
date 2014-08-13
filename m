Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 82C7160CFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 05:13:50 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 2C37F3F504;
	Wed, 13 Aug 2014 07:13:50 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLACK=1.7] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed, 13 Aug 2014 07:13:49 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed, 13 Aug 2014 07:13:48 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 13 Aug 2014 07:13:58 +0200
Message-ID: <53EAF40B.8050301@topic.nl>
Date: Wed, 13 Aug 2014 07:13:47 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <53EA5178.7020209@topic.nl>
	<CAJTo0LY+Kp14Sn4bdFtX4eYCK4Oea52MEG-=s6TbG_CKoMx9Pg@mail.gmail.com>
In-Reply-To: <CAJTo0LY+Kp14Sn4bdFtX4eYCK4Oea52MEG-=s6TbG_CKoMx9Pg@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Autotools and "foreign"
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
X-List-Received-Date: Wed, 13 Aug 2014 05:13:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 08/12/2014 08:57 PM, Burton, Ross wrote:
> On 12 August 2014 18:40, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> Is there an alternative to manually patching all of these packages to ge=
t
>> them to compile once more?
>
> Depends on the package, but generally you'll need to update the
> automake macro at the top of configure.ac (and submit a patch upstream
> as this should have been fixed years ago).

Basically, you're saying "no" then?

> Encouraging said upstreams to use autoreconf instead of (likely)
> home-grown crazy would be a good move whilst you're talking to them.

That might be the case if said upstream people actually still existed. Most=
 of=20
these packages have since long been abandoned.

So I guess I'll have to cook up a class that works around it, just adding t=
he=20
"missing" files into the S directory might do the trick.

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

Bezoek ons op 9 en 10 september tijdens Technology for Health Den Bosch (st=
and 53)
http://www.technologyforhealth.nl


