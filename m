Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SSb2G-0002s3-Lf
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:36:32 +0200
Received: by yenl13 with SMTP id l13so1420670yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=jwtjnKOXIRf3ZxBzKgw8bD9O3ROm5VzTVeqPE02exyM=;
	b=O5ET3h0wDuo6r3K2pXW3E9oUnar5gaTukcolOmqeoMzIMUxu6JgjIW/pV2gR4W6YiG
	0mY6pBgtcBYm3Z90Az/Lp2dL6+XVlDmVMBggnIzyUVakc2X/Fk7vRbtezd9A/aUXfVGe
	n6XAeUrRFsvR5heatJCCPew45ElKl5vabnXT0agDqpPb5JMKdhbGISl2MkFirBKLPmMp
	Df06CgZ5FxvEHCXmC0Up/rHnNa096pXnJIpISvYSxLRl3A5016z2Fx4hOAoxmE1x3iH2
	8sTABsKr6W/+3j4IpCeA1vhnsHoJxSDsgRNdUcbsJxcgqR/L5OWPNRwlVGHXac6i6lXQ
	Aj0A==
Received: by 10.50.169.7 with SMTP id aa7mr282581igc.52.1336685197423; Thu, 10
	May 2012 14:26:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Thu, 10 May 2012 14:26:17 -0700 (PDT)
X-Originating-IP: [79.117.103.30]
In-Reply-To: <CAMKF1spf5qF8DYySoT5Q2aSte5-LCVX9Yd8bLd3Jkwqe4m3Gaw@mail.gmail.com>
References: <1336683976-11846-1-git-send-email-andrei@gherzan.ro>
	<CAMKF1spf5qF8DYySoT5Q2aSte5-LCVX9Yd8bLd3Jkwqe4m3Gaw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 11 May 2012 00:26:17 +0300
Message-ID: <CAK18fxECsUVusXdYuS_gBwcXQaSTVaM2mc0Tpr7wfDikWHB9eQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnGrDvoMqk9aEGqcwjGDcyy2ICvHZcfFGUka5ltwZ0Q2AdV71+JCZq8oU9ZHwFaqD9cC7xC
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
X-List-Received-Date: Thu, 10 May 2012 21:36:32 -0000
Content-Type: multipart/alternative; boundary=e89a8f2348815e74c004bfb54628

--e89a8f2348815e74c004bfb54628
Content-Type: text/plain; charset=ISO-8859-1

And it does. But this is needed for qmake in Makefile generation. Didn't
find a better fix but this works as expected.

*@g*


On Fri, May 11, 2012 at 12:22 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 10, 2012 at 2:06 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> >
> > +App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard.
> The last one
> > +should be already generated before compiling ExportWizard.cpp.
> > +
>
> then shouldnt wizard.h  be including ui_wizard.h and not the .cpp file ?
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f2348815e74c004bfb54628
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

And it does. But this is needed for qmake in Makefile generation. Didn&#39;=
t find a better fix but this works as expected.<br clear=3D"all"><div style=
=3D"text-align:center"></div><div style=3D"text-align:center"><div align=3D=
"left" style=3D"font-family:&#39;Times New Roman&#39;;font-size:medium">

<font face=3D"Arial" color=3D"#333333" size=3D"-1"><br><b>@g</b></font></di=
v></div>
<br><br><div class=3D"gmail_quote">On Fri, May 11, 2012 at 12:22 AM, Khem R=
aj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

On Thu, May 10, 2012 at 2:06 PM, Andrei Gherzan &lt;<a href=3D"mailto:andre=
i@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt;<br>
&gt; +App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. =
The last one<br>
&gt; +should be already generated before compiling ExportWizard.cpp.<br>
&gt; +<br>
<br>
then shouldnt wizard.h =A0be including ui_wizard.h and not the .cpp file ?<=
br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--e89a8f2348815e74c004bfb54628--
