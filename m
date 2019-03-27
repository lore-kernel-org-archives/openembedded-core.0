Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f172.google.com (mail-it1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id 702167D132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:10:53 +0000 (UTC)
Received: by mail-it1-f172.google.com with SMTP id z126so1305474itd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R+AYQYzECMb4Q9XaT2zcy5PKk1pfbpnqWmNneOx15g0=;
	b=tmPt/g/0N3TlWLhngt570EyQ5uxhETA9JuJnHmvKOnrl0aHX7IJ3MLJd8Pk21T2PIa
	4d3L/Z5AqEUXRiai1zvHrAWyQQOojg0kwjypEURbfbjIhWGpeZ3vODm3LYq7o+9Sq5g9
	v/jsM+Q9656QAuyWGgHi8TpVxd+0joJpIbKjJLbuKa1UXqZds0iY8mpeRCZg0tIsPsH/
	kIiLZfH43djZxezVJ9fsbNtsK+mkXT1Q3sPs2G1P/75lonxlDM16oypKC0zwW78m04Iy
	3gv5D/wG7UOtSeai2NumiHsqXFbBciw22Bx3wIKgNgx7i0lAow0n4CH+0sz8S8+DscwF
	csGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R+AYQYzECMb4Q9XaT2zcy5PKk1pfbpnqWmNneOx15g0=;
	b=bGBE4HrALH9Jh7iIdC23H+iwp5cOE+PkbguqFRVJhmSp2349PzfAholHubFrXiXNmE
	HuhEQDbZNQMfk6Pg8I0ZJTRetFZW67jS9ZgIpCijbRAwRM22AzMb4gTTUZV2jttTIc/i
	sd+/DqLkt4iRgcrPPmAg1aF0QzMtQnYWB4uXBO21nDpz9cHkGgCtsCMCcn/dIRyT+Dm+
	bh0C8Tvj/koxR+Cy6gZaS4Zn1dx7G9SEdGQ4o/NJsIp3t9bRiOFY0HLX9PWIcZ9fdoHD
	0gJYBh0BnqUBYiBe9YzOqQupEiPd2Pkex/JZhXgZ+Q0MmpqAw03SbaXxS2OuIzt29TaY
	32Yw==
X-Gm-Message-State: APjAAAUrHy11Ur72TbiIK+ja6m0Ve48n2DdfT+DiTQxYeIQPt8QsNOl1
	6llpvGwuTBd3XM+K2V/Kg9jatwGztJoXBjsixhs=
X-Google-Smtp-Source: APXvYqymYUa1+uNk4mYrlONl8qL18xTbQVp1BMd5OdVJF7RQcqjzWy0sg8VCnhYmghxXVskB6Lj1yyPIGj80f+TDP0o=
X-Received: by 2002:a24:1394:: with SMTP id 142mr4794373itz.54.1553706654275; 
	Wed, 27 Mar 2019 10:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <1553691563-28778-1-git-send-email-vincent.prince.fr@gmail.com>
	<CANNYZj_z8ZcXniKCB63Q82mcez7BnEcBkeF2=Z5JugjjK7zamw@mail.gmail.com>
In-Reply-To: <CANNYZj_z8ZcXniKCB63Q82mcez7BnEcBkeF2=Z5JugjjK7zamw@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 27 Mar 2019 18:10:43 +0100
Message-ID: <CAB2nKc9eDyJBAM-YFmBOUydumaLo131Rsf8SSxBe5BiHt36sVw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
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
X-List-Received-Date: Wed, 27 Mar 2019 17:10:53 -0000
Content-Type: multipart/alternative; boundary="00000000000036a08505851685f0"

--00000000000036a08505851685f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

I added those to fix issue raised by lcov recipe, I'll check again tomorrow=
.

Regards,
Vincent

Le mer. 27 mars 2019 =C3=A0 14:05, Alexander Kanavin <alex.kanavin@gmail.co=
m> a
=C3=A9crit :

> Can you specify in detail what the failure is please? It is not
> happening on the AB.
>
> Alex
>
> On Wed, 27 Mar 2019 at 13:59, Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> > ---
> >  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> > index 60499f7..85472a8 100644
> > --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> > +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> > @@ -20,6 +20,7 @@ DUMMYPROVIDES =3D "\
> >      libxml-parser-perl \
> >      perl-module-bytes \
> >      perl-module-carp \
> > +    perl-module-config \
> >      perl-module-constant \
> >      perl-module-data-dumper \
> >      perl-module-errno \
> > @@ -35,10 +36,12 @@ DUMMYPROVIDES =3D "\
> >      perl-module-getopt-long \
> >      perl-module-io-file \
> >      perl-module-overload \
> > +    perl-module-overloading \
> >      perl-module-posix \
> >      perl-module-thread-queue \
> >      perl-module-threads \
> >      perl-module-warnings \
> > +    perl-module-warnings-register \
> >      /bin/sh \
> >      /bin/bash \
> >      /usr/bin/env \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000036a08505851685f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alexander,=C2=A0<div dir=3D"auto"><br></div><div dir=
=3D"auto">I added those to fix issue raised by lcov recipe, I&#39;ll check =
again tomorrow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,=
=C2=A0</div><div dir=3D"auto">Vincent=C2=A0</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 27 mars 2019 =C3=
=A0 14:05, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">=
alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Can you specify in detail what the failure is please? It is=
 not<br>
happening on the AB.<br>
<br>
Alex<br>
<br>
On Wed, 27 Mar 2019 at 13:59, Vincent Prince<br>
&lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank" rel=3D=
"noreferrer">vincent.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Vincent Prince &lt;<a href=3D"mailto:vincent.prince.fr@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">vincent.prince.fr@gmail.com=
</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dum=
my.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">target-sdk-provides-=
dummy.bb</a> | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://target-sdk-provi=
des-dummy.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">target-sdk-pr=
ovides-dummy.bb</a> b/meta/recipes-core/meta/<a href=3D"http://target-sdk-p=
rovides-dummy.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">target-sd=
k-provides-dummy.bb</a><br>
&gt; index 60499f7..85472a8 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dum=
my.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">target-sdk-provides-=
dummy.bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dum=
my.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">target-sdk-provides-=
dummy.bb</a><br>
&gt; @@ -20,6 +20,7 @@ DUMMYPROVIDES =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libxml-parser-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-bytes \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-carp \<br>
&gt; +=C2=A0 =C2=A0 perl-module-config \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-constant \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-data-dumper \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-errno \<br>
&gt; @@ -35,10 +36,12 @@ DUMMYPROVIDES =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-getopt-long \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-io-file \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-overload \<br>
&gt; +=C2=A0 =C2=A0 perl-module-overloading \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-posix \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-thread-queue \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-threads \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 perl-module-warnings \<br>
&gt; +=C2=A0 =C2=A0 perl-module-warnings-register \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /bin/sh \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /bin/bash \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /usr/bin/env \<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000036a08505851685f0--
