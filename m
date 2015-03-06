Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 327816013D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:15:02 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id D14963F4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 10:15:01 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
X-Spam-Status: No, score=-2.898 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, RCVD_IN_DNSWL_BLOCKED=0.001,
	URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 10:15:01 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 10:14:59 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 6 Mar 2015 10:16:12 +0100
Message-ID: <54F9700E.1050501@topic.nl>
Date: Fri, 6 Mar 2015 10:14:54 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1503050340460.25779@Device-040570>
In-Reply-To: <alpine.LFD.2.11.1503050340460.25779@Device-040570>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: is standard for COMPATIBLE_MACHINE to use "()" or not?
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
X-List-Received-Date: Fri, 06 Mar 2015 09:15:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05-03-15 09:43, Robert P. J. Day wrote:
>
>    a style guide thing ... it appears that COMPATIBLE_MACHINE happily
> acccepts a matching RE within parentheses or not, is there a
> preference?
>
>    also, in checking that, i ran across this in oe-core:
>
> linux-yocto_3.14.bb:COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemux86|qem=
uppc|qemumips|qemumips64|qemux86-64"
> linux-yocto_3.19.bb:COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemux86|qem=
uppc|qemumips|qemumips64|qemux86-64"
> linux-yocto-dev.bb:COMPATIBLE_MACHINE =3D "(qemuarm|qemux86|qemuppc|qemum=
ips|qemumips64|qemux86-64)"

The regex should have been "qemu(arm|x86|ppc|mips|mips64|x86-64)"

And since "x86-64" already matches "x86", that could have been omitted.

> where the first two recipes list "qemuarm64" but the dev version
> doesn't ... is that deliberate?

Probably not, but "qemuarm64" matches "qemuarm" already.



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


