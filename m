Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF86719B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 16:39:03 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id w204so53504136oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m7ddFJf3/bZBFh/vuXwOxEo0kiR790ubhlK8UXQMa7I=;
	b=OcUy7azRWCayoOWMJpQHL1GyO9qtr5TJWU9oAzLoDwbeAm+JMvz2Vn+7Vy/vkBBoDk
	uHuf+PxfniH5akWHPPzRBnH5Kwo13sleAQtmpFhuXn3pApFL65YBkzogTmKQNsD2Nwho
	2YmdUA3gs+4zvR8zi9iSUocrUwiry9IpM69L2ncRLyKiRJ6T9fAfkMpwt8mB+QxWzQHI
	MJclvtnkzTJos7dYdbkxdF1nvYbLdvHcQ3FtZLyhh/3U4znPd9NtcuU3qX7A5aT38VNO
	AFL7YL6do0ReVBnFgBYc5aGPXCEwyiJrjL2b34Qv0cxT1GKo55dk556efIR2jAcbWwAD
	7Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m7ddFJf3/bZBFh/vuXwOxEo0kiR790ubhlK8UXQMa7I=;
	b=m4sGCC/Urx6TR7IbYAqIbGbZ2BU9hY65Mb8x9fk98DEHuxRj0E4MURoBWSO3jqb6uF
	JeN6/VL6/QqFqJueMuZVNICfNDRJhY2PDSTqwaA+42m6NesPFNv9hL2GhtOCKOq4FMHe
	ZFxelCLEQ1APRO5mo9EaqSnUsYfmLmyPSmYtEvGx0+2L+he/icYBU6/IjD6jNWDRxAuf
	Z29danq1mmLFThRjsFNwSVIHLgfCdswl9BMPL1XBvxv/Y8mqw6UzXfVo/5Fg4r8X+6tW
	LklQFK8lrzuDFwyKmeBPAxWJQuLTNQW+TQv7b8q7TLRECTn82P6ZMZb9W7nSIPRnoKSg
	Tfvg==
X-Gm-Message-State: AMke39kzBtqlfbJSa91seawc2XfLVPQumDS7WCVdDK/QpAgQT52//830yk3zyTDlApNGqCB2LAFhxDFZy+rbUg==
X-Received: by 10.202.71.137 with SMTP id u131mr13327329oia.111.1487003943445; 
	Mon, 13 Feb 2017 08:39:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Mon, 13 Feb 2017 08:38:42 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702130808300.13813@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702090654250.29564@uk63952.mitel.com>
	<37eeaba5-4561-6e3c-60e9-ae090b2e579f@linux.intel.com>
	<alpine.LFD.2.20.1702130808300.13813@uk63952.mitel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 13 Feb 2017 09:38:42 -0700
Message-ID: <CABcZAN=Zusmrc4vzmgZoTbLC_GpOetU-r_fZa-Le1upevn18+Q@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the significance of the numeric version part of 'PV = "1.0.1+git${SRCPV}"'?
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
X-List-Received-Date: Mon, 13 Feb 2017 16:39:03 -0000
Content-Type: multipart/alternative; boundary=001a113e3c68d42d2805486c15d3

