Return-Path: <tarek.elsherbiny@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4489260650
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 12:30:48 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id b6so4101027yha.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZRq9uuulvCefkgupgXVwve5GvCvBuQPmyJEbmYoCjz4=;
	b=BJcTM8kIB+jJ9XvhMswp1eVchIEQZ5wlstzNXGKRJLFj5LQ1AG87pUHSnRd+UyiSmS
	oPTc++nKPiXIWJq+niwaBjmkVxDKUd6aTDRISatSGSREKi6pj+rM4wHuGxikGEZcAnwj
	2SUJSQPPdlzeO477nGkYpvRDWygGYvTqo1T/9MS9QqL1y/qlEQj69hdU8Lx9nIi2p/JZ
	7ONklZUekXezAVKQFtkiTgYZbkCuiHn2fjczCaOzg/1Y2fTxJXARpev8zidQChwQRQqz
	aQvCZnKTaEjG54i84hNEserYDtiQkHOxjOOchsIuOjNf4MLKwWewNmU8qcoB+hFHyN/w
	AUyA==
MIME-Version: 1.0
X-Received: by 10.236.207.194 with SMTP id n42mr22753771yho.153.1399033849071; 
	Fri, 02 May 2014 05:30:49 -0700 (PDT)
Received: by 10.170.71.65 with HTTP; Fri, 2 May 2014 05:30:48 -0700 (PDT)
Received: by 10.170.71.65 with HTTP; Fri, 2 May 2014 05:30:48 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CEA4705@IRSMSX105.ger.corp.intel.com>
References: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA4705@IRSMSX105.ger.corp.intel.com>
Date: Fri, 2 May 2014 13:30:48 +0100
Message-ID: <CAB3sqta0_u-Uv4EKXd6Y9upxyQfDEQ9_m_H=OL=tmMFKRb_14w@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: DNS when using Static IP
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
X-List-Received-Date: Fri, 02 May 2014 12:30:51 -0000
Content-Type: multipart/alternative; boundary=089e0163387a9a4ec004f869f3fd

--089e0163387a9a4ec004f869f3fd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

No connman is not included.  Shall I include it and try?
On 2 May 2014 13:01, "Iorga, Cristian" <cristian.iorga@intel.com> wrote:

>  Hello,
>
>
>
> What image did you start from, if any?
>
> i.e., core-image-minimal, core-image-sato, etc=E2=80=A6
>
> Is connman included?
>
>
>
> Regards,
>
> Cristian Iorga
>
> YP
>
> Intel Corporation
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *Tarek
> El-Sherbiny
> *Sent:* Friday, May 2, 2014 2:05 PM
> *To:* yocto@yoctoproject.org; openembedded-core@lists.openembedded.org
> *Subject:* [OE-core] DNS when using Static IP
>
>
>
> Hi.
>
>
>
> I'm trying to set my IP config to a static address.
>
>
>
> iface eth0 inet static
>
>      address 192.168.55.45
>
>      network 192.168.55.0
>
>      netmask 255.255.255.0
>
>      broadcast 192.168.55.255
>
>      gateway 192.168.55.1
>
>      dns-nameservers 192.168.10.2
>
>
>
> But I don't get the DNS server address to be included in /etc/resolv.conf
>
>
>
> If I run in dchp mode, then the resolv.conf is updated with my DNS addres=
s.
>
> Is there something I'm missing here in my setup?
>
>
>
>
>
> --
>
> *Tarek*
>

--089e0163387a9a4ec004f869f3fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">No connman is not included.=C2=A0 Shall I include it and try=
?</p>
<div class=3D"gmail_quote">On 2 May 2014 13:01, &quot;Iorga, Cristian&quot;=
 &lt;<a href=3D"mailto:cristian.iorga@intel.com">cristian.iorga@intel.com</=
a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">






<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Hello,<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">What image did you start =
from, if any?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">i.e., core-image-minimal,=
 core-image-sato, etc=E2=80=A6<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Is connman included?<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Regards,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Cristian Iorga<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">YP<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Intel Corporation<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><a name=3D"145bccf95e661649__MailEndCompose"><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:#1f497d"><u></u>=C2=A0<u></u></span></a></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">From:</sp=
an></b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;"> <a href=3D"mailto:openembedded-core-bounces@lists.open=
embedded.org" target=3D"_blank">openembedded-core-bounces@lists.openembedde=
d.org</a> [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openemb=
edded.org" target=3D"_blank">openembedded-core-bounces@lists.openembedded.o=
rg</a>]
<b>On Behalf Of </b>Tarek El-Sherbiny<br>
<b>Sent:</b> Friday, May 2, 2014 2:05 PM<br>
<b>To:</b> <a href=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yoct=
o@yoctoproject.org</a>; <a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> [OE-core] DNS when using Static IP<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Hi.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">I&#39;m trying to set my =
IP config to a static address.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">iface eth0 inet static<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0 =C2=A0 =C2=A0addre=
ss 192.168.55.45<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0 =C2=A0 =C2=A0netwo=
rk 192.168.55.0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0 =C2=A0 =C2=A0netma=
sk 255.255.255.0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0 =C2=A0 =C2=A0broad=
cast 192.168.55.255<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0 =C2=A0 =C2=A0gatew=
ay 192.168.55.1<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0 =C2=A0 =C2=A0dns-n=
ameservers 192.168.10.2<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">But I don&#39;t get the D=
NS server address to be included in /etc/resolv.conf<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">If I run in dchp mode, th=
en the resolv.conf is updated with my DNS address.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Is there something I&#39;=
m missing here in my setup?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><i><span style=3D"font-fa=
mily:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#666666">Tarek</span></=
i><u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>

--089e0163387a9a4ec004f869f3fd--
