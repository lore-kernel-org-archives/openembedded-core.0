Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 07D856FA5F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 05:35:09 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id B49383F918
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:35:09 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -0.5
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:35:09 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:35:09 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 3 Jun 2014 07:35:13 +0200
Message-ID: <538D5E8C.1090008@topic.nl>
Date: Tue, 3 Jun 2014 07:35:08 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <53843793.3030309@topic.nl>	<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>	<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>	<1401318733.2607.71.camel@ted>
	<538D5C34.4060905@topic.nl>
In-Reply-To: <538D5C34.4060905@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Tue, 03 Jun 2014 05:35:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06/03/2014 07:25 AM, Mike Looijmans wrote:
>> Worst case, you can pull the siginfo files from one build and the
>> siginfo files from the sstate mirror and then see which ones are
>> different, then run bitbake-diffsigs X Y to compare the two files.
>
> How do I find what to pull? I have (ssh) access to both machines. The
> sstate-cache dir contains a bunch of two-digit directories and a gazillio=
n files.
>
> I could just copy the whole thing to one machine, there's gigabit between
> them, but then what do I do with these files?

mike:~/zynq_platform/build$ find sstate-cache -name=20
'*fpga-image-miami*.siginfo' | wc -l
480

Suppose I copy them. Where do I copy them to, and what do I do with these 4=
80=20
files to tell me why the system insists on rebuilding this package?

Mike.

PS: I really really want to find out. Several of these FPGA recipes take 3.=
5=20
hours to build on the fastest i5 we could buy. So you can imagine we really=
=20
want to prevent having to build it more than once.



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

Visit us at MEDTEC Europe 3-5 June, Messe Stuttgart, stand number 5D20
http://medteceurope.com/index.php?page=3Dhome-en


