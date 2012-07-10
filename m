Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Soi0o-0006R1-Mb
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 23:30:28 +0200
Received: from mail8-co1-R.bigfish.com (10.243.78.254) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 21:01:48 +0000
Received: from mail8-co1 (localhost [127.0.0.1])	by mail8-co1-R.bigfish.com
	(Postfix) with ESMTP id 54DFEB40330	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 21:01:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail8-co1 (localhost.localdomain [127.0.0.1]) by mail8-co1
	(MessageSwitch) id 1341954106633116_24284;
	Tue, 10 Jul 2012 21:01:46 +0000 (UTC)
Received: from CO1EHSMHS021.bigfish.com (unknown [10.243.78.225])	by
	mail8-co1.bigfish.com (Postfix) with ESMTP id 9920888004A	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 21:01:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS021.bigfish.com
	(10.243.66.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 21:01:45 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Tue, 10 Jul 2012 16:04:04 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] sysvinit-inittab.bb: fix up dynamically
	removed consoles
Thread-Index: AQHNXt+JOioKSvCf4U+4hA0IB//BYQ==
Date: Tue, 10 Jul 2012 21:04:03 +0000
Message-ID: <CAEsOVNfvo6Luih7YjrEcF4jqE=y6j=yK4pU97Nkfha-rnjeSpw@mail.gmail.com>
References: <1341950440-19009-1-git-send-email-msm@freescale.com>
	<1341950440-19009-2-git-send-email-msm@freescale.com>
In-Reply-To: <1341950440-19009-2-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 2/2] sysvinit-inittab.bb: fix up dynamically removed consoles
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 21:30:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9750DA18B7CE1548BCE6F5336CD703C3@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Ignore this one too, sorry.

-M

On Tue, Jul 10, 2012 at 3:00 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> Using dmesg could result in removing all the serial consoles as the
> dmesg buffer might get filled up and erase the info we are looking
> for. Instead let's look at /proc/consoles
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/met=
a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index fe1ff41..fae3cac 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Inittab for sysvinit"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>
> -PR =3D "r8"
> +PR =3D "r9"
>
>  SRC_URI =3D "file://inittab"
>
> @@ -59,7 +59,7 @@ if [ "x$D" =3D=3D "x" ]; then
>         for i in $tmp
>         do
>                 j=3D`echo ${i} | sed s/^.*\;//g`
> -               if [ -z "`dmesg | grep ${j}`" ]; then
> +               if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
>                         sed -i /^.*${j}$/d /etc/inittab
>                 fi
>         done
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



