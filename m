Return-Path: <yann.cardaillac@smile.fr>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB377F6A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 09:29:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id r141so5833380wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smile-fr.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N0H4CcYjuUtTAinw00qv3X0RjkDS4ElGhpbhnWE21H8=;
	b=RHo+UWyxPyq2de2dtY38hwz7quu5H4m/Gr81gEBd3pXyCszhg/zpwD3hprqQAzTP8x
	nXBObCI/3NwE1b5H4JZ5s1F1s848NcJ3fEOBRhulIlMzjzf+C6uNq8OLkX55fWXpn0bE
	1XF2JEjXDe2TrOYJVVL0HMK9inywbKNqAWte1x41m3OdZ2TMeMDGsUt78eCk38DOQvuA
	bb/j2wL9p7M3Lh8CjLdws+JKnDjrkDL//PaYsCkFlmsx5ZiK08ALnQYazp2kx1NLH6uW
	cN43uNYyqcnx5fXKnli40gYHd73p49GtwuiGX1+RNx/AEWNf6tptRET8oHbeq+HYBEm1
	lbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N0H4CcYjuUtTAinw00qv3X0RjkDS4ElGhpbhnWE21H8=;
	b=KNy3w+WwxYG8a+Gj0ye752W8fEnyMioLb9CfBvR9XA3i7o2DClCFgUrEZYF4OVF5Kx
	GBeYysBuoBKJsaSatTXmkqRP0lOEqHCQYzat4N9y7AUU4J2uyKf2kSwSMs2diS25tpVn
	FiUL3w1jY+BT+y6VX88WEIS73Z5orVupXRDQ74crXxNBqqi444mjyxrwVChyhu4ilcBf
	iByaRCknp5Ca6RlpcoHlTWDsf4RDXCdgK21giGp9tBlzdOv3cZPJx1nGRaKn6Mc3Unm/
	+Luyu65MWA0jTpV5iWYe9KTd+QKdybbFck0E/YD9nQwrhmp6FNe8e+6e0ddGvoOx/y+5
	QraA==
X-Gm-Message-State: APjAAAWd2tAv9tZ458GiRVC4UAjbs61Yl+XDFLLucE4W8Ukmz/6kbDLP
	o/+mXh6MKXvmpBHgdf0e6Omh2BWlB5aElFnZmekttg==
X-Google-Smtp-Source: APXvYqxercpxi638eFzZhE48rJW4k2xw4jpZav+Zr/3UZquL9kGPpkPDGnb8wGw6Dm4OifcKWsC7GUCbG75gKq36Kng=
X-Received: by 2002:a05:600c:2247:: with SMTP id
	a7mr2126021wmm.19.1571736548674; 
	Tue, 22 Oct 2019 02:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAA984JUdZZ7d6pnpeddtSSR_XkPfxsUw-8e3AsLPjyiXzvJd0w@mail.gmail.com>
	<f9a16068-7062-b02e-0fd0-63acda2ec1ab@kernel.crashing.org>
In-Reply-To: <f9a16068-7062-b02e-0fd0-63acda2ec1ab@kernel.crashing.org>
From: Yann CARDAILLAC <yann.cardaillac@smile.fr>
Date: Tue, 22 Oct 2019 11:28:57 +0200
Message-ID: <CAA984JX8pNoXopjq==SvqZNJ9h=+ZR3w-+7FQo_eORH-ipF_Sw@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: jakub@redhat.com, yocto@yoctoproject.org,
	Romain Naour <romain.naour@smile.fr>, mark.hatle@windriver.co,
	openembedded-core@lists.openembedded.org
Subject: Re: [yocto][prelink-cross] Bug 13529 add SPDX identifier
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
X-List-Received-Date: Tue, 22 Oct 2019 09:29:08 -0000
X-Groupsio-MsgNum: 130327
Content-Type: multipart/mixed; boundary="000000000000aa782f05957c6e67"

--000000000000aa782f05957c6e67
Content-Type: multipart/alternative; boundary="000000000000aa782d05957c6e65"

--000000000000aa782d05957c6e65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 4:35 PM Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

> On 10/21/19 4:43 AM, Yann CARDAILLAC wrote:
> > Hi Mark Hatle, Jakub Jelinek,
>
> Jakub is no longer supporting this code, but he may have valuable insight=
s
> into
> licensing.
>
> > I'm currently beginning the work on bug 13529:
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13529
> >
> > The purpose is to add SPDX identifier to scripts and sources.
> >
> > Most of the sources have licences on the sources, however some of them
> don't,
> > and I've question about others :
> >
> > - src/sha.c do not shall it be GPLV2-or-later as most of the other?
>
> /* sha.c - Functions to compute the SHA1 hash (message-digest) of files
>    or blocks of memory.  Complies to the NIST specification FIPS-180-1.
>
>    Copyright (C) 2000, 2001, 2003 Scott G. Miller
>
>    Credits:
>       Robert Klep <robert@ilse.nl>  -- Expansion function fix
>    NOTE: The canonical source of this file is maintained in GNU coreutils=
.
> */
>
> The last line is the key.  This apparently came from GNU coreutils.
>
> From the SCM logs, sha.c was introduced in approx 2003-07-01 from what it
> looks
> like.  So it's a pretty old version.  You will need to do some detective
> work,
> and find older versions of coreutils until you find the one that
> corresponds to
> the code that was checked in.  Start back in 2003 and work backwards as
> necessary.  (The version that matches to the original 2003-07-01 should b=
e
> the
> reasonable license to use.)
>

Ok I found it ! https://github.com/coreutils/coreutils/blob/v4.5.8/lib/sha.=
c

from : https://github.com/coreutils/coreutils/blob/v4.5.8/COPYING it looks
like it's only GPLV2


> > - how to licence m4/libelf.m4 ? I'd prefer you to tell me exactly what
> to add in
> > order to avoid errors
>
> The original version of the m4/libelf.m4 was introduced 2001-09-27.  It
> appears
> to me that it was written as part of the prelinker, so would be under the
> overall license of the prelinker.
>
> Based on this, my assumption is that it is GPL-2.0
>
> I do not see any 'or-later' clauses anywhere.
>
> I have just add  "dnl SPDX-License-Identifier: GPL-2.0-only" bellow the
"Written by" comment, however should it also be in the resulting template?
I can add it also at first line of the resulting file if necessary ?


> - what about *.C files ? They don't have licence header, they look like C
> file
> > to me so I'd probably add :
> > // SPDX-License-Identifier: GPL-2.0-or-later
>
> There are each simply test cases.  They would be covered by the overall
> 'COPYING' for the package.  Thus GPL-2.0
>
> > - what about testsuite/ files ?
>
> Same, no specifically stated license will be GPL-2.0.
>
> Done !

> > Shall every thing just be GPL-2.0-or-later?
>
> Also just to be clear.  As I am NOT the original author of this work, I
> won't
> accept a patch to remove any existing license text from the headers in th=
is
> software, but I will accept the SPDX-License-Identifier to be added in
> addition
> to the existing license text.
>
>
If an existing file does not have any License text in it, then we will need
> to
> assume that the COPYING file covers all software unless there is some
> indicator
> it comes from another source with a different license.  For items w/o
> existing
> licenses, just adding the SPDX-License-Identifier will be acceptable.
>
> So in a header similar to:
>
> /* Copyright (C) 2001, 2002, 2003, 2007 Red Hat, Inc.
>    Written by Jakub Jelinek <jakub@redhat.com>, 2001.
>
>    This program is free software; you can redistribute it and/or modify
>    it under the terms of the GNU General Public License as published by
>    the Free Software Foundation; either version 2, or (at your option)
>    any later version.
>
>    This program is distributed in the hope that it will be useful,
>    but WITHOUT ANY WARRANTY; without even the implied warranty of
>    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>    GNU General Public License for more details.
>
>    You should have received a copy of the GNU General Public License
>    along with this program; if not, write to the Free Software Foundation=
,
>    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
>
> please add the header between the 'Written by' and the existing license
> text,
> such as:
>
> /* Copyright (C) 2001, 2002, 2003, 2007 Red Hat, Inc.
>    Written by Jakub Jelinek <jakub@redhat.com>, 2001.
>
>    SPDX-License-Identifier: GPL-2.0-or-later
>
>    This program is free software; you can redistribute it and/or modify
>    it under the terms of the GNU General Public License as published by
>
>
Here's the first attempt of the patch, feel free to give me any advice on
how to improve it!

Regards,

--=20
[image: SMILE] <http://www.smile.eu/>

20 rue des Jardins
92600 Asni=C3=A8res-sur-Seine
*Yann CARDAILLAC*
Ing=C3=A9nieur Syst=C3=A8mes Embarqu=C3=A9s

[image: email] yann.cardaillac@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>


[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire

--000000000000aa782d05957c6e65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 21, 2019 at 4:35 PM Mark =
Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kern=
el.crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On 10/21/19 4:43 AM, Yann CARDAILLAC wrote:<br>
&gt; Hi Mark Hatle, Jakub Jelinek,<br>
<br>
Jakub is no longer supporting this code, but he may have valuable insights =
into<br>
licensing.<br>
<br>
&gt; I&#39;m currently beginning the work on bug 13529:<br>
&gt; <br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13529" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D13529</a><br>
&gt; <br>
&gt; The purpose is to add SPDX identifier to scripts and sources.<br>
&gt; <br>
&gt; Most of the sources have licences on the sources, however some of them=
 don&#39;t,<br>
&gt; and I&#39;ve question about others :<br>
&gt; <br>
&gt; - src/sha.c do not shall it be GPLV2-or-later as most of the other?<br=
>
<br>
/* sha.c - Functions to compute the SHA1 hash (message-digest) of files<br>
=C2=A0 =C2=A0or blocks of memory.=C2=A0 Complies to the NIST specification =
FIPS-180-1.<br>
<br>
=C2=A0 =C2=A0Copyright (C) 2000, 2001, 2003 Scott G. Miller<br>
<br>
=C2=A0 =C2=A0Credits:<br>
=C2=A0 =C2=A0 =C2=A0 Robert Klep &lt;<a href=3D"mailto:robert@ilse.nl" targ=
et=3D"_blank">robert@ilse.nl</a>&gt;=C2=A0 -- Expansion function fix<br>
=C2=A0 =C2=A0NOTE: The canonical source of this file is maintained in GNU c=
oreutils.<br>
*/<br>
<br>
The last line is the key.=C2=A0 This apparently came from GNU coreutils.<br=
>
<br>
From the SCM logs, sha.c was introduced in approx 2003-07-01 from what it l=
ooks<br>
like.=C2=A0 So it&#39;s a pretty old version.=C2=A0 You will need to do som=
e detective work,<br>
and find older versions of coreutils until you find the one that correspond=
s to<br>
the code that was checked in.=C2=A0 Start back in 2003 and work backwards a=
s<br>
necessary.=C2=A0 (The version that matches to the original 2003-07-01 shoul=
d be the<br>
reasonable license to use.)<br></blockquote><div><br></div><div>Ok I found =
it ! <a href=3D"https://github.com/coreutils/coreutils/blob/v4.5.8/lib/sha.=
c">https://github.com/coreutils/coreutils/blob/v4.5.8/lib/sha.c</a> <br></d=
iv><div><br></div><div>from : <a href=3D"https://github.com/coreutils/coreu=
tils/blob/v4.5.8/COPYING">https://github.com/coreutils/coreutils/blob/v4.5.=
8/COPYING</a> it looks like it&#39;s only GPLV2<br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; - how to licence m4/libelf.m4 ? I&#39;d prefer you to tell me exactly =
what to add in<br>
&gt; order to avoid errors<br>
<br>
The original version of the m4/libelf.m4 was introduced 2001-09-27.=C2=A0 I=
t appears<br>
to me that it was written as part of the prelinker, so would be under the<b=
r>
overall license of the prelinker.<br>
<br>
Based on this, my assumption is that it is GPL-2.0<br>
<br>
I do not see any &#39;or-later&#39; clauses anywhere.<br>
<br></blockquote><div>I have just add=C2=A0 &quot;dnl SPDX-License-Identifi=
er: GPL-2.0-only&quot; bellow the &quot;Written by&quot; comment, however s=
hould it also be in the resulting template?=C2=A0</div><div>I can add it al=
so at first line of the resulting file if necessary ?<br></div><div><br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - what about *.C files ? They don&#39;t have licence header, they look=
 like C file<br>
&gt; to me so I&#39;d probably add :<br>
&gt; // SPDX-License-Identifier: GPL-2.0-or-later<br>
<br>
There are each simply test cases.=C2=A0 They would be covered by the overal=
l<br>
&#39;COPYING&#39; for the package.=C2=A0 Thus GPL-2.0<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - what about testsuite/ files ?<br>
<br>
Same, no specifically stated license will be GPL-2.0.<br>
<br></blockquote><div>Done !=C2=A0 <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt; Shall every thing just be GPL-2.0-or-later?<br>
<br>
Also just to be clear.=C2=A0 As I am NOT the original author of this work, =
I won&#39;t<br>
accept a patch to remove any existing license text from the headers in this=
<br>
software, but I will accept the SPDX-License-Identifier to be added in addi=
tion<br>
to the existing license text.<br>=C2=A0
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If an existing file does not have any License text in it, then we will need=
 to<br>
