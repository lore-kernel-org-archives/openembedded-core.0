Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 17C9B77BEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 13:56:46 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id p139so11619712itb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 05:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xKBCKvGV/RHPkKo+qjVbwIig5ygcgoFFQRjf9N8PDx4=;
	b=Vx+x8NBA8NLxrULSmJOAF18PbVmC01iIjUNsHkXSLTy3E63WWtvWIWApRImV/6pH3s
	tmUWhaPFmv+2n8V8lyQ3UaIgJMGUOCCHlQZPYtTy0gntRUJW97DGpwDdi97U+aiJLgGZ
	rIPEpewk2MOJ3x8QKwIDxlg39w2w2ADk0SuZ0QXvCLUNFDyERgEss+bMrMP/lP6yhw0S
	hZjFYgWj5nWQIpOMsKPp8tFOdRhG+qKaJSM+rj+0W5mlzpXNSQtjdcBHQnzTr60hzr8R
	KGYPJCe7Bd6/it/X9JxFeEwuZUMA7BbSVoxNeeRfM2bpoKKqyjxH2G6/8mnPIF0cqQ7q
	VhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xKBCKvGV/RHPkKo+qjVbwIig5ygcgoFFQRjf9N8PDx4=;
	b=mdwcH7ApE5DqGCWPIR4S36vbLReEsB2i+l/MWZBo8aCsKMFuwO+xNLsdtCc5g9+RlN
	6u4F2xuIFGhUc34z0rhpg3d+9bGuXodmln0XVq49GfKz8zxscG0JlhmsmsAQKJ9gx2oh
	Cp+Fy5f0bJL5koHxnI9gwlHau4FYSd79xM7Ptxri+7kD8QW1X2dFm5pPJ8r1U4m9mQjq
	mbgqBPTKZJvG3unvV4rHP7vN6RVK1N0+zvKgJztRf2Lhe3UnjZuSu9PiW27fYp2wRPhJ
	LN8ZpwlagOqIpubQacdy8d0KtPzlOF7Gz0+FAHxgW+Q0v7/pK9m0O88EiRBxQ19fJnTT
	qnVQ==
X-Gm-Message-State: AKGB3mIK0LAfO/30adEpTXkYZJ8iOBk7Pv9KKi2Owxl2tt/SeCEzbqTi
	U16QENwPbfAuvV9UxmlOknSzlrp6oPHp9daSluI=
X-Google-Smtp-Source: ACJfBosMGwEFARqbJREEn7SdVbArH7zpU9iXfir5nuMl0drP+GYk/N+JTCG7gWpKRNrUzd88HF8tcuX+B1x3k4x78qQ=
X-Received: by 10.107.48.197 with SMTP id w188mr7421927iow.301.1513259808044; 
	Thu, 14 Dec 2017 05:56:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.90.200 with HTTP; Thu, 14 Dec 2017 05:56:27 -0800 (PST)
In-Reply-To: <266c426e-ed0c-6fbb-842c-01962b9ef71b@dresearch-fe.de>
References: <266c426e-ed0c-6fbb-842c-01962b9ef71b@dresearch-fe.de>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 14 Dec 2017 14:56:27 +0100
Message-ID: <CAB2nKc8FEm+5g4EJP3PZwa=7+9d7iFu6cFQOoUph+vDPTmKZhA@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to fix file-rdes QA error for /usr/bin/python?
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
X-List-Received-Date: Thu, 14 Dec 2017 13:56:47 -0000
Content-Type: multipart/alternative; boundary="001a11444bfa4fb97005604d41b0"

--001a11444bfa4fb97005604d41b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steffen,

I maybe wrong but foo.py should start with
#!/usr/bin/env python

instead of
#!/usr/bin/python

Best regards,
Vincent



2017-12-14 14:34 GMT+01:00 Steffen Sledz <sledz@dresearch-fe.de>:

> With rocko some builds are rejected because of the following package QA
> error (formerly it was just a warning).
>
>  ERROR: foo-1_gitrAUTOINC+2595b80a79-r17 do_package_qa: QA Issue:
> /..../foo.py contained in package foo requires /usr/bin/python, but no
> providers found in RDEPENDS_for? [file-rdeps]
>
> But the recipe still contains an rdep for python in recipe foo_git.bb
>
>  RDEPENDS_{PN} +=3D " ... python "
>
> I assume the problem is that /usr/bin/python is not provided by any
> package but is just a symlink (created via u-a?).
>
> How can/should this be fixed?
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11444bfa4fb97005604d41b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Steffen,=C2=A0</div><div><br></div><div>I maybe wrong=
 but foo.py should start with=C2=A0</div><div>#!/usr/bin/env python=C2=A0=
=C2=A0</div><div><br></div><div>instead of=C2=A0</div><div>#!<span style=3D=
"font-size:12.8px">/usr/bin/python</span></div><div><span style=3D"font-siz=
e:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">Best regar=
ds,</span></div><div><span style=3D"font-size:12.8px">Vincent</span></div><=
div><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"f=
ont-size:12.8px"><br></span></div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">2017-12-14 14:34 GMT+01:00 Steffen Sledz <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sledz@dresearch-fe.de" target=3D"_blank">sle=
dz@dresearch-fe.de</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">With r=
ocko some builds are rejected because of the following package QA error (fo=
rmerly it was just a warning).<br>
<br>
=C2=A0ERROR: foo-1_gitrAUTOINC+2595b80a79-<wbr>r17 do_package_qa: QA Issue:=
 /..../foo.py contained in package foo requires /usr/bin/python, but no pro=
viders found in RDEPENDS_for? [file-rdeps]<br>
<br>
But the recipe still contains an rdep for python in recipe <a href=3D"http:=
//foo_git.bb" rel=3D"noreferrer" target=3D"_blank">foo_git.bb</a><br>
<br>
=C2=A0RDEPENDS_{PN} +=3D &quot; ... python &quot;<br>
<br>
I assume the problem is that /usr/bin/python is not provided by any package=
 but is just a symlink (created via u-a?).<br>
<br>
How can/should this be fixed?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
DResearch Fahrzeugelektronik GmbH<br>
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany<br>
Tel: <a href=3D"tel:%2B49%2030%20515932-237" value=3D"+4930515932237">+49 3=
0 515932-237</a> mailto:<a href=3D"mailto:sledz@dresearch-fe.de">sledz@dres=
earch-fe.de</a><br>
Fax: <a href=3D"tel:%2B49%2030%20515932-299" value=3D"+4930515932299">+49 3=
0 515932-299</a><br>
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;<br>
Amtsgericht Berlin Charlottenburg; HRB 130120 B;<br>
Ust.-IDNr. DE273952058<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11444bfa4fb97005604d41b0--
