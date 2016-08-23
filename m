Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 32DCB731BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 10:01:07 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id f189so188980302oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/iedF5lmREouTapttgBd9aTKkjv5GFki5p7SV25gF54=;
	b=x2yCguMTE3sRk8MHEQrntu4STP9E4e+zWXoJ3Ny36np48Yyo5iMZ2aw4NCPewqFk3/
	6btgaZzK2IREMfeWwzZ9uNsyx+q7mdVI5k3jeXnH0mIhSj7wIP5n+KCE1uQhd1Koj9eI
	Grj9DB0BUjGfOWc9TmLEPhAJzz8mmP3DgoTc6Sg4QuFuit7ir6cOSzCiW0R3wu3Re2f9
	M0ppAl+gGl5VSSsiOMwViFJnmtqX4bvu/gyHEX6NwierU6qQmkaDOd9cUxvR61DaIxiX
	4/sHSOU2rxlx2PRYajbnlNVJiS1hoP+5Y5qN3FHW8TmVjFslWK1c1fA/i914S1I+N7aC
	Z+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/iedF5lmREouTapttgBd9aTKkjv5GFki5p7SV25gF54=;
	b=Pn8swHOhLeIJtekMzSRfW7DcvbP6Z4TgEcBE/0yGnz51yeuKb20w0ZH1kKbNS2548/
	nkjsUAef5WVWsLB65AQdTpij0INDlcdBd+pqVaaaYyOYdMijFzwBVz+eFEA7ELFUEcqf
	k//tbqf6PPPvYkILPZJIuHmCaVpSZETqEaOs+Q+AqY4ffvoOvMQQyDsDUoG/0OAxYAfa
	dAVqVjjGl/RrRw/kG5GI0OfBiInBYCqcsofzuzdwUoR7vbsPBBt2NTDvdaIF+owClGBE
	bP1s1GiIrGd4eb8vOBsvIOnTfyioZ7EIpv28BK1UnqMTDl+k2qpvwSvTu1y/P88BRoQ5
	tOgw==
X-Gm-Message-State: AEkoouvXonWJnkykXvBeyRCT+/M8GWjcbIvykXhQSi+fkoCRK8A+2GpR/+gdiTYO/koMLgRK8TwLyMHJSNoxmpFt
X-Received: by 10.202.104.4 with SMTP id d4mr14246043oic.160.1471946467965;
	Tue, 23 Aug 2016 03:01:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 23 Aug 2016 03:00:37 -0700 (PDT)
In-Reply-To: <FEF4FC9A-75CF-4EBD-A4E4-A7AE2941668E@bmw-carit.de>
References: <2e948106-ac15-2c16-5bb6-f234079be725@embed.me.uk>
	<20160822142711.26042-1-clemens.lang@bmw-carit.de>
	<20160822142711.26042-2-clemens.lang@bmw-carit.de>
	<CAJTo0Lb1+G+cF2tFkVpA14w_1borw95msdtiRPDUPz0-RPMPDQ@mail.gmail.com>
	<FEF4FC9A-75CF-4EBD-A4E4-A7AE2941668E@bmw-carit.de>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 23 Aug 2016 13:00:37 +0300
Message-ID: <CAHiDW_EQRvyZOnUQXif0mD1Fh+zDa_8Wuh4bEDDpgfnQ=6+wOA@mail.gmail.com>
To: Clemens Lang <Clemens.Lang@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Thomas Witt <Thomas.Witt@bmw.de>
Subject: Re: [PATCH] cmake.bbclass: call cmake with a relative path
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
X-List-Received-Date: Tue, 23 Aug 2016 10:01:11 -0000
Content-Type: multipart/alternative; boundary=001a1140e81a5a29de053aba3e75

--001a1140e81a5a29de053aba3e75
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 August 2016 at 11:47, Clemens Lang <Clemens.Lang@bmw-carit.de> wrote:

