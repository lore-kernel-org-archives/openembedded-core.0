Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1UUQ-000322-Cq
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 05:41:50 +0200
Received: from mail11-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 03:29:54 +0000
Received: from mail11-va3 (localhost [127.0.0.1])	by mail11-va3-R.bigfish.com
	(Postfix) with ESMTP id 8594F2A0105	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 03:29:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371Ic85dh1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail11-va3 (localhost.localdomain [127.0.0.1]) by mail11-va3
	(MessageSwitch) id 1345001391813675_8834;
	Wed, 15 Aug 2012 03:29:51 +0000 (UTC)
Received: from VA3EHSMHS014.bigfish.com (unknown [10.7.14.249])	by
	mail11-va3.bigfish.com (Postfix) with ESMTP id C3C3CC0165	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 03:29:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS014.bigfish.com
	(10.7.99.24) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 03:29:50 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Tue, 14 Aug 2012 22:29:49 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] perf on older kernels
Thread-Index: AQHNem2nfB7df3ESVEOse2py7bZ/LpdahjSAgAAFMQA=
Date: Wed, 15 Aug 2012 03:29:49 +0000
Message-ID: <CAEsOVNfh03y944-zeGVOrQ4bRnBc-EKoeyUbxtAKSppgTJ0n4A@mail.gmail.com>
References: <CAEsOVNcP1hf8OqHqDYmt1QJTQ2S557-HjHOa5ihNxVt-veaqOg@mail.gmail.com>
	<CADkTA4Ox5KqWoBFMa5k6HObyMYBK7jNThakNO6AKS04zLRPM4w@mail.gmail.com>
In-Reply-To: <CADkTA4Ox5KqWoBFMa5k6HObyMYBK7jNThakNO6AKS04zLRPM4w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: perf on older kernels
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
X-List-Received-Date: Wed, 15 Aug 2012 03:41:50 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CAEsOVNfh03y944zeGVOrQ4bRnBcEKoeyUbxtAKSppgTJ0n4Amailgm_"

--_000_CAEsOVNfh03y944zeGVOrQ4bRnBcEKoeyUbxtAKSppgTJ0n4Amailgm_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


On Aug 14, 2012 10:11 PM, "Bruce Ashfield" <bruce.ashfield@gmail.com<mailto=
:bruce.ashfield@gmail.com>> wrote:
>
> On Tue, Aug 14, 2012 at 6:39 PM, McClintock Matthew-B29882
> <B29882@freescale.com<mailto:B29882@freescale.com>> wrote:
> > I've had to fix / hack the perf_3.4.bb<http://perf_3.4.bb> recipe to ge=
t it building on my
> > older kernel. Should we add perf_3.0.bb<http://perf_3.0.bb> recipes in =
oe-core or my own
> > layer? Or try to keep one recipe working for all versions? I have no
> > strong opinions.
>
> I'd prefer one recipe. Liang sent another proposal earlier for a fix
> that should make
> it work on all kernels. Just waiting to hear on that at the moment.

I've actually got other issues...

-M

>
> Cheers,
>
> Bruce
>
> >
> > -M
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists=
.openembedded.org>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.o=
penembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--_000_CAEsOVNfh03y944zeGVOrQ4bRnBcEKoeyUbxtAKSppgTJ0n4Amailgm_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <EDE2A87A0CA09B41A10E06C229E0CB97@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p><br>
On Aug 14, 2012 10:11 PM, &quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Aug 14, 2012 at 6:39 PM, McClintock Matthew-B29882<br>
&gt; &lt;<a href=3D"mailto:B29882@freescale.com">B29882@freescale.com</a>&g=
t; wrote:<br>
&gt; &gt; I've had to fix / hack the <a href=3D"http://perf_3.4.bb">perf_3.=
4.bb</a> recipe to get it building on my<br>
&gt; &gt; older kernel. Should we add <a href=3D"http://perf_3.0.bb">perf_3=
.0.bb</a> recipes in oe-core or my own<br>
&gt; &gt; layer? Or try to keep one recipe working for all versions? I have=
 no<br>
&gt; &gt; strong opinions.<br>
&gt;<br>
&gt; I'd prefer one recipe. Liang sent another proposal earlier for a fix<b=
r>
&gt; that should make<br>
&gt; it work on all kernels. Just waiting to hear on that at the moment.</p=
>
<p>I've actually got other issues...</p>
<p>-M</p>
<p>&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; -M<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/op=
enembedded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><b=
r>
</p>
</body>
</html>

--_000_CAEsOVNfh03y944zeGVOrQ4bRnBcEKoeyUbxtAKSppgTJ0n4Amailgm_--