assume that the COPYING file covers all software unless there is some indic=
ator<br>
it comes from another source with a different license.=C2=A0 For items w/o =
existing<br>
licenses, just adding the SPDX-License-Identifier will be acceptable.<br>
<br>
So in a header similar to:<br>
<br>
/* Copyright (C) 2001, 2002, 2003, 2007 Red Hat, Inc.<br>
=C2=A0 =C2=A0Written by Jakub Jelinek &lt;<a href=3D"mailto:jakub@redhat.co=
m" target=3D"_blank">jakub@redhat.com</a>&gt;, 2001.<br>
<br>
=C2=A0 =C2=A0This program is free software; you can redistribute it and/or =
modify<br>
=C2=A0 =C2=A0it under the terms of the GNU General Public License as publis=
hed by<br>
=C2=A0 =C2=A0the Free Software Foundation; either version 2, or (at your op=
tion)<br>
=C2=A0 =C2=A0any later version.<br>
<br>
=C2=A0 =C2=A0This program is distributed in the hope that it will be useful=
,<br>
=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty of=
<br>
=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See=
 the<br>
=C2=A0 =C2=A0GNU General Public License for more details.<br>
<br>
=C2=A0 =C2=A0You should have received a copy of the GNU General Public Lice=
nse<br>
=C2=A0 =C2=A0along with this program; if not, write to the Free Software Fo=
undation,<br>
=C2=A0 =C2=A0Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.=
=C2=A0 */<br>
<br>
please add the header between the &#39;Written by&#39; and the existing lic=
ense text,<br>
such as:<br>
<br>
/* Copyright (C) 2001, 2002, 2003, 2007 Red Hat, Inc.<br>
=C2=A0 =C2=A0Written by Jakub Jelinek &lt;<a href=3D"mailto:jakub@redhat.co=
m" target=3D"_blank">jakub@redhat.com</a>&gt;, 2001.<br>
<br>
=C2=A0 =C2=A0SPDX-License-Identifier: GPL-2.0-or-later<br>
<br>
=C2=A0 =C2=A0This program is free software; you can redistribute it and/or =
modify<br>
=C2=A0 =C2=A0it under the terms of the GNU General Public License as publis=
hed by<br>
<br></blockquote><div><br></div><div>Here&#39;s the first attempt of the pa=
tch, feel free to give me any advice on how to improve it!</div><div><br></=
div><div>Regards,<br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">

                    <div style=3D"display:block"><div>
   =20
    <font face=3D"Raleway, regular">
    <table style=3D"padding:20px" border=3D"0">
        <tbody>
        <tr>
            <td style=3D"font-size:13px;color:rgb(255,128,84);text-align:ce=
nter;padding-right:30px">
                <a href=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p>20 rue des Jardins<br>
92600 Asni=C3=A8res-sur-Seine</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Yann CARDAILLAC</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Ing=C3=A9nieur Syst=C3=A8mes Embarqu=C3=A9s<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:yann.cardaillac@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">yann.cardaillac@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.facebook.com/smileopensource" target=3D"_blank"><img src=3D"http://ftp.smi=
le.fr/client/Communication/signature/img/rs-facebook.png" alt=3D"Facebook" =
style=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <br>
   =20
    <br>
    <div style=3D"color:rgb(163,172,181);font-size:10px">
        <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/=
eco.png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    </div>
    </font>
</div></div></div></div></div></div></div>

--000000000000aa782d05957c6e65--

--000000000000aa782f05957c6e67
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-add-SPDX-Licence-identifier.patch"
Content-Disposition: attachment; 
	filename="0001-add-SPDX-Licence-identifier.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k21nbrfv0>
X-Attachment-Id: f_k21nbrfv0

RnJvbSBlMzI3NjIwZWIzNmRkYjA0YjRlNTc2MWZhMWExM2EyNzIzNzVkYWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5uIENBUkRBSUxMQUMgPHlhbm4uY2FyZGFpbGxhY0BzbWls
ZS5mcj4KRGF0ZTogVHVlLCAyMiBPY3QgMjAxOSAxMToyNzowMCArMDIwMApTdWJqZWN0OiBbUEFU
Q0hdIGFkZCBTUERYIExpY2VuY2UgaWRlbnRpZmllcgoKU2lnbmVkLW9mZi1ieTogWWFubiBDQVJE
QUlMTEFDIDx5YW5uLmNhcmRhaWxsYWNAc21pbGUuZnI+Ci0tLQogZ2VsZi9nZWxmLmMgICAgICAg
ICAgICAgIHwgMiArKwogZ2VsZi9nZWxmLmggICAgICAgICAgICAgIHwgMiArKwogZ2VsZngvZ2Vs
ZnguaCAgICAgICAgICAgIHwgMiArKwogZ2VsZngzMi9nZWxmeC5oICAgICAgICAgIHwgMiArKwog
bTQvbGliZWxmLm00ICAgICAgICAgICAgIHwgMSArCiBzcmMvYXJjaC1hbHBoYS5jICAgICAgICAg
fCAyICsrCiBzcmMvYXJjaC1hcm0uYyAgICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1jcmlzLmMg
ICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1pMzg2LmMgICAgICAgICAgfCAyICsrCiBzcmMvYXJj
aC1pYTY0LmMgICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1taXBzLmMgICAgICAgICAgfCAyICsr
CiBzcmMvYXJjaC1wcGMuYyAgICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1wcGM2NC5jICAgICAg
ICAgfCAyICsrCiBzcmMvYXJjaC1zMzkwLmMgICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1zMzkw
eC5jICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1zaC5jICAgICAgICAgICAgfCAyICsrCiBzcmMv
YXJjaC1zcGFyYy5jICAgICAgICAgfCAyICsrCiBzcmMvYXJjaC1zcGFyYzY0LmMgICAgICAgfCAy
ICsrCiBzcmMvYXJjaC14ODZfNjQuYyAgICAgICAgfCAyICsrCiBzcmMvY2FjaGUuYyAgICAgICAg
ICAgICAgfCAyICsrCiBzcmMvY2Fub25pY2FsaXplLmMgICAgICAgfCAyICsrCiBzcmMvY2hlY2tz
dW0uYyAgICAgICAgICAgfCAyICsrCiBzcmMvY29uZmxpY3QuYyAgICAgICAgICAgfCAyICsrCiBz
cmMvY3JjMzIuYyAgICAgICAgICAgICAgfCAyICsrCiBzcmMvY3h4LmMgICAgICAgICAgICAgICAg
fCAyICsrCiBzcmMvZGF0YS5jICAgICAgICAgICAgICAgfCAyICsrCiBzcmMvZG9pdC5jICAgICAg
ICAgICAgICAgfCAyICsrCiBzcmMvZHNvLmMgICAgICAgICAgICAgICAgfCAyICsrCiBzcmMvZHdh
cmYyLmMgICAgICAgICAgICAgfCAyICsrCiBzcmMvZHdhcmYyLmggICAgICAgICAgICAgfCAyICsr
CiBzcmMvZXhlYy5jICAgICAgICAgICAgICAgfCAyICsrCiBzcmMvZXhlY2xlX29wZW4uYyAgICAg
ICAgfCAyICsrCiBzcmMvZXhlY3N0YWNrLmMgICAgICAgICAgfCAyICsrCiBzcmMvZnB0ci5jICAg
ICAgICAgICAgICAgfCAyICsrCiBzcmMvZnB0ci5oICAgICAgICAgICAgICAgfCAyICsrCiBzcmMv
Z2F0aGVyLmMgICAgICAgICAgICAgfCAyICsrCiBzcmMvZ2V0LmMgICAgICAgICAgICAgICAgfCAy
ICsrCiBzcmMvaGFzaHRhYi5jICAgICAgICAgICAgfCAyICsrCiBzcmMvaGFzaHRhYi5oICAgICAg
ICAgICAgfCAyICsrCiBzcmMvbGF5b3V0LmMgICAgICAgICAgICAgfCAyICsrCiBzcmMvbGF5b3V0
LmggICAgICAgICAgICAgfCAyICsrCiBzcmMvbWFpbi5jICAgICAgICAgICAgICAgfCAyICsrCiBz
cmMvbWFrZWNyYy5jICAgICAgICAgICAgfCAxICsKIHNyYy9tZDUuYyAgICAgICAgICAgICAgICB8
IDIgKysKIHNyYy9tZDUuaCAgICAgICAgICAgICAgICB8IDIgKysKIHNyYy9tZGVidWcuYyAgICAg
ICAgICAgICB8IDIgKysKIHNyYy9wcmVsaW5rLmMgICAgICAgICAgICB8IDIgKysKIHNyYy9wcmVs
aW5rLmggICAgICAgICAgICB8IDIgKysKIHNyYy9wcmVsaW5rdGFiLmggICAgICAgICB8IDIgKysK
IHNyYy9yZWxvYy1pbmZvLmMgICAgICAgICB8IDIgKysKIHNyYy9yZWxvYy1pbmZvLmggICAgICAg
ICB8IDIgKysKIHNyYy9yZWxvYy5jICAgICAgICAgICAgICB8IDIgKysKIHNyYy9yZWxvYy5oICAg
ICAgICAgICAgICB8IDIgKysKIHNyYy9zaGEuYyAgICAgICAgICAgICAgICB8IDIgKysKIHNyYy9z
aGEuaCAgICAgICAgICAgICAgICB8IDIgKysKIHNyYy9zcGFjZS5jICAgICAgICAgICAgICB8IDIg
KysKIHNyYy9zcGFjZS5oICAgICAgICAgICAgICB8IDIgKysKIHNyYy9zdGFicy5jICAgICAgICAg
ICAgICB8IDIgKysKIHNyYy91bmRvLmMgICAgICAgICAgICAgICB8IDIgKysKIHNyYy91bmRvYWxs
LmMgICAgICAgICAgICB8IDIgKysKIHNyYy92ZXJpZnkuYyAgICAgICAgICAgICB8IDIgKysKIHRl
c3RzdWl0ZS9jeHgxLkMgICAgICAgICB8IDEgKwogdGVzdHN1aXRlL2N4eDEuaCAgICAgICAgIHwg
MSArCiB0ZXN0c3VpdGUvY3h4MS5zaCAgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9jeHgxbGliMS5D
ICAgICB8IDEgKwogdGVzdHN1aXRlL2N4eDFsaWIyLkMgICAgIHwgMSArCiB0ZXN0c3VpdGUvY3h4
Mi5DICAgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9jeHgyLnNoICAgICAgICB8IDEgKwogdGVzdHN1
aXRlL2N4eDMuQyAgICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvY3h4My5oICAgICAgICAgfCAxICsK
IHRlc3RzdWl0ZS9jeHgzLnNoICAgICAgICB8IDEgKwogdGVzdHN1aXRlL2N4eDNsaWIxLkMgICAg
IHwgMSArCiB0ZXN0c3VpdGUvY3h4M2xpYjIuQyAgICAgfCAxICsKIHRlc3RzdWl0ZS9jeWNsZTEu
c2ggICAgICB8IDEgKwogdGVzdHN1aXRlL2N5Y2xlMi5zaCAgICAgIHwgMSArCiB0ZXN0c3VpdGUv
ZGVwczEuYyAgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9kZXBzMS5oICAgICAgICB8IDEgKwogdGVz
dHN1aXRlL2RlcHMxLnNoICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvZGVwczFsaWIxLmMgICAgfCAx
ICsKIHRlc3RzdWl0ZS9kZXBzMWxpYjIuYyAgICB8IDEgKwogdGVzdHN1aXRlL2RlcHMyLnNoICAg
ICAgIHwgMSArCiB0ZXN0c3VpdGUvZGVwczJsaWIxLmMgICAgfCAxICsKIHRlc3RzdWl0ZS9mdW5j
dGlvbnMuc2ggICB8IDEgKwogdGVzdHN1aXRlL2lmdW5jLmggICAgICAgIHwgMSArCiB0ZXN0c3Vp
dGUvaWZ1bmMxLmMgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9pZnVuYzEuc2ggICAgICB8IDEgKwog
dGVzdHN1aXRlL2lmdW5jMWxpYjEuYyAgIHwgMSArCiB0ZXN0c3VpdGUvaWZ1bmMxbGliMi5jICAg
fCAxICsKIHRlc3RzdWl0ZS9pZnVuYzIuc2ggICAgICB8IDEgKwogdGVzdHN1aXRlL2lmdW5jMy5j
ICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvaWZ1bmMzLnNoICAgICAgfCAxICsKIHRlc3RzdWl0ZS9p
ZnVuYzNsaWIxLmMgICB8IDEgKwogdGVzdHN1aXRlL2lmdW5jdGVzdC5jICAgIHwgMSArCiB0ZXN0
c3VpdGUvbGF5b3V0LkMgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9sYXlvdXQxLnNoICAgICB8IDEg
KwogdGVzdHN1aXRlL2xheW91dDIuc2ggICAgIHwgMSArCiB0ZXN0c3VpdGUvbGF5b3V0bGliLkMg
ICAgfCAxICsKIHRlc3RzdWl0ZS9tb3ZlbGlicy5zaCAgICB8IDEgKwogdGVzdHN1aXRlL29yZGVy
LmMgICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvb3JkZXIuc2ggICAgICAgfCAxICsKIHRlc3RzdWl0
ZS9vcmRlcmxpYi5jICAgICB8IDEgKwogdGVzdHN1aXRlL29yZGVybGliLmggICAgIHwgMSArCiB0
ZXN0c3VpdGUvb3JkZXJsaWIxLmMgICAgfCAxICsKIHRlc3RzdWl0ZS9vcmRlcmxpYjEuaCAgICB8
IDEgKwogdGVzdHN1aXRlL29yZGVybGliMi5jICAgIHwgMSArCiB0ZXN0c3VpdGUvb3JkZXJsaWIz
LmMgICAgfCAxICsKIHRlc3RzdWl0ZS9wcmVsb2FkMS5jICAgICB8IDEgKwogdGVzdHN1aXRlL3By
ZWxvYWQxLmggICAgIHwgMSArCiB0ZXN0c3VpdGUvcHJlbG9hZDEuc2ggICAgfCAxICsKIHRlc3Rz
dWl0ZS9wcmVsb2FkMWxpYjEuYyB8IDEgKwogdGVzdHN1aXRlL3ByZWxvYWQxbGliMi5jIHwgMSAr
CiB0ZXN0c3VpdGUvcXVpY2sxLmMgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9xdWljazEuc2ggICAg
ICB8IDEgKwogdGVzdHN1aXRlL3F1aWNrMWxpYjEuYyAgIHwgMSArCiB0ZXN0c3VpdGUvcXVpY2sx
bGliMi5jICAgfCAxICsKIHRlc3RzdWl0ZS9xdWljazFsaWIzLmMgICB8IDEgKwogdGVzdHN1aXRl
L3F1aWNrMWxpYjQuYyAgIHwgMSArCiB0ZXN0c3VpdGUvcXVpY2syLnNoICAgICAgfCAxICsKIHRl
c3RzdWl0ZS9xdWljazMuc2ggICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jMS5jICAgICAgIHwg
MSArCiB0ZXN0c3VpdGUvcmVsb2MxLmggICAgICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzEuc2gg
ICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jMTAuYyAgICAgIHwgMSArCiB0ZXN0c3VpdGUvcmVs
b2MxMC5zaCAgICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzEwbGliMS5jICB8IDEgKwogdGVzdHN1
aXRlL3JlbG9jMTBsaWIyLmMgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2MxMGxpYjMuYyAgfCAxICsK
IHRlc3RzdWl0ZS9yZWxvYzEwbGliNC5jICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jMTBsaWI1LmMg
IHwgMSArCiB0ZXN0c3VpdGUvcmVsb2MxMS5jICAgICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzEx
LnNoICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jMTFsaWIyLmMgIHwgMSArCiB0ZXN0c3VpdGUv
cmVsb2MxMWxpYjMuYyAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzEyLmMgICAgICB8IDEgKwogdGVz
dHN1aXRlL3JlbG9jMTIuaCAgICAgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2MxMi5zaCAgICAgfCAx
ICsKIHRlc3RzdWl0ZS9yZWxvYzEybGliMS5jICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jMTJsaWIy
LmMgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2MxbGliMS5jICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxv
YzFsaWIyLmMgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jMi5jICAgICAgIHwgMSArCiB0ZXN0c3Vp
dGUvcmVsb2MyLnNoICAgICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzJsaWIxLmMgICB8IDEgKwog
dGVzdHN1aXRlL3JlbG9jMmxpYjIuYyAgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2MzLmMgICAgICAg
fCAxICsKIHRlc3RzdWl0ZS9yZWxvYzMuc2ggICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jM2xp
YjEuYyAgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2M0LmMgICAgICAgfCAxICsKIHRlc3RzdWl0ZS9y
ZWxvYzQuc2ggICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jNGxpYjEuYyAgIHwgMSArCiB0ZXN0
c3VpdGUvcmVsb2M0bGliMi5jICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzRsaWIzLmMgICB8IDEg
KwogdGVzdHN1aXRlL3JlbG9jNS5jICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2M1LnNoICAg
ICAgfCAxICsKIHRlc3RzdWl0ZS9yZWxvYzYuc2ggICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9j
Ny5jICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvcmVsb2M3LnNoICAgICAgfCAxICsKIHRlc3RzdWl0
ZS9yZWxvYzguc2ggICAgICB8IDEgKwogdGVzdHN1aXRlL3JlbG9jOS5zaCAgICAgIHwgMSArCiB0
ZXN0c3VpdGUvc2h1ZmZsZTEuc2ggICAgfCAxICsKIHRlc3RzdWl0ZS9zaHVmZmxlMi5jICAgICB8
IDEgKwogdGVzdHN1aXRlL3NodWZmbGUyLnNoICAgIHwgMSArCiB0ZXN0c3VpdGUvc2h1ZmZsZTMu
c2ggICAgfCAxICsKIHRlc3RzdWl0ZS9zaHVmZmxlNC5zaCAgICB8IDEgKwogdGVzdHN1aXRlL3No
dWZmbGU1LnNoICAgIHwgMSArCiB0ZXN0c3VpdGUvc2h1ZmZsZTYuc2ggICAgfCAxICsKIHRlc3Rz
dWl0ZS9zaHVmZmxlNmxpYjEuYyB8IDEgKwogdGVzdHN1aXRlL3NodWZmbGU2bGliMi5jIHwgMSAr
CiB0ZXN0c3VpdGUvc2h1ZmZsZTcuc2ggICAgfCAxICsKIHRlc3RzdWl0ZS9zaHVmZmxlOC5jICAg
ICB8IDEgKwogdGVzdHN1aXRlL3NodWZmbGU4LnNoICAgIHwgMSArCiB0ZXN0c3VpdGUvc2h1ZmZs
ZTkuYyAgICAgfCAxICsKIHRlc3RzdWl0ZS9zaHVmZmxlOS5zaCAgICB8IDEgKwogdGVzdHN1aXRl
L3RsczEuYyAgICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvdGxzMS5oICAgICAgICAgfCAxICsKIHRl
c3RzdWl0ZS90bHMxLnNoICAgICAgICB8IDEgKwogdGVzdHN1aXRlL3RsczFsaWIxLmMgICAgIHwg
MSArCiB0ZXN0c3VpdGUvdGxzMWxpYjIuYyAgICAgfCAxICsKIHRlc3RzdWl0ZS90bHMyLmMgICAg
ICAgICB8IDEgKwogdGVzdHN1aXRlL3RsczIuc2ggICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvdGxz
MmxpYjEuYyAgICAgfCAxICsKIHRlc3RzdWl0ZS90bHMzLnNoICAgICAgICB8IDEgKwogdGVzdHN1
aXRlL3RsczNsaWIyLmMgICAgIHwgMSArCiB0ZXN0c3VpdGUvdGxzNC5jICAgICAgICAgfCAxICsK
IHRlc3RzdWl0ZS90bHM0LnNoICAgICAgICB8IDEgKwogdGVzdHN1aXRlL3RsczRsaWIxLmMgICAg
IHwgMSArCiB0ZXN0c3VpdGUvdGxzNGxpYjIuYyAgICAgfCAxICsKIHRlc3RzdWl0ZS90bHM1LnNo
ICAgICAgICB8IDEgKwogdGVzdHN1aXRlL3RsczVsaWIxLmMgICAgIHwgMSArCiB0ZXN0c3VpdGUv
dGxzNi5zaCAgICAgICAgfCAxICsKIHRlc3RzdWl0ZS90bHM2bGliMS5jICAgICB8IDEgKwogdGVz
dHN1aXRlL3RsczcuYyAgICAgICAgIHwgMSArCiB0ZXN0c3VpdGUvdGxzNy5zaCAgICAgICAgfCAx
ICsKIHRlc3RzdWl0ZS91bmRvMS5zaCAgICAgICB8IDEgKwogdGVzdHN1aXRlL3VuZG9zeXNsaWJz
LnNoIHwgMSArCiB0ZXN0c3VpdGUvdW5wcmVsMS5jICAgICAgfCAxICsKIHRlc3RzdWl0ZS91bnBy
ZWwxLnNoICAgICB8IDEgKwogdGVzdHN1aXRlL3VucHJlbDFsaWIxLmMgIHwgMSArCiB0ZXN0c3Vp
dGUvdW5wcmVsMWxpYjIuYyAgfCAxICsKIDE5OSBmaWxlcyBjaGFuZ2VkLCAyNTggaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2dlbGYvZ2VsZi5jIGIvZ2VsZi9nZWxmLmMKaW5kZXggOTE1Y2Y1
Yi4uOTI2MTMxOCAxMDA2NDQKLS0tIGEvZ2VsZi9nZWxmLmMKKysrIGIvZ2VsZi9nZWxmLmMKQEAg
LTIsNiArMiw4IEBACiAgICBDb3B5cmlnaHQgKEMpIDIwMDEsIDIwMDIsIDIwMDQgUmVkIEhhdCwg
SW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAw
MS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAg
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9n
ZWxmL2dlbGYuaCBiL2dlbGYvZ2VsZi5oCmluZGV4IDZiNzZhMTUuLmI1NTJlMjMgMTAwNjQ0Ci0t
LSBhL2dlbGYvZ2VsZi5oCisrKyBiL2dlbGYvZ2VsZi5oCkBAIC0yLDYgKzIsOCBAQAogICAgQ29w
eXJpZ2h0IChDKSAyMDAxIFJlZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5l
ayA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAg
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlv
dXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvZ2VsZngvZ2VsZnguaCBiL2dlbGZ4L2dlbGZ4LmgKaW5k
ZXggYzAxMWE1Ny4uZmM5MTRhOSAxMDA2NDQKLS0tIGEvZ2VsZngvZ2VsZnguaAorKysgYi9nZWxm
eC9nZWxmeC5oCkBAIC0yLDYgKzIsOCBAQAogICAgQ29weXJpZ2h0IChDKSAyMDAxIFJlZCBIYXQs
IEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIw
MDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAg
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEv
Z2VsZngzMi9nZWxmeC5oIGIvZ2VsZngzMi9nZWxmeC5oCmluZGV4IDc2NjhhODQuLmVjZTJlMWIg
MTAwNjQ0Ci0tLSBhL2dlbGZ4MzIvZ2VsZnguaAorKysgYi9nZWxmeDMyL2dlbGZ4LmgKQEAgLTIs
NiArMiw4IEBACiAgICBDb3B5cmlnaHQgKEMpIDIwMDEgUmVkIEhhdCwgSW5jLgogICAgV3JpdHRl
biBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAg
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMg
cHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9tNC9saWJlbGYubTQgYi9t
NC9saWJlbGYubTQKaW5kZXggMjk1YmYwYy4uZjllMzliMiAxMDA2NDQKLS0tIGEvbTQvbGliZWxm
Lm00CisrKyBiL200L2xpYmVsZi5tNApAQCAtNCw2ICs0LDcgQEAgZG5sIFNvbWUgbGliZWxmIHZl
cnNpb25zIGhhdmUgYnVncyBpbiBFbGY2NF9TeHdvcmQgY29udmVyc2lvbnMuCiBkbmwgRGV0ZWN0
IGl0LgogCiBkbmwgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPi4K
K2RubCBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAKIEFDX0RFRlVOKFtB
Q19MSUJFTEZfU1hXT1JEXSwKICAgW0FDX1RSWV9SVU4oWwpkaWZmIC0tZ2l0IGEvc3JjL2FyY2gt
YWxwaGEuYyBiL3NyYy9hcmNoLWFscGhhLmMKaW5kZXggNzgwMmEzZS4uODgzNWNlMCAxMDA2NDQK
LS0tIGEvc3JjL2FyY2gtYWxwaGEuYworKysgYi9zcmMvYXJjaC1hbHBoYS5jCkBAIC0xLDYgKzEs
OCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA5IFJlZCBI
YXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4s
IDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisK
ICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0
IGEvc3JjL2FyY2gtYXJtLmMgYi9zcmMvYXJjaC1hcm0uYwppbmRleCBlZWM3YzU3Li4wZDc3MjZl
IDEwMDY0NAotLS0gYS9zcmMvYXJjaC1hcm0uYworKysgYi9zcmMvYXJjaC1hcm0uYwpAQCAtMSw2
ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMSwgMjAwMiwgMjAwNCwgMjAwOSwgMjAxMSwg
MjAxMyBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJl
ZGhhdC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
ci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikK
ZGlmZiAtLWdpdCBhL3NyYy9hcmNoLWNyaXMuYyBiL3NyYy9hcmNoLWNyaXMuYwppbmRleCAzMjcy
Nzc5Li40NjFjYTQ3IDEwMDY0NAotLS0gYS9zcmMvYXJjaC1jcmlzLmMKKysrIGIvc3JjL2FyY2gt
Y3Jpcy5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAyMDAyLCAyMDA0
LCAyMDA5IFJlZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJA
cmVkaGF0LmNvbT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9u
KQpkaWZmIC0tZ2l0IGEvc3JjL2FyY2gtaTM4Ni5jIGIvc3JjL2FyY2gtaTM4Ni5jCmluZGV4IGEx
ZTBmY2MuLjVhZmIyN2YgMTAwNjQ0Ci0tLSBhL3NyYy9hcmNoLWkzODYuYworKysgYi9zcmMvYXJj
aC1pMzg2LmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEsIDIwMDIsIDIw
MDMsIDIwMDQsIDIwMDksIDIwMTEgUmVkIEhhdCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBK
ZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5
CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAo
YXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvYXJjaC1pYTY0LmMgYi9zcmMvYXJjaC1p
YTY0LmMKaW5kZXggNjAzOTExNS4uYTdhMjM1ZiAxMDA2NDQKLS0tIGEvc3JjL2FyY2gtaWE2NC5j
CisrKyBiL3NyYy9hcmNoLWlhNjQuYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykg
MjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwOSBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5
IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQg
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJs
aXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9hcmNoLW1pcHMuYyBiL3Ny
Yy9hcmNoLW1pcHMuYwppbmRleCAwMmM2MDhmLi5mYWFkMWVlIDEwMDY0NAotLS0gYS9zcmMvYXJj
aC1taXBzLmMKKysrIGIvc3JjL2FyY2gtbWlwcy5jCkBAIC0yLDYgKzIsOCBAQAogICAgV3JpdHRl
biBieSBSaWNoYXJkIFNhbmRpZm9yZCA8cmljaGFyZEBjb2Rlc291cmNlcnkuY29tPiwgMjAwNgog
ICAgVXBkYXRlZCBieSBNYWNpZWogVy4gUm96eWNraSA8bWFjcm9AY29kZXNvdXJjZXJ5LmNvbT4s
IDIwMDguCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisK
ICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0
IGEvc3JjL2FyY2gtcHBjLmMgYi9zcmMvYXJjaC1wcGMuYwppbmRleCBlMjJlNWQ1Li5kNmMwZDNh
IDEwMDY0NAotLS0gYS9zcmMvYXJjaC1wcGMuYworKysgYi9zcmMvYXJjaC1wcGMuYwpAQCAtMSw2
ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwNSwg
MjAwOSwgMjAxMSBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGph
a3ViQHJlZGhhdC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9w
dGlvbikKZGlmZiAtLWdpdCBhL3NyYy9hcmNoLXBwYzY0LmMgYi9zcmMvYXJjaC1wcGM2NC5jCmlu
ZGV4IGE3NjRiOTkuLjI2ZjIwMzIgMTAwNjQ0Ci0tLSBhL3NyYy9hcmNoLXBwYzY0LmMKKysrIGIv
c3JjL2FyY2gtcHBjNjQuYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMiwg
MjAwMywgMjAwNCwgMjAwOSBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGlu
ZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAyLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAg
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5
b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9hcmNoLXMzOTAuYyBiL3NyYy9hcmNoLXMzOTAu
YwppbmRleCBlNWZlMTMwLi4yMGQxNTY2IDEwMDY0NAotLS0gYS9zcmMvYXJjaC1zMzkwLmMKKysr
IGIvc3JjL2FyY2gtczM5MC5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAx
LCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA5LCAyMDEwLCAyMDEzIFJlZCBIYXQsIEluYy4KICAgIFdy
aXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEuCiAKKyAgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3JjL2FyY2gtczM5
MHguYyBiL3NyYy9hcmNoLXMzOTB4LmMKaW5kZXggZTRkODJmNy4uZDRjMzc5OSAxMDA2NDQKLS0t
IGEvc3JjL2FyY2gtczM5MHguYworKysgYi9zcmMvYXJjaC1zMzkweC5jCkBAIC0xLDYgKzEsOCBA
QAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA5LCAyMDEzIFJl
ZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNv
bT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVy
CisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0t
Z2l0IGEvc3JjL2FyY2gtc2guYyBiL3NyYy9hcmNoLXNoLmMKaW5kZXggMWIxMTMxMi4uZjc0NDI1
MSAxMDA2NDQKLS0tIGEvc3JjL2FyY2gtc2guYworKysgYi9zcmMvYXJjaC1zaC5jCkBAIC0xLDYg
KzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA5IFJl
ZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNv
bT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVy
CisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0t
Z2l0IGEvc3JjL2FyY2gtc3BhcmMuYyBiL3NyYy9hcmNoLXNwYXJjLmMKaW5kZXggZTAxNmE3OS4u
NmIxNjRlMSAxMDA2NDQKLS0tIGEvc3JjL2FyY2gtc3BhcmMuYworKysgYi9zcmMvYXJjaC1zcGFy
Yy5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAyMDAyLCAyMDA0LCAy
MDA5IFJlZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVk
aGF0LmNvbT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpk
aWZmIC0tZ2l0IGEvc3JjL2FyY2gtc3BhcmM2NC5jIGIvc3JjL2FyY2gtc3BhcmM2NC5jCmluZGV4
IGFlZTQ2MDEuLjM5MDg5NWMgMTAwNjQ0Ci0tLSBhL3NyYy9hcmNoLXNwYXJjNjQuYworKysgYi9z
cmMvYXJjaC1zcGFyYzY0LmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEs
IDIwMDIsIDIwMDQsIDIwMDkgUmVkIEhhdCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxp
bmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAg
ICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQg
eW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvYXJjaC14ODZfNjQuYyBiL3NyYy9hcmNoLXg4
Nl82NC5jCmluZGV4IDJmNmM1NTEuLjViNDMyMTkgMTAwNjQ0Ci0tLSBhL3NyYy9hcmNoLXg4Nl82
NC5jCisrKyBiL3NyYy9hcmNoLXg4Nl82NC5jCkBAIC0zLDYgKzMsOCBAQAogICAgQ29weXJpZ2h0
IChDKSAyMDExIFdpbmQgUml2ZXIgU3lzdGVtcywgSW5jLgogICAgeDMyIHN1cHBvcnQgYnkgTWFy
ayBIYXRsZSA8bWFyay5oYXRsZUB3aW5kcml2ZXIuY29tPgogCisgICBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQg
YnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9y
IChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9jYWNoZS5jIGIvc3JjL2NhY2hlLmMK
aW5kZXggMWNjMzIxNy4uODE3Njg3NiAxMDA2NDQKLS0tIGEvc3JjL2NhY2hlLmMKKysrIGIvc3Jj
L2NhY2hlLmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEsIDIwMDIsIDIw
MDMsIDIwMDQsIDIwMDYsIDIwMTMgUmVkIEhhdCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBK
ZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5
CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAo
YXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvY2Fub25pY2FsaXplLmMgYi9zcmMvY2Fu
b25pY2FsaXplLmMKaW5kZXggNzlkZjQ0ZS4uZWM5MDQzYiAxMDA2NDQKLS0tIGEvc3JjL2Nhbm9u
aWNhbGl6ZS5jCisrKyBiL3NyYy9jYW5vbmljYWxpemUuYwpAQCAtMiw2ICsyLDggQEAKICAgIENv
cHlyaWdodCAoQykgMTk5Ni0yMDAyLCAyMDA0LCAyMDA1LCAyMDA2IEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbiwgSW5jLgogICAgVGhpcyBmaWxlIGlzIHBhcnQgb2YgdGhlIEdOVSBDIExpYnJhcnku
CiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRo
ZSBHTlUgQyBMaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vcgogICAgbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBH
ZW5lcmFsIFB1YmxpYwogICAgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgZWl0aGVyCmRpZmYgLS1naXQgYS9zcmMvY2hlY2tzdW0uYyBiL3NyYy9j
aGVja3N1bS5jCmluZGV4IDIwYTIzYTAuLjBkZjUzNjMgMTAwNjQ0Ci0tLSBhL3NyYy9jaGVja3N1
bS5jCisrKyBiL3NyYy9jaGVja3N1bS5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChD
KSAyMDAxLCAyMDAyLCAyMDAzIFJlZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVs
aW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQog
ICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0
IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3JjL2NvbmZsaWN0LmMgYi9zcmMvY29uZmxpY3Qu
YwppbmRleCA1NjEzYWNlLi4zNmY4NjA2IDEwMDY0NAotLS0gYS9zcmMvY29uZmxpY3QuYworKysg
Yi9zcmMvY29uZmxpY3QuYwpAQCAtMyw2ICszLDggQEAKICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVs
aW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEuCiAgICBVcGRhdGVkIGJ5IE1hY2llaiBXLiBS
b3p5Y2tpIDxtYWNyb0Bjb2Rlc291cmNlcnkuY29tPiwgMjAwOC4KIAorICAgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlz
aGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAy
LCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvY3JjMzIuYyBiL3NyYy9jcmMz
Mi5jCmluZGV4IGYzNmFiYjUuLjYzMWY3YmIgMTAwNjQ0Ci0tLSBhL3NyYy9jcmMzMi5jCisrKyBi
L3NyYy9jcmMzMi5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxIFJlZCBI
YXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4s
IDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisK
ICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0
IGEvc3JjL2N4eC5jIGIvc3JjL2N4eC5jCmluZGV4IDQzOTFlYmUuLjM0ZjBlZDggMTAwNjQ0Ci0t
LSBhL3NyYy9jeHguYworKysgYi9zcmMvY3h4LmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmln
aHQgKEMpIDIwMDEsIDIwMDIsIDIwMDMsIDIwMDcsIDIwMDkgUmVkIEhhdCwgSW5jLgogICAgV3Jp
dHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
ICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvZGF0YS5jIGIv
c3JjL2RhdGEuYwppbmRleCA3NTFmOTZmLi40ZDg2MzlkIDEwMDY0NAotLS0gYS9zcmMvZGF0YS5j
CisrKyBiL3NyYy9kYXRhLmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEs
IDIwMDIgUmVkIEhhdCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkBy
ZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24p
CmRpZmYgLS1naXQgYS9zcmMvZG9pdC5jIGIvc3JjL2RvaXQuYwppbmRleCAzNzg0ODY2Li42MTg2
NzJkIDEwMDY0NAotLS0gYS9zcmMvZG9pdC5jCisrKyBiL3NyYy9kb2l0LmMKQEAgLTEsNiArMSw4
IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEsIDIwMDMsIDIwMDQsIDIwMDUsIDIwMDcgUmVkIEhh
dCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwg
MjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwog
ICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQg
YS9zcmMvZHNvLmMgYi9zcmMvZHNvLmMKaW5kZXggOTQ5YWJmOS4uMzg1M2Q0MyAxMDA2NDQKLS0t
IGEvc3JjL2Rzby5jCisrKyBiL3NyYy9kc28uYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdo
dCAoQykgMjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwNSwgMjAwNiwgMjAxMCBSZWQgSGF0LCBJ
bmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAx
LgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3Ny
Yy9kd2FyZjIuYyBiL3NyYy9kd2FyZjIuYwppbmRleCBiOTU4OGIxLi40YzJmOTM5IDEwMDY0NAot
LS0gYS9zcmMvZHdhcmYyLmMKKysrIGIvc3JjL2R3YXJmMi5jCkBAIC0yLDYgKzIsOCBAQAogICAg
UmVkIEhhdCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQu
Y29tPiwgMjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmli
dXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYg
LS1naXQgYS9zcmMvZHdhcmYyLmggYi9zcmMvZHdhcmYyLmgKaW5kZXggYjBjODBiNi4uYmU3MzJl
MiAxMDA2NDQKLS0tIGEvc3JjL2R3YXJmMi5oCisrKyBiL3NyYy9kd2FyZjIuaApAQCAtMSw2ICsx
LDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMSwgMjAwMiwgMjAwOSwgMjAxMCwgMjAxMSwgMjAx
MiBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhh
dC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlm
ZiAtLWdpdCBhL3NyYy9leGVjLmMgYi9zcmMvZXhlYy5jCmluZGV4IGNhN2ZkMTQuLjI2NDE4Nzcg
MTAwNjQ0Ci0tLSBhL3NyYy9leGVjLmMKKysrIGIvc3JjL2V4ZWMuYwpAQCAtMSw2ICsxLDggQEAK
IC8qIENvcHlyaWdodCAoQykgMjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwNSwgMjAwNiBSZWQg
SGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+
LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgor
CiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdp
dCBhL3NyYy9leGVjbGVfb3Blbi5jIGIvc3JjL2V4ZWNsZV9vcGVuLmMKaW5kZXggMmVlNWNiYy4u
ZDc5NTQ2MSAxMDA2NDQKLS0tIGEvc3JjL2V4ZWNsZV9vcGVuLmMKKysrIGIvc3JjL2V4ZWNsZV9v
cGVuLmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEgUmVkIEhhdCwgSW5j
LgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4K
IAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
OyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMv
ZXhlY3N0YWNrLmMgYi9zcmMvZXhlY3N0YWNrLmMKaW5kZXggOTdmYjQ1My4uMjRmNmZiYiAxMDA2
NDQKLS0tIGEvc3JjL2V4ZWNzdGFjay5jCisrKyBiL3NyYy9leGVjc3RhY2suYwpAQCAtMSw2ICsx
LDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMywgMjAwNSwgMjAxMCBSZWQgSGF0LCBJbmMuCiAg
ICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAzLgogCisg
ICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9mcHRy
LmMgYi9zcmMvZnB0ci5jCmluZGV4IGNmZTNhZWQuLjFjNzkxNmMgMTAwNjQ0Ci0tLSBhL3NyYy9m
cHRyLmMKKysrIGIvc3JjL2ZwdHIuYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykg
MjAwMSwgMjAwMiwgMjAwMywgMjAwNyBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3Vi
IEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQg
YnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9y
IChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9mcHRyLmggYi9zcmMvZnB0ci5oCmlu
ZGV4IDM2ZWY3YzYuLjZkYWFlMDMgMTAwNjQ0Ci0tLSBhL3NyYy9mcHRyLmgKKysrIGIvc3JjL2Zw
dHIuaApAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMSBSZWQgSGF0LCBJbmMu
CiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgog
CisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlz
IHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
IG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247
IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9n
YXRoZXIuYyBiL3NyYy9nYXRoZXIuYwppbmRleCAyNzdmMWI1Li4yYWYzZDRkIDEwMDY0NAotLS0g
YS9zcmMvZ2F0aGVyLmMKKysrIGIvc3JjL2dhdGhlci5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29w
eXJpZ2h0IChDKSAyMDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA1LCAyMDA2LCAyMDA3IFJlZCBI
YXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4s
IDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisK
ICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0
IGEvc3JjL2dldC5jIGIvc3JjL2dldC5jCmluZGV4IDA2NTk5NjIuLmU5NTYzMTMgMTAwNjQ0Ci0t
LSBhL3NyYy9nZXQuYworKysgYi9zcmMvZ2V0LmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmln
aHQgKEMpIDIwMDEsIDIwMDIsIDIwMDMsIDIwMDQsIDIwMDUsIDIwMDcsIDIwMDkgUmVkIEhhdCwg
SW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAw
MS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAg
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9z
cmMvaGFzaHRhYi5jIGIvc3JjL2hhc2h0YWIuYwppbmRleCBmYTI3NDQ2Li5iMzYxNzg1IDEwMDY0
NAotLS0gYS9zcmMvaGFzaHRhYi5jCisrKyBiL3NyYy9oYXNodGFiLmMKQEAgLTIsNiArMiw4IEBA
CiAgICBDb3B5cmlnaHQgKEMpIDE5OTksIDIwMDAsIDIwMDEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuCiAgICBDb250cmlidXRlZCBieSBWbGFkaW1pciBNYWthcm92ICh2bWFrYXJvdkBj
eWdudXMuY29tKS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXIKKwogVGhpcyBmaWxlIGlzIHBhcnQgb2YgdGhlIGxpYmliZXJ0eSBsaWJyYXJ5LgogTGliaWJl
cnR5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogbW9k
aWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExpYnJhcnkgR2VuZXJhbCBQdWJsaWMK
ZGlmZiAtLWdpdCBhL3NyYy9oYXNodGFiLmggYi9zcmMvaGFzaHRhYi5oCmluZGV4IDMxZTYzZTAu
LmIxMDBiYjEgMTAwNjQ0Ci0tLSBhL3NyYy9oYXNodGFiLmgKKysrIGIvc3JjL2hhc2h0YWIuaApA
QCAtMiw2ICsyLDggQEAKICAgIENvcHlyaWdodCAoQykgMTk5OSwgMjAwMCBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24sIEluYy4KICAgIENvbnRyaWJ1dGVkIGJ5IFZsYWRpbWlyIE1ha2Fyb3YgKHZt
YWthcm92QGN5Z251cy5jb20pLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vci1sYXRlcgorCiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCmRpZmYgLS1n
aXQgYS9zcmMvbGF5b3V0LmMgYi9zcmMvbGF5b3V0LmMKaW5kZXggODU5YWI2Ni4uNjI2ZTg1OCAx
MDA2NDQKLS0tIGEvc3JjL2xheW91dC5jCisrKyBiL3NyYy9sYXlvdXQuYwpAQCAtMSw2ICsxLDgg
QEAKIC8qIENvcHlyaWdodCAoQykgMjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwNiwgMjAxMSBS
ZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5j
b20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAt
LWdpdCBhL3NyYy9sYXlvdXQuaCBiL3NyYy9sYXlvdXQuaAppbmRleCBmNDgxZDIyLi43ODQ5NGJj
IDEwMDY0NAotLS0gYS9zcmMvbGF5b3V0LmgKKysrIGIvc3JjL2xheW91dC5oCkBAIC0xLDYgKzEs
OCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAyMDA0LCAyMDA2IFJlZCBIYXQsIEluYy4KICAg
IFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEuCiAKKyAg
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9k
aWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3JjL21haW4u
YyBiL3NyYy9tYWluLmMKaW5kZXggNmJhODlkNS4uZjliZTZjZiAxMDA2NDQKLS0tIGEvc3JjL21h
aW4uYworKysgYi9zcmMvbWFpbi5jCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAy
MDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA1LCAyMDA3LCAyMDEwLCAyMDExIFJlZCBIYXQsIElu
Yy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEu
CiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3Jj
L21ha2VjcmMuYyBiL3NyYy9tYWtlY3JjLmMKaW5kZXggZGI1MjAxMy4uOGRlNDBkNSAxMDA2NDQK
LS0tIGEvc3JjL21ha2VjcmMuYworKysgYi9zcmMvbWFrZWNyYy5jCkBAIC0xLDMgKzEsNCBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLyogTm90IGNvcHlyaWdo
dGVkIDE5OTAgTWFyayBBZGxlciAqLwogCiAjaWZuZGVmIGxpbnQKZGlmZiAtLWdpdCBhL3NyYy9t
ZDUuYyBiL3NyYy9tZDUuYwppbmRleCAwZDJmZGVmLi44YmY0YTVkIDEwMDY0NAotLS0gYS9zcmMv
bWQ1LmMKKysrIGIvc3JjL21kNS5jCkBAIC00LDYgKzQsOCBAQAogICAgTk9URTogVGhlIGNhbm9u
aWNhbCBzb3VyY2Ugb2YgdGhpcyBmaWxlIGlzIG1haW50YWluZWQgd2l0aCB0aGUgR05VIEMKICAg
IExpYnJhcnkuICBCdWdzIGNhbiBiZSByZXBvcnRlZCB0byBidWctZ2xpYmNAcHJlcC5haS5taXQu
ZWR1LgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAg
ICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yIG1vZGlmeSBpdAogICAgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlCiAgICBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55CmRpZmYgLS1n
aXQgYS9zcmMvbWQ1LmggYi9zcmMvbWQ1LmgKaW5kZXggNTVmNjE5NS4uZTc0YzIxNCAxMDA2NDQK
LS0tIGEvc3JjL21kNS5oCisrKyBiL3NyYy9tZDUuaApAQCAtNCw2ICs0LDggQEAKICAgIE5PVEU6
IFRoZSBjYW5vbmljYWwgc291cmNlIG9mIHRoaXMgZmlsZSBpcyBtYWludGFpbmVkIHdpdGggdGhl
IEdOVSBDCiAgICBMaWJyYXJ5LiAgQnVncyBjYW4gYmUgcmVwb3J0ZWQgdG8gYnVnLWdsaWJjQHBy
ZXAuYWkubWl0LmVkdS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3It
bGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQKICAgIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZQogICAgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pIGFu
eQpkaWZmIC0tZ2l0IGEvc3JjL21kZWJ1Zy5jIGIvc3JjL21kZWJ1Zy5jCmluZGV4IDRjMjJkMmYu
LjU0YTI3MzkgMTAwNjQ0Ci0tLSBhL3NyYy9tZGVidWcuYworKysgYi9zcmMvbWRlYnVnLmMKQEAg
LTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEgUmVkIEhhdCwgSW5jLgogICAgV3Jp
dHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
ICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
YXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvcHJlbGluay5j
IGIvc3JjL3ByZWxpbmsuYwppbmRleCA2NGM0ZmVhLi40YzUxMmRjIDEwMDY0NAotLS0gYS9zcmMv
cHJlbGluay5jCisrKyBiL3NyYy9wcmVsaW5rLmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmln
aHQgKEMpIDIwMDEsIDIwMDIsIDIwMDMsIDIwMDQsIDIwMDUsIDIwMDYsIDIwMDcgUmVkIEhhdCwg
SW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAw
MS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAg
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9z
cmMvcHJlbGluay5oIGIvc3JjL3ByZWxpbmsuaAppbmRleCAzOWM0MzkwLi5lMmNkZTQyIDEwMDY0
NAotLS0gYS9zcmMvcHJlbGluay5oCisrKyBiL3NyYy9wcmVsaW5rLmgKQEAgLTQsNiArNCw4IEBA
CiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgog
ICAgVXBkYXRlZCBieSBNYWNpZWogVy4gUm96eWNraSA8bWFjcm9AY29kZXNvdXJjZXJ5LmNvbT4s
IDIwMDguCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisK
ICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0
IGEvc3JjL3ByZWxpbmt0YWIuaCBiL3NyYy9wcmVsaW5rdGFiLmgKaW5kZXggZjQxYzc5Yy4uZDEx
NmU1ZCAxMDA2NDQKLS0tIGEvc3JjL3ByZWxpbmt0YWIuaAorKysgYi9zcmMvcHJlbGlua3RhYi5o
CkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxIFJlZCBIYXQsIEluYy4KICAg
IFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVkaGF0LmNvbT4sIDIwMDEuCiAKKyAg
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJv
Z3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9k
aWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3JjL3JlbG9j
LWluZm8uYyBiL3NyYy9yZWxvYy1pbmZvLmMKaW5kZXggNGNlMzMzYy4uNGM2NzliOCAxMDA2NDQK
LS0tIGEvc3JjL3JlbG9jLWluZm8uYworKysgYi9zcmMvcmVsb2MtaW5mby5jCkBAIC0xLDYgKzEs
OCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDA4IENvZGVTb3VyY2VyeQogICAgV3JpdHRlbiBieSBN
YWNpZWogVy4gUm96eWNraSA8bWFjcm9AY29kZXNvdXJjZXJ5LmNvbT4sIDIwMDguCiAKKyAgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3JjL3JlbG9jLWlu
Zm8uaCBiL3NyYy9yZWxvYy1pbmZvLmgKaW5kZXggYThmOGI3Yy4uZjlmMDJkYiAxMDA2NDQKLS0t
IGEvc3JjL3JlbG9jLWluZm8uaAorKysgYi9zcmMvcmVsb2MtaW5mby5oCkBAIC0xLDYgKzEsOCBA
QAogLyogQ29weXJpZ2h0IChDKSAyMDA4IENvZGVTb3VyY2VyeQogICAgV3JpdHRlbiBieSBNYWNp
ZWogVy4gUm96eWNraSA8bWFjcm9AY29kZXNvdXJjZXJ5LmNvbT4sIDIwMDguCiAKKyAgIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAg
ICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpkaWZmIC0tZ2l0IGEvc3JjL3JlbG9jLmMgYi9z
cmMvcmVsb2MuYwppbmRleCBkZWIwYWJlLi4wMTMyNDI1IDEwMDY0NAotLS0gYS9zcmMvcmVsb2Mu
YworKysgYi9zcmMvcmVsb2MuYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAw
MSwgMjAwMiwgMjAwMywgMjAwNSBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEpl
bGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhl
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkK
ICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChh
dCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy9yZWxvYy5oIGIvc3JjL3JlbG9jLmgKaW5k
ZXggYTJjZWZmOS4uMDAxZWJkMSAxMDA2NDQKLS0tIGEvc3JjL3JlbG9jLmgKKysrIGIvc3JjL3Jl
bG9jLmgKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEsIDIwMDIgUmVkIEhh
dCwgSW5jLgogICAgV3JpdHRlbiBieSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwg
MjAwMS4KIAorICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwog
ICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnkKICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQg
YS9zcmMvc2hhLmMgYi9zcmMvc2hhLmMKaW5kZXggY2ZiYzk1Ni4uMGI4ZjlmOCAxMDA2NDQKLS0t
IGEvc3JjL3NoYS5jCisrKyBiL3NyYy9zaGEuYwpAQCAtMyw2ICszLDggQEAKIAogICAgQ29weXJp
Z2h0IChDKSAyMDAwLCAyMDAxLCAyMDAzIFNjb3R0IEcuIE1pbGxlcgogCisgICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisKICAgIENyZWRpdHM6CiAgICAgICBSb2JlcnQg
S2xlcCA8cm9iZXJ0QGlsc2Uubmw+ICAtLSBFeHBhbnNpb24gZnVuY3Rpb24gZml4CiAgICBOT1RF
OiBUaGUgY2Fub25pY2FsIHNvdXJjZSBvZiB0aGlzIGZpbGUgaXMgbWFpbnRhaW5lZCBpbiBHTlUg
Y29yZXV0aWxzLgpkaWZmIC0tZ2l0IGEvc3JjL3NoYS5oIGIvc3JjL3NoYS5oCmluZGV4IDEzNTgz
ZTMuLmI0MDk3NTIgMTAwNjQ0Ci0tLSBhL3NyYy9zaGEuaAorKysgYi9zcmMvc2hhLmgKQEAgLTIs
NiArMiw4IEBACiAgICBsaWJyYXJ5IGZ1bmN0aW9ucy4KIAogICAgQ29weXJpZ2h0IChDKSAxOTk5
LCBTY290dCBHLiBNaWxsZXIKKworICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogKi8KIAogI2lmbmRlZiBfU0hBX0gKZGlmZiAtLWdpdCBhL3NyYy9zcGFjZS5jIGIvc3Jj
L3NwYWNlLmMKaW5kZXggNGJkNDc2MC4uM2RhMDU2MSAxMDA2NDQKLS0tIGEvc3JjL3NwYWNlLmMK
KysrIGIvc3JjL3NwYWNlLmMKQEAgLTEsNiArMSw4IEBACiAvKiBDb3B5cmlnaHQgKEMpIDIwMDEs
IDIwMDIsIDIwMDMsIDIwMDQsIDIwMDYsIDIwMDcgUmVkIEhhdCwgSW5jLgogICAgV3JpdHRlbiBi
eSBKYWt1YiBKZWxpbmVrIDxqYWt1YkByZWRoYXQuY29tPiwgMjAwMS4KIAorICAgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKwogICAgVGhpcyBwcm9ncmFtIGlzIGZy
ZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAgIGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5CiAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lv
biAyLCBvciAoYXQgeW91ciBvcHRpb24pCmRpZmYgLS1naXQgYS9zcmMvc3BhY2UuaCBiL3NyYy9z
cGFjZS5oCmluZGV4IDVjOWY3MjUuLjRlZjQyOWUgMTAwNjQ0Ci0tLSBhL3NyYy9zcGFjZS5oCisr
KyBiL3NyYy9zcGFjZS5oCkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAxLCAy
MDA0IFJlZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJAcmVk
aGF0LmNvbT4sIDIwMDEuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKQpk
aWZmIC0tZ2l0IGEvc3JjL3N0YWJzLmMgYi9zcmMvc3RhYnMuYwppbmRleCBjMGE1YTZhLi40MzQ2
OTUwIDEwMDY0NAotLS0gYS9zcmMvc3RhYnMuYworKysgYi9zcmMvc3RhYnMuYwpAQCAtMSw2ICsx
LDggQEAKIC8qIENvcHlyaWdodCAoQykgMjAwMSwgMjAwNSwgMjAwNiBSZWQgSGF0LCBJbmMuCiAg
ICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgogCisg
ICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy91bmRv
LmMgYi9zcmMvdW5kby5jCmluZGV4IDRjMzhkYWIuLmNmMzNmMjYgMTAwNjQ0Ci0tLSBhL3NyYy91
bmRvLmMKKysrIGIvc3JjL3VuZG8uYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykg
MjAwMSwgMjAwMiwgMjAwMywgMjAwNSwgMjAxMCBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5
IEpha3ViIEplbGluZWsgPGpha3ViQHJlZGhhdC5jb20+LCAyMDAxLgogCisgICBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQg
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJs
aXNoZWQgYnkKICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9u
IDIsIG9yIChhdCB5b3VyIG9wdGlvbikKZGlmZiAtLWdpdCBhL3NyYy91bmRvYWxsLmMgYi9zcmMv
dW5kb2FsbC5jCmluZGV4IDU1ZDJhMGIuLjQ0OTA3YmQgMTAwNjQ0Ci0tLSBhL3NyYy91bmRvYWxs
LmMKKysrIGIvc3JjL3VuZG9hbGwuYwpAQCAtMSw2ICsxLDggQEAKIC8qIENvcHlyaWdodCAoQykg
MjAwMiwgMjAwNSBSZWQgSGF0LCBJbmMuCiAgICBXcml0dGVuIGJ5IEpha3ViIEplbGluZWsgPGph
a3ViQHJlZGhhdC5jb20+LCAyMDAyLgogCisgICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcgorCiAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKICAgIHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCB5b3VyIG9w
dGlvbikKZGlmZiAtLWdpdCBhL3NyYy92ZXJpZnkuYyBiL3NyYy92ZXJpZnkuYwppbmRleCA3ZjUz
MGMwLi5iZTAyOGZjIDEwMDY0NAotLS0gYS9zcmMvdmVyaWZ5LmMKKysrIGIvc3JjL3ZlcmlmeS5j
CkBAIC0xLDYgKzEsOCBAQAogLyogQ29weXJpZ2h0IChDKSAyMDAyLCAyMDAzLCAyMDA2LCAyMDA3
LCAyMDEwIFJlZCBIYXQsIEluYy4KICAgIFdyaXR0ZW4gYnkgSmFrdWIgSmVsaW5layA8amFrdWJA
cmVkaGF0LmNvbT4sIDIwMDIuCiAKKyAgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyCisKICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQogICAgdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9u
KQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N4eDEuQyBiL3Rlc3RzdWl0ZS9jeHgxLkMKaW5kZXgg
OWMxMWE2ZC4uOWU5YzdhOSAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL2N4eDEuQworKysgYi90ZXN0
c3VpdGUvY3h4MS5DCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQogI2luY2x1ZGUgImN4eDEuaCIKIGV4dGVybiAiQyIgdm9pZCBhYm9ydCAo
dm9pZCk7CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9jeHgxLmggYi90ZXN0c3VpdGUvY3h4MS5o
CmluZGV4IGQ2ZWZlOWIuLjgxMDMzODggMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9jeHgxLmgKKysr
IGIvdGVzdHN1aXRlL2N4eDEuaApAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKIHN0cnVjdCBBCiAgIHsKICAgICB2aXJ0dWFsIGludCBhICgp
OwpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N4eDEuc2ggYi90ZXN0c3VpdGUvY3h4MS5zaAppbmRl
eCA0NzdhNTQ1Li5iNGRjNTQ4IDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvY3h4MS5zaAorKysgYi90
ZXN0c3VpdGUvY3h4MS5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5z
aAogcm0gLWYgY3h4MSBjeHgxbGliKi5zbyBjeHgxLmxvZwogcm0gLWYgcHJlbGluay5jYWNoZQpk
aWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N4eDFsaWIxLkMgYi90ZXN0c3VpdGUvY3h4MWxpYjEuQwpp
bmRleCAxZWIxOTJhLi40OGNkMmQ5IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvY3h4MWxpYjEuQwor
KysgYi90ZXN0c3VpdGUvY3h4MWxpYjEuQwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJjeHgxLmgiCiAKIGludCBBOjph
ICgpCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvY3h4MWxpYjIuQyBiL3Rlc3RzdWl0ZS9jeHgxbGli
Mi5DCmluZGV4IDc3MDU1ZGEuLmE2MDBmNTUgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9jeHgxbGli
Mi5DCisrKyBiL3Rlc3RzdWl0ZS9jeHgxbGliMi5DCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgImN4eDEuaCIKIAogaW50
IEE6OmEgKCkKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9jeHgyLkMgYi90ZXN0c3VpdGUvY3h4Mi5D
CmluZGV4IDhiNmUwYmYuLmQyZTUzOTcgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9jeHgyLkMKKysr
IGIvdGVzdHN1aXRlL2N4eDIuQwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJjeHgxLmgiCiBleHRlcm4gIkMiIHZvaWQg
YWJvcnQgKHZvaWQpOwogCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvY3h4Mi5zaCBiL3Rlc3RzdWl0
ZS9jeHgyLnNoCmluZGV4IDA2NGZjYjYuLjY2ZDBkNDIgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9j
eHgyLnNoCisrKyBiL3Rlc3RzdWl0ZS9jeHgyLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jh
c2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAk
MGAvZnVuY3Rpb25zLnNoCiBybSAtZiBjeHgyIGN4eDJsaWIqLnNvIGN4eDIubG9nCiBybSAtZiBw
cmVsaW5rLmNhY2hlCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvY3h4My5DIGIvdGVzdHN1aXRlL2N4
eDMuQwppbmRleCAwYTRhZDdiLi43YTRhNmZjIDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvY3h4My5D
CisrKyBiL3Rlc3RzdWl0ZS9jeHgzLkMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAiY3h4My5oIgogZXh0ZXJuICJDIiB2
b2lkIGFib3J0ICh2b2lkKTsKIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N4eDMuaCBiL3Rlc3Rz
dWl0ZS9jeHgzLmgKaW5kZXggYWQyZGU3ZS4uMzdlNjkzYiAxMDA2NDQKLS0tIGEvdGVzdHN1aXRl
L2N4eDMuaAorKysgYi90ZXN0c3VpdGUvY3h4My5oCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogc3RydWN0IEEKICAgewogICAgIHZpcnR1
YWwgaW50IGEgKCkgeyByZXR1cm4gMTsgfQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N4eDMuc2gg
Yi90ZXN0c3VpdGUvY3h4My5zaAppbmRleCA0MTgzNjlhLi5lNGE3NjliIDEwMDc1NQotLS0gYS90
ZXN0c3VpdGUvY3h4My5zaAorKysgYi90ZXN0c3VpdGUvY3h4My5zaApAQCAtMSw0ICsxLDUgQEAK
ICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4g
YGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogcm0gLWYgY3h4MyBjeHgzbGliKi5zbyBjeHgzLmxv
Zwogcm0gLWYgcHJlbGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N4eDNsaWIxLkMg
Yi90ZXN0c3VpdGUvY3h4M2xpYjEuQwppbmRleCBmODcwYmYwLi4wZDIxZWUzIDEwMDY0NAotLS0g
YS90ZXN0c3VpdGUvY3h4M2xpYjEuQworKysgYi90ZXN0c3VpdGUvY3h4M2xpYjEuQwpAQCAtMSwz
ICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNs
dWRlICJjeHgzLmgiCiAKIEEgYTE7CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvY3h4M2xpYjIuQyBi
L3Rlc3RzdWl0ZS9jeHgzbGliMi5DCmluZGV4IDc1ZjJiMTIuLjhiNDc2NmMgMTAwNjQ0Ci0tLSBh
L3Rlc3RzdWl0ZS9jeHgzbGliMi5DCisrKyBiL3Rlc3RzdWl0ZS9jeHgzbGliMi5DCkBAIC0xLDMg
KzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1
ZGUgImN4eDMuaCIKIAogQSBhMjsKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9jeWNsZTEuc2ggYi90
ZXN0c3VpdGUvY3ljbGUxLnNoCmluZGV4IDNkYzdmOTMuLmQ0NDgxOWYgMTAwNzU1Ci0tLSBhL3Rl
c3RzdWl0ZS9jeWNsZTEuc2gKKysrIGIvdGVzdHN1aXRlL2N5Y2xlMS5zaApAQCAtMSw0ICsxLDUg
QEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
IC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogcm0gLWYgY3ljbGUxIGN5Y2xlMWxpYiouc28g
Y3ljbGUxLmxvZwogcm0gLWYgcHJlbGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2N5
Y2xlMi5zaCBiL3Rlc3RzdWl0ZS9jeWNsZTIuc2gKaW5kZXggMGI5OWE1ZC4uNmI1NTA1NiAxMDA3
NTUKLS0tIGEvdGVzdHN1aXRlL2N5Y2xlMi5zaAorKysgYi90ZXN0c3VpdGUvY3ljbGUyLnNoCkBA
IC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiBybSAtZiBjeWNsZTIgY3lj
bGUybGliKi5zbyBjeWNsZTIubG9nCiBybSAtZiBwcmVsaW5rLmNhY2hlCmRpZmYgLS1naXQgYS90
ZXN0c3VpdGUvZGVwczEuYyBiL3Rlc3RzdWl0ZS9kZXBzMS5jCmluZGV4IDMzMTU0NmMuLjMwMThl
NGIgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9kZXBzMS5jCisrKyBiL3Rlc3RzdWl0ZS9kZXBzMS5j
CkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eQogI2luY2x1ZGUgInJlbG9jMS5oIgogI2luY2x1ZGUgPHN0ZGxpYi5oPgogCmRpZmYgLS1naXQg
YS90ZXN0c3VpdGUvZGVwczEuaCBiL3Rlc3RzdWl0ZS9kZXBzMS5oCmluZGV4IGQ1ODY4ZjcuLmIy
OTc3MDggMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9kZXBzMS5oCisrKyBiL3Rlc3RzdWl0ZS9kZXBz
MS5oCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogI2luY2x1ZGUgInJlbG9jMS5oIgogCiBleHRlcm4gaW50IGY4ICh2b2lkKTsKZGlmZiAt
LWdpdCBhL3Rlc3RzdWl0ZS9kZXBzMS5zaCBiL3Rlc3RzdWl0ZS9kZXBzMS5zaAppbmRleCBiNjFh
NDFkLi5lZTQ4NDA3IDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvZGVwczEuc2gKKysrIGIvdGVzdHN1
aXRlL2RlcHMxLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiAK
IFBSRUxJTks9YGVjaG8gJFBSRUxJTksgXApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2RlcHMxbGli
MS5jIGIvdGVzdHN1aXRlL2RlcHMxbGliMS5jCmluZGV4IGQ0YWIyOGIuLjRlZmMzYWMgMTAwNjQ0
Ci0tLSBhL3Rlc3RzdWl0ZS9kZXBzMWxpYjEuYworKysgYi90ZXN0c3VpdGUvZGVwczFsaWIxLmMK
QEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAjaW5jbHVkZSAiZGVwczEuaCIKIAogaW50IGJhciA9IDI2OwpkaWZmIC0tZ2l0IGEvdGVzdHN1
aXRlL2RlcHMxbGliMi5jIGIvdGVzdHN1aXRlL2RlcHMxbGliMi5jCmluZGV4IGY3M2I0NTYuLjcx
OWFkN2QgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9kZXBzMWxpYjIuYworKysgYi90ZXN0c3VpdGUv
ZGVwczFsaWIyLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAicmVsb2MxLmgiCiAKIGludCBmMSAodm9pZCkKZGlmZiAt
LWdpdCBhL3Rlc3RzdWl0ZS9kZXBzMi5zaCBiL3Rlc3RzdWl0ZS9kZXBzMi5zaAppbmRleCAwYmNj
MjFjLi43MjU1MWU1IDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvZGVwczIuc2gKKysrIGIvdGVzdHN1
aXRlL2RlcHMyLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiAK
IFBSRUxJTks9YGVjaG8gJFBSRUxJTksgXApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2RlcHMybGli
MS5jIGIvdGVzdHN1aXRlL2RlcHMybGliMS5jCmluZGV4IDlkNGIyZGUuLmFhMDVkNDQgMTAwNjQ0
Ci0tLSBhL3Rlc3RzdWl0ZS9kZXBzMmxpYjEuYworKysgYi90ZXN0c3VpdGUvZGVwczJsaWIxLmMK
QEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAjaW5jbHVkZSAiZGVwczEuaCIKIAogaW50IGJhciA9IDI2OwpkaWZmIC0tZ2l0IGEvdGVzdHN1
aXRlL2Z1bmN0aW9ucy5zaCBiL3Rlc3RzdWl0ZS9mdW5jdGlvbnMuc2gKaW5kZXggNWU5ODcyNS4u
YTEyNjAyOSAxMDA3NTUKLS0tIGEvdGVzdHN1aXRlL2Z1bmN0aW9ucy5zaAorKysgYi90ZXN0c3Vp
dGUvZnVuY3Rpb25zLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogQ0M9IiR7Q0M6LWdjY30gJHtMSU5LT1BUU30i
CiBDQ0xJTks9JHtDQ0xJTks6LSR7Q0N9IC1XbCwtLWR5bmFtaWMtbGlua2VyPWBlY2hvIC4vbGQq
LnNvLipbMC05XWB9CiBDWFg9IiR7Q1hYOi1nKyt9ICR7TElOS09QVFN9IgpkaWZmIC0tZ2l0IGEv
dGVzdHN1aXRlL2lmdW5jLmggYi90ZXN0c3VpdGUvaWZ1bmMuaAppbmRleCA3OGFkODZiLi41NzYy
ODM5IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvaWZ1bmMuaAorKysgYi90ZXN0c3VpdGUvaWZ1bmMu
aApAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKICNpZm5kZWYgUElDS05PCiAjIGRlZmluZSBQSUNLTk8gMQogI2VuZGlmCmRpZmYgLS1naXQg
YS90ZXN0c3VpdGUvaWZ1bmMxLmMgYi90ZXN0c3VpdGUvaWZ1bmMxLmMKaW5kZXggZjU1MDBkZi4u
NmQ1ZjdlMCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL2lmdW5jMS5jCisrKyBiL3Rlc3RzdWl0ZS9p
ZnVuYzEuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKICNpbmNsdWRlICJpZnVuYy5oIgogCiBzdGF0aWMgaW50IGJpbnQxMSAodm9pZCkg
eyByZXR1cm4gMTsgfQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2lmdW5jMS5zaCBiL3Rlc3RzdWl0
ZS9pZnVuYzEuc2gKaW5kZXggMTM1MDE0ZC4uMTFmMDI0MyAxMDA3NTUKLS0tIGEvdGVzdHN1aXRl
L2lmdW5jMS5zaAorKysgYi90ZXN0c3VpdGUvaWZ1bmMxLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEv
YmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGly
bmFtZSAkMGAvZnVuY3Rpb25zLnNoCiAjIEZpcnN0IGNoZWNrIGlmIF9fdGhyZWFkIGlzIHN1cHBv
cnRlZCBieSBsZC5zby9nY2MvbGQvYXM6CiAkQ0NMSU5LIC1vIGlmdW5jdGVzdCAkc3JjZGlyL2lm
dW5jdGVzdC5jIC1XbCwtLXJwYXRoLWxpbmssLiA+IC9kZXYvbnVsbCAyPiYxIHx8IGV4aXQgNzcK
ZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9pZnVuYzFsaWIxLmMgYi90ZXN0c3VpdGUvaWZ1bmMxbGli
MS5jCmluZGV4IDI3YTNmMDMuLjc5YmNiZTQgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9pZnVuYzFs
aWIxLmMKKysrIGIvdGVzdHN1aXRlL2lmdW5jMWxpYjEuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJpZnVuYy5oIgog
CiBzdGF0aWMgaW50IGxpYjF0MTEgKHZvaWQpIHsgcmV0dXJuIDExOyB9CmRpZmYgLS1naXQgYS90
ZXN0c3VpdGUvaWZ1bmMxbGliMi5jIGIvdGVzdHN1aXRlL2lmdW5jMWxpYjIuYwppbmRleCBjYTEy
ZTNkLi5mNjZjNzU0IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvaWZ1bmMxbGliMi5jCisrKyBiL3Rl
c3RzdWl0ZS9pZnVuYzFsaWIyLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAiaWZ1bmMuaCIKIAogc3RhdGljIGludCBs
aWIydDExICh2b2lkKSB7IHJldHVybiAxOyB9CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvaWZ1bmMy
LnNoIGIvdGVzdHN1aXRlL2lmdW5jMi5zaAppbmRleCAzOTY2ZTg2Li4yNzE3NTk1IDEwMDc1NQot
LS0gYS90ZXN0c3VpdGUvaWZ1bmMyLnNoCisrKyBiL3Rlc3RzdWl0ZS9pZnVuYzIuc2gKQEAgLTEs
NCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKICMgRmlyc3QgY2hlY2sgaWYgX190
aHJlYWQgaXMgc3VwcG9ydGVkIGJ5IGxkLnNvL2djYy9sZC9hczoKICRDQ0xJTksgLW8gaWZ1bmN0
ZXN0ICRzcmNkaXIvaWZ1bmN0ZXN0LmMgLVdsLC0tcnBhdGgtbGluaywuID4gL2Rldi9udWxsIDI+
JjEgfHwgZXhpdCA3NwpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2lmdW5jMy5jIGIvdGVzdHN1aXRl
L2lmdW5jMy5jCmluZGV4IDFmMjQzZDguLmRhYjkwYzUgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9p
ZnVuYzMuYworKysgYi90ZXN0c3VpdGUvaWZ1bmMzLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAiaWZ1bmMuaCIKIAog
c3RhdGljIGludCBiaW50MTEgKHZvaWQpIHsgcmV0dXJuIDE7IH0KZGlmZiAtLWdpdCBhL3Rlc3Rz
dWl0ZS9pZnVuYzMuc2ggYi90ZXN0c3VpdGUvaWZ1bmMzLnNoCmluZGV4IDMwZmM4OTMuLmM2ZThk
YzYgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9pZnVuYzMuc2gKKysrIGIvdGVzdHN1aXRlL2lmdW5j
My5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogIyBGaXJzdCBj
aGVjayBpZiBfX3RocmVhZCBpcyBzdXBwb3J0ZWQgYnkgbGQuc28vZ2NjL2xkL2FzOgogJENDTElO
SyAtbyBpZnVuY3Rlc3QgJHNyY2Rpci9pZnVuY3Rlc3QuYyAtV2wsLS1ycGF0aC1saW5rLC4gPiAv
ZGV2L251bGwgMj4mMSB8fCBleGl0IDc3CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvaWZ1bmMzbGli
MS5jIGIvdGVzdHN1aXRlL2lmdW5jM2xpYjEuYwppbmRleCAxMzNiMzg5Li44OGE3MDE5IDEwMDY0
NAotLS0gYS90ZXN0c3VpdGUvaWZ1bmMzbGliMS5jCisrKyBiL3Rlc3RzdWl0ZS9pZnVuYzNsaWIx
LmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiAjaW5jbHVkZSAiaWZ1bmMuaCIKIAogc3RhdGljIGludCBsaWIxdDExICh2b2lkKSB7IHJl
dHVybiAxMTsgfQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2lmdW5jdGVzdC5jIGIvdGVzdHN1aXRl
L2lmdW5jdGVzdC5jCmluZGV4IDljZTdiMWEuLjZiMTJlNDYgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0
ZS9pZnVuY3Rlc3QuYworKysgYi90ZXN0c3VpdGUvaWZ1bmN0ZXN0LmMKQEAgLTEsMyArMSw0IEBA
CisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAiaWZ1
bmMuaCIKIAogc3RhdGljIGludCBmb28xICh2b2lkKSB7IHJldHVybiAxOyB9CmRpZmYgLS1naXQg
YS90ZXN0c3VpdGUvbGF5b3V0LkMgYi90ZXN0c3VpdGUvbGF5b3V0LkMKaW5kZXggNTA0N2EzNC4u
ZWNjYmVlZSAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL2xheW91dC5DCisrKyBiL3Rlc3RzdWl0ZS9s
YXlvdXQuQwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKIGludCBtYWluKCkKIHsKIH0KZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9sYXlvdXQx
LnNoIGIvdGVzdHN1aXRlL2xheW91dDEuc2gKaW5kZXggZWU3NTFhYi4uNjNjMTg5MSAxMDA3NTUK
LS0tIGEvdGVzdHN1aXRlL2xheW91dDEuc2gKKysrIGIvdGVzdHN1aXRlL2xheW91dDEuc2gKQEAg
LTEsNCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKIHJtIC1mIHByZWxpbmsuY2Fj
aGUKIHJtIC1mIGxheW91dDEgbGF5b3V0bGliKi5zbyBsYXlvdXQxLmxvZwpkaWZmIC0tZ2l0IGEv
dGVzdHN1aXRlL2xheW91dDIuc2ggYi90ZXN0c3VpdGUvbGF5b3V0Mi5zaAppbmRleCA3ZDg1MDRi
Li41Mzc4YjBlIDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvbGF5b3V0Mi5zaAorKysgYi90ZXN0c3Vp
dGUvbGF5b3V0Mi5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAog
cm0gLWYgbGF5b3V0MiBsYXlvdXQybGliKi5zbyBsYXlvdXQyLmxvZwogaT0xCmRpZmYgLS1naXQg
YS90ZXN0c3VpdGUvbGF5b3V0bGliLkMgYi90ZXN0c3VpdGUvbGF5b3V0bGliLkMKaW5kZXggODE2
MjUxNS4uZDY5OTE1MiAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL2xheW91dGxpYi5DCisrKyBiL3Rl
c3RzdWl0ZS9sYXlvdXRsaWIuQwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKIHN0cnVjdCBBCiAgIHsKICAgICB2aXJ0dWFsIGludCBhKCk7
CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvbW92ZWxpYnMuc2ggYi90ZXN0c3VpdGUvbW92ZWxpYnMu
c2gKaW5kZXggNDM1N2VlOC4uMDY1NWRmNSAxMDA3NTUKLS0tIGEvdGVzdHN1aXRlL21vdmVsaWJz
LnNoCisrKyBiL3Rlc3RzdWl0ZS9tb3ZlbGlicy5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9i
YXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUg
JDBgL2Z1bmN0aW9ucy5zaAogIyBUaGlzIHNjcmlwdCBjb3BpZXMgbmVlZGVkIEMgYW5kIEMrKyBs
aWJyYXJpZXMgaW50byB0aGUgdGVzdCBkaXJlY3RvcnkKIGVjaG8gJ2ludCBtYWluKCkgeyB9JyA+
IG1vdmVsaWJzLkMKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9vcmRlci5jIGIvdGVzdHN1aXRlL29y
ZGVyLmMKaW5kZXggNWUwZWY0My4uMDhmZGY0MyAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL29yZGVy
LmMKKysrIGIvdGVzdHN1aXRlL29yZGVyLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSA8c3RkaW8uaD4KICNpbmNsdWRl
ICJvcmRlcmxpYjEuaCIKICNpbmNsdWRlICJvcmRlcmxpYi5oIgpkaWZmIC0tZ2l0IGEvdGVzdHN1
aXRlL29yZGVyLnNoIGIvdGVzdHN1aXRlL29yZGVyLnNoCmluZGV4IGNlMGRiZGEuLjQ3MjU3MzYg
MTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9vcmRlci5zaAorKysgYi90ZXN0c3VpdGUvb3JkZXIuc2gK
QEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKIHJtIC1mIG9yZGVyIG9y
ZGVybGliKi5zbyBvcmRlci5sb2cKIHJtIC1mIHByZWxpbmsuY2FjaGUKZGlmZiAtLWdpdCBhL3Rl
c3RzdWl0ZS9vcmRlcmxpYi5jIGIvdGVzdHN1aXRlL29yZGVybGliLmMKaW5kZXggMGE5N2UwYS4u
MjE3MWRlMiAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL29yZGVybGliLmMKKysrIGIvdGVzdHN1aXRl
L29yZGVybGliLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAib3JkZXJsaWIuaCIKICNpbmNsdWRlICJvcmRlcmxpYjEu
aCIKIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL29yZGVybGliLmggYi90ZXN0c3VpdGUvb3JkZXJs
aWIuaAppbmRleCBhNGYxZWIwLi5jZjY5M2Q1IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvb3JkZXJs
aWIuaAorKysgYi90ZXN0c3VpdGUvb3JkZXJsaWIuaApAQCAtMSwyICsxLDMgQEAKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGludCB2YWx1ZSh2b2lkKTsKIGludCB2
YWx1ZTEodm9pZCk7CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvb3JkZXJsaWIxLmMgYi90ZXN0c3Vp
dGUvb3JkZXJsaWIxLmMKaW5kZXggYmU0ZWJkYy4uNGE4NDYwZSAxMDA2NDQKLS0tIGEvdGVzdHN1
aXRlL29yZGVybGliMS5jCisrKyBiL3Rlc3RzdWl0ZS9vcmRlcmxpYjEuYwpAQCAtMSwzICsxLDQg
QEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJv
cmRlcmxpYi5oIgogCiBpbnQgdmFsdWUxKHZvaWQpCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvb3Jk
ZXJsaWIxLmggYi90ZXN0c3VpdGUvb3JkZXJsaWIxLmgKaW5kZXggNTc2M2EzNi4uMTI3NTBjYSAx
MDA2NDQKLS0tIGEvdGVzdHN1aXRlL29yZGVybGliMS5oCisrKyBiL3Rlc3RzdWl0ZS9vcmRlcmxp
YjEuaApAQCAtMSArMSwyIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiBpbnQgb3JkZXJsaWIxKHZvaWQpOwpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL29yZGVybGli
Mi5jIGIvdGVzdHN1aXRlL29yZGVybGliMi5jCmluZGV4IGQxOTA4ZWEuLmVjMTdlOTMgMTAwNjQ0
Ci0tLSBhL3Rlc3RzdWl0ZS9vcmRlcmxpYjIuYworKysgYi90ZXN0c3VpdGUvb3JkZXJsaWIyLmMK
QEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
CiAjaW5jbHVkZSAib3JkZXJsaWIuaCIKIAogaW50IHZhbHVlKHZvaWQpCmRpZmYgLS1naXQgYS90
ZXN0c3VpdGUvb3JkZXJsaWIzLmMgYi90ZXN0c3VpdGUvb3JkZXJsaWIzLmMKaW5kZXggZjBmZjhj
ZC4uMjg1ZjI5YiAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL29yZGVybGliMy5jCisrKyBiL3Rlc3Rz
dWl0ZS9vcmRlcmxpYjMuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJvcmRlcmxpYi5oIgogCiBpbnQgdmFsdWUodm9p
ZCkKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9wcmVsb2FkMS5jIGIvdGVzdHN1aXRlL3ByZWxvYWQx
LmMKaW5kZXggZDZlZTQ4OS4uODgwNTk1NiAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3ByZWxvYWQx
LmMKKysrIGIvdGVzdHN1aXRlL3ByZWxvYWQxLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSA8c3RkbGliLmg+CiAjaW5j
bHVkZSAicHJlbG9hZDEuaCIKIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3ByZWxvYWQxLmggYi90
ZXN0c3VpdGUvcHJlbG9hZDEuaAppbmRleCAxMzliZWUwLi5mODViZDNiIDEwMDY0NAotLS0gYS90
ZXN0c3VpdGUvcHJlbG9hZDEuaAorKysgYi90ZXN0c3VpdGUvcHJlbG9hZDEuaApAQCAtMSwyICsx
LDMgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGludCBmb28o
aW50IHgsIGludCB5KTsKIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3ByZWxvYWQxLnNoIGIvdGVz
dHN1aXRlL3ByZWxvYWQxLnNoCmluZGV4IDhlMWY0ZDAuLjJhYzMxMDUgMTAwNzU1Ci0tLSBhL3Rl
c3RzdWl0ZS9wcmVsb2FkMS5zaAorKysgYi90ZXN0c3VpdGUvcHJlbG9hZDEuc2gKQEAgLTEsNCAr
MSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKIGNoZWNrX29uZSgpIHsKICAgY250PTAK
ZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9wcmVsb2FkMWxpYjEuYyBiL3Rlc3RzdWl0ZS9wcmVsb2Fk
MWxpYjEuYwppbmRleCAwYzFmYTQzLi45YmU5N2ZkIDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvcHJl
bG9hZDFsaWIxLmMKKysrIGIvdGVzdHN1aXRlL3ByZWxvYWQxbGliMS5jCkBAIC0xLDMgKzEsNCBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgInBy
ZWxvYWQxLmgiCiAKIGludCBmb28oaW50IHgsIGludCB5KSB7CmRpZmYgLS1naXQgYS90ZXN0c3Vp
dGUvcHJlbG9hZDFsaWIyLmMgYi90ZXN0c3VpdGUvcHJlbG9hZDFsaWIyLmMKaW5kZXggN2FiNTBh
YS4uMTlkZTQ5MCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3ByZWxvYWQxbGliMi5jCisrKyBiL3Rl
c3RzdWl0ZS9wcmVsb2FkMWxpYjIuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJwcmVsb2FkMS5oIgogCiBpbnQgZm9v
KGludCB4LCBpbnQgeSkgewpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3F1aWNrMS5jIGIvdGVzdHN1
aXRlL3F1aWNrMS5jCmluZGV4IGRjOTg0NDEuLjVkNmM5ZWYgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0
ZS9xdWljazEuYworKysgYi90ZXN0c3VpdGUvcXVpY2sxLmMKQEAgLTEsMyArMSw0IEBACisvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAicmVsb2MxLmgi
CiAjaW5jbHVkZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9xdWljazEuc2gg
Yi90ZXN0c3VpdGUvcXVpY2sxLnNoCmluZGV4IDY5MWI5NDAuLjAxZDUxNzIgMTAwNzU1Ci0tLSBh
L3Rlc3RzdWl0ZS9xdWljazEuc2gKKysrIGIvdGVzdHN1aXRlL3F1aWNrMS5zaApAQCAtMSw0ICsx
LDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogY2hlY2tfb25lKCkgewogICBjbnQ9MApk
aWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3F1aWNrMWxpYjEuYyBiL3Rlc3RzdWl0ZS9xdWljazFsaWIx
LmMKaW5kZXggNDE3NjdjZS4uMGM2ZGViNyAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3F1aWNrMWxp
YjEuYworKysgYi90ZXN0c3VpdGUvcXVpY2sxbGliMS5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogaW50IHExICh2b2lkKQogewogICBy
ZXR1cm4gcTIgKCkgKyAxOwpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3F1aWNrMWxpYjIuYyBiL3Rl
c3RzdWl0ZS9xdWljazFsaWIyLmMKaW5kZXggYjU0NTA4Ni4uYmQ3MThmOCAxMDA2NDQKLS0tIGEv
dGVzdHN1aXRlL3F1aWNrMWxpYjIuYworKysgYi90ZXN0c3VpdGUvcXVpY2sxbGliMi5jCkBAIC0x
LDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogZXh0
ZXJuIGludCBxMSAodm9pZCk7CiAKIGludCBmMSAodm9pZCkKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0
ZS9xdWljazFsaWIzLmMgYi90ZXN0c3VpdGUvcXVpY2sxbGliMy5jCmluZGV4IDA2NzYwYTMuLjQw
ZGU4ZDYgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9xdWljazFsaWIzLmMKKysrIGIvdGVzdHN1aXRl
L3F1aWNrMWxpYjMuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKICNpZm5kZWYgRDEKICNkZWZpbmUgRDEobikgaW50IHF2YXIjI247IGlu
dCAqcXB2YXIjI24gPSAmcXZhciMjbjsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3F1
aWNrMWxpYjQuYyBiL3Rlc3RzdWl0ZS9xdWljazFsaWI0LmMKaW5kZXggNTNlMjNkNy4uN2EwZTE2
OCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3F1aWNrMWxpYjQuYworKysgYi90ZXN0c3VpdGUvcXVp
Y2sxbGliNC5jCkBAIC0xLDIgKzEsMyBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogI2RlZmluZSBEMShuKSBpbnQgcXZhciMjbjsKICNpbmNsdWRlICJxdWljazFs
aWIzLmMiCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcXVpY2syLnNoIGIvdGVzdHN1aXRlL3F1aWNr
Mi5zaAppbmRleCAwMzFhNDEwLi5hODI0OGRmIDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvcXVpY2sy
LnNoCisrKyBiL3Rlc3RzdWl0ZS9xdWljazIuc2gKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFz
aAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQw
YC9mdW5jdGlvbnMuc2gKIGNoZWNrX29uZSgpIHsKICAgY250PTAKZGlmZiAtLWdpdCBhL3Rlc3Rz
dWl0ZS9xdWljazMuc2ggYi90ZXN0c3VpdGUvcXVpY2szLnNoCmluZGV4IDFjZGI1MjMuLmY4NmQ1
ODIgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9xdWljazMuc2gKKysrIGIvdGVzdHN1aXRlL3F1aWNr
My5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogY2hlY2tfb25l
KCkgewogICBjbnQ9MApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3JlbG9jMS5jIGIvdGVzdHN1aXRl
L3JlbG9jMS5jCmluZGV4IGU2NzliZWQuLmU3OTlmMWYgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9y
ZWxvYzEuYworKysgYi90ZXN0c3VpdGUvcmVsb2MxLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAicmVsb2MxLmgiCiAj
aW5jbHVkZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzEuaCBiL3Rl
c3RzdWl0ZS9yZWxvYzEuaAppbmRleCAwOTNkZDNhLi4xMjg3MDgwIDEwMDY0NAotLS0gYS90ZXN0
c3VpdGUvcmVsb2MxLmgKKysrIGIvdGVzdHN1aXRlL3JlbG9jMS5oCkBAIC0xLDMgKzEsNCBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogc3RydWN0IEEKICAgewog
ICAgIGNoYXIgYTsKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzEuc2ggYi90ZXN0c3VpdGUv
cmVsb2MxLnNoCmluZGV4IDU2MTZkNGUuLmE4OTE2M2MgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9y
ZWxvYzEuc2gKKysrIGIvdGVzdHN1aXRlL3JlbG9jMS5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jp
bi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5h
bWUgJDBgL2Z1bmN0aW9ucy5zaAogcm0gLWYgcmVsb2MxIHJlbG9jMWxpYiouc28gcmVsb2MxLmxv
Zwogcm0gLWYgcHJlbGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3JlbG9jMTAuYyBi
L3Rlc3RzdWl0ZS9yZWxvYzEwLmMKaW5kZXggNTcyMGQzMy4uNTQxOGEzNSAxMDA2NDQKLS0tIGEv
dGVzdHN1aXRlL3JlbG9jMTAuYworKysgYi90ZXN0c3VpdGUvcmVsb2MxMC5jCkBAIC0xLDMgKzEs
NCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUg
PHN0ZGxpYi5oPgogCiBleHRlcm4gaW50IGJhciwgYmF6LCAqYmFycCwgKmJhenAsIGR1bW15Owpk
aWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3JlbG9jMTAuc2ggYi90ZXN0c3VpdGUvcmVsb2MxMC5zaApp
bmRleCAwMzAzNGMxLi5mOWRlYjRhIDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvcmVsb2MxMC5zaAor
KysgYi90ZXN0c3VpdGUvcmVsb2MxMC5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1
bmN0aW9ucy5zaAogcm0gLWYgcmVsb2MxMCByZWxvYzEwbGliKi5zbyByZWxvYzEwLmxvZwogcm0g
LWYgcHJlbGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3JlbG9jMTBsaWIxLmMgYi90
ZXN0c3VpdGUvcmVsb2MxMGxpYjEuYwppbmRleCAyZWUwNmQyLi5mMjI5YmNmIDEwMDY0NAotLS0g
YS90ZXN0c3VpdGUvcmVsb2MxMGxpYjEuYworKysgYi90ZXN0c3VpdGUvcmVsb2MxMGxpYjEuYwpA
QCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkK
IGludCBiYXIgPSAyNjsKIGludCBiYXogPSAyODsKIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3Jl
bG9jMTBsaWIyLmMgYi90ZXN0c3VpdGUvcmVsb2MxMGxpYjIuYwppbmRleCBmYzMyN2ZjLi4xZTM0
YWFiIDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvcmVsb2MxMGxpYjIuYworKysgYi90ZXN0c3VpdGUv
cmVsb2MxMGxpYjIuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKIGV4dGVybiBpbnQgYmFyLCBiYXosIGYxICh2b2lkKSwgZjIgKHZvaWQp
OwogCiBpbnQgZjMgKHZvaWQpCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2MxMGxpYjMuYyBi
L3Rlc3RzdWl0ZS9yZWxvYzEwbGliMy5jCmluZGV4IDJlYzgwYWIuLjRkYjNiMDMgMTAwNjQ0Ci0t
LSBhL3Rlc3RzdWl0ZS9yZWxvYzEwbGliMy5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzEwbGliMy5j
CkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eQogZXh0ZXJuIGludCBiYXIsIGJheiwgZjEgKHZvaWQpLCBmMiAodm9pZCk7CiAKIGludCAqYmFy
cCA9ICZiYXIsICpiYXpwID0gJmJhejsKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzEwbGli
NC5jIGIvdGVzdHN1aXRlL3JlbG9jMTBsaWI0LmMKaW5kZXggNDM3NjI0OS4uZGM3YzBjNiAxMDA2
NDQKLS0tIGEvdGVzdHN1aXRlL3JlbG9jMTBsaWI0LmMKKysrIGIvdGVzdHN1aXRlL3JlbG9jMTBs
aWI0LmMKQEAgLTEgKzEsMiBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogaW50IGR1bW15ID0gMjQ7CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2MxMGxpYjUu
YyBiL3Rlc3RzdWl0ZS9yZWxvYzEwbGliNS5jCmluZGV4IDE5ZmQ5MjUuLjA5ODZhNGEgMTAwNjQ0
Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzEwbGliNS5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzEwbGli
NS5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seQogaW50IGJhciA9IDM2OwogaW50IGJheiA9IDM4OwogCmRpZmYgLS1naXQgYS90ZXN0c3Vp
dGUvcmVsb2MxMS5jIGIvdGVzdHN1aXRlL3JlbG9jMTEuYwppbmRleCA5MjNhZmY0Li4yOGZmMTE5
IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvcmVsb2MxMS5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzEx
LmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CiAjaW5jbHVkZSA8c3RkbGliLmg+CiAKIGV4dGVybiBpbnQgZHVtbXk7CmRpZmYgLS1naXQg
YS90ZXN0c3VpdGUvcmVsb2MxMS5zaCBiL3Rlc3RzdWl0ZS9yZWxvYzExLnNoCmluZGV4IGZhMGVh
YjkuLmRiZmU2ZjggMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzExLnNoCisrKyBiL3Rlc3Rz
dWl0ZS9yZWxvYzExLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNo
CiBybSAtZiByZWxvYzExIHJlbG9jMTFsaWIqLnNvIHJlbG9jMTEubG9nCiBybSAtZiBwcmVsaW5r
LmNhY2hlCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2MxMWxpYjIuYyBiL3Rlc3RzdWl0ZS9y
ZWxvYzExbGliMi5jCmluZGV4IDZhMjE5MWMuLjdmMmUyNGYgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0
ZS9yZWxvYzExbGliMi5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzExbGliMi5jCkBAIC0xLDMgKzEs
NCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogaW50IHZhciA9
IDI0LCB2YXIyID0gMTY7CiAKIGludCB2YXJwMSAodm9pZCkKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0
ZS9yZWxvYzExbGliMy5jIGIvdGVzdHN1aXRlL3JlbG9jMTFsaWIzLmMKaW5kZXggMGNlYTdmMy4u
MDY5MzMwNCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3JlbG9jMTFsaWIzLmMKKysrIGIvdGVzdHN1
aXRlL3JlbG9jMTFsaWIzLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5CiBpbnQgdmFyID0gMzI7CiBleHRlcm4gaW50IHZhcjI7CiAKZGlm
ZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzEyLmMgYi90ZXN0c3VpdGUvcmVsb2MxMi5jCmluZGV4
IGNmYTg4ODguLjcxZGNlNDkgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzEyLmMKKysrIGIv
dGVzdHN1aXRlL3JlbG9jMTIuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJyZWxvYzEyLmgiCiAjaW5jbHVkZSA8c3Rk
bGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzEyLmggYi90ZXN0c3VpdGUvcmVs
b2MxMi5oCmluZGV4IDhlMDk0MDUuLmI3ZmUyN2IgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxv
YzEyLmgKKysrIGIvdGVzdHN1aXRlL3JlbG9jMTIuaApAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIHR5cGVkZWYgc3RydWN0CiAgIHsKICAg
ICBjaGFyIGE7CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2MxMi5zaCBiL3Rlc3RzdWl0ZS9y
ZWxvYzEyLnNoCmluZGV4IDc0ZDFmYTguLmU2NWRjZDIgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9y
ZWxvYzEyLnNoCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzEyLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEv
YmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGly
bmFtZSAkMGAvZnVuY3Rpb25zLnNoCiBybSAtZiByZWxvYzEyIHJlbG9jMTJsaWIqLnNvIHJlbG9j
MTIubG9nCiBybSAtZiBwcmVsaW5rLmNhY2hlCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2Mx
MmxpYjEuYyBiL3Rlc3RzdWl0ZS9yZWxvYzEybGliMS5jCmluZGV4IGRiN2U2NGYuLjRlZTlkMzkg
MTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzEybGliMS5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxv
YzEybGliMS5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogI2luY2x1ZGUgInJlbG9jMTIuaCIKIAogY2hhciBhKGNvbnN0IEEgKmQpCmRp
ZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2MxMmxpYjIuYyBiL3Rlc3RzdWl0ZS9yZWxvYzEybGli
Mi5jCmluZGV4IGZmYTYwYTAuLmNiZTA2Y2IgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzEy
bGliMi5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzEybGliMi5jCkBAIC0xLDMgKzEsNCBAQAorLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgInJlbG9jMTIu
aCIKIAogQSBmb29bXSA9IHsKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzFsaWIxLmMgYi90
ZXN0c3VpdGUvcmVsb2MxbGliMS5jCmluZGV4IDhhYTA2MjguLmFjNWU5MmIgMTAwNjQ0Ci0tLSBh
L3Rlc3RzdWl0ZS9yZWxvYzFsaWIxLmMKKysrIGIvdGVzdHN1aXRlL3JlbG9jMWxpYjEuYwpAQCAt
MSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNp
bmNsdWRlICJyZWxvYzEuaCIKIAogaW50IGJhciA9IDI2OwpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRl
L3JlbG9jMWxpYjIuYyBiL3Rlc3RzdWl0ZS9yZWxvYzFsaWIyLmMKaW5kZXggYTMzOGMxZC4uNjE5
Yzg3OCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3JlbG9jMWxpYjIuYworKysgYi90ZXN0c3VpdGUv
cmVsb2MxbGliMi5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQogI2luY2x1ZGUgInJlbG9jMS5oIgogCiBpbnQgZjEgKHZvaWQpCmRpZmYg
LS1naXQgYS90ZXN0c3VpdGUvcmVsb2MyLmMgYi90ZXN0c3VpdGUvcmVsb2MyLmMKaW5kZXggNmM3
ZmVkNS4uOTdkMDQ4NSAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3JlbG9jMi5jCisrKyBiL3Rlc3Rz
dWl0ZS9yZWxvYzIuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlIDxzdGRsaWIuaD4KIAogZXh0ZXJuIGludCBmMiAoaW50
IGFkZCk7CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2MyLnNoIGIvdGVzdHN1aXRlL3JlbG9j
Mi5zaAppbmRleCA0MmJiNjNmLi5mNDk1ZjY0IDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvcmVsb2My
LnNoCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzIuc2gKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFz
aAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQw
YC9mdW5jdGlvbnMuc2gKIFNIRkxBR1M9CiBjYXNlICJgdW5hbWUgLW1gIiBpbgpkaWZmIC0tZ2l0
IGEvdGVzdHN1aXRlL3JlbG9jMmxpYjEuYyBiL3Rlc3RzdWl0ZS9yZWxvYzJsaWIxLmMKaW5kZXgg
MzU1MTcwNC4uNmUyMzRhNCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3JlbG9jMmxpYjEuYworKysg
Yi90ZXN0c3VpdGUvcmVsb2MybGliMS5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogaW50IGYxIChpbnQgZHVtbXkpCiB7CiAgIHJldHVy
biAxOwpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3JlbG9jMmxpYjIuYyBiL3Rlc3RzdWl0ZS9yZWxv
YzJsaWIyLmMKaW5kZXggMDk0ZGFhZC4uZDNmODUxMCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3Jl
bG9jMmxpYjIuYworKysgYi90ZXN0c3VpdGUvcmVsb2MybGliMi5jCkBAIC0xLDMgKzEsNCBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogZXh0ZXJuIGludCBmMSAo
aW50IGR1bW15KTsKIAogaW50IGYyIChpbnQgYWRkKQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3Jl
bG9jMy5jIGIvdGVzdHN1aXRlL3JlbG9jMy5jCmluZGV4IDJmNDU1ZDcuLjg1NTVkODAgMTAwNjQ0
Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzMuYworKysgYi90ZXN0c3VpdGUvcmVsb2MzLmMKQEAgLTEs
MyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5j
bHVkZSAicmVsb2MxLmgiCiAjaW5jbHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8c3RkaW8uaD4K
ZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzMuc2ggYi90ZXN0c3VpdGUvcmVsb2MzLnNoCmlu
ZGV4IDU5NDE3OTguLmQzYzI1ZDMgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzMuc2gKKysr
IGIvdGVzdHN1aXRlL3JlbG9jMy5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0
aW9ucy5zaAogcm0gLWYgcmVsb2MzIHJlbG9jM2xpYiouc28gcmVsb2MzLmxvZwogcm0gLWYgcHJl
bGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3JlbG9jM2xpYjEuYyBiL3Rlc3RzdWl0
ZS9yZWxvYzNsaWIxLmMKaW5kZXggZmQ2NDljNi4uZGY0MzMwYSAxMDA2NDQKLS0tIGEvdGVzdHN1
aXRlL3JlbG9jM2xpYjEuYworKysgYi90ZXN0c3VpdGUvcmVsb2MzbGliMS5jCkBAIC0xLDMgKzEs
NCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUg
InJlbG9jMS5oIgogCiBpbnQgYmF6WzNdID0geyAyOCwgMjksIDMwIH07CmRpZmYgLS1naXQgYS90
ZXN0c3VpdGUvcmVsb2M0LmMgYi90ZXN0c3VpdGUvcmVsb2M0LmMKaW5kZXggY2IzYjE3YS4uZTk1
NjBkMCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3JlbG9jNC5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxv
YzQuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKICNpbmNsdWRlIDxzdGRpby5oPgogCiBpbnQgbWFpbiAodm9pZCkKZGlmZiAtLWdpdCBh
L3Rlc3RzdWl0ZS9yZWxvYzQuc2ggYi90ZXN0c3VpdGUvcmVsb2M0LnNoCmluZGV4IDk5MmMzM2Eu
LmZiZWEyYjggMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzQuc2gKKysrIGIvdGVzdHN1aXRl
L3JlbG9jNC5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogIyBU
aGlzIHRlc3QgdGFrZXMgYSBsb3Qgb2YgdGltZSwgc28gc2tpcCBpdCBub3JtYWxseQogWyAteiAi
JENIRUNLX01FX0hBUkRFUiIgXSAmJiBleGl0IDc3CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVs
b2M0bGliMS5jIGIvdGVzdHN1aXRlL3JlbG9jNGxpYjEuYwppbmRleCBmMTI5N2Q4Li44NTgzYmFk
IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvcmVsb2M0bGliMS5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxv
YzRsaWIxLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAjaW5jbHVkZSA8c3RkaW8uaD4KIAogaW50IG1haW4gKHZvaWQpCmRpZmYgLS1n
aXQgYS90ZXN0c3VpdGUvcmVsb2M0bGliMi5jIGIvdGVzdHN1aXRlL3JlbG9jNGxpYjIuYwppbmRl
eCAwN2FhNzIxLi44MDE0YTEyIDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvcmVsb2M0bGliMi5jCisr
KyBiL3Rlc3RzdWl0ZS9yZWxvYzRsaWIyLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSA8c3RkaW8uaD4KIAogaW50IG1h
aW4gKHZvaWQpCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2M0bGliMy5jIGIvdGVzdHN1aXRl
L3JlbG9jNGxpYjMuYwppbmRleCAxZjMwODE3Li42MTVlYjk5IDEwMDY0NAotLS0gYS90ZXN0c3Vp
dGUvcmVsb2M0bGliMy5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzRsaWIzLmMKQEAgLTEsMyArMSw0
IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSA8
c3RkaW8uaD4KIAogaW50IG1haW4gKHZvaWQpCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2M1
LmMgYi90ZXN0c3VpdGUvcmVsb2M1LmMKaW5kZXggMTIzYWQ1ZC4uYTljNmI5NyAxMDA2NDQKLS0t
IGEvdGVzdHN1aXRlL3JlbG9jNS5jCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzUuYwpAQCAtMSwzICsx
LDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRl
IDxzdGRpby5oPgogCiBpbnQgbWFpbiAodm9pZCkKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxv
YzUuc2ggYi90ZXN0c3VpdGUvcmVsb2M1LnNoCmluZGV4IGIxN2NiZmYuLjlmZTVlZmIgMTAwNzU1
Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzUuc2gKKysrIGIvdGVzdHN1aXRlL3JlbG9jNS5zaApAQCAt
MSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogIyBUaGlzIHRlc3QgdGFrZXMg
YSBsb3Qgb2YgdGltZSwgc28gc2tpcCBpdCBub3JtYWxseQogWyAteiAiJENIRUNLX01FX0hBUkRF
UiIgXSAmJiBleGl0IDc3CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVsb2M2LnNoIGIvdGVzdHN1
aXRlL3JlbG9jNi5zaAppbmRleCBmMmE1YjE3Li41MDE1YzFlIDEwMDc1NQotLS0gYS90ZXN0c3Vp
dGUvcmVsb2M2LnNoCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzYuc2gKQEAgLTEsNCArMSw1IEBACiAj
IS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBk
aXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKIHJtIC1mIHJlbG9jNiByZWxvYzZsaWIqLnNvIHJlbG9j
Ni5sb2cKIHJtIC1mIHByZWxpbmsuY2FjaGUKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzcu
YyBiL3Rlc3RzdWl0ZS9yZWxvYzcuYwppbmRleCBjMWY2ZGM4Li5jNGM4YTUzIDEwMDY0NAotLS0g
YS90ZXN0c3VpdGUvcmVsb2M3LmMKKysrIGIvdGVzdHN1aXRlL3JlbG9jNy5jCkBAIC0xLDMgKzEs
NCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUg
InJlbG9jMS5oIgogI2luY2x1ZGUgPHN0ZGxpYi5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+CmRpZmYg
LS1naXQgYS90ZXN0c3VpdGUvcmVsb2M3LnNoIGIvdGVzdHN1aXRlL3JlbG9jNy5zaAppbmRleCBj
N2RhYjk5Li4zYjBkNDJiIDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvcmVsb2M3LnNoCisrKyBiL3Rl
c3RzdWl0ZS9yZWxvYzcuc2gKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMu
c2gKIHJtIC1mIHJlbG9jNyByZWxvYzdsaWIqLnNvIHJlbG9jNy5sb2cKIHJtIC1mIHByZWxpbmsu
Y2FjaGUKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9yZWxvYzguc2ggYi90ZXN0c3VpdGUvcmVsb2M4
LnNoCmluZGV4IDA1MTk1Y2YuLjE3OWY0MTEgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9yZWxvYzgu
c2gKKysrIGIvdGVzdHN1aXRlL3JlbG9jOC5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNo
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBg
L2Z1bmN0aW9ucy5zaAogIyBEaXNhYmxlIHRoaXMgdGVzdCB1bmRlciBTRUxpbnV4CiBpZiB0ZXN0
IC14IC91c3Ivc2Jpbi9nZXRlbmZvcmNlOyB0aGVuCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvcmVs
b2M5LnNoIGIvdGVzdHN1aXRlL3JlbG9jOS5zaAppbmRleCBlNWVjMjkyLi5hMTg3ZmNiIDEwMDc1
NQotLS0gYS90ZXN0c3VpdGUvcmVsb2M5LnNoCisrKyBiL3Rlc3RzdWl0ZS9yZWxvYzkuc2gKQEAg
LTEsNCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKICMgRGlzYWJsZSB0aGlzIHRl
c3QgdW5kZXIgU0VMaW51eAogaWYgdGVzdCAteCAvdXNyL3NiaW4vZ2V0ZW5mb3JjZTsgdGhlbgpk
aWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3NodWZmbGUxLnNoIGIvdGVzdHN1aXRlL3NodWZmbGUxLnNo
CmluZGV4IDYxZTU5NmYuLjQ5NzE4NTQgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9zaHVmZmxlMS5z
aAorKysgYi90ZXN0c3VpdGUvc2h1ZmZsZTEuc2gKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFz
aAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQw
YC9mdW5jdGlvbnMuc2gKIHJtIC1mIHNodWZmbGUxIHNodWZmbGUxbGliKi5zbyBzaHVmZmxlMS5s
b2cgc2h1ZmZsZTEubGRzCiBybSAtZiBwcmVsaW5rLmNhY2hlCmRpZmYgLS1naXQgYS90ZXN0c3Vp
dGUvc2h1ZmZsZTIuYyBiL3Rlc3RzdWl0ZS9zaHVmZmxlMi5jCmluZGV4IDhjMDY5NDIuLjhlY2Yx
NjggMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9zaHVmZmxlMi5jCisrKyBiL3Rlc3RzdWl0ZS9zaHVm
ZmxlMi5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQogI2luY2x1ZGUgInJlbG9jMS5oIgogI2luY2x1ZGUgPHN0ZGxpYi5oPgogCmRpZmYg
LS1naXQgYS90ZXN0c3VpdGUvc2h1ZmZsZTIuc2ggYi90ZXN0c3VpdGUvc2h1ZmZsZTIuc2gKaW5k
ZXggOTUzY2VhMy4uM2Q3ZjdhZSAxMDA3NTUKLS0tIGEvdGVzdHN1aXRlL3NodWZmbGUyLnNoCisr
KyBiL3Rlc3RzdWl0ZS9zaHVmZmxlMi5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1
bmN0aW9ucy5zaAogIyBLZXJuZWxzIGJlZm9yZSAyLjQuMTAgYXJlIGtub3duIG5vdCB0byB3b3Jr
CiBjYXNlICJgdW5hbWUgLXJgIiBpbgpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3NodWZmbGUzLnNo
IGIvdGVzdHN1aXRlL3NodWZmbGUzLnNoCmluZGV4IDUzNGQxNzQuLjQxM2YzZDkgMTAwNzU1Ci0t
LSBhL3Rlc3RzdWl0ZS9zaHVmZmxlMy5zaAorKysgYi90ZXN0c3VpdGUvc2h1ZmZsZTMuc2gKQEAg
LTEsNCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKICMgS2VybmVscyBiZWZvcmUg
Mi40LjEwIGFyZSBrbm93biBub3QgdG8gd29yawogY2FzZSAiYHVuYW1lIC1yYCIgaW4KZGlmZiAt
LWdpdCBhL3Rlc3RzdWl0ZS9zaHVmZmxlNC5zaCBiL3Rlc3RzdWl0ZS9zaHVmZmxlNC5zaAppbmRl
eCAzOTg5NzJhLi5kYTI2NjRkIDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvc2h1ZmZsZTQuc2gKKysr
IGIvdGVzdHN1aXRlL3NodWZmbGU0LnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVu
Y3Rpb25zLnNoCiAjIEtlcm5lbHMgYmVmb3JlIDIuNC4xMCBhcmUga25vd24gbm90IHRvIHdvcmsK
IGNhc2UgImB1bmFtZSAtcmAiIGluCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvc2h1ZmZsZTUuc2gg
Yi90ZXN0c3VpdGUvc2h1ZmZsZTUuc2gKaW5kZXggZThjMDI5Ny4uOTU0M2FhMCAxMDA3NTUKLS0t
IGEvdGVzdHN1aXRlL3NodWZmbGU1LnNoCisrKyBiL3Rlc3RzdWl0ZS9zaHVmZmxlNS5zaApAQCAt
MSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogcm0gLWYgc2h1ZmZsZTUgc2h1
ZmZsZTVsaWIqLnNvIHNodWZmbGU1LmxvZyBzaHVmZmxlNS5sZHMKIHJtIC1mIHByZWxpbmsuY2Fj
aGUKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9zaHVmZmxlNi5zaCBiL3Rlc3RzdWl0ZS9zaHVmZmxl
Ni5zaAppbmRleCBjZGQxNmEwLi4wYzQ0NDJlIDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvc2h1ZmZs
ZTYuc2gKKysrIGIvdGVzdHN1aXRlL3NodWZmbGU2LnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmlu
L2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFt
ZSAkMGAvZnVuY3Rpb25zLnNoCiBybSAtZiBzaHVmZmxlNiBzaHVmZmxlNmxpYiouc28gc2h1ZmZs
ZTYubG9nIHNodWZmbGU2Lmxkcwogcm0gLWYgcHJlbGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVz
dHN1aXRlL3NodWZmbGU2bGliMS5jIGIvdGVzdHN1aXRlL3NodWZmbGU2bGliMS5jCmluZGV4IDgw
NTMyOTMuLjJlNzVhODcgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS9zaHVmZmxlNmxpYjEuYworKysg
Yi90ZXN0c3VpdGUvc2h1ZmZsZTZsaWIxLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAicmVsb2MxLmgiCiAKIGludCBi
YXIgPSAyNjsKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9zaHVmZmxlNmxpYjIuYyBiL3Rlc3RzdWl0
ZS9zaHVmZmxlNmxpYjIuYwppbmRleCBlZDE4ZjZiLi4yMGRkZjU0IDEwMDY0NAotLS0gYS90ZXN0
c3VpdGUvc2h1ZmZsZTZsaWIyLmMKKysrIGIvdGVzdHN1aXRlL3NodWZmbGU2bGliMi5jCkBAIC0x
LDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2lu
Y2x1ZGUgInJlbG9jMS5oIgogI2luY2x1ZGUgPHN0ZGxpYi5oPgogCmRpZmYgLS1naXQgYS90ZXN0
c3VpdGUvc2h1ZmZsZTcuc2ggYi90ZXN0c3VpdGUvc2h1ZmZsZTcuc2gKaW5kZXggNDI1MGIyNi4u
NjQzMzJkMCAxMDA3NTUKLS0tIGEvdGVzdHN1aXRlL3NodWZmbGU3LnNoCisrKyBiL3Rlc3RzdWl0
ZS9zaHVmZmxlNy5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAog
cm0gLWYgc2h1ZmZsZTcgc2h1ZmZsZTdsaWIqLnNvIHNodWZmbGU3LmxvZyBzaHVmZmxlNy5sZHMK
IHJtIC1mIHByZWxpbmsuY2FjaGUKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9zaHVmZmxlOC5jIGIv
dGVzdHN1aXRlL3NodWZmbGU4LmMKaW5kZXggNGU4MDE4NC4uZWVlZTQ5MCAxMDA2NDQKLS0tIGEv
dGVzdHN1aXRlL3NodWZmbGU4LmMKKysrIGIvdGVzdHN1aXRlL3NodWZmbGU4LmMKQEAgLTEsMyAr
MSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVk
ZSAicmVsb2MxLmgiCiAjaW5jbHVkZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0
ZS9zaHVmZmxlOC5zaCBiL3Rlc3RzdWl0ZS9zaHVmZmxlOC5zaAppbmRleCA3ODc1NjczLi44ZTk5
YjA0IDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvc2h1ZmZsZTguc2gKKysrIGIvdGVzdHN1aXRlL3No
dWZmbGU4LnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiBybSAt
ZiBzaHVmZmxlOCBzaHVmZmxlOGxpYiouc28gc2h1ZmZsZTgubG9nIHNodWZmbGU4Lmxkcwogcm0g
LWYgcHJlbGluay5jYWNoZQpkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3NodWZmbGU5LmMgYi90ZXN0
c3VpdGUvc2h1ZmZsZTkuYwppbmRleCAyMDFlYWJjLi41YzlhOTEzIDEwMDY0NAotLS0gYS90ZXN0
c3VpdGUvc2h1ZmZsZTkuYworKysgYi90ZXN0c3VpdGUvc2h1ZmZsZTkuYwpAQCAtMSwzICsxLDQg
QEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJy
ZWxvYzEuaCIKICNpbmNsdWRlIDxzdGRsaWIuaD4KIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3No
dWZmbGU5LnNoIGIvdGVzdHN1aXRlL3NodWZmbGU5LnNoCmluZGV4IGM5NzQ3MDguLjUwNzlhY2Ig
MTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS9zaHVmZmxlOS5zaAorKysgYi90ZXN0c3VpdGUvc2h1ZmZs
ZTkuc2gKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKICMgS2VybmVs
cyBiZWZvcmUgMi40LjEwIGFyZSBrbm93biBub3QgdG8gd29yawogY2FzZSAiYHVuYW1lIC1yYCIg
aW4KZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHMxLmMgYi90ZXN0c3VpdGUvdGxzMS5jCmluZGV4
IDA4YmQyNmYuLmRiODdiZjkgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS90bHMxLmMKKysrIGIvdGVz
dHN1aXRlL3RsczEuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJ0bHMxLmgiCiAjaW5jbHVkZSA8c3RkbGliLmg+CiAK
ZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHMxLmggYi90ZXN0c3VpdGUvdGxzMS5oCmluZGV4IGQ2
MjczNDAuLmI1NTBjZjYgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS90bHMxLmgKKysrIGIvdGVzdHN1
aXRlL3RsczEuaApAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkKIHN0cnVjdCBBCiAgIHsKICAgICBjaGFyIGE7CmRpZmYgLS1naXQgYS90ZXN0
c3VpdGUvdGxzMS5zaCBiL3Rlc3RzdWl0ZS90bHMxLnNoCmluZGV4IDU4NWQxNzkuLjQ1NzFmYTQg
MTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS90bHMxLnNoCisrKyBiL3Rlc3RzdWl0ZS90bHMxLnNoCkBA
IC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiAjIEZpcnN0IGNoZWNrIGlm
IF9fdGhyZWFkIGlzIHN1cHBvcnRlZCBieSBsZC5zby9nY2MvbGQvYXM6CiBybSAtZiB0bHN0ZXN0
CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdGxzMWxpYjEuYyBiL3Rlc3RzdWl0ZS90bHMxbGliMS5j
CmluZGV4IGViMDczNGIuLjZmYTFkMDcgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS90bHMxbGliMS5j
CisrKyBiL3Rlc3RzdWl0ZS90bHMxbGliMS5jCkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgInRsczEuaCIKICNpbmNsdWRl
IDxzdGRsaWIuaD4KIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3RsczFsaWIyLmMgYi90ZXN0c3Vp
dGUvdGxzMWxpYjIuYwppbmRleCBlZWUwM2E5Li5jOGQzMDlhIDEwMDY0NAotLS0gYS90ZXN0c3Vp
dGUvdGxzMWxpYjIuYworKysgYi90ZXN0c3VpdGUvdGxzMWxpYjIuYwpAQCAtMSwzICsxLDQgQEAK
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJ0bHMx
LmgiCiAjaW5jbHVkZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHMyLmMg
Yi90ZXN0c3VpdGUvdGxzMi5jCmluZGV4IDEyNDYxNjUuLmE4NzU2ZTIgMTAwNjQ0Ci0tLSBhL3Rl
c3RzdWl0ZS90bHMyLmMKKysrIGIvdGVzdHN1aXRlL3RsczIuYwpAQCAtMSwzICsxLDQgQEAKKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJ0bHMxLmgi
CiAjaW5jbHVkZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHMyLnNoIGIv
dGVzdHN1aXRlL3RsczIuc2gKaW5kZXggNjkxMGMxNi4uMjM4ZjA3YiAxMDA3NTUKLS0tIGEvdGVz
dHN1aXRlL3RsczIuc2gKKysrIGIvdGVzdHN1aXRlL3RsczIuc2gKQEAgLTEsNCArMSw1IEBACiAj
IS9iaW4vYmFzaAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBk
aXJuYW1lICQwYC9mdW5jdGlvbnMuc2gKICMgRmlyc3QgY2hlY2sgaWYgX190aHJlYWQgaXMgc3Vw
cG9ydGVkIGJ5IGxkLnNvL2djYy9sZC9hczoKIHJtIC1mIHRsc3Rlc3QKZGlmZiAtLWdpdCBhL3Rl
c3RzdWl0ZS90bHMybGliMS5jIGIvdGVzdHN1aXRlL3RsczJsaWIxLmMKaW5kZXggMjRiNzU1NS4u
ZGYzYzY1NyAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3RsczJsaWIxLmMKKysrIGIvdGVzdHN1aXRl
L3RsczJsaWIxLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAidGxzMS5oIgogI2luY2x1ZGUgPHN0ZGxpYi5oPgogCmRp
ZmYgLS1naXQgYS90ZXN0c3VpdGUvdGxzMy5zaCBiL3Rlc3RzdWl0ZS90bHMzLnNoCmluZGV4IDk1
MWVlNTUuLmY5YjNlZGYgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS90bHMzLnNoCisrKyBiL3Rlc3Rz
dWl0ZS90bHMzLnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiAj
IEZpcnN0IGNoZWNrIGlmIF9fdGhyZWFkIGlzIHN1cHBvcnRlZCBieSBsZC5zby9nY2MvbGQvYXM6
CiBybSAtZiB0bHN0ZXN0CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdGxzM2xpYjIuYyBiL3Rlc3Rz
dWl0ZS90bHMzbGliMi5jCmluZGV4IGJhNDg1ZDMuLjVlNTBlODYgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
dWl0ZS90bHMzbGliMi5jCisrKyBiL3Rlc3RzdWl0ZS90bHMzbGliMi5jCkBAIC0xLDMgKzEsNCBA
QAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgInRs
czEuaCIKICNpbmNsdWRlIDxzdGRsaWIuaD4KIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3RsczQu
YyBiL3Rlc3RzdWl0ZS90bHM0LmMKaW5kZXggMDg4MmYwNy4uMGU0Y2VkMSAxMDA2NDQKLS0tIGEv
dGVzdHN1aXRlL3RsczQuYworKysgYi90ZXN0c3VpdGUvdGxzNC5jCkBAIC0xLDMgKzEsNCBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogI2luY2x1ZGUgInRsczEu
aCIKICNpbmNsdWRlIDxzdGRsaWIuaD4KIApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3RsczQuc2gg
Yi90ZXN0c3VpdGUvdGxzNC5zaAppbmRleCBlMDBlN2NjLi5lNjFjMDQxIDEwMDc1NQotLS0gYS90
ZXN0c3VpdGUvdGxzNC5zaAorKysgYi90ZXN0c3VpdGUvdGxzNC5zaApAQCAtMSw0ICsxLDUgQEAK
ICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4g
YGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogIyBGaXJzdCBjaGVjayBpZiBfX3RocmVhZCBpcyBz
dXBwb3J0ZWQgYnkgbGQuc28vZ2NjL2xkL2FzOgogcm0gLWYgdGxzdGVzdApkaWZmIC0tZ2l0IGEv
dGVzdHN1aXRlL3RsczRsaWIxLmMgYi90ZXN0c3VpdGUvdGxzNGxpYjEuYwppbmRleCBhMDNhZjBi
Li4yMDJiYmJiIDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvdGxzNGxpYjEuYworKysgYi90ZXN0c3Vp
dGUvdGxzNGxpYjEuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJ0bHMxLmgiCiAjaW5jbHVkZSA8c3RkbGliLmg+CiAK
ZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHM0bGliMi5jIGIvdGVzdHN1aXRlL3RsczRsaWIyLmMK
aW5kZXggMzA5NTA0Yi4uOTI4NGEzMCAxMDA2NDQKLS0tIGEvdGVzdHN1aXRlL3RsczRsaWIyLmMK
KysrIGIvdGVzdHN1aXRlL3RsczRsaWIyLmMKQEAgLTEsMyArMSw0IEBACisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAjaW5jbHVkZSAidGxzMS5oIgogI2luY2x1ZGUg
PHN0ZGxpYi5oPgogCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdGxzNS5zaCBiL3Rlc3RzdWl0ZS90
bHM1LnNoCmluZGV4IDcyODI4MDguLjk5YTc4MTIgMTAwNzU1Ci0tLSBhL3Rlc3RzdWl0ZS90bHM1
LnNoCisrKyBiL3Rlc3RzdWl0ZS90bHM1LnNoCkBAIC0xLDQgKzEsNSBAQAogIyEvYmluL2Jhc2gK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLiBgZGlybmFtZSAkMGAv
ZnVuY3Rpb25zLnNoCiAjIEZpcnN0IGNoZWNrIGlmIF9fdGhyZWFkIGlzIHN1cHBvcnRlZCBieSBs
ZC5zby9nY2MvbGQvYXM6CiBybSAtZiB0bHN0ZXN0CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdGxz
NWxpYjEuYyBiL3Rlc3RzdWl0ZS90bHM1bGliMS5jCmluZGV4IDk2Nzc4NDguLmJmNDJmY2YgMTAw
NjQ0Ci0tLSBhL3Rlc3RzdWl0ZS90bHM1bGliMS5jCisrKyBiL3Rlc3RzdWl0ZS90bHM1bGliMS5j
CkBAIC0xLDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eQogI2luY2x1ZGUgInRsczEuaCIKICNpbmNsdWRlIDxzdGRsaWIuaD4KIApkaWZmIC0tZ2l0IGEv
dGVzdHN1aXRlL3RsczYuc2ggYi90ZXN0c3VpdGUvdGxzNi5zaAppbmRleCA2YTY0ZjAyLi4wZjUy
NmE1IDEwMDc1NQotLS0gYS90ZXN0c3VpdGUvdGxzNi5zaAorKysgYi90ZXN0c3VpdGUvdGxzNi5z
aApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0aW9ucy5zaAogIyBGaXJzdCBjaGVj
ayBpZiBfX3RocmVhZCBpcyBzdXBwb3J0ZWQgYnkgbGQuc28vZ2NjL2xkL2FzOgogcm0gLWYgdGxz
dGVzdApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3RsczZsaWIxLmMgYi90ZXN0c3VpdGUvdGxzNmxp
YjEuYwppbmRleCA1MzEwYzA2Li40ZWU3ZWI4IDEwMDY0NAotLS0gYS90ZXN0c3VpdGUvdGxzNmxp
YjEuYworKysgYi90ZXN0c3VpdGUvdGxzNmxpYjEuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJ0bHMxLmgiCiAjaW5j
bHVkZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHM3LmMgYi90ZXN0c3Vp
dGUvdGxzNy5jCmluZGV4IDRhM2RiMjQuLmExMWFkZmIgMTAwNjQ0Ci0tLSBhL3Rlc3RzdWl0ZS90
bHM3LmMKKysrIGIvdGVzdHN1aXRlL3RsczcuYwpAQCAtMSwzICsxLDQgQEAKKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICNpbmNsdWRlICJ0bHMxLmgiCiAjaW5jbHVk
ZSA8c3RkbGliLmg+CiAKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS90bHM3LnNoIGIvdGVzdHN1aXRl
L3Rsczcuc2gKaW5kZXggYWI5MzcxOS4uNzQzMTgxOSAxMDA3NTUKLS0tIGEvdGVzdHN1aXRlL3Rs
czcuc2gKKysrIGIvdGVzdHN1aXRlL3Rsczcuc2gKQEAgLTEsNCArMSw1IEBACiAjIS9iaW4vYmFz
aAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAuIGBkaXJuYW1lICQw
YC9mdW5jdGlvbnMuc2gKICMgRmlyc3QgY2hlY2sgaWYgX190aHJlYWQgaXMgc3VwcG9ydGVkIGJ5
IGxkLnNvL2djYy9sZC9hczoKIHJtIC1mIHRsc3Rlc3QKZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS91
bmRvMS5zaCBiL3Rlc3RzdWl0ZS91bmRvMS5zaAppbmRleCA2OGVlZTFmLi5hYzA3ZmI4IDEwMDc1
NQotLS0gYS90ZXN0c3VpdGUvdW5kbzEuc2gKKysrIGIvdGVzdHN1aXRlL3VuZG8xLnNoCkBAIC0x
LDQgKzEsNSBAQAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQogLiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiBybSAtZiB1bmRvMSB1bmRvMWxp
Yiouc28gdW5kbzEubG9nCiBybSAtZiBwcmVsaW5rLmNhY2hlCmRpZmYgLS1naXQgYS90ZXN0c3Vp
dGUvdW5kb3N5c2xpYnMuc2ggYi90ZXN0c3VpdGUvdW5kb3N5c2xpYnMuc2gKaW5kZXggMWNlMTM2
ZC4uZWYwYjFlOCAxMDA3NTUKLS0tIGEvdGVzdHN1aXRlL3VuZG9zeXNsaWJzLnNoCisrKyBiL3Rl
c3RzdWl0ZS91bmRvc3lzbGlicy5zaApAQCAtMSw0ICsxLDUgQEAKICMhL2Jpbi9iYXNoCisjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIC4gYGRpcm5hbWUgJDBgL2Z1bmN0
aW9ucy5zaAogTElCUz1gY2F0IHN5c2xpYi5saXN0YAogY29tcGFyZWxpYnMgPj4gdW5kb3N5c2xp
YnMubG9nIDI+JjEgfHwgZXhpdCAxCmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdW5wcmVsMS5jIGIv
dGVzdHN1aXRlL3VucHJlbDEuYwppbmRleCAwYzhlOWY5Li44YWViZTk2IDEwMDY0NAotLS0gYS90
ZXN0c3VpdGUvdW5wcmVsMS5jCisrKyBiL3Rlc3RzdWl0ZS91bnByZWwxLmMKQEAgLTEsMyArMSw0
IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiBleHRlcm4gaW50
IGJhciAoKTsKIAogaW50CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdW5wcmVsMS5zaCBiL3Rlc3Rz
dWl0ZS91bnByZWwxLnNoCmluZGV4IDQwMWY4YmYuLjY5YTcwODEgMTAwNzU1Ci0tLSBhL3Rlc3Rz
dWl0ZS91bnByZWwxLnNoCisrKyBiL3Rlc3RzdWl0ZS91bnByZWwxLnNoCkBAIC0xLDQgKzEsNSBA
QAogIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQog
LiBgZGlybmFtZSAkMGAvZnVuY3Rpb25zLnNoCiBQUkVMSU5LPWBlY2hvICRQUkVMSU5LIFwKIAkg
fCBzZWQgLWUgJ3MsIFwuL1wocHJlbGlua1wuXChjYWNoZVx8Y29uZlwpXCksIHVucHJlbDEudHJl
ZS9ldGMvXDEsZycgXApkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL3VucHJlbDFsaWIxLmMgYi90ZXN0
c3VpdGUvdW5wcmVsMWxpYjEuYwppbmRleCA4Zjg1ZGEzLi45ZWQ0M2U1IDEwMDY0NAotLS0gYS90
ZXN0c3VpdGUvdW5wcmVsMWxpYjEuYworKysgYi90ZXN0c3VpdGUvdW5wcmVsMWxpYjEuYwpAQCAt
MSwzICsxLDQgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIGlu
dAogYmF6ICgpCiB7CmRpZmYgLS1naXQgYS90ZXN0c3VpdGUvdW5wcmVsMWxpYjIuYyBiL3Rlc3Rz
dWl0ZS91bnByZWwxbGliMi5jCmluZGV4IDQ3ODMxMjMuLjczMjVkMTUgMTAwNjQ0Ci0tLSBhL3Rl
c3RzdWl0ZS91bnByZWwxbGliMi5jCisrKyBiL3Rlc3RzdWl0ZS91bnByZWwxbGliMi5jCkBAIC0x
LDMgKzEsNCBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogZXh0
ZXJuIGludCBiYXogKCk7CiAKIGludAotLSAKMi43LjQKCg==

--000000000000aa782f05957c6e67--
