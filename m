Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id E13DD619CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:46:46 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id i1so3560349lfo.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=puR3TqwXikbalVccZfogsdMI3Zr2wiOM4kzvH0okrqA=;
	b=CmbMAVCCzKr62eB2/cOMlJl0dasNddcb2N48aQWwvIgA0piBQyTChNSB/qFnBzbMX0
	2jY8hDQhMO+ffLYlIqkHwTm1hgoC10rFeh5Cl7k81JbvcZ8NTdM00s7xf0K2Oth6MqNI
	g/Y7alnadohRBKXP0y9fGeGAj7Ap0EAFFJQ2HUsYxK72RVNDau0DfxaEMNjd+pWjTDLO
	RqlyIAWrGffWMOm98rRNOL55DIJ5Hbu6Y9wU7nK0KjJZj4NZlOYpNyYL8DqzRt9MfhCs
	GJFmpf8YqKExujtK8/P1K7GsMiiDvzYxf7Z94wS+felKnH03gHPYdlkmD6sLEOj8MJtb
	+59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=puR3TqwXikbalVccZfogsdMI3Zr2wiOM4kzvH0okrqA=;
	b=QTLnWIx9DRCQZCoXjGsPRD4PjDrEaCs+xXw0CkHOPTdPZnxwYj7uLsArKbhHeCOrmQ
	TsghC1AXjYj2Kq/TGbIJKuIPD5a/yYz1sSh1xqVGT3i91ETGn3MKsL44qX41/T/aU0Y+
	NvHl7aVtJGiHh9OZ3dNuOXa68h9U+i7+Gv5risnDMi5FXjPzDb+q4Q2j5Edj1BoULYGZ
	MVGthBFbZAcroVBJAtupSul1inqaEWFutxwEcj4vWMYkL4rpizosCYXyVH5XkJMSmu+B
	pgzKONLMh8LwtKoJncuWTxbiyF+OehgLHnGUIhW+IyxXdHCaLJskfeDXumZ5c3msOc/a
	w08g==
X-Gm-Message-State: ANhLgQ1dBavb4hU71yMGSfQJyQ1JH4GEyzAMoJtJzCAdJM5xO731SA+w
	VFdEqB1bvKAulRbA70tfaAf/VeN9Z3KsL+VhSkQ=
X-Google-Smtp-Source: ADFU+vt5P7rHmfmAN6bBSyNwdk7vx5mA9oiIwEPsRzEsBZarDlno2e/f3PTiUvfpE+9JMR0Ug5fmc0DeqNNgHAqoArM=
X-Received: by 2002:ac2:4110:: with SMTP id b16mr5123425lfi.211.1584704807388; 
	Fri, 20 Mar 2020 04:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
	<CADySD0EMgZoMWYjwcjXv_8AHD3p0nmytd8sgBVdfB8ddq9anJA@mail.gmail.com>
	<alpine.LFD.2.21.2003200730490.8837@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003200730490.8837@localhost.localdomain>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 21 Mar 2020 00:47:26 +1300
Message-ID: <CADySD0EkD0V4jXc4qWy=ms65TaGa-2RpTPc5t+AzBx1cfk-2Ng@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: recipe design curiosity: how to best install a package configuration file?
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
X-List-Received-Date: Fri, 20 Mar 2020 11:46:48 -0000
Content-Type: multipart/alternative; boundary="0000000000001e4abb05a147d766"

--0000000000001e4abb05a147d766
Content-Type: text/plain; charset="UTF-8"

new recipe version (most likely) will have new release and expect any change

If you are concerned about recipe version in your layer then manage that
rather than copying original recipe file *as it is* in your layer

When upgrading recipe, anyway have to test it to make sure your image
doesn't break. So no way you will miss any breaking change introduced. And
at that point you could have (if needed) your custom version in "file/"
rather than always copying the working sample which is already maintained
by someone else

I wouldn't recommend to have copy of unchanged upstream files in a custom
layer

Cheers
Ankur

