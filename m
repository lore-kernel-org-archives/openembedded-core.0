Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id D4E66606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 12:52:23 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id y84so95147148lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cBJuZaPsazFvSvPe7Bv2pxzJcnyJ0E80y79Z4W6k2qU=;
	b=yAW73ff6OIVjQgKVet5m4+pNFdMSMwYToS8/h1ujJh2fDiViz+y5EwZrstnwP++V+O
	UzRQECYutffIpk3VOY+jPaebgQa0d/ojA5wi4zNbOpgEAzvWyD5TS5OP2u24vMpq3+b6
	qNBAXb3Bx5lcbehosqVusXNepCwmK/4ecJixK5dD040GgnnnSsbK8Ax62omeGfyXy8y3
	QFlJuQY58A0HM0+9rKW3S4RC4bk3xv1TE8tjTCHwCUdQpf0oqAz+pjFIm9adtNgyr+LD
	DNLl9zi3dhZ8YvLaRugQ6eytNxDm3omCDI46yU15Oi4YDNiqO6/eZQNCLQ0wk38uIH2J
	DNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cBJuZaPsazFvSvPe7Bv2pxzJcnyJ0E80y79Z4W6k2qU=;
	b=B04J8eQ9nB20KjqQZk15hHcN1++rB6H/pWbDQhrnP9wd0tpbiyv4iAZ1e/OzuSOiL8
	MgkyLt2kZM7rTpJoIz6zJjcOLUe6hVETiThjgqMnsi3by3fZ9BAaqXgMcH4YRGUmSRq4
	qWD3krXMxNzdA4p9W0Hmvff5JFaCIhwmGEQq7BUNZpVGj9SApjrOYcm609B3pLS1krxh
	HHLDk7+54U+VaLOAnFZoq+j7JjW7rKVfaPXmj7+2BhXq65VUyFsVW+0/qMEeSqMtXPfH
	iGfk+by8eB7p7nyIwiF2VMFzHgBHWKZMsWQ1g9Q9IOeBgB3DuvhGq6JAP9JADwhEDT7c
	nZHw==
X-Gm-Message-State: AOPr4FX0NsA1tH0laf0DGWlkvsiIMkvnRgRPf7c9QmVSlcC0XQYglwJ90qtJ/d6eWho0/odgZ1Dar3fZ4u9D5w==
X-Received: by 10.25.146.65 with SMTP id u62mr5879193lfd.121.1462452743328;
	Thu, 05 May 2016 05:52:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Thu, 5 May 2016 05:51:53 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <20160505105743.GA22250@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504170600.GA14676@jupiter.localdomain>
	<CAAPZna0WB0OjbEzo7eh6NctTcrm78O+fAtnFNwb-Ksgscg1x7w@mail.gmail.com>
	<7618991.MRiH0pG9k0@peggleto-mobl.ger.corp.intel.com>
	<20160505105743.GA22250@jupiter.localdomain>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 5 May 2016 09:51:53 -0300
Message-ID: <CAAPZna3uDZab3jtmQYkiR+DR4k5UN_OYhJHcod0G02rdsmtTUQ@mail.gmail.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 05 May 2016 12:52:25 -0000
Content-Type: multipart/alternative; boundary=001a11402e1244698f053217d050

--001a11402e1244698f053217d050
Content-Type: text/plain; charset=UTF-8

Hi Paul,

When running:
recipetool create "npm://registry.npmjs.org;name=grunt-cli;version=1.1.0"

I get this error:

NOTE: Unpacking abbrev-1.0.7.tgz to
/tmp/recipetool-tXXZDi/npmpkg/node_modules/nopt/node_modules/abbrev/
Traceback (most recent call last):
  File "sources/openembedded-core/scripts/recipetool", line 116, in <module>
    ret = main()
  File "sources/openembedded-core/scripts/recipetool", line 107, in main
    ret = args.func(args)
  File "sources/openembedded-core/scripts/lib/recipetool/create.py", line
561, in create_recipe
    handler.process(srctree_use, classes, lines_before, lines_after,
handled, extravalues)
  File "sources/openembedded-core/scripts/lib/recipetool/create_npm.py",
line 133, in process
    license = self._handle_license(pdata)
  File "sources/openembedded-core/scripts/lib/recipetool/create_npm.py",
line 44, in _handle_license
    if 'license' in data:
TypeError: argument of type 'NoneType' is not iterable


On Thu, May 5, 2016 at 7:57 AM, Brendan Le Foll <brendan.le.foll@intel.com>
wrote:

