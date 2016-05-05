Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id CE474731CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 18:22:53 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id m64so105606118lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/YDeEYdxaBq5i0Kv14ZZAJimAapT+N0u9J+9BT0Mm+Q=;
	b=rOQB8pVNByzysgQtBsafCCH0tUDYdvPWSZG128wKBWfrYE9/AsrwXKdIVq2kOzicGA
	An3GZxMGWylWQjiyfkMNMtt4mHmLy9eoZG0X/RxbZqwN4crz3XJ2T2vXB6zo0E5zccMj
	WGErS7uZFwqcsl2K0hRhxZEws3fdKndkfDs5X+XfQRrsx+pZvj8yEvXPBSCra+zovvZe
	U2RVaIS02R525YOTRLvosWxlhn5mgfEyRb54KgIzXqboPju+yn3n/q5GdZxx2dnfcBE7
	NiC8nT/oVrgyrkErWP+83wcwrYze8kBbf9vpwrxHkFxzT3YUWSmFQHQpUYFnCpl7lOAe
	M8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/YDeEYdxaBq5i0Kv14ZZAJimAapT+N0u9J+9BT0Mm+Q=;
	b=Ek8Y1FuIJKzoP/5bFOdG0SoIi3gVqU0naF2VXwCGbqD8cdfHr0x96ojfBLHh+74+1+
	jcuBVIifSaFq581Ycfn/7J0bRtwWoDPsZyWIacambdToqeQ+AYV8+javoobD8o/qpjtH
	ZZ/UTsDgdWj5vYrbySBP4GFfv3z2aKVNeKW00mHRNK3Z9RA5vbkExfqxbny6f/xE5lFy
	HoRqbEAZp5seAua6qRUaDFToOvfdazTZBQqdlGb00sJnzZT/rIM542qD+Ei9S7g+ZxfO
	pMgNrYfRNAmVMkWJ42tErrdHy02QSGmUovcMT8i1XKIv4tT2CrE+sezKLmOMk6g6imWp
	JvQQ==
X-Gm-Message-State: AOPr4FXStX0KVbLntViFJNT5JWNUowbreqSjgKAehAj9TQE04ZHh9O0QZfAWqwaaljKYwHcPc4Z+AiIMQ2tiJw==
X-Received: by 10.25.146.6 with SMTP id u6mr6700915lfd.60.1462472572947; Thu,
	05 May 2016 11:22:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Thu, 5 May 2016 11:22:23 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <4689592.jhB3FmLTaB@peggleto-mobl.ger.corp.intel.com>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160505105743.GA22250@jupiter.localdomain>
	<CAAPZna3uDZab3jtmQYkiR+DR4k5UN_OYhJHcod0G02rdsmtTUQ@mail.gmail.com>
	<4689592.jhB3FmLTaB@peggleto-mobl.ger.corp.intel.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 5 May 2016 15:22:23 -0300
Message-ID: <CAAPZna1wStNSgiuYwuSOOF7=f_54GOKrOiEhRMBiFeBygFSHpA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Thu, 05 May 2016 18:22:54 -0000
Content-Type: multipart/alternative; boundary=001a114029483467c105321c6eb3

--001a114029483467c105321c6eb3
Content-Type: text/plain; charset=UTF-8

Yes, this patch fix this problem.

Thanks!

