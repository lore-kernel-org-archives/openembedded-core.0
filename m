Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCBp3-0006AM-Io
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 17:31:47 +0100
Received: by mail-wg0-f46.google.com with SMTP id fg15so3606756wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2013 08:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=bHQYYb+/yGxI5w4fLhs4SJLITCqUH/+EorP5nPnjv/k=;
	b=oi2Hk+6H43hO5v/kftI9gkxeWsTEBKMKqcienyFe3sLKhRiph8ZLW+gOxNSq3v4Zqr
	Qdkapsa0S0fA1GMfxZQ8XCLBwIZohfZLtpbPafP15X9Ir13LCUXd2h+icC4LHgKjIh9z
	esunYLmmEXJ4aeaLsItdJHCGBUFwkWC9T7N6lFPFAT1LVLPNKbrXkmE0935ONRkd7u64
	217vY+E5J2dfS/IFLYE7TE1JX3Oek4F+Bd7ohgB+XyPjdQretix4eRYHnR51nJ5TIiAh
	mg+8xhtqFg/Jir3Sy5mU1uD3zaqnxsMFIMQgyplYJBMhLpUBs6s6WM8udzdoPoxbpGDO
	mHSA==
MIME-Version: 1.0
X-Received: by 10.181.12.103 with SMTP id ep7mr7089595wid.12.1362327311096;
	Sun, 03 Mar 2013 08:15:11 -0800 (PST)
Received: by 10.194.89.106 with HTTP; Sun, 3 Mar 2013 08:15:10 -0800 (PST)
In-Reply-To: <1362326189.4325.27.camel@ted>
References: <alpine.DEB.2.02.1207060832110.13212@oneiric>
	<1362326189.4325.27.camel@ted>
Date: Sun, 3 Mar 2013 17:15:10 +0100
Message-ID: <CA+chaQcihOUk9L9aYj1JT+RQJ8DJY1YW3iVbJooWsL2=AgP3JQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ALLOW_EMPTY versus ALLOW_EMPTY_${PN}? a couple clarifications
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Mar 2013 16:31:49 -0000
Content-Type: multipart/alternative; boundary=f46d0438eddb72260904d7078bf7

--f46d0438eddb72260904d7078bf7
Content-Type: text/plain; charset=UTF-8

Can you please add ALLOW_EMPTY to sanity check like R* variables are now?


On Sun, Mar 3, 2013 at 4:56 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2012-07-06 at 09:10 -0400, Robert P. J. Day wrote:
> >   just trying to clarify the gory details of the ALLOW_EMPTY setting.
> > first, across several .bb files, there is a mixture of these two:
> >
> > ALLOW_EMPTY = "1"
> > ALLOW_EMPTY_${PN} = "1"
> >
> >   what's the difference?  what does the first one represent if you're
> > not specific?  does that cover *all* generated packages?
>
> FWIW, a package name should generally be specified. I've just sent a
> patch to OE-Core updating the various references.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--f46d0438eddb72260904d7078bf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you please add ALLOW_EMPTY to sanity check like R* var=
iables are now?</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sun, Mar 3, 2013 at 4:56 PM, Richard Purdie <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Fri, 2012-07-06 at 09:10 -0400, Robert P.=
 J. Day wrote:<br>
&gt; =C2=A0 just trying to clarify the gory details of the ALLOW_EMPTY sett=
ing.<br>
&gt; first, across several .bb files, there is a mixture of these two:<br>
&gt;<br>
&gt; ALLOW_EMPTY =3D &quot;1&quot;<br>
&gt; ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt;<br>
&gt; =C2=A0 what&#39;s the difference? =C2=A0what does the first one repres=
ent if you&#39;re<br>
&gt; not specific? =C2=A0does that cover *all* generated packages?<br>
<br>
FWIW, a package name should generally be specified. I&#39;ve just sent a<br=
>
patch to OE-Core updating the various references.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br></div>

--f46d0438eddb72260904d7078bf7--
