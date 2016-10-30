Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA19371A3B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 17:16:27 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id i127so8093404oia.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=aNwdqYpfKoyOQriN6sS5+FiQfzcLGsTldYKykLNpktQ=;
	b=wVa6Gbu8mhkUNPvb3HqHiyHJ8yCP4VUGc39Kvp/V70Uc3wWJAwvetJemEXyIGdJ8Ek
	/O75eacTU3mngmpSklSJ2C9jcoucjSA2D7v5LWqN9WYWeodMNtA4KBKS7DnXZ5Cqtayz
	aJHrAEX82E0HDhBrL/grI+16f2K/dM/Wz170BB4LcB7sRcazhDCuod44gOaEprfU3S1z
	+RdqeqJxQaAJr6qirxTlXoeIxIdLJvsZHq2fch+4eg1CKseMDfkJCOiZ/trm8Bev5CCK
	jGxxaOgPwyFlbyRHZqJm8ZviNk7Rc/8L5kThy0VU7g80vJvwwsAVRCqbjvysuANuHxjz
	hYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=aNwdqYpfKoyOQriN6sS5+FiQfzcLGsTldYKykLNpktQ=;
	b=gP8O92O4xo9waL8gpYFeiEC/OvwuAmOoNk3sFkP6sSDh5qiaEXSft01CACjGn5so1Y
	+sh2UunLJNzQfVB3I756VeeW6uWRZOA5zAiV8CxnjBQLQ42QuA1KF+zL2E1Ti8O7nIoE
	3ZvJqW+Az2Cty1dBnnxbdj8cR/xY2CKDmXT9Pe3s05T5IEQFo95eec+We4JhBRLD6blO
	cq/fGsyPCEU7f7l1G5GjAIhGh/D9LyJnxvThPaAfoZWx8giZd73PBDCg/vusrWxbi0qL
	fObHPeqz7lx+O3FygjbfjpzBQfolaDJKx4JjQsiJtD6aVVB43BTYZghljiaJf1vX+6oj
	973Q==
X-Gm-Message-State: ABUngvcLStNLO5iN95Vkl7iEQIXHM4zusUeejAo5LKncE2Hj0marPefivf+TBtN1mrmKzcUPxhkp0YWO7egxTQ==
X-Received: by 10.202.3.193 with SMTP id 184mr23519254oid.177.1477847788385;
	Sun, 30 Oct 2016 10:16:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Sun, 30 Oct 2016 10:16:07 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 30 Oct 2016 10:16:07 -0700
X-Google-Sender-Auth: wEWbcpoEuOVdrylfcZnBNuL8nxk
Message-ID: <CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Sun, 30 Oct 2016 17:16:28 -0000
Content-Type: multipart/alternative; boundary=001a113ba1e075878505401840df

--001a113ba1e075878505401840df
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 5:25 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   not sure if i should have noticed this before, but i was building a
> number of python modules, and my collection of layers gave me two
> possibilities for python-django:
>
>   * python-django_git.bb      (meta-openstack)
>   * python-django_1.9.7.bb    (meta-python)
>
>   i simply assumed that any "git"-versioned recipe would typically
> take precedence over a fixed version recipe, so i was surprised to see
> that what was built was python-django-1.8.6. huh?
>
>   then i looked at the recipe from meta-openstack, and it contained
> the lines:
>
>   PV =3D "1.8.6"
>   SRCREV =3D "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
>
>   SRC_URI =3D " \
>       git://github.com/django/django.git;branch=3Dstable/1.8.x \
>       "
>
> am i right in being a bit confused by that? i checked out the github
> repo, and it has branches "stable/1.8.x", and also "stable/1.9.x" and
> "stable/1.10.x". so what is that supposed to mean?
>
>   am i right in assuming that a "git" recipe will (in the absence of
> any PREFERRED_VERSION settings or other overriding settings) always be
> considered before a fixed version recipe? and is that why i got this
> (for me) unexpected result?
>

Bitbake selects default versions via DEFAULT_VERSION, PREFERRED_VERSION,
and lacking both, a na=C3=AFve version comparison. There=E2=80=99s nothing =
magic to
select or not select an _git recipe.

It=E2=80=99s been a very common pattern for the _git recipe to be the devel=
opment
version / branch HEAD, to be used only when explicitly selected, whereas
the versioned recipes are stable and versioned, so are appropriate
defaults. That said, there are also _git recipes that set specific
versions, and version recipes that use git to fetch that version. There=E2=
=80=99s a
lack of consistency in that regard, but what you were surprised by has
basically been the expected, default convention in the past, not the
exception.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ba1e075878505401840df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Oct 30, 2016 at 5:25 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 not sure if i should have noticed this before, but i was building a<=
br>
number of python modules, and my collection of layers gave me two<br>
possibilities for python-django:<br>
<br>
=C2=A0 * <a href=3D"http://python-django_git.bb" rel=3D"noreferrer" target=
=3D"_blank">python-django_git.bb</a>=C2=A0 =C2=A0 =C2=A0 (meta-openstack)<b=
r>
=C2=A0 * <a href=3D"http://python-django_1.9.7.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python-django_1.9.7.bb</a>=C2=A0 =C2=A0 (meta-python)<br>
<br>
=C2=A0 i simply assumed that any &quot;git&quot;-versioned recipe would typ=
ically<br>
take precedence over a fixed version recipe, so i was surprised to see<br>
that what was built was python-django-1.8.6. huh?<br>
<br>
=C2=A0 then i looked at the recipe from meta-openstack, and it contained<br=
>
the lines:<br>
<br>
=C2=A0 PV =3D &quot;1.8.6&quot;<br>
=C2=A0 SRCREV =3D &quot;<wbr>80b7e9d09f2d23209b591288f9b2cf<wbr>3eb3d927c8&=
quot;<br>
<br>
=C2=A0 SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/django/django.git;b=
ranch=3Dstable/1.8.x" rel=3D"noreferrer" target=3D"_blank">github.com/djang=
o/<wbr>django.git;branch=3Dstable/1.8.x</a> \<br>
=C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
am i right in being a bit confused by that? i checked out the github<br>
repo, and it has branches &quot;stable/1.8.x&quot;, and also &quot;stable/1=
.9.x&quot; and<br>
&quot;stable/1.10.x&quot;. so what is that supposed to mean?<br>
<br>
=C2=A0 am i right in assuming that a &quot;git&quot; recipe will (in the ab=
sence of<br>
any PREFERRED_VERSION settings or other overriding settings) always be<br>
considered before a fixed version recipe? and is that why i got this<br>
(for me) unexpected result?<br></blockquote><div><br></div><div>Bitbake sel=
ects default versions via DEFAULT_VERSION, PREFERRED_VERSION, and lacking b=
oth, a na=C3=AFve version comparison. There=E2=80=99s nothing magic to sele=
ct or not select an _git recipe.</div><div><br></div><div>It=E2=80=99s been=
 a very common pattern for the _git recipe to be the development version / =
branch HEAD, to be used only when explicitly selected, whereas the versione=
d recipes are stable and versioned, so are appropriate defaults. That said,=
 there are also _git recipes that set specific versions, and version recipe=
s that use git to fetch that version. There=E2=80=99s a lack of consistency=
 in that regard, but what you were surprised by has basically been the expe=
cted, default convention in the past, not the exception.</div></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christoph=
er Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded,=
 OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graph=
ics</div>
</div></div>

--001a113ba1e075878505401840df--
