Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id C74E971B2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:17:20 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id 2so15155027oif.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 07:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PKOrjNwlN4aYiXPQEaW+FhnUnS9ZVcYzCNsl/MxRnhM=;
	b=Vtzoqmvo4oeFb3sNHsGLbY5pj/SVhYknwjwXL7iyGjlHCdaX1zjxF5arqVf2hKG0vS
	QMvNhTEYn5XC7hv4vyVSvs/HCFPQFmDm75RvyPdu3Yf6PQUDhvc1WLrxY/iELTbl/jrr
	fq7zCG8fqdFHUwNlFiwp+khkxXRPW7k5m5OdHrca28BPG8znlo+pQHJjFW0pUGrRPgDk
	VpsCjsodUcxNMqL8bK9626ggixODKi/c6P8b18ttGN0tNpPP4tVK/X/nxAQaxfK2BdcG
	y3yTsenSqfiGAFTgmkrveN0h/YZm3PsxM/j9wNxlQD1TBwcjBbAJYgUY4Sk+Vdy/6rr+
	J4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PKOrjNwlN4aYiXPQEaW+FhnUnS9ZVcYzCNsl/MxRnhM=;
	b=F01CspdWjLFNKWi4hmvIS4uvWzjwlidfLfk0UBYJa4KJgrpbrs2viXfOeAS2mLUSdw
	8KPcyaL3G0TT4bbg/CpKO0UL5AICIxMDRSRiaolrxu4xz21nSBPy2zRgyVwcLyvJC9dD
	dOV9H/JpZmXMWwO/owRMdmptdCgkhoLBmeCER6PPY382CiLvbSgGCn5BsMOdECZGIFRn
	IunqsvALL6xc3G5ntUXVQHbvR3J/SDNGajjxESVRAAkUSgXlURUYVO+3DMnqZIgNZMJ8
	POStuwStsG04bpmRYOqDkqxxD+TgNNkY7lUVu7HmDatiP/BfdKLBs8zDLCCAq6t9v+Tf
	0GLw==
X-Gm-Message-State: AMke39kw157Ck7gbyP3QvSXU5AWUuHHuR21MJULRUbCPK+gRWB3sdzX7tRx8i9a8kHLoZstNrOedyxj+VcG/Ng==
X-Received: by 10.202.85.193 with SMTP id j184mr3102182oib.199.1487603840887; 
	Mon, 20 Feb 2017 07:17:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Mon, 20 Feb 2017 07:17:00 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702200935010.377@localhost.localdomain>
References: <alpine.LFD.2.20.1702200935010.377@localhost.localdomain>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 20 Feb 2017 08:17:00 -0700
Message-ID: <CABcZANkGtd+ikiFq+gL3d1m8_usPGfLZP9uaCKzarfXObEGO-w@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: dbus seems to be given debian naming convention, breaking another recipe
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
X-List-Received-Date: Mon, 20 Feb 2017 15:17:21 -0000
Content-Type: multipart/alternative; boundary=001a113d216880b2640548f7c21f

--001a113d216880b2640548f7c21f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 7:40 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   moving on, i whipped together a recipe for libnet-dbus-perl, tried
> to build, and:
>
>   ...
>   DBus >=3D 1.3.0 is required
>   ...
>
> which is weird since oe-core contains the recipe:
>
>   meta/recipes-core/dbus/dbus_1.10.14.bb
>
> but when i examined the deployed rpms:
>
> -rw-r--r--. 3 rpjday rpjday  163963 Feb 20 06:04
> dbus-1-1.10.14-r0.ppc7400.rpm
> -rw-r--r--. 3 rpjday rpjday 1393445 Feb 20 06:04
> dbus-dbg-1.10.14-r0.ppc7400.rpm
> -rw-r--r--. 3 rpjday rpjday   36372 Feb 20 06:04
> dbus-dev-1.10.14-r0.ppc7400.rpm
> -rw-r--r--. 3 rpjday rpjday   92124 Feb 20 06:04
> dbus-doc-1.10.14-r0.ppc7400.rpm
> -rw-r--r--. 3 rpjday rpjday    2960 Feb 20 06:04
> dbus-ptest-1.10.14-r0.ppc7400.rpm
> -rw-r--r--. 3 rpjday rpjday  135131 Feb 20 06:04 libdbus-1-3-1.10.14-r0.
> ppc7400.rpm
>
>   uh, what's with the "dbus-1-1.10.14-r0.ppc7400.rpm"?
>                            ^^^^
> oh, wait, here's a line from the dbus recipe:
>
>   DEBIANNAME_${PN} =3D "dbus-1"
>
> it would seem that that is getting in the way, or am i doing something
> silly?
>

