Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id C5B46731DD;
	Mon, 22 Aug 2016 22:19:12 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id k135so6896519lfb.1;
	Mon, 22 Aug 2016 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2NabB1vU0E4knYXw1dJdfFJyPR4WADu6L5+P14+Dwek=;
	b=TH4m1S9cZaKAn7bRvC4UdFjN57N3lW+SWCIRXMBQVJtlQveEuYNN5oGxgSjt5Sj2Cw
	0U8zsFcopH2TbZ7JYs0d8o28FgoPln0AxeagIwq3CUcvYjuTKrX01qXZ1CueSV6LQIRe
	KjWer/wu8BaA5eXLeohn8l7bxQpcDcFEgW/7BUx4Tdc0QednK7yHlUsJf3DaandjNvum
	+OM0oh4zz7FUNmJIsHQneVZ3baeMV6H4BjKltEmiH3hw+rB6QoNQPwX+PcVTQ+L4SnHF
	S8rfIUXgpwYgQBzK5fg4c2qWX8Ls0xGCd+MJCb9bf28oLZgviuAeyT9I8Hn+x2Fnq5PG
	0ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2NabB1vU0E4knYXw1dJdfFJyPR4WADu6L5+P14+Dwek=;
	b=M7YE5DtrwnZcIyzsyhfkQeG21tkUA9bMpodjzJkq3JuwKhXSViXSQWfjIJ2G9spGTY
	OBL/I4JuVxh/n+5EhW9WtcreZmTIeUcItsYmq4P5ooRWDtdu8hh/ntcnoM7hbLenJByu
	cxnszD7rWS8jKkANJwwQ66L3p4nyPlBhOonyRzXOToK3FT/17lJM//zAMf+PJJBfpLR6
	uo/yWXxQ8NU+hVZoGUi7tguz22L7/19DZAWVuLOXmBUUgbFZEjU1OVFOwD86a+uxSaU9
	HBCHZX+cEZp9eKNhY6RcXAwMSD4fBC96v6n2ktFNSWRekJG8PzvjCWctPhkE0x2Akv9y
	JcTQ==
X-Gm-Message-State: AEkoouvH3ihfh0hJeXE1FCOjD8cWKvvEg/eKP5CWuMjIaYp4GbhBmPqWH/brTn0uTeDHo+CXfky0RYWSzt5snQ==
X-Received: by 10.25.19.32 with SMTP id j32mr6888646lfi.204.1471904351611;
	Mon, 22 Aug 2016 15:19:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Mon, 22 Aug 2016 15:19:10 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84B6209B91@ALA-MBA.corp.ad.wrs.com>
References: <20160818155231.26598.41172@opal.openembedded.org>
	<20160818155232.98F9250386@opal.openembedded.org>
	<20160822142037.mreue353yrb6kvgs@jama>
	<007BD92917A2324FA403BCF9A464CF84B6209B91@ALA-MBA.corp.ad.wrs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Aug 2016 00:19:10 +0200
Message-ID: <CA+chaQf+XQjaCQBADNcG4ZxCuS5wGeD2Swq6OUEo6tDHmn73cg@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/02: systemd-compat-units: pkg_postinst() does not work
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
X-List-Received-Date: Mon, 22 Aug 2016 22:19:14 -0000
Content-Type: multipart/alternative; boundary=001a114065c60571ef053ab07011

--001a114065c60571ef053ab07011
Content-Type: text/plain; charset=UTF-8

changing it to DEPEND would only make it worse an more useless

On Mon, Aug 22, 2016 at 7:01 PM, Slater, Joseph <joe.slater@windriver.com>
wrote:

