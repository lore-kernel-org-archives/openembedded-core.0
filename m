Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1STehd-0002vA-1u
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 21:43:40 +0200
Received: by ggnp4 with SMTP id p4so171029ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 12:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=rUNNFpYJ3aMGvnjkbXszB6SziDFjRdCdbXTQEilJRgk=;
	b=H4ADCA7vQ3KwrvcEF4jUVtWkyKGreFRvsmZbjLmksSDwc2f95dQs9/59Q44DXeunSP
	P+UJQgnL8l54MoO1dbO4pf5alJ9uMyA+F3gIuRu+qdw27PADPuxd27lAgIA9AA8WJIAO
	XMvLd61/R4iWWSRc20ra/y1iyYmlvxlFoUaen+PrMyb4yopQVBkRFrQI/w604vOc9+V+
	J3vFPucZIRjiCuJz/OGIojrd+aohHmB/NKl/8/6qkKvXeoWfo+8p3NluyRONbDdauuUk
	AoNuk1IOgU+9F44M/zCQRy2hb3HCcy8enraVbs3VdB9dsj2oNzUsjOZM2VIW1SPd2BZg
	VN3g==
Received: by 10.50.88.225 with SMTP id bj1mr2903337igb.42.1336937618379; Sun,
	13 May 2012 12:33:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Sun, 13 May 2012 12:33:18 -0700 (PDT)
X-Originating-IP: [92.86.21.113]
In-Reply-To: <CAMKF1srjgfuoKU+yqf81tbWkUjicaVpSe_ouV+PVRn3fd1tK_g@mail.gmail.com>
References: <1336683976-11846-1-git-send-email-andrei@gherzan.ro>
	<CAMKF1spf5qF8DYySoT5Q2aSte5-LCVX9Yd8bLd3Jkwqe4m3Gaw@mail.gmail.com>
	<CAK18fxECsUVusXdYuS_gBwcXQaSTVaM2mc0Tpr7wfDikWHB9eQ@mail.gmail.com>
	<CAMKF1srjgfuoKU+yqf81tbWkUjicaVpSe_ouV+PVRn3fd1tK_g@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 13 May 2012 22:33:18 +0300
Message-ID: <CAK18fxFFbkb-gPYDLRthOOTTMEe_Z3Mth6QdfyRsjKSzdraWxQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQltZYZKQWitXA91xFed0QD4kZ0NGg1kfqiYOaYM7MFB75nE0TUAhLGmFmtIwPgTjAZgKUjW
Subject: Re: [PATCH V3] fotowall: Add #include ui_wizard.h to ExportWizard.cpp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sun, 13 May 2012 19:43:40 -0000
Content-Type: multipart/alternative; boundary=e89a8f234417d4920e04bff00b2f

--e89a8f234417d4920e04bff00b2f
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 11, 2012 at 12:31 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 10, 2012 at 2:26 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > And it does. But this is needed for qmake in Makefile generation. Didn't
> > find a better fix but this works as expected.
>
> I see. So it seems makefile generator does not grok recursive includes ?
> is that documented or a bug in the generator
>
>
Didn't check this but i will. Thanks.
@g

_______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f234417d4920e04bff00b2f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, May 11, 2012 at 12:31 AM, Khem Raj <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

On Thu, May 10, 2012 at 2:26 PM, Andrei Gherzan &lt;<a href=3D"mailto:andre=
i@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt; And it does. But this is needed for qmake in Makefile generation. Didn=
&#39;t<br>
&gt; find a better fix but this works as expected.<br>
<br>
I see. So it seems makefile generator does not grok recursive includes ?<br=
>
is that documented or a bug in the generator<br>
<br></blockquote><div>=A0</div><div>Didn&#39;t check this but i will. Thank=
s.</div><div>@g</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--e89a8f234417d4920e04bff00b2f--
