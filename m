Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6B5616F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:46:58 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id k188so238490vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cxnTeqjDGdnuJxWsE+R6F1NObRJ3+W8FMwQS+3xHEmI=;
	b=tK36xGebtccvPDzfK6GK54njJNlbLsSPeLk8POFds8BQX189dvStensIiVGXyx4rM6
	NRi+CcPN+aCjLf+tJhoIhzuOtz+y5IXiyblehb2n7Pwa9HxudweSCOBc4yXkCIzS4IpQ
	ynNMJiscBVtLLkL5Rqcts4aulwa5uQR6bZWuVdA/Fhm4LjU0vrPn4XRnt8je2gHbszxR
	YsTKaXd0KRZ60AoWPHcZIS2EvhMn41DSHZar8ZygARbxtlY3w3aD7rWd1uuuE2pM4ubU
	6peozOwrbWSQ0HckTlZCbCULh+4F/CAz+9NVT3+NzRXVDSXFWOKXnj4yAxazAqi719n9
	Fa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cxnTeqjDGdnuJxWsE+R6F1NObRJ3+W8FMwQS+3xHEmI=;
	b=nFbPUqVbBXJUDka31YiYp4qEy4Bemi9MGELxlcU7uHYdFWmoxoedl/Ekw4eE/gYyse
	JZRmOZyk49lqHhWxa0fptnxnF0J3PGftBpOzgd+9bMoTzH4xJi1AwyZmYqNPzHiWZkCd
	xm4glWQliuyHyRBemmuRU5RjESbXzYxur8zxkU9SApFaN4YmP3FYH1LegUJnCKhqm72y
	EEOfD4hshnSew+yWBn+teb5Kqer11fTl4BYV/vnut8pILLu5ltXhaIZjBVBDPRq6ekgI
	GKCdOz4mxUoQx5rigivvu0pEgTrDJVdfrh1PbQhw9fLd4bgFzQUBfcoxaHPYAR9bE87m
	QiIw==
X-Gm-Message-State: APjAAAVF04W1k4kXn0la0rGUPdDRrcuCpPNRjB9S5+Hlui1t64HdVGWT
	5CPvHP2cX+QD4ea/YEtsWY+JLSeMbGJmsgo3CteNgQ==
X-Google-Smtp-Source: APXvYqzHcrZHDxmxMDYroC9McwMH8gDWaAjcTLC5kU1ZfQDNhtjrBPtf0O0RNUI7f8QKBnbqH6m/bQUUc2ptB3h2VtI=
X-Received: by 2002:a67:7987:: with SMTP id u129mr719259vsc.83.1582660019574; 
	Tue, 25 Feb 2020 11:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
In-Reply-To: <CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2020 20:46:48 +0100
Message-ID: <CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 19:46:59 -0000
Content-Type: multipart/alternative; boundary="000000000000445db8059f6bc075"

--000000000000445db8059f6bc075
Content-Type: text/plain; charset="UTF-8"

These are the commits produced monthly by a tool called Automated Upgrade
Helper and sent directly to recipe maintainers as listed in
maintainers.inc. When maintainers receive the patches, they're supposed to
reset the author to themselves, but sometimes it doesn't happen.

Search for 'auh' in oe-core list for monthly summaries of AUH work.

Alex