--001a113e3c68d42d2805486c15d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 6:51 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Thu, 9 Feb 2017, Leonardo Sandoval wrote:
>
> >
> >
> > On 02/09/2017 06:06 AM, Robert P. J. Day wrote:
> > >    i *thought* i understood this, but a colleague insists i don't so
> > > ... dumb question time.
> > >
> > >    recently, i asked about the netdata recipe file "netdata_git.bb",
> > > which contains the snippet:
> > >
> > >    SRC_URI =3D "git://github.com/firehol/netdata.git;protocol=3Dhttps=
"
> > >    SRCREV =3D "36c1304e37094174ea51001903058e65053107ca"
> > >    PV =3D "1.0.1+git${SRCPV}"
> > >
> > > perhaps i've been wrong all this time, but i understood the above to
> > > mean that the source checked out would be based on commit
> > > 36c1304e37094174ea51001903058e65053107ca, and that the "1.0.1+" part
> > > of the PV variable was simply for aesthetics.
> > >
> > >    i realize that the full value of PV would be used to generate the
> > > final rpm files, and here's what i get:
> > >
> > >    netdata-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
> > >    netdata-dbg-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
> > >    netdata-dev-1.0.1+git0+36c1304e37-r0.0.ppc7400.rpm
> > >
> > > but is there some other significance or functionality associated
> > > with that "1.0.1+" prefix for PV?
> > that is the version and it should be the most recent release or tag
> > point of the SCM.
> > >
> > >    the only thing i can think of is OE's algorithm for selecting
> > > the most recent recipe. AIUI, if i have multiple versions for the
> > > same recipe. all things being equal, OE would choose the "git"
> > > recipe file over a numerically-versioned recipe file, correct?
> > >
> > >    so, say i have two recipe files:
> > >
> > >    netdata_1.0.2.bb
> > >    netdata_git.bb
> > >
> > > i assume that OE would choose the second one by default, even if,
> > > internally, that "git" form of the recipe selected a SRCREV that
> > > might represent an earlier commit than the 1.0.2 version.
> > On this area, check this link
> >
> > http://www.yoctoproject.org/docs/2.2/ref-manual/ref-
> manual.html#var-PREFERRED_VERSION
> >
> > If you want to use git recipe, then you need to explicitly indicate
> > it through the latter variable, otherwise the 1.0.2 will be used.
>
>   ok, i've never dug into the recipe versioning really, really deeply
> so a few questions if i may. (and if all this is written out
> somewhere already, a link would be just ducky.)
>
>   first, where is the code that handles recipe versioning and
> selection? i'm assuming it's part of the bitbake fetcher library, but
> i'm willing to be corrected.
>
>   next (ignoring "git"-based recipes for the moment and
> PREFERRED_VERSION aside), is the selection of one of a number of
> recipes based on the final value of "PV" that is set/calculated for a
> given recipe file? i can see that one can set "PV" in any recipe file,
> and i'm also assuming that if one doesn't do that, the value of "PV"
> would be extracted from the recipe file name so, for instance, the
> recipe file busybox_1.24.1.bb would automatically generate a "PV"
> value of 1.24.1. that part seems fairly obvious.
>

It=E2=80=99s the default value of PV in meta/conf/bitbake.conf, which uses =
inline
python to extract the version number from the filename. Not special, not
magic, just a default value for the variable.


>   next (and what might be a silly question), based on the above, is it
> possible to set absurdly misleading PV values in recipe files for the
> same recipe, such as:
>
>   rday_1.0.bb
>         PV =3D "2.0"
>
>   rday_2.0.bb
>         PV =3D "1.0"
>
> of course the above is wildly confusing, but is it legal? and given
> what's written above, i'm concluding that the most "recent" recipe
> selected by default would be "rday_1.0.bb", yes?
>

It=E2=80=99s legal, and the default lacking any specified preference would =
be the
higher PV, 2.0, which is the rday_2.0.bb recipe. Default version selection
when nothing is preferred (and no layer priorities are involved in the
selection) goes based on PV, not the filename.

  now, on to "git" recipes. for all of the git-based recipes i can
> see, the recipe files contain some variation of:
>
>   SRCREV =3D "8f33f80100096f7790c7b819ce37a3ed8ce8b5fa"
>   PV =3D "2.99.917+git${SRCPV}"
>
> (side question: is there any "git"-based recipe that *doesn't* have
> some form of the above? would a file like that be considered an error?
> or at least badly written?)
>
>   as for "git" recipe files, i've always understood that, regardless
> of the version number prefix used in setting "PV" (in the above,
> "2.99.917"), the "SRCPV" value defines the actual commit that will be
> fetched and checked out. so where does that leave the version number
> prefix "2.99.917".
>
>   as i've read it all this time, even when using a git-based recipe,
> developers like to choose that version number prefix to represent some
> official tag that was not so far in the recent past from the git
> commit ID -- kind of an aesthetic reminder that, "this git recipe
> represents some level of improvement over version 2.99.917", but not
> as far as the *next* official version number, something like that.
>

Its purpose isn=E2=80=99t an aesthetic reminder, it=E2=80=99s to ensure tha=
t
2.99.917+gitsomething is seen as newer than the 2.99.917 release version
for package upgrades.

  in addition, though, that numeric version prefix is used to select
> the most "recent" recipe version, so that (if i read this correctly),
> if i have two recipe files:
>
>   * netdata_1.0.2.bb
>   * netdata_git.bb
>
> while the first file is a fixed version, it all depends on the value
> of "PV" set in the second version, so that if the second recipe file
> contained the line:
>
>   PV =3D "1.0.1+git${SRCPV}"
>
> then PREFERRED_VERSION aside, the fixed version (1.0.2) would be
> selected as the more recent recipe file, even if that git SRCPV
> represented newer content. how am i doing so far?
>

That=E2=80=99s correct, but remember that DEFAULT_PREFERENCE is always a fa=
ctor,
most often when there=E2=80=99s both a release recipe and a git recipe, the=
 git