> Hi Ross,
>
> Ross Burton <ross.burton@intel.com> wrote:
>
> > Seems to work in my testing, but this breaks piglit's bash-completion
> > logic again (resulting in it not installing the file).  If you understa=
nd
> > cmake then having a quick look at that would be much appreciated.  For
> > reference the buildhistory-diff log is:
> >
> > packages/corei7-64-poky-linux/piglit/piglit-bash-completion: FILELIST:
> > removed all items "/usr/share/bash-completion/completions/piglit:
>
> I think this is not related to the patch and currently toggles randomly
> depending on whether bash-completion=E2=80=99s do_populate_sysroot gets r=
un before
> piglit=E2=80=99s do_configure. Nothing seems to depend on
> bash-completion:do_populate_sysroot.
>
>   $> bitbake -g piglit
>   $> grep -c -- '-> "bash-completion\.do_populate_sysroot'
> task-depends.dot
>   0
>

This looks likely. The piglit build actually does
    find_package(bash-completion NO_MODULE)
to decide whether to install and where.

Arguably this should be explicitly selectable but even then it would also
be reasonable for bash-completion.bbclass to ensure that bash-completion.pc
and the cmake equivalents are installed in the sysroot...

Jussi



>
> HTH,
> --
> Clemens Lang =E2=80=A2 Development Specialist
> BMW Car IT GmbH =E2=80=A2 Lise-Meitner-Str. 14 =E2=80=A2 89081 Ulm =E2=80=
=A2 http://bmw-carit.com
> -------------------------------------------------------------------------
> BMW Car IT GmbH
> Gesch=C3=A4ftsf=C3=BChrer: Michael W=C3=BCrtenberger und Alexis Trolin
> Sitz und Registergericht: M=C3=BCnchen HRB 134810
> -------------------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140e81a5a29de053aba3e75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 August 2016 at 11:47, Clemens Lang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Clemens.Lang@bmw-carit.de" target=3D"_blank">Clemens.Lang@bmw-carit.de</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
 Ross,<br>
<br>
Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.=
com</a>&gt; wrote:<br>
<br>
&gt; Seems to work in my testing, but this breaks piglit&#39;s bash-complet=
ion<br>
&gt; logic again (resulting in it not installing the file).=C2=A0 If you un=
derstand<br>
&gt; cmake then having a quick look at that would be much appreciated.=C2=
=A0 For<br>
&gt; reference the buildhistory-diff log is:<br>
&gt;<br>
&gt; packages/corei7-64-poky-linux/<wbr>piglit/piglit-bash-completion: FILE=
LIST:<br>
&gt; removed all items &quot;/usr/share/bash-completion/<wbr>completions/pi=
glit:<br>
<br>
I think this is not related to the patch and currently toggles randomly<br>
depending on whether bash-completion=E2=80=99s do_populate_sysroot gets run=
 before<br>
piglit=E2=80=99s do_configure. Nothing seems to depend on<br>
bash-completion:do_populate_<wbr>sysroot.<br>
<br>
=C2=A0 $&gt; bitbake -g piglit<br>
=C2=A0 $&gt; grep -c -- &#39;-&gt; &quot;bash-completion\.do_populate_<wbr>=
sysroot&#39; task-depends.dot<br>
=C2=A0 0<br></blockquote><div><br></div><div>This looks likely. The piglit =
build actually does=C2=A0</div><div>=C2=A0 =C2=A0 find_package(bash-complet=
ion NO_MODULE)</div><div>to decide whether to install and where.</div><div>=
<br></div><div>Arguably this should be explicitly selectable but even then =
it would also be reasonable for bash-completion.bbclass to ensure that bash=
-completion.pc and the cmake equivalents are installed in the sysroot...=C2=
=A0</div><div><br></div><div><div>Jussi</div></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
HTH,<br>
<span class=3D""><font color=3D"#888888">--<br>
Clemens Lang =E2=80=A2 Development Specialist<br>
BMW Car IT GmbH =E2=80=A2 Lise-Meitner-Str. 14 =E2=80=A2 89081 Ulm =E2=80=
=A2 <a href=3D"http://bmw-carit.com" rel=3D"noreferrer" target=3D"_blank">h=
ttp://bmw-carit.com</a><br>
------------------------------<wbr>------------------------------<wbr>-----=
--------<br>
BMW Car IT GmbH<br>
Gesch=C3=A4ftsf=C3=BChrer: Michael W=C3=BCrtenberger und Alexis Trolin<br>
Sitz und Registergericht: M=C3=BCnchen HRB 134810<br>
------------------------------<wbr>------------------------------<wbr>-----=
--------<br>
</font></span><div class=3D""><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a1140e81a5a29de053aba3e75--