On Tue, 25 Feb 2020 at 20:43, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Feb 21, 2020 at 2:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: Upgrade Helper <auh@auh.yoctoproject.org>
>
> Why does the author sometimes get set to "Upgrade Helper"? It doesn't
> seem to happen very often (4 times in the past 6 years in oe-core).
> What's special about those 4 cases?
>
> I think it would be clearer if the author was set to whoever ran the tool.
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../ninja/ninja/fix-musl.patch                | 46 -------------------
> >  .../ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb} |  6 +--
> >  2 files changed, 2 insertions(+), 50 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
> >  rename meta/recipes-devtools/ninja/{ninja_1.9.0.bb => ninja_1.10.0.bb}
> (87%)
> >
> > diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> > deleted file mode 100644
> > index 7fd779110d..0000000000
> > --- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 2001
> > -From: makepost <makepost@firemail.cc>
> > -Date: Mon, 24 Dec 2018 03:13:16 +0200
> > -Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
> > -
> > -In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
> > -compatibility macro. Should help avoid hardcoding platform detection.
> > -
> > -Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > -
> > -Upstream-Status: Pending
> > ----
> > - src/disk_interface.cc | 14 ++++----------
> > - 1 file changed, 4 insertions(+), 10 deletions(-)
> > -
> > -diff --git a/src/disk_interface.cc b/src/disk_interface.cc
> > -index d4c2fb0..dc297c4 100644
> > ---- a/src/disk_interface.cc
> > -+++ b/src/disk_interface.cc
> > -@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string&
> path, string* err) const {
> > -   // that it doesn't exist.
> > -   if (st.st_mtime == 0)
> > -     return 1;
> > --#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
> > -+#if defined(_AIX)
> > -+  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> > -+#elif defined(__APPLE__)
> > -   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
> > -           st.st_mtimespec.tv_nsec);
> > --#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 ||
> defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
> > --       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) ||
> defined(__FreeBSD__))
> > --  // For glibc, see "Timestamp files" in the Notes of
> http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
> > --  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and
> define the right macro values above.
> > --  // For bsd, see
> https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
> > --  // For bionic, C and POSIX API is always enabled.
> > --  // For solaris, see
> https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
> > -+#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
> > -   return (int64_t)st.st_mtim.tv_sec * 1000000000LL +
> st.st_mtim.tv_nsec;
> > --#elif defined(_AIX)
> > --  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
> > - #else
> > -   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
> > - #endif
> > ---
> > -2.17.1
> > -
> > diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
> > similarity index 87%
> > rename from meta/recipes-devtools/ninja/ninja_1.9.0.bb
> > rename to meta/recipes-devtools/ninja/ninja_1.10.0.bb
> > index f1236e8ac8..bdc6365052 100644
> > --- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> > +++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
> > @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> >
> >  DEPENDS = "re2c-native ninja-native"
> >
> > -SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
> > +SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
> >
> > -SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
> > -           file://fix-musl.patch \
> > -"
> > +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
> >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> >
> >  S = "${WORKDIR}/git"
> > --
> > 2.25.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000445db8059f6bc075
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>These are the commits produced monthly by a tool call=
ed Automated Upgrade Helper and sent directly to recipe maintainers as list=
ed in maintainers.inc. When maintainers receive the patches, they&#39;re su=
pposed to reset the author to themselves, but sometimes it doesn&#39;t happ=
en.</div><div><br></div><div>Search for &#39;auh&#39; in oe-core list for m=
onthly summaries of AUH work.<br></div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, 25 Feb 2020 at 20:43, Andre McCurdy &lt;<a href=3D"mailto:armccurdy@g=
mail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Fri, Feb 21, 2020 at 2:46 PM Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; From: Upgrade Helper &lt;<a href=3D"mailto:auh@auh.yoctoproject.org" t=
arget=3D"_blank">auh@auh.yoctoproject.org</a>&gt;<br>
<br>
Why does the author sometimes get set to &quot;Upgrade Helper&quot;? It doe=
sn&#39;t<br>
seem to happen very often (4 times in the past 6 years in oe-core).<br>
What&#39;s special about those 4 cases?<br>
<br>
I think it would be clearer if the author was set to whoever ran the tool.<=
br>
<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ninja/ninja/fix-musl.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 46 -------------------<br>
&gt;=C2=A0 .../ninja/{<a href=3D"http://ninja_1.9.0.bb" rel=3D"noreferrer" =
target=3D"_blank">ninja_1.9.0.bb</a> =3D&gt; <a href=3D"http://ninja_1.10.0=
.bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.10.0.bb</a>} |=C2=A0 6 +-=
-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 50 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.pa=
tch<br>
&gt;=C2=A0 rename meta/recipes-devtools/ninja/{<a href=3D"http://ninja_1.9.=
0.bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb</a> =3D&gt; <a hr=
ef=3D"http://ninja_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.=
10.0.bb</a>} (87%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/r=
ecipes-devtools/ninja/ninja/fix-musl.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 7fd779110d..0000000000<br>
&gt; --- a/meta/recipes-devtools/ninja/ninja/fix-musl.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,46 +0,0 @@<br>
&gt; -From e92a915183f8bff268f74c8cd00d986301a2bbf8 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: makepost &lt;makepost@firemail.cc&gt;<br>
&gt; -Date: Mon, 24 Dec 2018 03:13:16 +0200<br>
&gt; -Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510<br>
&gt; -<br>
&gt; -In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backwar=
d<br>
&gt; -compatibility macro. Should help avoid hardcoding platform detection.=
<br>
&gt; -<br>
&gt; -Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@o=
leksandr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com=
</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; ----<br>
&gt; - src/disk_interface.cc | 14 ++++----------<br>
&gt; - 1 file changed, 4 insertions(+), 10 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/disk_interface.cc b/src/disk_interface.cc<br>
&gt; -index d4c2fb0..dc297c4 100644<br>
&gt; ---- a/src/disk_interface.cc<br>
&gt; -+++ b/src/disk_interface.cc<br>
&gt; -@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string&=
amp; path, string* err) const {<br>
&gt; -=C2=A0 =C2=A0// that it doesn&#39;t exist.<br>
&gt; -=C2=A0 =C2=A0if (st.st_mtime =3D=3D 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; --#if defined(__APPLE__) &amp;&amp; !defined(_POSIX_C_SOURCE)<br>
&gt; -+#if defined(_AIX)<br>
&gt; -+=C2=A0 return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;<b=
r>
&gt; -+#elif defined(__APPLE__)<br>
&gt; -=C2=A0 =C2=A0return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st.st_mtimespec.tv_nsec);<br=
>
&gt; --#elif (_POSIX_C_SOURCE &gt;=3D 200809L || _XOPEN_SOURCE &gt;=3D 700 =
|| defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0defined(__BIONIC__) || (defined (__SVR4) =
&amp;&amp; defined (__sun)) || defined(__FreeBSD__))<br>
&gt; --=C2=A0 // For glibc, see &quot;Timestamp files&quot; in the Notes of=
 <a href=3D"http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://www.kernel.org/doc/man-page=
