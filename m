Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAB777F80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 21:37:48 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id h4so9539549oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i8vvbZANzMKZQQ8e/PR6cW/5rspHya6GjCxjD4TG9X0=;
	b=Dm9PgSpe1qilvyj0n9R83Hrh3DDAWflNqXjYrW+Np2ukSecx3/9Klk7PWkW54ukjMJ
	CR9PchmEz39vXGvU44deBSpU9ZwxDpE1KqPaF78750/bVJd2ywmgsmYGDwTR797p/Hyx
	IrR5TzPC1l/SDl2d3RHW8Zl0ncMHnsUgaPr5DGOzVFxAohAtzRtZ2VB7Qxdz0fkX+w4U
	3fnlU8IyaAyq1krQmEpuxFOyuzSEM7phVy0cU8SY26Tsv+vm+FJ9gY1oA8XlB6wYHL2V
	+MM0uWiZ2TtsfYmX8NXbjsdhvj5eKqkMb0rIB2iUnzH49Fgd1N6ocvCIf9l4WL3MZFUj
	UfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i8vvbZANzMKZQQ8e/PR6cW/5rspHya6GjCxjD4TG9X0=;
	b=WNscDA/VXXG/dsYLfJhpWuWDFjZxHd7d23w/rb/0BnFLE+nQufNlM4nnNukJA6wAB9
	eAYZkVJIV/QJHGD3FoV2TCs3v0zfo/VtnORCKrOIjyswWSDwFkxzmU2N2HHSRVmewObo
	RTC1tAFZxETObEuZf6KYVHQHBQM+G7prezZtxE6221Jss2vGjj7NlHVOf73wEdX+fsLC
	Mx2MnAMD55lPrKULpb9nhLDcx1rATjR4xR0YlGmp8rF/LkXCx5nQQ6EKLmJuH7yXy/iy
	nKz4XXdGyabZpz2H8VBrDfdDkhvUVLSgRM+IXZaIaaQSZYqiVzStEItBD7iEocFcvdKr
	U+BQ==
X-Gm-Message-State: AODbwcD/a4GFYwVXm1Px7vNsb/fYyX40RjLoG6n+adfJjCKNkzNkhsPa
	00fVN2mSrWN2gfii59vhlKqGBdud6A==
X-Received: by 10.157.31.71 with SMTP id x7mr3729590otx.217.1495143470229;
	Thu, 18 May 2017 14:37:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.226 with HTTP; Thu, 18 May 2017 14:37:29 -0700 (PDT)
In-Reply-To: <CAMKF1sp9VFkd5+4HcYpgnZ+HhOoarKJNrc=--DTsmGYJyps-2g@mail.gmail.com>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
	<20170518181957.GU28053@denix.org>
	<CAMKF1sp9VFkd5+4HcYpgnZ+HhOoarKJNrc=--DTsmGYJyps-2g@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 18 May 2017 14:37:29 -0700
Message-ID: <CABcZAN=wku6-Z-T2w-OWzpXSxghB_NRUdYx3d9nn2STpUrYBpw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Thu, 18 May 2017 21:37:51 -0000
Content-Type: multipart/alternative; boundary="001a113710bc6e70e9054fd33799"

--001a113710bc6e70e9054fd33799
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 11:57 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 18, 2017 at 11:19 AM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > On Thu, May 18, 2017 at 07:34:23PM +0200, Enrico Scholz wrote:
> >> build fails else with
> >>
> >> | + make -j 8 -l 6 cc=3Dccache gcc
> >> | make: *** No rule to make target 'gcc'.  Stop.
> >>
> >> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> >> ---
> >>  meta/recipes-extended/tzcode/tzcode-native_2017b.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> >> index 2084f79..165d2c6 100644
> >> --- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> >> +++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> >> @@ -18,7 +18,7 @@ S =3D "${WORKDIR}"
> >>
> >>  inherit native
> >>
> >> -EXTRA_OEMAKE +=3D "cc=3D${CC}"
> >> +EXTRA_OEMAKE +=3D "cc=3D'${CC}'"
> >
> > Should these be double-quotes around ${CC}?
>
> I think this should work as such.


Indeed, it=E2=80=99s expanded by bitbake, not the shell, so which quotes do=
n=E2=80=99t
matter in that regard, and it=E2=80=99s syntactically cleaner to use differ=
ent
quotes than those used for the variable as a whole.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113710bc6e70e9054fd33799
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 18, 2017 at 11:57 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, May =
18, 2017 at 11:19 AM, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.o=
rg">denis@denix.org</a>&gt; wrote:<br>
&gt; On Thu, May 18, 2017 at 07:34:23PM +0200, Enrico Scholz wrote:<br>
&gt;&gt; build fails else with<br>
&gt;&gt;<br>
&gt;&gt; | + make -j 8 -l 6 cc=3Dccache gcc<br>
&gt;&gt; | make: *** No rule to make target &#39;gcc&#39;.=C2=A0 Stop.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@s=
igma-chemnitz.de">enrico.scholz@sigma-chemnitz.<wbr>de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native=
_2017b.bb" rel=3D"noreferrer" target=3D"_blank">t<wbr>zcode-native_2017b.bb=
</a> | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/<wbr>tzcode/<a href=3D"http://t=
zcode-native_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-native_2=
017b.bb</a> b/meta/recipes-extended/<wbr>tzcode/<a href=3D"http://tzcode-na=
tive_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-native_2017b.bb<=
/a><br>
&gt;&gt; index 2084f79..165d2c6 100644<br>
&gt;&gt; --- a/meta/recipes-extended/<wbr>tzcode/<a href=3D"http://tzcode-n=
ative_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-native_2017b.bb=
</a><br>
&gt;&gt; +++ b/meta/recipes-extended/<wbr>tzcode/<a href=3D"http://tzcode-n=
ative_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-native_2017b.bb=
</a><br>
&gt;&gt; @@ -18,7 +18,7 @@ S =3D &quot;${WORKDIR}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit native<br>
&gt;&gt;<br>
&gt;&gt; -EXTRA_OEMAKE +=3D &quot;cc=3D${CC}&quot;<br>
&gt;&gt; +EXTRA_OEMAKE +=3D &quot;cc=3D&#39;${CC}&#39;&quot;<br>
&gt;<br>
&gt; Should these be double-quotes around ${CC}?<br>
<br>
</span>I think this should work as such.</blockquote></div><br>Indeed, it=
=E2=80=99s expanded by bitbake, not the shell, so which quotes don=E2=80=99=
t matter in that regard, and it=E2=80=99s syntactically cleaner to use diff=
erent quotes than those used for the variable as a whole.<br>-- <br><div cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Ment=
or Graphics</div></div></div></div>
</div></div>

--001a113710bc6e70e9054fd33799--
