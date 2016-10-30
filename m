Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E3CD071997
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 19:40:37 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v84so2226010oie.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BbNhm+0RU4RvHt9G1MiSTm/qf8l4GNNU55XzwRalWY8=;
	b=IMUESnPa54/Xo1BDeeorv2J7odNXh8EpvvVAICIwAsxSDhaH3C5nqIiImoM0iZ8NX0
	8N/5v4rrOTXPONg38E2Vap3ovOYrj1W9L50WvaQvPyquBXYrw966924xHjaQSHWltRcq
	btP0crA2o/SVJlR86WyJHnBvQ/0VpjUUfhR5oAEgX7rfMBtsJNBp4i0hoomg/vCQQqIy
	QIh6S15hsDyWH0O0aUcRifNwXLkofwoYChxL1uoP0p/v7o+cZhSy3gXUgOSSZ1L9XS3g
	SlycUmcC1pH4ZVwy03yW1eryeftMlC4XdeZCOqQ/ifVZV2olOV+GJKKJ5XuwDyfnckRX
	yfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=BbNhm+0RU4RvHt9G1MiSTm/qf8l4GNNU55XzwRalWY8=;
	b=covesTrEe8SpxNUxzhcXcAkDKP8OLRWHXlSm7bam8oENEUHmm1JWpKzJclGpCCGcYo
	ZcWmO6BZBm+I9vr90Z1gtKdpcsEwSyg/im/6iZudEw/WJ3yi3CGgEMJNXxPCktIC1yrl
	Ri6pe+r/BWyV35ko8Q4VPZL5JaFHU755pQTiJudpStFBfAD59Br3ivVaz9rc33zF3jQH
	q5mSL7+uY07qG+6EdVCmufMXLH6Y+JXmzVt76qff+Nw/Ri/KIsRs3zNlo85azAbvcuT7
	AAHpNoMzJLhroPZEwXq6pHb6LdvQmwq0trnX0wBqNiy98+SsidB76Otc/nq6DU4tIWs+
	cBxA==
X-Gm-Message-State: ABUngvc0P0knXWYtJ64v9HYn5qlbQRNcryKVS9SUgPJw547hzY/3nPLdn5sBcNeiyUyF4gEXEpe5I0Q5H29BGA==
X-Received: by 10.202.74.88 with SMTP id x85mr16906171oia.77.1477856439042;
	Sun, 30 Oct 2016 12:40:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Sun, 30 Oct 2016 12:40:18 -0700 (PDT)
In-Reply-To: <CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
	<CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 30 Oct 2016 12:40:18 -0700
X-Google-Sender-Auth: irq_FGOaHAeKd9tDUk8mMmsVJpo
Message-ID: <CABcZAN=n9sJH5Bvh4Ka69gEa3y5iDBt=7LRg6AA0PeMoEdJRAg@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 19:40:38 -0000
Content-Type: multipart/alternative; boundary=001a113db35014072e05401a446d

--001a113db35014072e05401a446d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 10:16 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Sun, Oct 30, 2016 at 5:25 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
>>
>>   not sure if i should have noticed this before, but i was building a
>> number of python modules, and my collection of layers gave me two
>> possibilities for python-django:
>>
>>   * python-django_git.bb      (meta-openstack)
>>   * python-django_1.9.7.bb    (meta-python)
>>
>>   i simply assumed that any "git"-versioned recipe would typically
>> take precedence over a fixed version recipe, so i was surprised to see
>> that what was built was python-django-1.8.6. huh?
>>
>>   then i looked at the recipe from meta-openstack, and it contained
>> the lines:
>>
>>   PV =3D "1.8.6"
>>   SRCREV =3D "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"
>>
>>   SRC_URI =3D " \
>>       git://github.com/django/django.git;branch=3Dstable/1.8.x \
>>       "
>>
>> am i right in being a bit confused by that? i checked out the github
>> repo, and it has branches "stable/1.8.x", and also "stable/1.9.x" and
>> "stable/1.10.x". so what is that supposed to mean?
>>
>>   am i right in assuming that a "git" recipe will (in the absence of
>> any PREFERRED_VERSION settings or other overriding settings) always be
>> considered before a fixed version recipe? and is that why i got this
>> (for me) unexpected result?
>>
>
> Bitbake selects default versions via DEFAULT_VERSION, PREFERRED_VERSION,
> and lacking both, a na=C3=AFve version comparison. There=E2=80=99s nothin=
g magic to
> select or not select an _git recipe.
>

s/DEFAULT_VERSION/DEFAULT_PREFERENCE/
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113db35014072e05401a446d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Oct 30, 2016 at 10:16 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Sun, Oct 30, 2016 at 5:25 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
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
=C2=A0 SRCREV =3D &quot;80b7e9d09f2d23209b591288f9b2c<wbr>f3eb3d927c8&quot;=
<br>
<br>
=C2=A0 SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/django/django.git;b=
ranch=3Dstable/1.8.x" rel=3D"noreferrer" target=3D"_blank">github.com/djang=
o/django<wbr>.git;branch=3Dstable/1.8.x</a> \<br>
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
(for me) unexpected result?<br></blockquote><div><br></div></span><div>Bitb=
ake selects default versions via DEFAULT_VERSION, PREFERRED_VERSION, and la=
cking both, a na=C3=AFve version comparison. There=E2=80=99s nothing magic =
to select or not select an _git recipe.</div></blockquote></div><br>s/DEFAU=
LT_VERSION/DEFAULT_PREFERENCE/<br>-- <br><div class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113db35014072e05401a446d--
