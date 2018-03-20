Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 28FBD6060F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:19:34 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o8so1078475wra.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=12QnNy0SsWmbYs7JKrLBD2IsKcXejKq+TIbEzVxj7VM=;
	b=S1kwM3ew+LuA1nlzZdd3Inzk9bcPWuR6llIEp9zrMAsvK3SIC9T2j4ZPQ+7eIiSW9L
	iDVMSoBLAB+O6Z3D339E7wc0hJIP2crXkAUCO7WNZ8xRpq1gYBJqHnsRDeFF3a2lPhhQ
	9LFPXZdpgP1uMiMtDZ4hVQjJVgeoSWrzDluUOpPe30h6mEutiC294AKeUgRmmvKZc+mh
	4MkRtaX6rJ/Snjz2U6AYnVePcI42bOOq8xwGQT1IyQNqD0c3fE4xR9Gq1DiCPG5q/5Sp
	rP+xX45/6ygTvZvWGbFzKexmE2DUvQ1DpWOuq7Yq1DXEyfmU50saSiKyv14YKKhWwqb1
	yQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=12QnNy0SsWmbYs7JKrLBD2IsKcXejKq+TIbEzVxj7VM=;
	b=K8ziH9pOm1gJwmXmJFP18WBTJkEtXpmORqaFX1z0B5nFhzrVK8Hr8wFSsdUmESzlBL
	+Tn9iwJ2GoA1hNODCnStYNCtKPxJK2472JxoZB6fMh1gOoLoPgTYdao5732pQoI8NWwZ
	2eJ3+Nez02UR/IhVP81gS0+02aioAU2m/FnAqR707Bio2fM6MibzbqwfOqU90wAQvxXy
	sYPkwSK8SCpAFzMBkTh7QsMZInC8NcQyb5picUEZJXx3d8n4J3WhpmNL8suIoTQJGTIY
	RlTfFvVXNXf76d3IJQTffBktxuULVDdnPfSvQF9GY7GIZWbgtitQyO2zgO4wHk2q/19Z
	jqUA==
X-Gm-Message-State: AElRT7GhnlWRk1pOAw/nJYzowpaE5O/8BdIBTDIPnYud5WpIcCQVK+IH
	xyXFmGPr3vPDOz4SAzt1agyztHzb+iMGZitwg7E=
X-Google-Smtp-Source: AG47ELtOJRe+EUfk9DLs16mbZXTqCHgaYroReGfonlKSwxitDlwovMRR/txJs/xmwtiKu4yCP8t1Gxo6diKbe6plqms=
X-Received: by 10.223.189.14 with SMTP id j14mr881162wrh.138.1521541175661;
	Tue, 20 Mar 2018 03:19:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Tue, 20 Mar 2018 03:19:35 -0700 (PDT)
In-Reply-To: <CAJ86T=VWaJOesaUHM_k=x-+ip044=0SqFhMA4MfNExsz_VYeWw@mail.gmail.com>
References: <CAMKF1sqfasCaxgxFV_-f1UhAeS4GnwJxSU1uz61UbOg3Rmecsg@mail.gmail.com>
	<20180317112607.28536-1-Martin.Jansa@gmail.com>
	<CAJ86T=VWaJOesaUHM_k=x-+ip044=0SqFhMA4MfNExsz_VYeWw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Mar 2018 11:19:35 +0100
Message-ID: <CA+chaQdVBZTfp+jSuCwYufQQz2izdt-Z3OoafdRvAUmrtuP=Lw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] iputils: add PACKAGECONFIG for libidn and disable it by default
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
X-List-Received-Date: Tue, 20 Mar 2018 10:19:35 -0000
Content-Type: multipart/alternative; boundary="089e082fcdb84958250567d56940"

--089e082fcdb84958250567d56940
Content-Type: text/plain; charset="UTF-8"

And v1 just got merged to master, I'll send v2 with change of the default
if other agree.

I don't have strong opinion, yes it might be broken, but it was enabled
since the update to 20161105 and nobody was complaining and adding
PACKAGECONFIG usually shouldn't change the options currently used (I've
meant to disable it by default, just because Khem's request).

