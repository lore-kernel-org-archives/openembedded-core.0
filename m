Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 24D9A75D4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 14:51:54 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id m11so316853983oif.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pRHahvEd56aXRoGu7HWswxzIb2ESkoErrsWS/KEJWvk=;
	b=tL2LtwtNjtMbF3RlQItCpYwXgVLglV+xeciFi+0ricX/V1QET0y2He6vuElocJtQYF
	QBWJD3O85gbU6tfdr46YaJ7729c4iDogJ6K/6MexJ/cW5zuYWpBiNE7lJN5MT0IJXUaq
	/wl2DxUjTVaF4JVL0Cs26TX0SBHPYmey+MuwiOz0Jr6maNrBxGAttHin50/a0wR4LgjR
	TUqpnbooF5TnL3ZdYan+qUq73YNTydDih8XB0as6bdX8zyss8Z9LHLfDPyO5CEDTf/XV
	N/vckKNqOoxVj6O75jSO8IBUgKlRzkNDh6IzNUPHEqq8Gs1UZQ43X4BPiSwgdbeBc/vZ
	qxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pRHahvEd56aXRoGu7HWswxzIb2ESkoErrsWS/KEJWvk=;
	b=b16nhOc9STkmmFllYrTeG93EH3TwLqHFsj/pJzBQopFFSodK7vVLsFuXHXG7T5Q2Gp
	zD8OkiDGoZjC/NaYn+mFjXsbfYD6/98Ols3xrg979QT/bYu1UjSp+Zpuk5Dc2LZEu8U6
	+v07iX6vKbnY0yAgkWQVD3XP/da83vUQHjXHcrN/1PQoNElP396F1+2+SEloGa8HcAhW
	UbGi+9AeGXhd+aUgtDAK+iW1zhUh/j1GfkyS6OIegd7BgVVCq8DPoWjavDEP9ENY/hZ/
	db8QLtd2cEpgMkjw6OF02CwN9iH84Gu6eFC5qkzDPKzpvSfGGpEn9Vw0eI5gOA+g3iSt
	SGCQ==
X-Gm-Message-State: AE9vXwOI0n43VOCUwHlDqoNpmnaLdL1x7+P4kFsM5ZVo7wRuXi3aXtheAZ2DwrBnWIYcht5SXoQFkxUyvrBXy0em
X-Received: by 10.202.180.2 with SMTP id d2mr29076254oif.98.1473691915653;
	Mon, 12 Sep 2016 07:51:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 12 Sep 2016 07:51:35 -0700 (PDT)
In-Reply-To: <cba00f95-da02-2a0b-893c-516539104999@windriver.com>
References: <1473361447-11655-1-git-send-email-ross.burton@intel.com>
	<cba00f95-da02-2a0b-893c-516539104999@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 15:51:35 +0100
Message-ID: <CAJTo0LaZ48dQ2ENAk7pAg51gjoxX6jLRsP2xsmA3WnP=k2AdcA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: remove redundant removals
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
X-List-Received-Date: Mon, 12 Sep 2016 14:51:56 -0000
Content-Type: multipart/alternative; boundary=001a113d3dd4243667053c50a3fb

--001a113d3dd4243667053c50a3fb
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 20:19, Mark Hatle <mark.hatle@windriver.com> wrote:

> > -     rm -f ${D}/${mandir}/man8/rpmcache.8*
> > -     rm -f ${D}/${mandir}/man8/rpmgraph.8*
> > -     rm -f ${D}/${mandir}/*/man8/rpmcache.8*
> > -     rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
> > -     rm -rf ${D}/${mandir}/{fr,ko}
>
> Above cases need to be removed.  We do not support the rpmcache or
> rpmgraph, and
> at least for a long time the man pages were being generated for them.  (If
> this
> is no longer true, and man pages ARE being generated they should be
> removed.)


These manpages are not installed in the first place.

> -     rm -f ${D}/${includedir}/popt.h
> > -     rm -f ${D}/${libdir}/libpopt.*
> > -     rm -f ${D}/${libdir}/pkgconfig/popt.pc
> > -     rm -f ${D}/${datadir}/locale/*/LC_MESSAGES/popt.mo
> > -     rm -f ${D}/${mandir}/man3/popt.3
>
> We can use either an internal or external version of the popt library.  If
> the
> internal version is used, we MUST remove all of these files.  If the
> external
> version is used, the RPM won't end up doing anything.


