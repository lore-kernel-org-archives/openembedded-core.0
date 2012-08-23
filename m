Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4Nih-0007aX-LB
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 05:04:31 +0200
Received: from mail245-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE013.bigfish.com (10.7.40.63) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Aug 2012 02:52:25 +0000
Received: from mail245-va3 (localhost [127.0.0.1])	by
	mail245-va3-R.bigfish.com (Postfix) with ESMTP id A84675003B9;
	Thu, 23 Aug 2012 02:52:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i)
Received: from mail245-va3 (localhost.localdomain [127.0.0.1]) by mail245-va3
	(MessageSwitch) id 13456903442774_10371;
	Thu, 23 Aug 2012 02:52:24 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.238])	by
	mail245-va3.bigfish.com (Postfix) with ESMTP id F15BED80045;
	Thu, 23 Aug 2012 02:52:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Aug 2012 02:52:23 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.123]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 22 Aug 2012 21:52:22 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Thread-Topic: [OE-core] why does using a "revision" prevent downloading
	during a parse?
Thread-Index: AQHNgNpRNokU9M4a106Aes1Yl35T7w==
Date: Thu, 23 Aug 2012 02:52:22 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A5FD736@039-SN1MPN1-001.039d.mgd.msft.net>
References: <alpine.DEB.2.02.1208222108300.24283@oneiric>
In-Reply-To: <alpine.DEB.2.02.1208222108300.24283@oneiric>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why does using a "revision" prevent downloading during a parse?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 03:04:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5DB8A87F5C0786418F8079E3F8211CF9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2012 at 8:11 PM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
>   certainly about to embarrass myself again, but from
> u-boot_2011.06.bb:
>
> ...
> # This revision corresponds to the tag "v2011.06"
> # We use the revision in order to avoid having to fetch it from the repo =
during parse
> SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>
> PV =3D "v2011.06+git${SRCPV}"
> ...
>
>   i don't know what that means -- how does using that "revision"
> prevent fetching?  i would simply have defined the SRC_URI using the
> tag value, so i'm not sure what benefit i'm getting out of the above.

You should look for the patch that made that change and read the commit mes=
sage.

-M

>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