On Tue, Mar 20, 2018 at 12:32 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Sat, Mar 17, 2018 at 4:26 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * it got enabled by default, but without the dependency on libidn in:
> >   commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
> >   Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> >   AuthorDate: Thu Feb 1 20:02:08 2018 +0200
> >   Subject: iputils: update to 20161105
> >
> > * https://github.com/iputils/iputils/blob/master/RELNOTES.old
> >   mentiones that IDN was enabled by default in:
> >   [s20160308] and surprisingly the same in [s20150815]
> >   but there are no release notes for s20151218 version we were using
> until
> >   now, don't know how it really relates to [s20150815].
> >
> > * but there are some issues with libidn as described in:
> >   https://github.com/iputils/iputils/commit/
> f3a461603ef4fb7512ade3bdb73fe1824e294547
> >   so disable it by default.
> >
> > * fails with:
> >   | In file included from ping_common.c:1:0:
> >   | ping.h:39:10: fatal error: idna.h: No such file or directory
> >   |  #include <idna.h>
> >   |           ^~~~~~~~
> >
> > * Easiest way to reproduce this failure is to remove libidn from gnutls
> >   PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFIG
> >   at all (like the one in meta-gplv2).
> >
> > * First it leads to following QA issue:
> >   http://errors.yoctoproject.org/Errors/Build/53212/
> >   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping
> rdepends on libidn, but it isn't a build dependency, missing libidn in
> DEPENDS or PACKAGECONFIG? [build-deps]
> >   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue:
> iputils-traceroute6 rdepends on libidn, but it isn't a build dependency,
> missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
> >   ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
> >   Please consider fixing them.
> >   ERROR: iputils-s20161105-r0 do_package_qa: Function failed:
> >   do_package_qa
> >   ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/
> work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
> >   ERROR: Task (/OE/build/oe-core/openembedded-core/meta/
> recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) failed with
> exit code '1'
> >
> > * But if you cleansstate iputils as well (after removing libidn from
> >   gnutls PACKAGECONFIG) to empty iputils RSS, then you get the error
> about
> >   missing idna.h:
> >   http://errors.yoctoproject.org/Errors/Build/53213/
> >
> > * Adding the libidn dependency explicitly in iputils recipe fixes the
> >   issue.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-extended/iputils/iputils_s20161105.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb
> b/meta/recipes-extended/iputils/iputils_s20161105.bb
> > index ad7dbc4d4a..0125739b03 100644
> > --- a/meta/recipes-extended/iputils/iputils_s20161105.bb
> > +++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
> > @@ -23,8 +23,11 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
> >
> >  EXTRA_OEMAKE = "-e MAKEFLAGS="
> >
> > +PACKAGECONFIG ?= ""
>
> It looks like mut (and now master-next) have picked up v1 of this
> patch, where libidn is enabled by default.
>
> > +PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn"
> > +
> >  do_compile () {
> > -       oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${
> STAGING_DIR_HOST}/${base_libdir}" all
> > +       oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${
> STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
> >  }
> >
> >  do_install () {
> > --
> > 2.15.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e082fcdb84958250567d56940
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And v1 just got merged to master, I&#39;ll send v2 with ch=
ange of the default if other agree.<div><br></div><div>I don&#39;t have str=
ong opinion, yes it might be broken, but it was enabled since the=C2=A0<spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">update to 20161105 and nobody was complaining and ad=
ding PACKAGECONFIG usually shouldn&#39;t change the options currently used =
(I&#39;ve meant to disable it by default, just because Khem&#39;s request).=
</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Tue, Mar 20, 2018 at 12:32 AM, Andre McCurdy <span dir=3D"ltr">&lt;<a =
href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb=
"><div class=3D"h5">On Sat, Mar 17, 2018 at 4:26 AM, Martin Jansa &lt;<a hr=
ef=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<=
br>
&gt; * it got enabled by default, but without the dependency on libidn in:<=
br>
&gt;=C2=A0 =C2=A0commit 5997981fa2c22609a88b8cbb595dbf<wbr>7758b2f7c2<br>
&gt;=C2=A0 =C2=A0Author: Alexander Kanavin &lt;<a href=3D"mailto:alexander.=
kanavin@linux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0AuthorDate: Thu Feb 1 20:02:08 2018 +0200<br>
&gt;=C2=A0 =C2=A0Subject: iputils: update to 20161105<br>
&gt;<br>
&gt; * <a href=3D"https://github.com/iputils/iputils/blob/master/RELNOTES.o=
ld" rel=3D"noreferrer" target=3D"_blank">https://github.com/iputils/<wbr>ip=
utils/blob/master/RELNOTES.<wbr>old</a><br>
&gt;=C2=A0 =C2=A0mentiones that IDN was enabled by default in:<br>
&gt;=C2=A0 =C2=A0[s20160308] and surprisingly the same in [s20150815]<br>
&gt;=C2=A0 =C2=A0but there are no release notes for s20151218 version we we=
re using until<br>
&gt;=C2=A0 =C2=A0now, don&#39;t know how it really relates to [s20150815].<=
br>
&gt;<br>
&gt; * but there are some issues with libidn as described in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/iputils/iputils/commit/f3a46=
1603ef4fb7512ade3bdb73fe1824e294547" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/iputils/<wbr>iputils/commit/<wbr>f3a461603ef4fb7512ade3bd=
b73fe1<wbr>824e294547</a><br>
&gt;=C2=A0 =C2=A0so disable it by default.<br>
&gt;<br>
&gt; * fails with:<br>
&gt;=C2=A0 =C2=A0| In file included from ping_common.c:1:0:<br>
&gt;=C2=A0 =C2=A0| ping.h:39:10: fatal error: idna.h: No such file or direc=
tory<br>
&gt;=C2=A0 =C2=A0|=C2=A0 #include &lt;idna.h&gt;<br>
&gt;=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>
&gt;<br>
&gt; * Easiest way to reproduce this failure is to remove libidn from gnutl=
s<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG or to use gnutls which doesn&#39;t have libi=
dn PACKAGECONFIG<br>
&gt;=C2=A0 =C2=A0at all (like the one in meta-gplv2).<br>
&gt;<br>
&gt; * First it leads to following QA issue:<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Build/532=
12/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Build/53212/</a><br>
&gt;=C2=A0 =C2=A0ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputi=
ls-ping rdepends on libidn, but it isn&#39;t a build dependency, missing li=
bidn in DEPENDS or PACKAGECONFIG? [build-deps]<br>
&gt;=C2=A0 =C2=A0ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputi=
ls-traceroute6 rdepends on libidn, but it isn&#39;t a build dependency, mis=
sing libidn in DEPENDS or PACKAGECONFIG? [build-deps]<br>
&gt;=C2=A0 =C2=A0ERROR: iputils-s20161105-r0 do_package_qa: QA run found fa=
tal errors.<br>
&gt;=C2=A0 =C2=A0Please consider fixing them.<br>
&gt;=C2=A0 =C2=A0ERROR: iputils-s20161105-r0 do_package_qa: Function failed=
:<br>
&gt;=C2=A0 =C2=A0do_package_qa<br>
&gt;=C2=A0 =C2=A0ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp=
-glibc/<wbr>work/core2-64-oe-linux/<wbr>iputils/s20161105-r0/temp/log.<wbr>=
do_package_qa.7627<br>
&gt;=C2=A0 =C2=A0ERROR: Task (/OE/build/oe-core/<wbr>openembedded-core/meta=
/<wbr>recipes-extended/iputils/<wbr>iputils_s20161105.bb:do_<wbr>package_qa=
) failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt; * But if you cleansstate iputils as well (after removing libidn from<b=
r>
&gt;=C2=A0 =C2=A0gnutls PACKAGECONFIG) to empty iputils RSS, then you get t=
he error about<br>
&gt;=C2=A0 =C2=A0missing idna.h:<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Build/532=
13/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Build/53213/</a><br>
&gt;<br>
&gt; * Adding the libidn dependency explicitly in iputils recipe fixes the<=
br>
&gt;=C2=A0 =C2=A0issue.<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/iputils/<a href=3D"http://iputils_s2016110=
5.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>iputils_s20161105.bb</a> | =
5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iput=
ils_s20161105.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb=
</a> b/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s201611=
05.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br>
&gt; index ad7dbc4d4a..0125739b03 100644<br>
&gt; --- a/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s20=
161105.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br=
>
&gt; +++ b/meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s20=
161105.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20161105.bb</a><br=
>
&gt; @@ -23,8 +23,11 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt=
;s\d+)&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
&gt;<br>
&gt; +PACKAGECONFIG ?=3D &quot;&quot;<br>
<br>
</div></div>It looks like mut (and now master-next) have picked up v1 of th=
is<br>
patch, where libidn is enabled by default.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +PACKAGECONFIG[libidn] =3D &quot;USE_IDN=3Dyes,USE_IDN=3Dno,<wbr>libid=
n&quot;<br>
&gt; +<br>
&gt;=C2=A0 do_compile () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;CC=3D${CC} -D_GNU_SOURCE&#=
39; VPATH=3D&quot;${STAGING_LIBDIR}:${<wbr>STAGING_DIR_HOST}/${base_<wbr>li=
bdir}&quot; all<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;CC=3D${CC} -D_GNU_SOURCE&#=
39; VPATH=3D&quot;${STAGING_LIBDIR}:${<wbr>STAGING_DIR_HOST}/${base_<wbr>li=
bdir}&quot; ${PACKAGECONFIG_CONFARGS} all<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install () {<br>
&gt; --<br>
&gt; 2.15.1<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--089e082fcdb84958250567d56940--