On Thu, May 5, 2016 at 3:13 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> Right, this is the problem Brendan was describing - I believe I sent a
> patch
> to fix this already:
>
> http://patchwork.openembedded.org/patch/121039/
>
> Cheers,
> Paul
>
> On Thu, 05 May 2016 09:51:53 Fabio Berton wrote:
> > Hi Paul,
> >
> > When running:
> > recipetool create "npm://registry.npmjs.org
> ;name=grunt-cli;version=1.1.0"
> >
> > I get this error:
> >
> > NOTE: Unpacking abbrev-1.0.7.tgz to
> > /tmp/recipetool-tXXZDi/npmpkg/node_modules/nopt/node_modules/abbrev/
> > Traceback (most recent call last):
> >   File "sources/openembedded-core/scripts/recipetool", line 116, in
> <module>
> > ret = main()
> >   File "sources/openembedded-core/scripts/recipetool", line 107, in main
> >     ret = args.func(args)
> >   File "sources/openembedded-core/scripts/lib/recipetool/create.py", line
> > 561, in create_recipe
> >     handler.process(srctree_use, classes, lines_before, lines_after,
> > handled, extravalues)
> >   File "sources/openembedded-core/scripts/lib/recipetool/create_npm.py",
> > line 133, in process
> >     license = self._handle_license(pdata)
> >   File "sources/openembedded-core/scripts/lib/recipetool/create_npm.py",
> > line 44, in _handle_license
> >     if 'license' in data:
> > TypeError: argument of type 'NoneType' is not iterable
> >
> >
> > On Thu, May 5, 2016 at 7:57 AM, Brendan Le Foll <
> brendan.le.foll@intel.com>
> >
> > wrote:
> > > On Thu, May 05, 2016 at 07:10:43PM +1200, Paul Eggleton wrote:
> > > > Note also that devtool add / recipetool create are capable of
> creating
> > >
> > > pretty
> > >
> > > > complete recipes for npm packages where licenses are also correctly
> set
> > >
> > > per
> > >
> > > > package (so you get them in the image manifest). I'd strongly
> recommend
> > >
> > > using
> > >
> > > > it for this; if you have any issues please let me know.
> > >
> > > So actually it errors in this case because of a test package in the
> > > resolve module (this shows the issue quicker/easier) see:
> > > $ recipetool create "npm://registry.npmjs.org
> ;name=resolve;version=1.1.7"
> > >
> > > There's a node_modules dir inside test/ it gets taken as if npm had
> > > resolved/download a dep when in fact it hasn't. Since node packages
> > > can and do ship their own deps with them sometimes, I think the only
> > > fix would be in npm_split_package_dirs to walk 1 level of the ${PN}
> > > dir only so that:
> > >
> > > ${PN}/node_modules -> taken
> > > ${PN}/tests/node_modules -> ignored
> > > ${PN}/node_modules/${PN}/node_modules -> taken
> > >
> > > Cheers,
> > > Brendan
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--001a114029483467c105321c6eb3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Yes, this patch fix this problem.<br><br></div=
><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;font=
-size:small">Thanks!<br></div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Thu, May 5, 2016 at 3:13 PM, Paul Eggleton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_bl=
ank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Right, this is the problem Brendan was describing - I belie=
ve I sent a patch<br>
to fix this already:<br>
<br>
<a href=3D"http://patchwork.openembedded.org/patch/121039/" rel=3D"noreferr=
er" target=3D"_blank">http://patchwork.openembedded.org/patch/121039/</a><b=
r>
<br>
Cheers,<br>
Paul<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Thu, 05 May 2016 09:51:53 Fabio Berton wrote:<br>
&gt; Hi Paul,<br>
&gt;<br>
&gt; When running:<br>
&gt; recipetool create &quot;npm://<a href=3D"http://registry.npmjs.org" re=
l=3D"noreferrer" target=3D"_blank">registry.npmjs.org</a>;name=3Dgrunt-cli;=
version=3D1.1.0&quot;<br>
&gt;<br>
&gt; I get this error:<br>
&gt;<br>
&gt; NOTE: Unpacking abbrev-1.0.7.tgz to<br>
&gt; /tmp/recipetool-tXXZDi/npmpkg/node_modules/nopt/node_modules/abbrev/<b=
r>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0File &quot;sources/openembedded-core/scripts/recipetool&qu=
ot;, line 116, in &lt;module&gt;<br>
&gt; ret =3D main()<br>
&gt;=C2=A0 =C2=A0File &quot;sources/openembedded-core/scripts/recipetool&qu=
ot;, line 107, in main<br>
&gt;=C2=A0 =C2=A0 =C2=A0ret =3D args.func(args)<br>
&gt;=C2=A0 =C2=A0File &quot;sources/openembedded-core/scripts/lib/recipetoo=
l/create.py&quot;, line<br>
&gt; 561, in create_recipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0handler.process(srctree_use, classes, lines_before,=
 lines_after,<br>
&gt; handled, extravalues)<br>
&gt;=C2=A0 =C2=A0File &quot;sources/openembedded-core/scripts/lib/recipetoo=
l/create_npm.py&quot;,<br>
&gt; line 133, in process<br>
&gt;=C2=A0 =C2=A0 =C2=A0license =3D self._handle_license(pdata)<br>
&gt;=C2=A0 =C2=A0File &quot;sources/openembedded-core/scripts/lib/recipetoo=
l/create_npm.py&quot;,<br>
&gt; line 44, in _handle_license<br>
&gt;=C2=A0 =C2=A0 =C2=A0if &#39;license&#39; in data:<br>
&gt; TypeError: argument of type &#39;NoneType&#39; is not iterable<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 5, 2016 at 7:57 AM, Brendan Le Foll &lt;<a href=3D"mailto:=
brendan.le.foll@intel.com">brendan.le.foll@intel.com</a>&gt;<br>
&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Thu, May 05, 2016 at 07:10:43PM +1200, Paul Eggleton wrote:<br=
>
&gt; &gt; &gt; Note also that devtool add / recipetool create are capable o=
f creating<br>
&gt; &gt;<br>
&gt; &gt; pretty<br>
&gt; &gt;<br>
&gt; &gt; &gt; complete recipes for npm packages where licenses are also co=
rrectly set<br>
&gt; &gt;<br>
&gt; &gt; per<br>
&gt; &gt;<br>
&gt; &gt; &gt; package (so you get them in the image manifest). I&#39;d str=
ongly recommend<br>
&gt; &gt;<br>
&gt; &gt; using<br>
&gt; &gt;<br>
&gt; &gt; &gt; it for this; if you have any issues please let me know.<br>
&gt; &gt;<br>
&gt; &gt; So actually it errors in this case because of a test package in t=
he<br>
&gt; &gt; resolve module (this shows the issue quicker/easier) see:<br>
&gt; &gt; $ recipetool create &quot;npm://<a href=3D"http://registry.npmjs.=
org" rel=3D"noreferrer" target=3D"_blank">registry.npmjs.org</a>;name=3Dres=
olve;version=3D1.1.7&quot;<br>
&gt; &gt;<br>
&gt; &gt; There&#39;s a node_modules dir inside test/ it gets taken as if n=
pm had<br>
&gt; &gt; resolved/download a dep when in fact it hasn&#39;t. Since node pa=
ckages<br>
&gt; &gt; can and do ship their own deps with them sometimes, I think the o=
nly<br>
&gt; &gt; fix would be in npm_split_package_dirs to walk 1 level of the ${P=
N}<br>
&gt; &gt; dir only so that:<br>
&gt; &gt;<br>
&gt; &gt; ${PN}/node_modules -&gt; taken<br>
&gt; &gt; ${PN}/tests/node_modules -&gt; ignored<br>
&gt; &gt; ${PN}/node_modules/${PN}/node_modules -&gt; taken<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Brendan<br>
<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br></div>

--001a114029483467c105321c6eb3--