> At the cost of a little build time, I guess we could lose the inherit
> allarch.
> As a practical matter, we could get rid of the RDEPEND (or make it a
> DEPEND?),
> but that seems wrong, somehow.
>
> Joe
>
> > -----Original Message-----
> > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > Sent: Monday, August 22, 2016 7:21 AM
> > To: openembedded-core@lists.openembedded.org; Slater, Joseph
> > Cc: openembedded-commits@lists.openembedded.org
> > Subject: Re: [oe-commits] [openembedded-core] 01/02:
> systemd-compat-units: pkg_postinst()
> > does not work
> >
> > On Thu, Aug 18, 2016 at 03:52:33PM +0000, git@git.openembedded.org
> wrote:
> > > rpurdie pushed a commit to branch master
> > > in repository openembedded-core.
> > >
> > > commit 8183309080aee45746daaff46b0506b09b5bd269
> > > Author: Joe Slater <jslater@windriver.com>
> > > AuthorDate: Mon Aug 15 16:04:53 2016 -0700
> > >
> > >     systemd-compat-units: pkg_postinst() does not work
> > >
> > >     The test for various files is wrong and will always be
> > >     true, even if init.d does not exist.
> > >
> > >     Exit if init.d does not exist, and correctly test for
> > >     file existence otherwise.
> > >
> > >     Signed-off-by: Joe Slater <jslater@windriver.com>
> > >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/recipes-core/systemd/systemd-compat-units.bb | 17
> ++++++++++-------
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb
> b/meta/recipes-
> > core/systemd/systemd-compat-units.bb
> > > index 0b8ff09..90811da 100644
> > > --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> > > +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> > > @@ -23,21 +23,24 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
> > >  "
> > >
> > >  pkg_postinst_${PN} () {
> > > -   cd $D${sysconfdir}/init.d
> > >
> > > -   echo "Disabling the following sysv scripts: "
> > > +   cd $D${sysconfdir}/init.d  ||  exit 0
> > >
> > > -   OPTS=""
> > > +   echo "Disabling the following sysv scripts: "
> > >
> > >     if [ -n "$D" ]; then
> > >             OPTS="--root=$D"
> > > +   else
> > > +           OPTS=""
> > >     fi
> > >
> > >     for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> > > -           if [ \( -e $i -o $i.sh \) -a ! \( -e
> $D${sysconfdir}/systemd/system/$i.service -
> > o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
> > > -                   echo -n "$i: " ; systemctl ${OPTS} mask $i.service
> > > +           if [ -e $i -o -e $i.sh ]  &&   ! [ -e
> $D${sysconfdir}/systemd/system/$i.service
> > -o -e $D${systemd_unitdir}/system/$i.service ] ; then
> > > +                   echo -n "$i: "
> > > +                   systemctl $OPTS mask $i.service
> > >             fi
> > > -   done ; echo
> > > +   done
> > > +   echo
> > >  }
> > >
> > > -RDPEPENDS_${PN} = "systemd"
> > > +RDEPENDS_${PN} = "systemd"
> >
> > This is good typo fix, but also causes allarch systemd-compat-units to
> > RDEPENDS on TUNE_PKGARCH systemd as reported in:
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-August/125483.html
> >
> > So either please exclude it in layer.conf for drop this runtime
> > dependency completely.
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a114065c60571ef053ab07011
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">changing it to DEPEND would only make it worse an more use=
less</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon,=
 Aug 22, 2016 at 7:01 PM, Slater, Joseph <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:joe.slater@windriver.com" target=3D"_blank">joe.slater@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">At the cost of a li=
ttle build time, I guess we could lose the inherit allarch.<br>
As a practical matter, we could get rid of the RDEPEND (or make it a DEPEND=
?),<br>
but that seems wrong, somehow.<br>
<br>
Joe<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: Martin Jansa [mailto:<a href=3D"mailto:martin.jansa@gmail.com">m=
artin.jansa@gmail.com</a><wbr>]<br>
&gt; Sent: Monday, August 22, 2016 7:21 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a>; Slater, Joseph<br>
&gt; Cc: <a href=3D"mailto:openembedded-commits@lists.openembedded.org">ope=
nembedded-commits@lists.<wbr>openembedded.org</a><br>
&gt; Subject: Re: [oe-commits] [openembedded-core] 01/02: systemd-compat-un=
its: pkg_postinst()<br>
&gt; does not work<br>
&gt;<br>
&gt; On Thu, Aug 18, 2016 at 03:52:33PM +0000, <a href=3D"mailto:git@git.op=
enembedded.org">git@git.openembedded.org</a> wrote:<br>
&gt; &gt; rpurdie pushed a commit to branch master<br>
&gt; &gt; in repository openembedded-core.<br>
&gt; &gt;<br>
&gt; &gt; commit 8183309080aee45746daaff46b0506<wbr>b09b5bd269<br>
&gt; &gt; Author: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com">j=
slater@windriver.com</a>&gt;<br>
&gt; &gt; AuthorDate: Mon Aug 15 16:04:53 2016 -0700<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0systemd-compat-units: pkg_postinst() does not =
work<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The test for various files is wrong and will a=
lways be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0true, even if init.d does not exist.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Exit if init.d does not exist, and correctly t=
est for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0file existence otherwise.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Joe Slater &lt;<a href=3D"mailt=
o:jslater@windriver.com">jslater@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Ross Burton &lt;<a href=3D"mail=
to:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-compat-=
units.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-compat-units.bb=
</a> | 17 ++++++++++-------<br>
&gt; &gt;=C2=A0 1 file changed, 10 insertions(+), 7 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-=
compat-units.bb" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-compat-u=
nits.bb</a> b/meta/recipes-<br>
&gt; core/systemd/<a href=3D"http://systemd-compat-units.bb" rel=3D"norefer=
rer" target=3D"_blank">systemd-compat-<wbr>units.bb</a><br>
&gt; &gt; index 0b8ff09..90811da 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-compat-=
units.bb" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-compat-units.bb=
</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-compat-=
units.bb" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-compat-units.bb=
</a><br>
&gt; &gt; @@ -23,21 +23,24 @@ SYSTEMD_DISABLED_SYSV_SERVICES =3D &quot; \<b=
r>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 pkg_postinst_${PN} () {<br>
&gt; &gt; -=C2=A0 =C2=A0cd $D${sysconfdir}/init.d<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0echo &quot;Disabling the following sysv scripts: &q=
uot;<br>
&gt; &gt; +=C2=A0 =C2=A0cd $D${sysconfdir}/init.d=C2=A0 ||=C2=A0 exit 0<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0OPTS=3D&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0echo &quot;Disabling the following sysv scripts: &q=
uot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if [ -n &quot;$D&quot; ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPTS=3D&quot;--roo=
t=3D$D&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPTS=3D&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0for i in ${SYSTEMD_DISABLED_SYSV_<wbr>SERVICES=
} ; do<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ \( -e $i -o $i.sh =
\) -a ! \( -e $D${sysconfdir}/systemd/<wbr>system/$i.service -<br>
&gt; o=C2=A0 -e $D${systemd_unitdir}/system/$<wbr>i.service \) ] ; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo -n &quot;$i: &quot; ; systemctl ${OPTS} mask $i.service<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e $i -o -e $i.sh =
]=C2=A0 &amp;&amp;=C2=A0 =C2=A0! [ -e $D${sysconfdir}/systemd/<wbr>system/$=
i.service<br>
&gt; -o -e $D${systemd_unitdir}/system/$<wbr>i.service ] ; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0echo -n &quot;$i: &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0systemctl $OPTS mask $i.service<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0done ; echo<br>
&gt; &gt; +=C2=A0 =C2=A0done<br>
&gt; &gt; +=C2=A0 =C2=A0echo<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -RDPEPENDS_${PN} =3D &quot;systemd&quot;<br>
&gt; &gt; +RDEPENDS_${PN} =3D &quot;systemd&quot;<br>
&gt;<br>
&gt; This is good typo fix, but also causes allarch systemd-compat-units to=
<br>
&gt; RDEPENDS on TUNE_PKGARCH systemd as reported in:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
016-August/125483.html" rel=3D"noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/<wbr>pipermail/openembedded-core/<wbr>2016-August/125483.ht=
ml</a><br>
&gt;<br>
&gt; So either please exclude it in layer.conf for drop this runtime<br>
&gt; dependency completely.<br>
&gt;<br>
&gt; --<br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div>

--001a114065c60571ef053ab07011--
