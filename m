Return-Path: <tarek.elsherbiny@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id DBC30605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 13:08:53 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 9so1368589ykp.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zRJrQpGDmxjyeHLWdIJrumI2uq3VjIOPkNvGavW1Gwo=;
	b=H56KWsoy/J4Zi+beZzOOOFZlfVSKl24Oc0gcgEokM7BRTuPf3WBp3VhB2BLVJn5YVX
	JPNSf+K0sEkRwoNp8RFy4flyEDOPESuW+gH4pelmxWZ+qwiX9pXTUvdWT07KtJNrSekm
	J0MztbqtnatlY3lF7xC6FZ0NqDF5lXmCuB4ub+tiTNRyDo3mkb2F+cQjBS46BslgaVOU
	AGqbikYDH5ZC8JR4KQkgv/pVQC113V1s4VoV20Xnb7YLXTUiLSb1vCJrW1vq6eVhMNLE
	PUq/uyld58dVH21Qt+S89Y6WqAcR9KvW82/noiZKQ9sQz5j1/DleqQRLIPR2mjia+ce5
	CVkQ==
MIME-Version: 1.0
X-Received: by 10.236.209.68 with SMTP id r44mr4830996yho.152.1399036134280;
	Fri, 02 May 2014 06:08:54 -0700 (PDT)
Received: by 10.170.71.65 with HTTP; Fri, 2 May 2014 06:08:54 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CEA474F@IRSMSX105.ger.corp.intel.com>
References: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA4705@IRSMSX105.ger.corp.intel.com>
	<CAB3sqta0_u-Uv4EKXd6Y9upxyQfDEQ9_m_H=OL=tmMFKRb_14w@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA474F@IRSMSX105.ger.corp.intel.com>
Date: Fri, 2 May 2014 14:08:54 +0100
Message-ID: <CAB3sqtbRMmCb_gLPVBrHBi1ft-6ji1q4S4F=1CkZFkitaFNUYg@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 02 May 2014 13:08:54 -0000
Content-Type: multipart/alternative; boundary=001a11c2a77ecfed1a04f86a7b87

--001a11c2a77ecfed1a04f86a7b87
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

My image is based on core-image-base.

include recipes-core/images/core-image-base.bb



On Fri, May 2, 2014 at 1:49 PM, Iorga, Cristian <cristian.iorga@intel.com>w=
rote:

>  Not really, I just wanted to get a better overview of the issue that you
> are facing.
>
> What image did you started from, if any?
>
>
>
> *From:* Tarek El-Sherbiny [mailto:tarek.elsherbiny@gmail.com]
> *Sent:* Friday, May 2, 2014 3:31 PM
> *To:* Iorga, Cristian
> *Cc:* openembedded-core@lists.openembedded.org; yocto@yoctoproject.org
> *Subject:* RE: [OE-core] DNS when using Static IP
>
>
>
> No connman is not included.  Shall I include it and try?
>
> On 2 May 2014 13:01, "Iorga, Cristian" <cristian.iorga@intel.com> wrote:
>
>   Hello,
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
>


--=20
*Tarek*

--001a11c2a77ecfed1a04f86a7b87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My image is based on core-image-base.<div><br></div><div>i=
nclude recipes-core/images/<a href=3D"http://core-image-base.bb">core-image=
-base.bb</a><br></div><div><br></div></div><div class=3D"gmail_extra"><br><=
br>
<div class=3D"gmail_quote">On Fri, May 2, 2014 at 1:49 PM, Iorga, Cristian =
<span dir=3D"ltr">&lt;<a href=3D"mailto:cristian.iorga@intel.com" target=3D=
"_blank">cristian.iorga@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">






<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Not really, I just wanted=
 to get a better overview of the issue that you are facing.<u></u><u></u></=
span></p>

<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">What image did you starte=
d from, if any?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><a name=3D"145bcfb7fa931e82__MailEndCompose"><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:#1f497d"><u></u>=C2=A0<u></u></span></a></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;">From:</sp=
an></b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;"> Tarek El-Sherbiny [mailto:<a href=3D"mailto:tarek.elsh=
erbiny@gmail.com" target=3D"_blank">tarek.elsherbiny@gmail.com</a>]
<br>
<b>Sent:</b> Friday, May 2, 2014 3:31 PM<br>
<b>To:</b> Iorga, Cristian<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a>; <a href=3D"mail=
to:yocto@yoctoproject.org" target=3D"_blank">yocto@yoctoproject.org</a><br>
<b>Subject:</b> RE: [OE-core] DNS when using Static IP<u></u><u></u></span>=
</p><div><div class=3D"h5">
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<p style=3D"margin-left:.5in">No connman is not included.=C2=A0 Shall I inc=
lude it and try?<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">On 2 May 2014 13:01, &quo=
t;Iorga, Cristian&quot; &lt;<a href=3D"mailto:cristian.iorga@intel.com" tar=
get=3D"_blank">cristian.iorga@intel.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">Hello,</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">What image did you start from, if any?</span><u>=
</u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">i.e., core-image-minimal, core-image-sato, etc=
=E2=80=A6</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">Is connman included?</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">Regards,</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">Cristian Iorga</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">YP</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1f497d">Intel Corporation</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<a name=3D"145bcfb7fa931e82_145bccf95e661649__MailEndCompose"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d">=C2=A0</span></a><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sa=
ns-serif&quot;">From:</span></b><span style=3D"font-size:11.0pt;font-family=
:&quot;Calibri&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org" target=
=3D"_blank">
openembedded-core-bounces@lists.openembedded.org</a> [mailto:<a href=3D"mai=
lto:openembedded-core-bounces@lists.openembedded.org" target=3D"_blank">ope=
nembedded-core-bounces@lists.openembedded.org</a>]
<b>On Behalf Of </b>Tarek El-Sherbiny<br>
<b>Sent:</b> Friday, May 2, 2014 2:05 PM<br>
<b>To:</b> <a href=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yoct=
o@yoctoproject.org</a>;
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> [OE-core] DNS when using Static IP</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
Hi.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
I&#39;m trying to set my IP config to a static address.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
iface eth0 inet static<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0 =C2=A0 =C2=A0address 192.168.55.45<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0 =C2=A0 =C2=A0network 192.168.55.0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0 =C2=A0 =C2=A0netmask 255.255.255.0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0 =C2=A0 =C2=A0broadcast 192.168.55.255<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0 =C2=A0 =C2=A0gateway 192.168.55.1<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0 =C2=A0 =C2=A0dns-nameservers 192.168.10.2<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
But I don&#39;t get the DNS server address to be included in /etc/resolv.co=
nf<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
If I run in dchp mode, then the resolv.conf is updated with my DNS address.=
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
Is there something I&#39;m missing here in my setup?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<i><span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;colo=
r:#666666">Tarek</span></i><u></u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div></div></div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><i><font color=3D"#666666" face=3D"arial, helvetica, sans-serif">Tarek=
</font></i></div>
</div>

--001a11c2a77ecfed1a04f86a7b87--