recipe will have a -1 default preference. That said, nowadays we shouldn=E2=
=80=99t
have multiple versions in a layer anyway.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113e3c68d42d2805486c15d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 13, 2017 at 6:51 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">On Thu, 9 Feb 2017, Leonardo Sandoval wrote:<=
br>
<br>
&gt;<br>
&gt;<br>
&gt; On 02/09/2017 06:06 AM, Robert P. J. Day wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 i *thought* i understood this, but a colleague insis=
ts i don&#39;t so<br>
&gt; &gt; ... dumb question time.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 recently, i asked about the netdata recipe file &quo=
t;<a href=3D"http://netdata_git.bb" rel=3D"noreferrer" target=3D"_blank">ne=
tdata_git.bb</a>&quot;,<br>
&gt; &gt; which contains the snippet:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/firehol/netdata.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/firehol/<wbr>netdata.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 SRCREV =3D &quot;<wbr>36c1304e37094174ea51001903058e=
<wbr>65053107ca&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 PV =3D &quot;1.0.1+git${SRCPV}&quot;<br>
&gt; &gt;<br>
&gt; &gt; perhaps i&#39;ve been wrong all this time, but i understood the a=
bove to<br>
&gt; &gt; mean that the source checked out would be based on commit<br>
&gt; &gt; 36c1304e37094174ea51001903058e<wbr>65053107ca, and that the &quot=
;1.0.1+&quot; part<br>
&gt; &gt; of the PV variable was simply for aesthetics.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 i realize that the full value of PV would be used to=
 generate the<br>
&gt; &gt; final rpm files, and here&#39;s what i get:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 netdata-1.0.1+git0+36c1304e37-<wbr>r0.0.ppc7400.rpm<=
br>
&gt; &gt;=C2=A0 =C2=A0 netdata-dbg-1.0.1+git0+<wbr>36c1304e37-r0.0.ppc7400.=
rpm<br>
&gt; &gt;=C2=A0 =C2=A0 netdata-dev-1.0.1+git0+<wbr>36c1304e37-r0.0.ppc7400.=
rpm<br>
&gt; &gt;<br>
&gt; &gt; but is there some other significance or functionality associated<=
br>
&gt; &gt; with that &quot;1.0.1+&quot; prefix for PV?<br>
&gt; that is the version and it should be the most recent release or tag<br=
>
&gt; point of the SCM.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 the only thing i can think of is OE&#39;s algorithm =
for selecting<br>
&gt; &gt; the most recent recipe. AIUI, if i have multiple versions for the=
<br>
&gt; &gt; same recipe. all things being equal, OE would choose the &quot;gi=
t&quot;<br>
&gt; &gt; recipe file over a numerically-versioned recipe file, correct?<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 so, say i have two recipe files:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"http://netdata_1.0.2.bb" rel=3D"noreferre=
r" target=3D"_blank">netdata_1.0.2.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"http://netdata_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">netdata_git.bb</a><br>
&gt; &gt;<br>
&gt; &gt; i assume that OE would choose the second one by default, even if,=
<br>
&gt; &gt; internally, that &quot;git&quot; form of the recipe selected a SR=
CREV that<br>
&gt; &gt; might represent an earlier commit than the 1.0.2 version.<br>
&gt; On this area, check this link<br>
&gt;<br>
&gt; <a href=3D"http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.=
html#var-PREFERRED_VERSION" rel=3D"noreferrer" target=3D"_blank">http://www=
.yoctoproject.org/<wbr>docs/2.2/ref-manual/ref-<wbr>manual.html#var-PREFERR=
ED_<wbr>VERSION</a><br>
&gt;<br>
&gt; If you want to use git recipe, then you need to explicitly indicate<br=
>
&gt; it through the latter variable, otherwise the 1.0.2 will be used.<br>
<br>
</div></div>=C2=A0 ok, i&#39;ve never dug into the recipe versioning really=
, really deeply<br>
so a few questions if i may. (and if all this is written out<br>
somewhere already, a link would be just ducky.)<br>
<br>
=C2=A0 first, where is the code that handles recipe versioning and<br>
selection? i&#39;m assuming it&#39;s part of the bitbake fetcher library, b=
ut<br>
i&#39;m willing to be corrected.<br>
<br>
=C2=A0 next (ignoring &quot;git&quot;-based recipes for the moment and<br>
PREFERRED_VERSION aside), is the selection of one of a number of<br>
recipes based on the final value of &quot;PV&quot; that is set/calculated f=
or a<br>
given recipe file? i can see that one can set &quot;PV&quot; in any recipe =
file,<br>
and i&#39;m also assuming that if one doesn&#39;t do that, the value of &qu=
ot;PV&quot;<br>
would be extracted from the recipe file name so, for instance, the<br>
recipe file <a href=3D"http://busybox_1.24.1.bb" rel=3D"noreferrer" target=
=3D"_blank">busybox_1.24.1.bb</a> would automatically generate a &quot;PV&q=
uot;<br>
value of 1.24.1. that part seems fairly obvious.<br></blockquote><div><br><=
/div><div>It=E2=80=99s the default value of PV in meta/conf/bitbake.conf, w=
hich uses inline python to extract the version number from the filename. No=
t special, not magic, just a default value for the variable.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
=C2=A0 next (and what might be a silly question), based on the above, is it=
<br>
possible to set absurdly misleading PV values in recipe files for the<br>
same recipe, such as:<br>
<br>
=C2=A0 <a href=3D"http://rday_1.0.bb" rel=3D"noreferrer" target=3D"_blank">=
rday_1.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PV =3D &quot;2.0&quot;<br>
<br>
=C2=A0 <a href=3D"http://rday_2.0.bb" rel=3D"noreferrer" target=3D"_blank">=
rday_2.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PV =3D &quot;1.0&quot;<br>
<br>
of course the above is wildly confusing, but is it legal? and given<br>
what&#39;s written above, i&#39;m concluding that the most &quot;recent&quo=
t; recipe<br>
selected by default would be &quot;<a href=3D"http://rday_1.0.bb" rel=3D"no=
referrer" target=3D"_blank">rday_1.0.bb</a>&quot;, yes?<br></blockquote><di=
v><br></div><div>It=E2=80=99s legal, and the default lacking any specified =
preference would be the higher PV, 2.0, which is the <a href=3D"http://rday=
_2.0.bb">rday_2.0.bb</a> recipe. Default version selection when nothing is =
preferred (and no layer priorities are involved in the selection) goes base=
d on PV, not the filename.</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
=C2=A0 now, on to &quot;git&quot; recipes. for all of the git-based recipes=
 i can<br>
