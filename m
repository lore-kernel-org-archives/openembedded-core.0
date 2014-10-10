Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 975DC6FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 05:36:27 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 3E8FA3F4AD;
	Fri, 10 Oct 2014 07:36:27 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -0.5
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Fri, 10 Oct 2014 07:36:26 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Fri, 10 Oct 2014 07:36:25 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Fri, 10 Oct 2014 07:36:40 +0200
Message-ID: <54377059.10606@topic.nl>
Date: Fri, 10 Oct 2014 07:36:25 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <54354CBD.6040506@topic.nl>	<5436445C.5020503@topic.nl>	<1412884615.871.24.camel@ted>
	<CAP9ODKpERB+agUBv3-BgPM3JRBQiZ-QKVhONvuSkRFUWi_ZkqQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpERB+agUBv3-BgPM3JRBQiZ-QKVhONvuSkRFUWi_ZkqQ@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request to move "gitpkgv.bbclass" from meta-oe to oe-core
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
X-List-Received-Date: Fri, 10 Oct 2014 05:36:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 10/10/2014 12:15 AM, Otavio Salvador wrote:
> On Thu, Oct 9, 2014 at 4:56 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2014-10-09 at 10:16 +0200, Mike Looijmans wrote:
>>> =EF=BB=BFIn partial reply to my own question, this has been discussed 2=
 years ago, but
>>> apparently nothing ever came out of it.
>>>
>>> http://lists.openembedded.org/pipermail/openembedded-core/2012-February=
/056050.html
>>>
>>> So once more the request to be able to get sane version strings for git=
 repos.
>>> Can we please just move gitpkgv. That's like five minutes work, and if =
anyone
>>> (e.g. me) feels like building something better, he or she is free do su=
bmit
>>> that and get rid of the gitpkgv class once it's obsolete.
>>
>> I do feel quite strongly that this is something which should get
>> improved in the fetcher itself. That is why I've pushed back on the
>> patch since if I take it into OE-Core, there is even less incentive to
>> fix the real problem...
>
> Mike I am also an user of gitpkgv but I must to agree with Richard
> here. Moving this to OE-Core will just make it worse. It is way better
> to prepare a patch and add support for it on the fetcher code of
> BitBake.

Give me some pointers on what you're talking about here, and I'll be happy =
to=20
try and implement it. Currently I have no idea as to what is "wrong" with t=
he=20
gitpkgv approach, and I also have no clue as to what it is you want to have=
=20
implemented in the git fetcher.

Kind regards,
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

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


