Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SrWw2-0005Py-Q6
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 18:17:11 +0200
Received: from mail145-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Wed, 18 Jul 2012 16:05:49 +0000
Received: from mail145-va3 (localhost [127.0.0.1])	by
	mail145-va3-R.bigfish.com (Postfix) with ESMTP id 98A5A480561	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 16:05:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h946hf0ah107ah10d2hbe9i)
Received: from mail145-va3 (localhost.localdomain [127.0.0.1]) by mail145-va3
	(MessageSwitch) id 1342627516563394_28320;
	Wed, 18 Jul 2012 16:05:16 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.246])	by
	mail145-va3.bigfish.com (Postfix) with ESMTP id 48D382C033C	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 16:05:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 18 Jul 2012 16:05:15 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Wed, 18 Jul 2012 11:05:15 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Different behavior of same IMAGE_FSTYPES definition
	in edison branch and denzil branch
Thread-Index: AQHNZP8dsphqzcEdwkSwMrBymqdPeg==
Date: Wed, 18 Jul 2012 16:05:14 +0000
Message-ID: <CAEsOVNf596LWkxYUjbEJfAqRBqd50O7yOxPODuCRQ60vJKs4cQ@mail.gmail.com>
References: <CA452391058F6D4E9715FB2C29D9312A0121D266@039-SN2MPN1-021.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A0121D266@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Different behavior of same IMAGE_FSTYPES definition in edison branch and denzil branch
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
X-List-Received-Date: Wed, 18 Jul 2012 16:17:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <3E4F41B28E33E74FB2D13064478448C9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 8:05 AM, Luo Zhenhua-B19537
<B19537@freescale.com> wrote:
> I meet a different behavior of IMAGE_FSTYPES in edison branch and denzil
> branch.
>
>
>
> In edison branch:
>
> IMAGE_FSTYPES is defined as following in poky/meta/conf/bitbake.conf.
>
> IMAGE_FSTYPES ?=3D "tar.gz"
>
> I defined IMAGE_FSTYPES as following in my customized image bb file(in my
> layer)
>
> IMAGE_FSTYPES ?=3D "tar.gz ext2.gz.u-boot jffs2"
>
> The actual value of IMAGE_FSTYPES is "tar.gz ext2.gz.u-boot jffs2" which =
is
> the expectation.
>
>
>
> In denzil branch:
>
> IMAGE_FSTYPES is defined as following in poky/meta/conf/bitbake.conf.
>
> IMAGE_FSTYPES ?=3D "tar.gz"
>
> I defined IMAGE_FSTYPES as following in my customized image bb file(in my
> layer)
>
> IMAGE_FSTYPES ?=3D "tar.gz ext2.gz.u-boot jffs2"
>
> The actual value of IMAGE_FSTYPES is "tar.gz"
>
>
>
> Is this the expected behavior in denzil branch? Should I use =91IMAGE_FST=
YPES
> =3D "tar.gz ext2.gz.u-boot jffs2"=92 to override previous definition?

This has to do with the order the files are processed I believe. Which
ever ?=3D processed first takes precendence. I for one think we should
probably make everything in oe-core be ??=3D and layers can defined ?=3D
and local.conf/users can use =3D.

Thoughts?

-M=



