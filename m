Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYbU7-0002Ng-AG
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:50:23 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so286047pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hbQz4E5LS5mxbTvW+y3+WeIrL0DMZlcolBs4eWMNYgU=;
	b=EjptRFnX7YYxuVokTBuiWHT6DXKfDxQ2mcFzj7CTKS24lHyLTaQnUnbgp8jNFV5+Bi
	nv453QRp79hM1LKwq8X4CplmPY4imUrxdciBfmOxDDUvOiO+MMkUTc3JYoCfc4TSU0jK
	3YxZ3UsvTWOrgDj+jBb50bJLCkfp6YCDICJiyXcpWSAtqdVFIvvwnJHZhw0G1IZNi1Et
	BtCMQDVOHI8ME70repl/Adz65ldFmhMbTE1hgXF9ZrNh5vEU4MCzi5XSThOgld3yeGL2
	T7Wv/f0TMZtpx1amT3b3o07wQZmVRUJHQ7i4YC6nZJNz7wLoRb6u0LTDbmFfjMbaUv5A
	U9VA==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr76889496pbc.64.1352892987269; Wed,
	14 Nov 2012 03:36:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 03:36:27 -0800 (PST)
In-Reply-To: <3022446.WMq39sgvYG@helios>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<0c604e38ddcd6597371775a9c51625bf71c9f359.1352871028.git.sgw@linux.intel.com>
	<CAP9ODKpOi5tf6Tgdwv7sm=YeXL21Q9i=7ATiDLjVtvvZ-UddVw@mail.gmail.com>
	<3022446.WMq39sgvYG@helios>
Date: Wed, 14 Nov 2012 09:36:27 -0200
X-Google-Sender-Auth: 7Z1GnTBokaBPbF1nojDR8j2Bals
Message-ID: <CAP9ODKo=i=tKcKSTucvZHBShtfbvEp-F4TbE93+Vrs_wxasXgQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] less: Update to 451
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
X-List-Received-Date: Wed, 14 Nov 2012 11:50:23 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c12eece0a204ce72f1a0

--e89a8ff1c12eece0a204ce72f1a0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 9:33 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wednesday 14 November 2012 09:26:53 Otavio Salvador wrote:
> > > -PR = "r3"
> > > +PR = "r0"
> >
> > Please drop PR as r0 is the default.
>
> We don't do that in OE-Core.
>

Well, as far as I remember I always drop the PR when it is going to be r0.

But OK.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c12eece0a204ce72f1a0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Nov 14, 2012 at 9:33 AM, Paul Eg=
gleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.co=
m" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div class=3D"im">On Wednesday 14 November 2012 09:26:53 Otavio Salvador wr=
ote:<br>
&gt; &gt; -PR =3D &quot;r3&quot;<br>
&gt; &gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; Please drop PR as r0 is the default.<br>
<br>
</div>We don&#39;t do that in OE-Core.<br></blockquote><div><br></div><div>=
Well, as far as I remember I always drop the PR when it is going to be r0.<=
/div><div><br></div><div>But OK.</div><div>=A0</div></div>-- <br>Otavio Sal=
vador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. System=
s<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e89a8ff1c12eece0a204ce72f1a0--
