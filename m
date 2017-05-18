Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3874B7808D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 22:38:24 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id w10so9740903oif.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 15:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=waCOp3t1x6cj+AT5fPoIp+vvRmHk2/tPQZlkPO2Wi8s=;
	b=qJXOsxSSTu9zw+ao1xpcy6QCPUt7IQUtFVSlE76T4fausKZ6LIOj6aT7yuFQSKqqgY
	KzwtO+aUqw7Kp+ji7AwobvhbPDKStPDmUb/5hOUk8MH8mnj4OtQTt43wHcUDFpZxqy9d
	U32yLJtb4Q8/eb0OOS3EUh9fcJlqvc2N9E/xr1Um/SXPsTcGWgH8dXY2Mx9DEnW6x7+v
	SbTqtVcLZkmjbSu9XE8CtgIhZ6zs2uMFyJMKZO5n3z65TdwGtHytSDyIe9IBZra38AjW
	pVim+2/nkyBsauKCn2qjvg0RXm1V8G6IN/AQWGPoILIJKjS+1VDqw2x590w0F3CWtIar
	s+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=waCOp3t1x6cj+AT5fPoIp+vvRmHk2/tPQZlkPO2Wi8s=;
	b=EcFjpMoUqQBM1+ICr1lnDpXjQVIBb6xL6fVnlFdY317mguM6xnjI61F3dyEIlFZPy7
	u865Kq0GyFgoP3w7b+Ub8WlGSB358rmPa4614nGNbM0SFlxKLJt92nv6WrYwwQGFMm4C
	DB94L+sGx6iu3temtcZ4t4h8HtP/ZvPXrlucN3gE+Mjg6QWcFJIfDz2a4cEu5xyMAWcA
	Azjgk0KxtTDrVy7TKOAEEPCmIQK0gHn/uM9ui1NBxyGRmhpb/k7OsM4SCSOFNLCp8lBc
	lrfAfyx/EeWjjS+0/y0YoFByVzL8MMLsY9PbkhEo2sN66PKg+uZ/p/E1IkW6rvQaRz6t
	/w4g==
X-Gm-Message-State: AODbwcBOFyFrInyt/Nu0tOtnRhDphhI7mPQpTwDbrHQBfXw7CrTkicH/
	HCdTTdvyjPNijgrotjw66goHQDn9CA==
X-Received: by 10.157.50.165 with SMTP id u34mr3879613otb.8.1495147106128;
	Thu, 18 May 2017 15:38:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.226 with HTTP; Thu, 18 May 2017 15:38:05 -0700 (PDT)
In-Reply-To: <20170518215454.GV28053@denix.org>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
	<20170518181957.GU28053@denix.org>
	<CAMKF1sp9VFkd5+4HcYpgnZ+HhOoarKJNrc=--DTsmGYJyps-2g@mail.gmail.com>
	<CABcZAN=wku6-Z-T2w-OWzpXSxghB_NRUdYx3d9nn2STpUrYBpw@mail.gmail.com>
	<20170518215454.GV28053@denix.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 18 May 2017 15:38:05 -0700
Message-ID: <CABcZAN=YL2fx4sk62hReh=WD8xWuaAjKRRjCciZ7q1VyHXs6ZQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Thu, 18 May 2017 22:38:25 -0000
Content-Type: multipart/alternative; boundary="001a114752a625d983054fd41086"

--001a114752a625d983054fd41086
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 2:54 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, May 18, 2017 at 02:37:29PM -0700, Christopher Larson wrote:
> > On Thu, May 18, 2017 at 11:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > > On Thu, May 18, 2017 at 11:19 AM, Denys Dmytriyenko <denis@denix.org>
> > > wrote:
> > > > On Thu, May 18, 2017 at 07:34:23PM +0200, Enrico Scholz wrote:
> > > >> build fails else with
> > > >>
> > > >> | + make -j 8 -l 6 cc=3Dccache gcc
> > > >> | make: *** No rule to make target 'gcc'.  Stop.
> > > >>
> > > >> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > > >> ---
> > > >>  meta/recipes-extended/tzcode/tzcode-native_2017b.bb | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> > > b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> > > >> index 2084f79..165d2c6 100644
> > > >> --- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> > > >> +++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
> > > >> @@ -18,7 +18,7 @@ S =3D "${WORKDIR}"
> > > >>
> > > >>  inherit native
> > > >>
> > > >> -EXTRA_OEMAKE +=3D "cc=3D${CC}"
> > > >> +EXTRA_OEMAKE +=3D "cc=3D'${CC}'"
> > > >
> > > > Should these be double-quotes around ${CC}?
> > >
> > > I think this should work as such.
> >
> > Indeed, it=E2=80=99s expanded by bitbake, not the shell, so which quote=
s don=E2=80=99t
> > matter in that regard, and it=E2=80=99s syntactically cleaner to use di=
fferent
> > quotes than those used for the variable as a whole.
>
> Unless ${CC} has shell variables inside for later expansion, isn't it?


