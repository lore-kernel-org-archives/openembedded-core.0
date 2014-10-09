Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 6567B6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 08:16:32 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id E77F03F785
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 10:16:31 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 10:16:31 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 10:16:29 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 9 Oct 2014 10:16:44 +0200
Message-ID: <5436445C.5020503@topic.nl>
Date: Thu, 9 Oct 2014 10:16:28 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
References: <54354CBD.6040506@topic.nl>
In-Reply-To: <54354CBD.6040506@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
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
X-List-Received-Date: Thu, 09 Oct 2014 08:16:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFIn partial reply to my own question, this has been discussed 2 yea=
rs ago, but=20
apparently nothing ever came out of it.

http://lists.openembedded.org/pipermail/openembedded-core/2012-February/056=
050.html

So once more the request to be able to get sane version strings for git rep=
os.=20
Can we please just move gitpkgv. That's like five minutes work, and if anyo=
ne=20
(e.g. me) feels like building something better, he or she is free do submit=
=20
that and get rid of the gitpkgv class once it's obsolete.

Mike.

On 10/08/2014 04:39 PM, Mike Looijmans wrote:
> The gitpkgv class is very helpful when you want packages to have a consis=
tent
> incremental version number, when build machines cannot talk to eachother
> (ruling out using PRSERVER for example) other than through repositories.
>
> However, this small gem is present in meta-oe and not in the core. I now =
have
> several layers that pull in all of meta-oe just for being able to number =
GIT
> versions incrementally.
>
> Could gitpkgv be moved into oe-core? (I'll be happy to write and submit t=
he
> patch.) Or, is there an alternative that does something similar?
>
> Kind regards,
> Mike.
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
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


