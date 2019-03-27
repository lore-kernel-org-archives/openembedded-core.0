Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0185A7D088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:42:30 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id z126so818490itd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9S2KIyrWceKTnbwDq9CWY1rqBNC0zWA7cCe2TcOIKyQ=;
	b=txwJrsWSrXdbOPzMzJ639WzpSBYJm5OZgtU7n7Qz/f3R7bV3JsOhNK1yzokF1fCVpY
	6C4gvNzCR69HNJPyMig4gPN2TZzmvpg1AcL+Bdeuhu+lSC6gn0sAjJdmpAcRx5GwPyB0
	W93y2/CALOFQRfHRAj4Pia7IZwpv8V9fH5FMEGcGYimq8A5DHwmv9RtgF3DRj4mRv1NG
	l0/z+vVGgpcpEGEwRueYoY0utXZB8acpn4TjZG+5p8MutvWq+mevv0AZtV+a+m7JLL+M
	wyl5aJmj58/rN8L5NlWp1YFsUXOIK6cqMfIoad15TBItroxuYi0b4XNRPcT+5PYzF+Nb
	OPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9S2KIyrWceKTnbwDq9CWY1rqBNC0zWA7cCe2TcOIKyQ=;
	b=QTp2onQq8IGfCWFlW3H26NdM4htHyW9pTBfRYc+dttvphaUYWHuwxo0JUitZJwDmqD
	g1OQ6WFLQ4r+UpOENYxatAB7q7LKbVUpa7bz2o2z6kFvzJliLbcin55BSejCOLj9ZSH3
	G/OWXKJ9YLy3HkF+bPrTm+OnxNxM5N659JC0U6RFstmRLnHsz6H7EWWO7MARSyUr294X
	UiN15UOGObQD44z40mdRJl05qCteieTq50C7hcqLZlKy6anQBCW9baL0/Xx3ju4SGeWN
	rY+Qc4TE+VlguULjfYakSzTq9l4IwANPbrdKoiJv/+8CcDqtoVdVQdD+QNwiWAsLEFnE
	kg0Q==
X-Gm-Message-State: APjAAAXKDW2FfUdE/I7LoQ2i0AicwuvSbo951/2OV/JNVlswoE4oqK8n
	0fn2TUNu+Ielmpx63qhzB6wv4Dd0uSymaND8hL4=
X-Google-Smtp-Source: APXvYqxG9fMCll9FsB+bXSAVjnZM06pKN6L/gHAA3LDyAINtEGbOjHTihLnrYulBU9Yi+jD1zPI84Jei6y+bG6OQlwY=
X-Received: by 2002:a24:1394:: with SMTP id 142mr4417166itz.54.1553701351840; 
	Wed, 27 Mar 2019 08:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <1553690811-26575-1-git-send-email-vincent.prince.fr@gmail.com>
	<CAO5Uq5TudhS3=eZGYS_M++VqV1kWc0sLhNccumu7VCQhn_Ht7w@mail.gmail.com>
In-Reply-To: <CAO5Uq5TudhS3=eZGYS_M++VqV1kWc0sLhNccumu7VCQhn_Ht7w@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 27 Mar 2019 16:42:20 +0100
Message-ID: <CAB2nKc9Jj=Q+RHSXOyjaRtm34nwhN1htiEJYJaA6RNY7s5g5HA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Mar 2019 15:42:31 -0000
Content-Type: multipart/alternative; boundary="00000000000029e23705851549ed"

--00000000000029e23705851549ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ouch :/
Thanks Alex, sending V2.

Le mer. 27 mars 2019 =C3=A0 16:26, Alex Kiernan <alex.kiernan@gmail.com> a
=C3=A9crit :

> On Wed, Mar 27, 2019 at 12:47 PM Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > libpcre2 is needed to enable grep option to journalctl.
> >
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd_241.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_241.bb
> b/meta/recipes-core/systemd/systemd_241.bb
> > index a12b9ab..9e05944 100644
> > --- a/meta/recipes-core/systemd/systemd_241.bb
> > +++ b/meta/recipes-core/systemd/systemd_241.bb
> > @@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] =3D
> "-Dnss-mymachines=3Dtrue,-Dnss-mymachines=3Dfalse"
> >  PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Df=
alse"
> >  PACKAGECONFIG[openssl] =3D "-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,openssl=
"
> >  PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGIN=
S}"
> > +PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dtrue,libpcre2"
>
> You've got "pcre2=3Dtrue" in both arms of the PACKAGECONFIG.
>
> >  PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
> >  PACKAGECONFIG[portabled] =3D "-Dportabled=3Dtrue,-Dportabled=3Dfalse"
> >  PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Dtrue,-Dqrencode=3Dfalse,qren=
code"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan
>

--00000000000029e23705851549ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ouch :/</div><div>Thanks Alex, sending V2.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0mer. 27 mars 2019 =C3=A0=C2=A016:26, Alex Kiernan &lt;<a href=3D"mailto:=
alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Mar 27, =
2019 at 12:47 PM Vincent Prince<br>
&lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank">vincen=
t.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; libpcre2 is needed to enable grep option to journalctl.<br>
&gt;<br>
&gt; Signed-off-by: Vincent Prince &lt;<a href=3D"mailto:vincent.prince.fr@=
gmail.com" target=3D"_blank">vincent.prince.fr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_241.bb</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_241.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_241.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_241.bb" rel=3D"noreferrer" target=3D"=
_blank">systemd_241.bb</a><br>
&gt; index a12b9ab..9e05944 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_241.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_241.bb</a><br>
&gt; @@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] =3D &quot;-Dnss-myma=
chines=3Dtrue,-Dnss-mymachines=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[nss-resolve] =3D &quot;-Dnss-resolve=3Dtrue,-Dnss-=
resolve=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[openssl] =3D &quot;-Dopenssl=3Dtrue,-Dopenssl=3Dfa=
lse,openssl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[pam] =3D &quot;-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,$=
{PAM_PLUGINS}&quot;<br>
&gt; +PACKAGECONFIG[pcre2] =3D &quot;-Dpcre2=3Dtrue,-Dpcre2=3Dtrue,libpcre2=
&quot;<br>
<br>
You&#39;ve got &quot;pcre2=3Dtrue&quot; in both arms of the PACKAGECONFIG.<=
br>
<br>
&gt;=C2=A0 PACKAGECONFIG[polkit] =3D &quot;-Dpolkit=3Dtrue,-Dpolkit=3Dfalse=
&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[portabled] =3D &quot;-Dportabled=3Dtrue,-Dportable=
d=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[qrencode] =3D &quot;-Dqrencode=3Dtrue,-Dqrencode=
=3Dfalse,qrencode&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--00000000000029e23705851549ed--
