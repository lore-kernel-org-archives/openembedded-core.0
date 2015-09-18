Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 343BD7423D;
	Fri, 18 Sep 2015 09:02:36 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so55499801wic.0;
	Fri, 18 Sep 2015 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YRSIy86Lk4ISrFTBW23/Vlf9uXWN0ARba9E5EM8yCgg=;
	b=G8cQDhYXWU8EWDRvjzFm7OPVfAOTfAaY1GumG8Ibf4IK663ArDm5KR0AzjZRw84f1T
	H0lWboMt/n4TVX4M58Mp0dUkX+nXo3GCjAKkwTfsZtYKiJQ3yIUhd/uCANOZxX/cBx72
	SfDseYaJZ6RfEpIhYGcgGFyaTlw8Vz2kxevKbgqzhPtuqOZKWQLengMF8OfKg7S0Lpri
	qfswjC1tVTosCOKZIuYPgpvDFAUCoHhhE1PaeWVIrHnx17EuGLe0feBM4cAPYt5Baj/1
	ytUoWDCG5XKZ/r7mI6cYafJt5Oc6h1XKP0PxaAxqjC3veSD7Kdw5AFktX0aUbXPURibU
	Ozsg==
MIME-Version: 1.0
X-Received: by 10.180.8.200 with SMTP id t8mr15067894wia.34.1442566955972;
	Fri, 18 Sep 2015 02:02:35 -0700 (PDT)
Received: by 10.28.59.138 with HTTP; Fri, 18 Sep 2015 02:02:35 -0700 (PDT)
In-Reply-To: <2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
	<CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
	<CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
	<2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
Date: Fri, 18 Sep 2015 11:02:35 +0200
Message-ID: <CA+chaQfdK4irH2DvnX-c=4pPHv2VXg3Y81mm6RuP845aJy_8yw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Adrian Freihofer <adrian.freihofer@neratec.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V2 2/3] systemd: Upgrade 219 -> 225
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
X-List-Received-Date: Fri, 18 Sep 2015 09:02:37 -0000
Content-Type: multipart/alternative; boundary=f46d044304e6f9bf28052001ca2d

--f46d044304e6f9bf28052001ca2d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

we're not accepting github's pull requests, see README.

Andreas already send many fixes for gudev, please check master-next if
something is missing from your changes and resend to ML.

On Fri, Sep 18, 2015 at 9:46 AM, Adrian Freihofer <
adrian.freihofer@neratec.com> wrote:

> Hi Andreas
>
> Here is a first patchset ready for pulling...
> https://github.com/openembedded/meta-openembedded/pull/16
>
> ------------------------------
> *Von: *"Khem Raj" <raj.khem@gmail.com>
> *An: *"Andreas M=C3=BCller" <schnitzeltony@googlemail.com>
> *CC: *openembedded-devel@lists.openembedded.org, "Patches and discussions
> about the oe-core layer" <openembedded-core@lists.openembedded.org>
> *Gesendet: *Mittwoch, 16. September 2015 23:18:50
> *Betreff: *Re: [OE-core] [PATCH V2 2/3] systemd: Upgrade 219 -> 225
>
> On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Is anybody preparing patches for gudev (many packets in meta-oe require
> it)?
> >
> > If not I can do so. Is the home for libgudev oe-core or better meta-oe?
>
> meta-oe is better for now. I am not working on it.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--f46d044304e6f9bf28052001ca2d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Adrian,<div><br></div><div>we&#39;re not accepting gith=
ub&#39;s pull requests, see README.</div><div><br></div><div>Andreas alread=
y send many fixes for gudev, please check master-next if something is missi=
ng from your changes and resend to ML.</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Fri, Sep 18, 2015 at 9:46 AM, Adrian Fr=
eihofer <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.freihofer@neratec.co=
m" target=3D"_blank">adrian.freihofer@neratec.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div style=3D"font-family:arial,helveti=
ca,sans-serif;font-size:10pt;color:#000000"><div>Hi Andreas<br></div><div><=
br></div><div>Here is a first patchset ready for pulling...<br></div><div><=
a href=3D"https://github.com/openembedded/meta-openembedded/pull/16" target=
=3D"_blank">https://github.com/openembedded/meta-openembedded/pull/16</a></=
div><div><br></div><hr><div><b>Von: </b>&quot;Khem Raj&quot; &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br=
><b>An: </b>&quot;Andreas M=C3=BCller&quot; &lt;<a href=3D"mailto:schnitzel=
tony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;=
<br><b>CC: </b><a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a>, &quot;Pat=
ches and discussions about the oe-core layer&quot; &lt;<a href=3D"mailto:op=
enembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core=
@lists.openembedded.org</a>&gt;<br><b>Gesendet: </b>Mittwoch, 16. September=
 2015 23:18:50<br><b>Betreff: </b>Re: [OE-core] [PATCH V2 2/3] systemd: Upg=
rade 219 -&gt; 225<br></div><div><div class=3D"h5"><div><br></div><div>On W=
ed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller<br>&lt;<a href=3D"mailto:s=
chnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com=
</a>&gt; wrote:<br>&gt; Is anybody preparing patches for gudev (many packet=
s in meta-oe require it)?<br>&gt;<br>&gt; If not I can do so. Is the home f=
or libgudev oe-core or better meta-oe?<br><br>meta-oe is better for now. I =
am not working on it.<br>-- <br>___________________________________________=
____<br>Openembedded-core mailing list<br><a href=3D"mailto:Openembedded-co=
re@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.openem=
bedded.org</a><br><a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" target=3D"_blank">http://lists.openembedded.org/mailman=
/listinfo/openembedded-core</a><br></div></div></div></div></div><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--f46d044304e6f9bf28052001ca2d--
