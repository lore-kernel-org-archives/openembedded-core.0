Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 885E577E13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 15:23:14 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id c13so12235422qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dR5UioKRhx8a0syyrdmMehoTUY8avfzKa9j39ej0j2o=;
	b=oK/UVpyY7qcRTDFVUbH8UOyHYLMzlcJ4FnTHspTRhrTsc+KaDvr2/ooEJtk/YP/Igo
	03XEVPiS5QcMu7lntIsUo6XETer55Cay/hMmXzhVnfz7S6aywVarxwKfyke8Oc8pLcG/
	H0z8xfcARfahxWapYb2JdWl0Zu7Ht04wX1df8Q/BQYsvh+21Fsrezg6r/bPCC142FIoI
	TYBGEEx+w/QMIqWNtuOqFfW+sworKBLSrsZaZq5Nds3SdRmhNIrNReKD3vw5wSY5x1q+
	RhypVtwqy9QRZZAK80FCjQSBriOcGk+o0OwspDAC53OMquKknr2pm9rD57wUXMrdI/qm
	eQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dR5UioKRhx8a0syyrdmMehoTUY8avfzKa9j39ej0j2o=;
	b=VbmvqBWzy5gaqaTRsNmOoxV1znDvyEUoNkqkA1LU0AwFmPB2NPoExkOEX7K+f+mSUj
	E48R8bjrZxUdPRguXBVIDdvn/Gb/vr+st22QeavP6BUmAfyN88xezwUO1gAUoNjl8QiQ
	eGQ0rF0YFlRbu/lcXcF9kaZmMzJyseuu8aetkV8W4hah9Zm1HTamLmvDrUQLvruMqZEr
	qChigvWZMP/MCz0ruwZc2ooePzD5PiT9UuuCMzakJIj8cPP5Js+pQ4HAPGmtZ0juqfcI
	ttYPUaO3qqpxpeupSaJOcpiYbBTYU1txHlx5AO/KY/nyGspOcslOV9agHSAWIGVfJNZt
	mZjQ==
X-Gm-Message-State: AODbwcDnkHIBRXqIIfnMwh0ZOibpUPPx0GF+gmifOfLKI2OtCFoamHS8
	2aaAMFMakzz0sMh1kTLOB7OokVTkrSWD
X-Received: by 10.200.34.242 with SMTP id g47mr3486287qta.109.1495034595533;
	Wed, 17 May 2017 08:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 17 May 2017 08:22:55 -0700 (PDT)
In-Reply-To: <20170516214855.GM28053@denix.org>
References: <1494358314-53536-1-git-send-email-denis@denix.org>
	<20170516214855.GM28053@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 May 2017 16:22:55 +0100
Message-ID: <CAJTo0Laagrn4z71dt1-hLukn+civBa2PwMoEU2zKg0gNFSFSCQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-nose: rename ${bindir}/nosetests into ${bindir}/nosetests3
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
X-List-Received-Date: Wed, 17 May 2017 15:23:14 -0000
Content-Type: multipart/alternative; boundary="001a114037d4fe7b16054fb9dd31"

--001a114037d4fe7b16054fb9dd31
Content-Type: text/plain; charset="UTF-8"

Queued already, there's been quite a backlog and there's always that one
patch that breaks something subtle isn't there...

Ross

On 16 May 2017 at 22:48, Denys Dmytriyenko <denis@denix.org> wrote:

> Ping
>
> On Tue, May 09, 2017 at 03:31:54PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > This resolves a conflict when both python-nose and python3-nose are
> pulled
> > into an image and try to install ${bindir}/nosetests binary.
> >
> > This matches with how other distros are solving this problem, e.g.
> Debian:
> > https://packages.debian.org/jessie/all/python3-nose/filelist
> >
> > Also, other packages like python3-setuptools are already doing the same
> with
> > their binaries.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-devtools/python/python3-nose_1.3.7.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> > index 99bba44..1e2ff74 100644
> > --- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> > +++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> > @@ -17,6 +17,10 @@ S = "${WORKDIR}/nose-${PV}"
> >
> >  inherit setuptools3
> >
> > +do_install_append() {
> > +    mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3
> > +}
> > +
> >  RDEPENDS_${PN}_class-target = "\
> >    python3-unittest \
> >    "
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114037d4fe7b16054fb9dd31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Queued already, there&#39;s been quite a backlog and there=
&#39;s always that one patch that breaks something subtle isn&#39;t there..=
.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On 16 May 2017 at 22:48, Denys Dmytriyenko <span dir=3D=
"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.=
org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Tue, May 09, 2017 at 03:31:54PM -0400, Denys Dmytriyenko wrote:<br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt;<br>
&gt; This resolves a conflict when both python-nose and python3-nose are pu=
lled<br>
&gt; into an image and try to install ${bindir}/nosetests binary.<br>
&gt;<br>
&gt; This matches with how other distros are solving this problem, e.g. Deb=
ian:<br>
&gt; <a href=3D"https://packages.debian.org/jessie/all/python3-nose/filelis=
t" rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/<wbr>je=
ssie/all/python3-nose/<wbr>filelist</a><br>
&gt;<br>
&gt; Also, other packages like python3-setuptools are already doing the sam=
e with<br>
&gt; their binaries.<br>
&gt;<br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3-nose_1.3.=
7.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-nose_1.3.7.bb</a> |=
 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://pytho=
n3-nose_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.b=
b</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-nose_1.=
3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a><br>
&gt; index 99bba44..1e2ff74 100644<br>
&gt; --- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-nose=
_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a><b=
r>
&gt; +++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-nose=
_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a><b=
r>
&gt; @@ -17,6 +17,10 @@ S =3D &quot;${WORKDIR}/nose-${PV}&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit setuptools3<br>
&gt;<br>
&gt; +do_install_append() {<br>
&gt; +=C2=A0 =C2=A0 mv ${D}${bindir}/nosetests ${D}${bindir}/nosetests3<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS_${PN}_class-target =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 python3-unittest \<br>
&gt;=C2=A0 =C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114037d4fe7b16054fb9dd31--