IMO doing so is a bug, as it relies on particulars of precisely when and
where the shell variable is expanded. Doing so often results in having to
escape it a precise number of times, depending on what context where you
want it expanded. More trouble than it=E2=80=99s worth, in my opinion. *shr=
ug*
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114752a625d983054fd41086
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 18, 2017 at 2:54 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><=
div class=3D"">On Thu, May 18, 2017 at 02:37:29PM -0700, Christopher Larson=
 wrote:<br>
&gt; On Thu, May 18, 2017 at 11:57 AM, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, May 18, 2017 at 11:19 AM, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denis@denix.org">denis@denix.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; On Thu, May 18, 2017 at 07:34:23PM +0200, Enrico Scholz wrot=
e:<br>
&gt; &gt; &gt;&gt; build fails else with<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; | + make -j 8 -l 6 cc=3Dccache gcc<br>
&gt; &gt; &gt;&gt; | make: *** No rule to make target &#39;gcc&#39;.=C2=A0 =
Stop.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enric=
o.scholz@sigma-chemnitz.de">enrico.scholz@sigma-chemnitz.<wbr>de</a>&gt;<br=
>
&gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt;&gt;=C2=A0 meta/recipes-extended/tzcode/<a href=3D"http://tzc=
ode-native_2017b.bb" rel=3D"noreferrer" target=3D"_blank">t<wbr>zcode-nativ=
e_2017b.bb</a> | 2 +-<br>
&gt; &gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-extended/<wbr>tzcode/<a href=
=3D"http://tzcode-native_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzc=
ode-native_2017b.bb</a><br>
&gt; &gt; b/meta/recipes-extended/<wbr>tzcode/<a href=3D"http://tzcode-nati=
ve_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-native_2017b.bb</a=
><br>
&gt; &gt; &gt;&gt; index 2084f79..165d2c6 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/recipes-extended/<wbr>tzcode/<a href=3D"http:=
//tzcode-native_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-nativ=
e_2017b.bb</a><br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-extended/<wbr>tzcode/<a href=3D"http:=
//tzcode-native_2017b.bb" rel=3D"noreferrer" target=3D"_blank">tzcode-nativ=
e_2017b.bb</a><br>
&gt; &gt; &gt;&gt; @@ -18,7 +18,7 @@ S =3D &quot;${WORKDIR}&quot;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 inherit native<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; -EXTRA_OEMAKE +=3D &quot;cc=3D${CC}&quot;<br>
&gt; &gt; &gt;&gt; +EXTRA_OEMAKE +=3D &quot;cc=3D&#39;${CC}&#39;&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Should these be double-quotes around ${CC}?<br>
&gt; &gt;<br>
&gt; &gt; I think this should work as such.<br>
&gt;<br>
&gt; Indeed, it=E2=80=99s expanded by bitbake, not the shell, so which quot=
es don=E2=80=99t<br>
&gt; matter in that regard, and it=E2=80=99s syntactically cleaner to use d=
ifferent<br>
&gt; quotes than those used for the variable as a whole.<br>
<br>
</div></div>Unless ${CC} has shell variables inside for later expansion, is=
n&#39;t it?</blockquote></div><br>IMO doing so is a bug, as it relies on pa=
rticulars of precisely when and where the shell variable is expanded. Doing=
 so often results in having to escape it a precise number of times, dependi=
ng on what context where you want it expanded. More trouble than it=E2=80=
=99s worth, in my opinion. *shrug*<br>-- <br><div class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEm=
bedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div>=
</div></div>
</div></div>

--001a114752a625d983054fd41086--