debian.bbclass handles this, but package naming is irrelevent. Your
buildsystem isn=E2=80=99t running out and trying to find a binary rpm, at l=
east I=E2=80=99d
certainly hope not.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113d216880b2640548f7c21f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Feb 20, 2017 at 7:40 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qf" =
class=3D"a3s aXjCH m15a5bf802ff11d6b">=C2=A0 moving on, i whipped together =
a recipe for libnet-dbus-perl, tried<br>
to build, and:<br>
<br>
=C2=A0 ...<br>
=C2=A0 DBus &gt;=3D 1.3.0 is required<br>
=C2=A0 ...<br>
<br>
which is weird since oe-core contains the recipe:<br>
<br>
=C2=A0 meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">dbus_1.<wbr>10.14.bb</a><br>
<br>
but when i examined the deployed rpms:<br>
<br>
-rw-r--r--. 3 rpjday rpjday=C2=A0 163963 <span class=3D"aBn" tabindex=3D"0"=
><span class=3D"aQJ">Feb 20 06:04</span></span> dbus-1-1.10.14-r0.ppc7400.r=
pm<br>
-rw-r--r--. 3 rpjday rpjday 1393445 <span class=3D"aBn" tabindex=3D"0"><spa=
n class=3D"aQJ">Feb 20 06:04</span></span> dbus-dbg-1.10.14-r0.ppc7400.<wbr=
>rpm<br>
-rw-r--r--. 3 rpjday rpjday=C2=A0 =C2=A036372 <span class=3D"aBn" tabindex=
=3D"0"><span class=3D"aQJ">Feb 20 06:04</span></span> dbus-dev-1.10.14-r0.p=
pc7400.<wbr>rpm<br>
-rw-r--r--. 3 rpjday rpjday=C2=A0 =C2=A092124 <span class=3D"aBn" tabindex=
=3D"0"><span class=3D"aQJ">Feb 20 06:04</span></span> dbus-doc-1.10.14-r0.p=
pc7400.<wbr>rpm<br>
-rw-r--r--. 3 rpjday rpjday=C2=A0 =C2=A0 2960 Feb 20 06:04 dbus-ptest-1.10.=
14-r0.ppc7400.<wbr>rpm<br>
-rw-r--r--. 3 rpjday rpjday=C2=A0 135131 <span class=3D"aBn" tabindex=3D"0"=
><span class=3D"aQJ">Feb 20 06:04</span></span> libdbus-1-3-1.10.14-r0.<wbr=
>ppc7400.rpm<br>
<br>
=C2=A0 uh, what&#39;s with the &quot;dbus-1-1.10.14-r0.ppc7400.<wbr>rpm&quo=
t;?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^<br>
oh, wait, here&#39;s a line from the dbus recipe:<br>
<br>
=C2=A0 DEBIANNAME_${PN} =3D &quot;dbus-1&quot;<br>
<br>
it would seem that that is getting in the way, or am i doing something<br>
silly?</div></blockquote></div><br>debian.bbclass handles this, but package=
 naming is irrelevent. Your buildsystem isn=E2=80=99t running out and tryin=
g to find a binary rpm, at least I=E2=80=99d certainly hope not.<br>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</div></div>

--001a113d216880b2640548f7c21f--
