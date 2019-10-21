Return-Path: <yann.cardaillac@smile.fr>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8C67F34E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 09:43:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 6so946703wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smile-fr.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=FPXgx47sGTYerDtvBTi7Qm/GjF1nVueOrzS135/6EnA=;
	b=ZvYr5BMy6Q9KxgUxBLtRWbn+WsC6cpJ70tetuHiEwMos9gxRZCRHYlyspXtL2XXE/I
	STpCjf5i/IabhthcKJh1kSdihpY0NCEb40lEEg+6L5fKnFG7q+yOIdhdtZqB307uvlci
	ZWgvlDNsuWXYpIdM2Uu0T1OWJmyQaphtL8GxD+HvhBI9NVwqetzQIQ5sH5mCGVkrm7VY
	7VZa3CfWZBm3IgBChJ5XfrFGUbZgLtuC/kr5cnd6Wft+V+SXmBNmyPmPlYlalzEuDjoH
	aS/L17EvO2RXRs5IbwHoUBpUSyd+ONmDVhS6b6KccXJVrQ7Ce2cVZo4SIg4zBkrFyb2k
	33dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=FPXgx47sGTYerDtvBTi7Qm/GjF1nVueOrzS135/6EnA=;
	b=fcy+faxKeiXyszboav401yADjId8wNTVUn6JvbttwL321lj4Tz3by6WGP5SC6MFpJg
	azC0oFWkSMpwhvsCiPZPu031m4p9UXyDp3GvkZ1aS9/TCoxj0BFvZCbhExJAPz256dDp
	uBL4aoFDdIdaq/rcpztcRHMSKN9JoHRwX3mF5kZdolpnrkl/vK5EFJ9odhJr2ubXGm4u
	Ld6tyHVzBEym2iMKvHgGb9hvWcaj2PhHMeSrv2ePVORkR157MX7bb9VNen7VbqpXzZpW
	PpNQY3dP52BE/o+Yr7Z4EXoY+S1iLHsUJ9TteDBRDvz6BxQ/JsSvICLCNkOua1MpoHY1
	AVCg==
X-Gm-Message-State: APjAAAWljKMpPjJj9h2gxg1u5R/uD3ppvQpuWqm3EC7KDUixS0LF8Pxs
	P6bUKeVsY8ue+cjeI+DMX2YiEK4XFmKbbfGARJBkFA==
X-Google-Smtp-Source: APXvYqzJyaqs1EI9yB5cs6pWNY9Pt3agu4M3mVgayuaFG6bKpkBRvvSG69YgFDgdbA6TwVkyjlJfo/HmeXP/S8iPtd0=
X-Received: by 2002:a05:600c:2247:: with SMTP id
	a7mr3230910wmm.19.1571650997903; 
	Mon, 21 Oct 2019 02:43:17 -0700 (PDT)
MIME-Version: 1.0
From: Yann CARDAILLAC <yann.cardaillac@smile.fr>
Date: Mon, 21 Oct 2019 11:43:07 +0200
Message-ID: <CAA984JUdZZ7d6pnpeddtSSR_XkPfxsUw-8e3AsLPjyiXzvJd0w@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: jakub@redhat.com, Romain Naour <romain.naour@smile.fr>,
	mark.hatle@windriver.co
Subject: [yocto][prelink-cross] Bug 13529 add SPDX identifier
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
X-List-Received-Date: Mon, 21 Oct 2019 09:43:17 -0000
Content-Type: multipart/alternative; boundary="00000000000070f4340595688337"

--00000000000070f4340595688337
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark Hatle, Jakub Jelinek,

I'm currently beginning the work on bug 13529:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13529

The purpose is to add SPDX identifier to scripts and sources.

Most of the sources have licences on the sources, however some of them
don't, and I've question about others :

- src/sha.c do not shall it be GPLV2-or-later as most of the other?
- how to licence m4/libelf.m4 ? I'd prefer you to tell me exactly what to
add in order to avoid errors
- what about *.C files ? They don't have licence header, they look like C
file to me so I'd probably add :
// SPDX-License-Identifier: GPL-2.0-or-later
- what about testsuite/ files ?

Shall every thing just be GPL-2.0-or-later?

Best Regards,

Yann CARDAILLAC

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

--00000000000070f4340595688337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mark Hatle, Jakub Jelinek,</div><div><br></div><di=
v>I&#39;m currently beginning the work on bug 13529:</div><div><br></div><d=
iv><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13529">ht=
tps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13529</a></div><div><br><=
/div><div>The purpose is to add SPDX identifier to scripts and sources.</di=
v><div><br></div><div>Most of the sources have licences on the sources, how=
ever some of them don&#39;t, and I&#39;ve question about others :<br></div>=
<div><br></div><div>- src/sha.c do not shall it be GPLV2-or-later as most o=
f the other? <br></div><div>- how to licence m4/libelf.m4 ? I&#39;d prefer =
you to tell me exactly what to add in order to avoid errors</div><div>- wha=
t about *.C files ? They don&#39;t have licence header, they look like C fi=
le to me so I&#39;d probably add :</div><div>// SPDX-License-Identifier: GP=
L-2.0-or-later<br></div><div>- what about testsuite/ files ? <br></div><div=
><br></div><div>Shall every thing just be GPL-2.0-or-later?<br></div><div><=
br></div><div>Best Regards,</div><div><br></div><div>Yann CARDAILLAC<br></d=
iv><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-sm=
artmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">

                    <div style=3D"display:block"><div>
   =20
    <font face=3D"Raleway, regular">
    <table style=3D"padding:20px" border=3D"0">
        <tbody>
        <tr>
            <td style=3D"font-size:13px;color:rgb(255,128,84);text-align:ce=
nter;padding-right:30px">
                <a href=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width:100%;height:auto" src=3D"http:/=
/ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"SMILE=
">
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
-right:5px" src=3D"http://ftp.smile.fr/client/Communication/signature/img/m=
ail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:yann.cardaillac@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">yann.cardaillac@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right:5px" src=3D"http://ftp.smile.fr/clie=
nt/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=3D"=
12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width:100%;height:auto"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.facebook.com/smileopensource" target=3D"_blank"><img src=3D"http://ftp.smi=
le.fr/client/Communication/signature/img/rs-facebook.png" alt=3D"Facebook" =
style=3D"max-width:100%;height:auto"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width:100%;height:auto"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h:100%;height:auto"></a></span>
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

--00000000000070f4340595688337--
