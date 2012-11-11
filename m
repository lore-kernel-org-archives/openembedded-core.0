Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TXh72-0001fx-Is
	for openembedded-core@lists.linuxtogo.org;
	Mon, 12 Nov 2012 00:38:53 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so3553872pbb.6
	for <openembedded-core@lists.linuxtogo.org>;
	Sun, 11 Nov 2012 15:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=v/IYOqUJwfAXchsmvbfI2NJf+Isd2iWmGprGrQEm3JA=;
	b=SYKH7GsqG9m8SxHJV0LamL5sGB8mvRPmX+7JfGja3tBx7L3n0eQWda8WwyDYADoRHV
	en85Rw+K8gobN8DdDDN9XCxkzy5DsS7LWkxgp66quZZVe0YJw28phx7WQZ4qPh8wi/az
	enjVf5jeHzr+UqgQN6m/DsaT717ZqbqJYEiDFGuVH6COtDVLYKmxeYJp3LricjVpuxtO
	RB71hR13S7fDhBeD7v0rMH2Lv8MYf/1MInHbzovnzdClABHe1qdqyzrWwVSEc9zB33KG
	YsyuO+UchhrdqnTGvmFH1HT0MwxGAdoWgAjyaemF7gAybOb9CnFB9IfFkzDElbN78Wwy
	ocVA==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr52043494pbc.130.1352676295418; Sun,
	11 Nov 2012 15:24:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Sun, 11 Nov 2012 15:24:55 -0800 (PST)
In-Reply-To: <4701269.Boc8pSq2zM@helios>
References: <12301427.Yf0uchSh3U@helios> <2026428.K88ggMmWnu@helios>
	<20121111201613.GB3407@jama.jama.net> <4701269.Boc8pSq2zM@helios>
Date: Sun, 11 Nov 2012 21:24:55 -0200
X-Google-Sender-Auth: uX67lbaEpEhzub2R9DODi-Z1PtQ
Message-ID: <CAP9ODKoiaAJzAZEcH0doQkNZSXuqaOzM0_rsopLCswR-uHOOAA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.linuxtogo.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe] OE-Classic recipe migration status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Nov 2012 23:38:54 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85c15a3b904ce407eea

--e89a8ff1c85c15a3b904ce407eea
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 11, 2012 at 6:49 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Sunday 11 November 2012 21:16:13 Martin Jansa wrote:
> > On Sun, Nov 11, 2012 at 07:58:09PM +0000, Paul Eggleton wrote:
> > > On Sunday 11 November 2012 20:52:26 Martin Jansa wrote:
> > > > I've noticed quite a few recipes listed here, which does exist in
> some
> > > > layer (recipes mostly from meta-fso, meta-aurora, meta-shr), should I
> > > > remove them from that wiki page or add layer name in 2nd column?
> > >
> > > I did have all the layers in meta-smartphone included in the list I
> used
> > > to
> > > filter this one, so if there are items that somehow didn't get removed
> I'd
> > > like to figure out why. Can you list them here so I can look into that?
> >
> > Ah sorry, you're probably right
> >
> > I've noticed e.g this:
> > libfsobasics  [distro]
> > libfsoresource        [distro]
> > libfsosystem  [distro]
> > libfsotransport       [distro]
> > but those are now provided by single libfsoframework recipe and I've
> > forgot this change
> >
> https://github.com/shr-distribution/meta-smartphone/commit/0298befc97dc5dca2
> > a3721fb0ff9d4caf8d24f84
> >
> > So I'll just update [distro] flag to something like obsoleted by
> > libfsoframework.
>
> Ah ok, sounds good.
>
> > The rest is probably also not 1:1 like qfsodbusxml2cpp-native
> > ./meta-fso/recipes-freesmartphone/freesmartphone/qfsodbusxml2cpp_git.bb
> >
> > Maybe you can try to update scripts to show matches after "-native"
> > suffix strip?
>
> I'd prefer to handle this manually - there are cases when newer recipes
> haven't been BBCLASSEXTENDed to handle -native so I've been checking this
> by
> hand.
>

You might grep for it and match it properly. So it drops a manual step.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c85c15a3b904ce407eea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 11, 2012 at 6:49 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
On Sunday 11 November 2012 21:16:13 Martin Jansa wrote:<br>
<div class=3D"im">&gt; On Sun, Nov 11, 2012 at 07:58:09PM +0000, Paul Eggle=
ton wrote:<br>
&gt; &gt; On Sunday 11 November 2012 20:52:26 Martin Jansa wrote:<br>
</div><div class=3D"im">&gt; &gt; &gt; I&#39;ve noticed quite a few recipes=
 listed here, which does exist in some<br>
&gt; &gt; &gt; layer (recipes mostly from meta-fso, meta-aurora, meta-shr),=
 should I<br>
&gt; &gt; &gt; remove them from that wiki page or add layer name in 2nd col=
umn?<br>
&gt; &gt;<br>
&gt; &gt; I did have all the layers in meta-smartphone included in the list=
 I used<br>
&gt; &gt; to<br>
&gt; &gt; filter this one, so if there are items that somehow didn&#39;t ge=
t removed I&#39;d<br>
&gt; &gt; like to figure out why. Can you list them here so I can look into=
 that?<br>
&gt;<br>
</div>&gt; Ah sorry, you&#39;re probably right<br>
&gt;<br>
&gt; I&#39;ve noticed e.g this:<br>
&gt; libfsobasics =A0[distro]<br>
&gt; libfsoresource =A0 =A0 =A0 =A0[distro]<br>
&gt; libfsosystem =A0[distro]<br>
&gt; libfsotransport =A0 =A0 =A0 [distro]<br>
&gt; but those are now provided by single libfsoframework recipe and I&#39;=
ve<br>
&gt; forgot this change<br>
&gt; <a href=3D"https://github.com/shr-distribution/meta-smartphone/commit/=
0298befc97dc5dca2" target=3D"_blank">https://github.com/shr-distribution/me=
ta-smartphone/commit/0298befc97dc5dca2</a><br>
&gt; a3721fb0ff9d4caf8d24f84<br>
&gt;<br>
&gt; So I&#39;ll just update [distro] flag to something like obsoleted by<b=
r>
&gt; libfsoframework.<br>
<br>
Ah ok, sounds good.<br>
<br>
&gt; The rest is probably also not 1:1 like qfsodbusxml2cpp-native<br>
&gt; ./meta-fso/recipes-freesmartphone/freesmartphone/<a href=3D"http://qfs=
odbusxml2cpp_git.bb" target=3D"_blank">qfsodbusxml2cpp_git.bb</a><br>
&gt;<br>
&gt; Maybe you can try to update scripts to show matches after &quot;-nativ=
e&quot;<br>
&gt; suffix strip?<br>
<br>
I&#39;d prefer to handle this manually - there are cases when newer recipes=
<br>
haven&#39;t been BBCLASSEXTENDed to handle -native so I&#39;ve been checkin=
g this by<br>
hand.<br></blockquote><div><br></div><div>You might grep for it and match i=
t properly. So it drops a manual step.</div><div>=A0</div></div>-- <br>Otav=
io Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. =
Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_bl=
ank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br"=
 target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c85c15a3b904ce407eea--