Okay, restored.


> > -     rm -f ${D}/${mandir}/man1/xar.1*
> > -     rm -f ${D}/${bindir}/xar
> > -     rm -rf ${D}/${includedir}/xar
> > -     rm -f ${D}/${libdir}/libxar*
>

xar is a PACKAGECONFIG which is disabled by default, so removing the files
if it is enabled seems wrong.


> > -     rm -f ${D}/${bindir}/lz*
> > -     rm -f ${D}/${bindir}/unlzma
> > -     rm -f ${D}/${bindir}/unxz
> > -     rm -f ${D}/${bindir}/xz*
> > -     rm -rf ${D}/${includedir}/lzma*
> > -     rm -f ${D}/${mandir}/man1/lz*.1
> > -     rm -f ${D}/${libdir}/pkgconfig/liblzma*
>
> Above files may be generated in some configurations.  (Possible that is no
> longer true.


Doesn't appear to be true any more: rpm links to an external xz.


>  > -     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.a

>       rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.la
> > -     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.a
> >       rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.la
>
> The .a files were removed because we didn't want anyone statically linking
> to
> python.a, not sure they they were being produced to begin with.. but that
> is why
> that was there.


Nothing is installing these but I suspect this is a side-effect of Poky's
no-static-libs change, so I'll remove this.

> -     rm -f ${D}/${libdir}/rpm/libsqldb.*
> > -
>
> If 'sqlite' support is enabled in RPM, the above should be removed.  It
> will
> clash with external components.


Done.


>
> > -     # We don't want, nor need the Mandriva multiarch items
> > -     rm -f ${D}/${bindir}/multiarch-dispatch
> > -     rm -f ${D}/${bindir}/multiarch-platform
> > -     rm -f ${D}/${libdir}/rpm/check-multiarch-files
> > -     rm -f ${D}/${libdir}/rpm/mkmultiarch
> > -     rm -f ${D}/${includedir}/multiarch-dispatch.h
> > -
>
> Again, some configs may produce these.. if they're not produced in our
> config we
> can remove it.


Not anymore apparently:

noinst_SCRIPTS += multiarch-dispatch multiarch-platform
noinst_SCRIPTS += check-multiarch-files mkmultiarch
noinst_HEADERS = multiarch-dispatch.h


> >       rm -f ${D}/${libdir}/rpm/gstreamer.sh
> >       rm -f ${D}/${libdir}/rpm/gem_helper.rb
> >       rm -f ${D}/${libdir}/rpm/rubygems.rb
> > @@ -610,12 +567,10 @@ do_install_append() {
> >       rm -f ${D}/${libdir}/rpm/macros.d/kernel
> >       rm -f ${D}/${libdir}/rpm/macros.d/gstreamer
> >       rm -f ${D}/${libdir}/rpm/bin/mgo
> > -     rm -f ${D}/${libdir}/rpm/bin/dbconvert
>
> dbconvert is not useful for us.. it used to be provided, so we removed it.


This doesn't get installed anymore.

V2 incoming.

Ross

--001a113d3dd4243667053c50a3fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 September 2016 at 20:19, Mark Hatle <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hat=
le@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D"gmail-">&gt; -=C2=A0 =
=C2=A0 =C2=A0rm -f ${D}/${mandir}/man8/rpmcache.<wbr>8*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${mandir}/man8/rpmgraph.<wbr>8*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${mandir}/*/man8/<wbr>rpmcache.8*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${mandir}/*/man8/<wbr>rpmgraph.8*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${mandir}/{fr,ko}<br>
<br>
</span>Above cases need to be removed.=C2=A0 We do not support the rpmcache=
 or rpmgraph, and<br>
at least for a long time the man pages were being generated for them.=C2=A0=
 (If this<br>
is no longer true, and man pages ARE being generated they should be removed=
.)</blockquote><div><br></div><div>These manpages are not installed in the =
first place.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><span class=3D"gmail-">
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${includedir}/popt.h<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/libpopt.*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/pkgconfig/popt.<wbr>pc<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${datadir}/locale/*/LC_<wbr>MESSAGES/p=
opt.mo<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${mandir}/man3/popt.3<br>
<br>
</span>We can use either an internal or external version of the popt librar=
y.=C2=A0 If the<br>
internal version is used, we MUST remove all of these files.=C2=A0 If the e=
xternal<br>
version is used, the RPM won&#39;t end up doing anything.</blockquote><div>=
<br></div><div>Okay, restored.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span=
 class=3D"gmail-">
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${mandir}/man1/xar.1*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/xar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${includedir}/xar<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/libxar*<br></span></blockquo=
te><div><br></div><div>xar is a PACKAGECONFIG which is disabled by default,=
 so removing the files if it is enabled seems wrong.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><span class=3D"gmail-">
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/lz*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/unlzma<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/unxz<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/xz*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${includedir}/lzma*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${mandir}/man1/lz*.1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/pkgconfig/<wbr>liblzma*<br>
<br>
</span>Above files may be generated in some configurations.=C2=A0 (Possible=
 that is no<br>
longer true.</blockquote><div><br></div><div>Doesn&#39;t appear to be true =
any more: rpm links to an external xz.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x">=C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}${PYTHON_SITEPACKAGES_DIR}<wbr=
>/*.a</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><span class=3D"gmail-">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${PYTHON_SITEPACKAGES_DIR}<wbr>/*.=
la<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}${PYTHON_SITEPACKAGES_DIR}<wbr>/rpm/*.a=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${PYTHON_SITEPACKAGES_DIR}<wbr>/rp=
m/*.la<br>
<br>
</span>The .a files were removed because we didn&#39;t want anyone statical=
ly linking to<br>
python.a, not sure they they were being produced to begin with.. but that i=
s why<br>
that was there.</blockquote><div><br></div><div>Nothing is installing these=
 but I suspect this is a side-effect of Poky&#39;s no-static-libs change, s=
o I&#39;ll remove this.=C2=A0<br></div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><spa=
n class=3D"gmail-">&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/libsq=
ldb.*<br>
&gt; -<br>
<br>
</span>If &#39;sqlite&#39; support is enabled in RPM, the above should be r=
emoved.=C2=A0 It will<br>
clash with external components.</blockquote><div><br></div><div>Done.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><span class=3D"gmail-"><br>
&gt; -=C2=A0 =C2=A0 =C2=A0# We don&#39;t want, nor need the Mandriva multia=
rch items<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/multiarch-<wbr>dispatch<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${bindir}/multiarch-<wbr>platform<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/check-<wbr>multiarch-fil=
es<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/mkmultiarch<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${includedir}/multiarch-<wbr>dispatch.=
h<br>
&gt; -<br>
<br>
</span>Again, some configs may produce these.. if they&#39;re not produced =
in our config we<br>
can remove it.</blockquote><div><br></div><div>Not anymore apparently:</div=
><div><br></div><div>noinst_SCRIPTS +=3D multiarch-dispatch multiarch-platf=
orm</div><div>noinst_SCRIPTS +=3D check-multiarch-files mkmultiarch</div><d=
iv>noinst_HEADERS =3D multiarch-dispatch.h</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex"><span class=3D"gmail-">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/gstreamer.<wbr>sh<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/gem_helper.<wbr>rb<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/rubygems.rb<br>
&gt; @@ -610,12 +567,10 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/macros.d/<wbr>kerne=
l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/macros.d/<wbr>gstre=
amer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/bin/mgo<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/bin/<wbr>dbconvert<br>
<br>
</span>dbconvert is not useful for us.. it used to be provided, so we remov=
ed it.</blockquote><div><br></div><div>This doesn&#39;t get installed anymo=
re.</div><div><br></div><div>V2 incoming.</div><div><br></div><div>Ross</di=
v></div></div></div>

--001a113d3dd4243667053c50a3fb--