On Sat, Mar 21, 2020, 12:32 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Sat, 21 Mar 2020, Ankur Tyagi wrote:
>
> > what if sample file is updated in new version? Now you have to
> > maintain the copy in your "file/" as well.
> >
> > If you are using sample file as it is, then keeping a copy is
> > probably not a good idea
> >
> > Cheers
> > Ankur
>
>   i actually think that's an argument in my favour ... i would be very
> nervous about how upgrading a recipe version would quietly upgrade my
> configuration file. i would far prefer to have to manually upgrade my
> configuration to keep in step.
>
> rday
>
> >         got into a discussion yesterday about the "cleanest" way to
> design a
> >       .bbappend file to install a package's configuration file, so i'm
> >       curious about best practices, and here's an example. (and i'm
> asking
> >       as it looks like this will be an issue for a number of recipes i'm
> >       looking at.)
> >
> >         current recipe for conntrack-tools:
> >
> >
> http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
> >
> >       note how the recipe install step installs a conntrack.conf.sample
> >       file:
> >
> >       do_install_append() {
> >         install -d ${D}/${sysconfdir}/conntrackd
> >         install -d ${D}/${sysconfdir}/init.d
> >         install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf
> ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
> >         ...
> >
> >       so far, so good. now, in cases where a sample conf file is
> provided,
> >       there is, of course, no guarantee that it will be applicable out of
> >       the box -- one *expects* that it might be necessary to tweak such a
> >       file and install it as part of a .bbappend file. and here's the
> point
> >       of contention.
> >
> >         in this current situation, it turns out that that sample conf
> file
> >       just happens to be appropriate, so the entire .bbappend file for
> this
> >       recipe consists of:
> >
> >       do_install_append () {
> >           install -m 0644  \
> >           ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample \
> >           ${D}/${sysconfdir}/conntrackd/conntrackd.conf
> >       }
> >
> >         yes, that will work, but i suggested that, even though it's
> >       convenient, the problem with that approach is that looking at the
> >       .bbappend file doesn't show you the contents of the file that will
> be
> >       installed. to see the actual conf file, you'd have to peruse the
> >       source, or check the final result ... you get the idea.
> >
> >         i suggested that, even though the sample file in *this* case was
> >       perfectly appropriate, i would choose to make a copy of it under
> >       files/, and install the conf file from *there*, the advantage being
> >       that the actual file being installed is immediately readable.
> >
> >         does anyone have any strong opinions on this? it seems mundane,
> but
> >       i think the latter approach is still superior, especially since i
> >       suspect most sample configuration files would have to be adjusted,
> >       anyway.
> >
> >         thoughts? just trying to collect some best practices to apply to
> >       this project.
> >
> >       rday
> >       --
> >       _______________________________________________
> >       Openembedded-core mailing list
> >       Openembedded-core@lists.openembedded.org
> >       http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================

--0000000000001e4abb05a147d766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>new recipe version (most likely) will have new relea=
se and expect any change</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>If you are concerned about recipe version in your layer then manage that r=
ather than copying original recipe file *as it is* in your layer</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">When upgrading recipe, anyway have=
 to test it to make sure your image doesn&#39;t break. So no way you will m=
iss any breaking change introduced. And at that=C2=A0point you could have (=
if needed) your custom version in &quot;file/&quot; rather than always copy=
ing the working sample which is already maintained by someone else</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I wouldn&#39;t recommend to have=
 copy of unchanged upstream files in a custom layer</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Cheers</div><div dir=3D"auto">Ankur<br><br><div=
 class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, Mar 21, 2020, 12:32 AM Robert P. J. Day &lt;<a href=3D"mailto:rpjday=
@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Sat, 21 Mar 2020, Ankur Tyagi wrote:<br>
<br>
&gt; what if sample file is updated in new version? Now you have to<br>
&gt; maintain the copy in your &quot;file/&quot; as well.<br>
&gt;<br>
&gt; If you are using sample file as it is, then keeping a copy is<br>
&gt; probably not a good idea<br>
&gt;<br>
&gt; Cheers<br>
&gt; Ankur<br>
<br>
=C2=A0 i actually think that&#39;s an argument in my favour ... i would be =
very<br>
nervous about how upgrading a recipe version would quietly upgrade my<br>
configuration file. i would far prefer to have to manually upgrade my<br>
configuration to keep in step.<br>
<br>
rday<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 got into a discussion yesterday about=
 the &quot;cleanest&quot; way to design a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.bbappend file to install a package&#39;s co=
nfiguration file, so i&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0curious about best practices, and here&#39;s=
 an example. (and i&#39;m asking<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0as it looks like this will be an issue for a=
 number of recipes i&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0looking at.)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 current recipe for conntrack-tools:<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/meta=
-openembedded/tree/meta-networking/recipes-filter/conntrack-tools/conntrack=
-tools_1.4.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://cgi=
t.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/co=
nntrack-tools/conntrack-tools_1.4.5.bb</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0note how the recipe install step installs a =
conntrack.conf.sample<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 install -d ${D}/${sysconfdir}/conntra=
ckd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 install -d ${D}/${sysconfdir}/init.d<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 install -m 0644 ${S}/doc/sync/ftfw/co=
nntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ...<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0so far, so good. now, in cases where a sampl=
e conf file is provided,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0there is, of course, no guarantee that it wi=
ll be applicable out of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the box -- one *expects* that it might be ne=
cessary to tweak such a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file and install it as part of a .bbappend f=
ile. and here&#39;s the point<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0of contention.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 in this current situation, it turns o=
ut that that sample conf file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0just happens to be appropriate, so the entir=
e .bbappend file for this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0recipe consists of:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_install_append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 install -m 0644=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ${D}/${sysconfdir}/conntrackd/=
conntrackd.conf.sample \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ${D}/${sysconfdir}/conntrackd/=
conntrackd.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 yes, that will work, but i suggested =
that, even though it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0convenient, the problem with that approach i=
s that looking at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.bbappend file doesn&#39;t show you the cont=
ents of the file that will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0installed. to see the actual conf file, you&=
#39;d have to peruse the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source, or check the final result ... you ge=
t the idea.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 i suggested that, even though the sam=
ple file in *this* case was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0perfectly appropriate, i would choose to mak=
e a copy of it under<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0files/, and install the conf file from *ther=
e*, the advantage being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0that the actual file being installed is imme=
diately readable.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 does anyone have any strong opinions =
on this? it seems mundane, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i think the latter approach is still superio=
r, especially since i<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0suspect most sample configuration files woul=
d have to be adjusted,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0anyway.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 thoughts? just trying to collect some=
 best practices to apply to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0this project.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rday<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0____________________________________________=
___<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.op=
enembedded.org" target=3D"_blank" rel=3D"noreferrer">Openembedded-core@list=
s.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mai=
lman/listinfo/openembedded-core" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><=
br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
-- <br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://crashcourse.ca" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer noreferrer" target=3D=
"_blank">http://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer noreferrer" target=3D"_blank">http://ca.li=
nkedin.com/in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</blockqu=
ote></div></div></div>

--0000000000001e4abb05a147d766--