see, the recipe files contain some variation of:<br>
<br>
=C2=A0 SRCREV =3D &quot;<wbr>8f33f80100096f7790c7b819ce37a3<wbr>ed8ce8b5fa&=
quot;<br>
=C2=A0 PV =3D &quot;2.99.917+git${SRCPV}&quot;<br>
<br>
(side question: is there any &quot;git&quot;-based recipe that *doesn&#39;t=
* have<br>
some form of the above? would a file like that be considered an error?<br>
or at least badly written?)<br>
<br>
=C2=A0 as for &quot;git&quot; recipe files, i&#39;ve always understood that=
, regardless<br>
of the version number prefix used in setting &quot;PV&quot; (in the above,<=
br>
&quot;2.99.917&quot;), the &quot;SRCPV&quot; value defines the actual commi=
t that will be<br>
fetched and checked out. so where does that leave the version number<br>
prefix &quot;2.99.917&quot;.<br>
<br>
=C2=A0 as i&#39;ve read it all this time, even when using a git-based recip=
e,<br>
developers like to choose that version number prefix to represent some<br>
official tag that was not so far in the recent past from the git<br>
commit ID -- kind of an aesthetic reminder that, &quot;this git recipe<br>
represents some level of improvement over version 2.99.917&quot;, but not<b=
r>
as far as the *next* official version number, something like that.<br></blo=
ckquote><div><br></div><div>Its purpose isn=E2=80=99t an aesthetic reminder=
, it=E2=80=99s to ensure that 2.99.917+gitsomething is seen as newer than t=
he 2.99.917 release version for package upgrades.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
=C2=A0 in addition, though, that numeric version prefix is used to select<b=
r>
the most &quot;recent&quot; recipe version, so that (if i read this correct=
ly),<br>
if i have two recipe files:<br>
<br>
=C2=A0 * <a href=3D"http://netdata_1.0.2.bb" rel=3D"noreferrer" target=3D"_=
blank">netdata_1.0.2.bb</a><br>
=C2=A0 * <a href=3D"http://netdata_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">netdata_git.bb</a><br>
<br>
while the first file is a fixed version, it all depends on the value<br>
of &quot;PV&quot; set in the second version, so that if the second recipe f=
ile<br>
contained the line:<br>
<br>
=C2=A0 PV =3D &quot;1.0.1+git${SRCPV}&quot;<br>
<br>
then PREFERRED_VERSION aside, the fixed version (1.0.2) would be<br>
selected as the more recent recipe file, even if that git SRCPV<br>
represented newer content. how am i doing so far?<br></blockquote><div><br>=
</div><div>That=E2=80=99s correct, but remember that DEFAULT_PREFERENCE is =
always a factor, most often when there=E2=80=99s both a release recipe and =
a git recipe, the git recipe will have a -1 default preference. That said, =
nowadays we shouldn=E2=80=99t have multiple versions in a layer anyway.</di=
v></div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth =
at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior S=
oftware Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a113e3c68d42d2805486c15d3--