s/online/pages/man2/stat.2.html</a><br>
&gt; --=C2=A0 // newlib, uClibc and musl follow the kernel (or Cygwin) head=
ers and define the right macro values above.<br>
&gt; --=C2=A0 // For bsd, see <a href=3D"https://github.com/freebsd/freebsd=
/blob/master/sys/sys/stat.h" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/freebsd/freebsd/blob/master/sys/sys/stat.h</a> and similar<br>
&gt; --=C2=A0 // For bionic, C and POSIX API is always enabled.<br>
&gt; --=C2=A0 // For solaris, see <a href=3D"https://docs.oracle.com/cd/E88=
353_01/html/E37841/stat-2.html" rel=3D"noreferrer" target=3D"_blank">https:=
//docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html</a>.<br>
&gt; -+#elif defined(st_mtime) // A macro, so we&#39;re likely on modern PO=
SIX.<br>
&gt; -=C2=A0 =C2=A0return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st=
_mtim.tv_nsec;<br>
&gt; --#elif defined(_AIX)<br>
&gt; --=C2=A0 return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;<b=
r>
&gt; - #else<br>
&gt; -=C2=A0 =C2=A0return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime=
nsec;<br>
&gt; - #endif<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.9.0=
.bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb</a> b/meta/recipes=
-devtools/ninja/<a href=3D"http://ninja_1.10.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ninja_1.10.0.bb</a><br>
&gt; similarity index 87%<br>
&gt; rename from meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.9.0.=
bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb</a><br>
&gt; rename to meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.10.0.b=
b" rel=3D"noreferrer" target=3D"_blank">ninja_1.10.0.bb</a><br>
&gt; index f1236e8ac8..bdc6365052 100644<br>
&gt; --- a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.9.0.bb" re=
l=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.10.0.bb" r=
el=3D"noreferrer" target=3D"_blank">ninja_1.10.0.bb</a><br>
&gt; @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da8158=
6a64ad4e476c791cda7e2f2c52e&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;re2c-native ninja-native&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;b25c08bda4949192c69cea4cee057887341a2ffc&quot;<br>
&gt; +SRCREV =3D &quot;ed7f67040b370189d989adbd60ff8ea29957231f&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/ninja-build/ninj=
a.git;branch=3Drelease" rel=3D"noreferrer" target=3D"_blank">github.com/nin=
ja-build/ninja.git;branch=3Drelease</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-musl.patch \<br>
&gt; -&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ninja-build/ninj=
a.git;branch=3Drelease" rel=3D"noreferrer" target=3D"_blank">github.com/nin=
ja-build/ninja.git;branch=3Drelease</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;.*)&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000445db8059f6bc075--