> On Thu, May 05, 2016 at 07:10:43PM +1200, Paul Eggleton wrote:
> > Note also that devtool add / recipetool create are capable of creating
> pretty
> > complete recipes for npm packages where licenses are also correctly set
> per
> > package (so you get them in the image manifest). I'd strongly recommend
> using
> > it for this; if you have any issues please let me know.
>
> So actually it errors in this case because of a test package in the
> resolve module (this shows the issue quicker/easier) see:
> $ recipetool create "npm://registry.npmjs.org;name=resolve;version=1.1.7"
>
> There's a node_modules dir inside test/ it gets taken as if npm had
> resolved/download a dep when in fact it hasn't. Since node packages
> can and do ship their own deps with them sometimes, I think the only
> fix would be in npm_split_package_dirs to walk 1 level of the ${PN}
> dir only so that:
>
> ${PN}/node_modules -> taken
> ${PN}/tests/node_modules -> ignored
> ${PN}/node_modules/${PN}/node_modules -> taken
>
> Cheers,
> Brendan
>

--001a11402e1244698f053217d050
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Paul,<br><br>When running:<br>recipetool cr=
eate &quot;npm://<a href=3D"http://registry.npmjs.org">registry.npmjs.org</=
a>;name=3Dgrunt-cli;version=3D1.1.0&quot;<br><br>I get this error:<br><br>N=
OTE: Unpacking abbrev-1.0.7.tgz to /tmp/recipetool-tXXZDi/npmpkg/node_modul=
es/nopt/node_modules/abbrev/<br>Traceback (most recent call last):<br>=C2=
=A0 File &quot;sources/openembedded-core/scripts/recipetool&quot;, line 116=
, in &lt;module&gt;<br>=C2=A0=C2=A0=C2=A0 ret =3D main()<br>=C2=A0 File &qu=
ot;sources/openembedded-core/scripts/recipetool&quot;, line 107, in main<br=
>=C2=A0=C2=A0=C2=A0 ret =3D args.func(args)<br>=C2=A0 File &quot;sources/op=
enembedded-core/scripts/lib/recipetool/create.py&quot;, line 561, in create=
_recipe<br>=C2=A0=C2=A0=C2=A0 handler.process(srctree_use, classes, lines_b=
efore, lines_after, handled, extravalues)<br>=C2=A0 File &quot;sources/open=
embedded-core/scripts/lib/recipetool/create_npm.py&quot;, line 133, in proc=
ess<br>=C2=A0=C2=A0=C2=A0 license =3D self._handle_license(pdata)<br>=C2=A0=
 File &quot;sources/openembedded-core/scripts/lib/recipetool/create_npm.py&=
quot;, line 44, in _handle_license<br>=C2=A0=C2=A0=C2=A0 if &#39;license&#3=
9; in data:<br>TypeError: argument of type &#39;NoneType&#39; is not iterab=
le<br><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Thu, May 5, 2016 at 7:57 AM, Brendan Le Foll <span dir=3D"ltr">&lt;=
<a href=3D"mailto:brendan.le.foll@intel.com" target=3D"_blank">brendan.le.f=
oll@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On Thu, May 05, 2016 at 07:10:43PM +1200, Paul Eggleton wrote:<=
br>
&gt; Note also that devtool add / recipetool create are capable of creating=
 pretty<br>
&gt; complete recipes for npm packages where licenses are also correctly se=
t per<br>
&gt; package (so you get them in the image manifest). I&#39;d strongly reco=
mmend using<br>
&gt; it for this; if you have any issues please let me know.<br>
<br>
</span>So actually it errors in this case because of a test package in the<=
br>
resolve module (this shows the issue quicker/easier) see:<br>
$ recipetool create &quot;npm://<a href=3D"http://registry.npmjs.org" rel=
=3D"noreferrer" target=3D"_blank">registry.npmjs.org</a>;name=3Dresolve;ver=
sion=3D1.1.7&quot;<br>
<br>
There&#39;s a node_modules dir inside test/ it gets taken as if npm had<br>
resolved/download a dep when in fact it hasn&#39;t. Since node packages<br>
can and do ship their own deps with them sometimes, I think the only<br>
fix would be in npm_split_package_dirs to walk 1 level of the ${PN}<br>
dir only so that:<br>
<br>
${PN}/node_modules -&gt; taken<br>
${PN}/tests/node_modules -&gt; ignored<br>
${PN}/node_modules/${PN}/node_modules -&gt; taken<br>
<br>
Cheers,<br>
Brendan<br>
</blockquote></div><br></div>

--001a11402e1244698f053217d050--
