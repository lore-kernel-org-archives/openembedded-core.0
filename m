Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.35384.1595243549144549770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 04:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MpieAleU;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id h28so12490937edz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gc69Tj/KBX5MkEqohDgmOM9MIb17QYK76YKmSPgsajk=;
        b=MpieAleU854Dt2xMCcoIjPN+/x8yFl86OkkKQh5NbLsqteQNc7P598d/VAkKEseWUu
         gnT1uTCXAl+fXL4TpLa6PniH6yh2tTqTcEfKCZntRx9X/d5d2BJjbape8W4o05OKefG+
         xhcif7rxmHTsQTxhtVQ4TEPqiZjVt1Q5SbS4NB7MYQvD4vAdI6yLCbzAZLYOCRSePfoZ
         mAtOmNhfS7NyTwwlkV6AWP5fgDn8oCmI9xHHKtq/Volf23D+ysb4GFfZxpvPFYiDE2BG
         ou9tD+VTjqYelB4adivElPJVMs6TZZwERru49TZzvpGzsI5EIJVvNjQfP2qTLTJXbeHS
         nUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gc69Tj/KBX5MkEqohDgmOM9MIb17QYK76YKmSPgsajk=;
        b=CPvhjFGGTuRwgHnq0YdtsleuTOUjRgGRrAORmfItCepMItSIscVI1CutgVTi41Ahrq
         RjKqcFT2lHalrEfCpJCDl4211tU8HqyCCxiO4Q94G4cBumpFwDvL1017q+OoIdVw5HBZ
         Y1Zl+zCXF7Z1ohxwpOvLCQc36Qbq//cz5fT7pSFAnJ0tersM3s64oFyr3hknSKjya7HG
         iFZoyqwCUiXSqcj37grxu6poa7SQOmGsmrRpnw6zyDA6tPcRenvYkLDzgF+OI57LHlJI
         W6ONyyj8Yx7sMZcRcMZcGhkMJTR17fws6kkl+RoqTGvdWNYMuu2SL3yTegMHzOX3DutN
         x8PA==
X-Gm-Message-State: AOAM5314nhpQ5uafXE9BbqRvEHdvJcUZwTv/bpceeKGMPqJFAJ4ZgYAz
	xjqwcRoBydR+L2R70yoD1s09OMGhIcaeXb61a0o=
X-Google-Smtp-Source: ABdhPJxenEU6Hicuq64IE6c3hlYRPBZtXkVjhzIVVG+7e1K7CLRfk2WT4vrAUxFkUm7Q1/4ds6HloW9ticRK+BT/H0I=
X-Received: by 2002:aa7:c504:: with SMTP id o4mr20567331edq.311.1595243547734;
 Mon, 20 Jul 2020 04:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200630094907.1396284-1-changqing.li@windriver.com>
 <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
 <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com> <CA+chaQc3oXSrbDYdWKRyFEbqn9oNHdeiAVexmzVndwcyYFEBog@mail.gmail.com>
 <100548f6-240a-4ba1-0aeb-bc301d066c52@windriver.com> <db248f93-870a-bff8-4959-29faa8fa7c28@gmail.com>
 <ae137063-cebf-8af8-383d-a707de2556ca@windriver.com>
In-Reply-To: <ae137063-cebf-8af8-383d-a707de2556ca@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 20 Jul 2020 13:12:16 +0200
Message-ID: <CA+chaQdLigicck-6Q53upOEBNxGei1a_465P6kOb_ZV8ungYMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
To: Changqing Li <changqing.li@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fe372405aadd9451"

--000000000000fe372405aadd9451
Content-Type: text/plain; charset="UTF-8"

> Martin, Khem, I still don't know how to reproduce this error "Unable
to find matching sigdata for ....",  could you send how to reproduce?

"Unable to find matching sigdata for ...." part is irrelevant

The issue is this:
"Hash for dependent task gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot
changed from
a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f"

and you can reproduce it when you generate the signatures for 2 MACHINEs
with different TUNE_PKGARCH e.g. qemux86 and qemuarm.



On Fri, Jul 17, 2020 at 9:36 AM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 7/14/20 12:30 AM, Khem Raj wrote:
> >
> >
> > On 7/12/20 11:03 PM, Changqing Li wrote:
> >> Hi, Martin
> >>
> >> Thanks for tell me the problem.  Maybe I don't understand you
> >> correctly,  but I don't met your problem, below is what I tried,
> >>
> >> if I am wrong, please tell me how I can reproduce your problem, thanks.
> >>
> >>
> >
> > since gtk+3 or perhaps even gdk-pixbuf is not allarch package being
> > added as runtime dependency here would mean that any package thats
> > inheriting this class and allarch class will have the issue Martin is
> > seeing, one way to fix is to call it abi safe using
> > SIGGEN_EXCLUDERECIPES_ABISAFE but since its a class, I dont think you
> > can easily call that out in layer.conf.
>
> How about add it in gtk-icon-cache.bbclass,  and check the arch first,
> if it is allarch,  then add gtk+3/pixbug into
> SIGGEN_EXCLUDERECIPES_ABISAFE?
>
> >
> >> Here is what I tried:
> >>
> >> bitbake adwaita-icon-themewithout my patch, and then build
> >> adwaita-icon-theme with my patch, and then run below command:
> >>
> >> bitbake-diffsigs
> >>
> 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.608eb6ea5873c19534fddfeacee59d81fa799ce6c965217ffe76a0141885093a
>
> >>
> 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.b10948f26bfd089980c9f9af928e108e9764627201dcfd9db43efc8a455b181b
>
> >>
> >> NOTE: Starting bitbake server...
> >> runtaskdeps changed:
> >> ['autoconf/autoconf_2.69.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/autoconf/
> autoconf_2.69.bb
> >> automake/automake_1.16.2.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/automake/
> automake_1.16.2.bb',
> >> +gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot,
> >> 'gnome/adwaita-icon-theme_3.36.1.bb:do_fetch
> >> gnu-config/gnu-config_git.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/gnu-config/
> gnu-config_git.bb',
> >> +gtk+/gtk+3_3.24.21.bb:do_populate_sysroot,
> >> 'gtk+/gtk+3_3.24.21.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/gtk+/gtk+
> 3_3.24.21.bb
> >> hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot
> >> librsvg/librsvg_2.40.20.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-gnome/librsvg/
> librsvg_2.40.20.bb
> >> libtool/libtool-native_2.4.6.bb:do_populate_sysroot
> >> pkgconfig/pkgconfig_git.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pkgconfig/
> pkgconfig_git.bb
> >> pseudo/pseudo_git.bb:
> do_populate_sysroot:virtual:native:/poky/meta/recipes-devtools/pseudo/
> pseudo_git.bb']
> >>
> >> Number of task dependencies changed
> >> Dependency on task gtk+/gtk+3_3.24.21.bb:do_populate_sysroot was
> >> added with hash
> >> 60018dc07fa11c46226232c0923871b65f88f51a0b7665045f779a1111c1e1dd
> >> Dependency on task
> >> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot was added with
> >> hash 17cd8a1fe76fa0b342dc50b8e2d71d8d88eec93d0367ae48629ae66f41eca11f
> >>
> >>
> >> On 7/11/20 12:37 AM, Martin Jansa wrote:
> >>> With this change now in master and dunfell there is signature issue
> >>> in allarch adwaita-icon-theme now runtime depending on TUNE_PKGARCH
> >>> gdk-pixbuf as shown by sstate-diff-machines.sh/bitbake-diffsigs
> >>> <http://sstate-diff-machines.sh/bitbake-diffsigs>:
> >>>
> >>> bitbake-diffsigs
> >>>
> tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwaita-icon-theme/*do_prepare_recipe_sysroot*
> >>> NOTE: Starting bitbake server...
> >>> NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP:
> >>> 127.0.0.1, PORT: 33511, PID: 36423
> >>> Hash for dependent task
> >>> gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from
> >>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
> >>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
> >>> Unable to find matching sigdata for
> >>> openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot
>
> >>> with hashes
> >>> a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 or
> >>> 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f
>
> Martin, Khem, I still don't know how to reproduce this error "Unable to
> find matching sigdata for ....",  could you send how to reproduce?
>
> >>>
> >>> On Wed, Jul 1, 2020 at 3:39 AM Changqing Li
> >>> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>>
> wrote:
> >>>
> >>>
> >>>     On 6/30/20 6:01 PM, Richard Purdie wrote:
> >>>     > On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:
> >>>     >> From: Changqing Li <changqing.li@windriver.com
> >>>     <mailto:changqing.li@windriver.com>>
> >>>     >>
> >>>     >> fix error:
> >>>     >> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
> >>> --update-cache
> >>>     >> /var/tmp/rpm-tmp.mdYxY6: line 12:
> >>>     /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
> >>>     >> query-loaders: No such file or directory
> >>>     >> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961)
> >>> rc 2961
> >>>     >> status 7f00
> >>>     >> warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet
> >>>     >> failed, exit status 127
> >>>     >>
> >>>     >> when install adwaita-icon-theme, which inherit gtk-icon-cache
> >>>     >> on target, above error reported,  fix by add needeed packages
> >>>     >> in RDEPENDS
> >>>     >>
> >>>     >> Signed-off-by: Changqing Li <changqing.li@windriver.com
> >>>     <mailto:changqing.li@windriver.com>>
> >>>     >> ---
> >>>     >>   meta/classes/gtk-icon-cache.bbclass | 2 ++
> >>>     >>   1 file changed, 2 insertions(+)
> >>>     >>
> >>>     >> diff --git a/meta/classes/gtk-icon-cache.bbclass
> >>>     b/meta/classes/gtk-
> >>>     >> icon-cache.bbclass
> >>>     >> index 91cb4ad409..7f218ce7ae 100644
> >>>     >> --- a/meta/classes/gtk-icon-cache.bbclass
> >>>     >> +++ b/meta/classes/gtk-icon-cache.bbclass
> >>>     >> @@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme',
> >>>     '']['${BPN}' ==
> >>>     >> 'hicolor-icon-theme']} gtk
> >>>     >>
> >>>     >>   PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
> >>>     >>
> >>>     >> +RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
> >>>     >> +
> >>>     >>   gtk_icon_cache_postinst() {
> >>>     >>   if [ "x$D" != "x" ]; then
> >>>     >>      $INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache
> >>> ${PKG}
> >>>     >> \
> >>>     > This isn't quite right since the postinst may be added to a
> >>> package
> >>>     > other than ${PN}.
> >>>     >
> >>>     > You need to add the RDEPENDS to the code:
> >>>     >
> >>>     >          rdepends = ' ' + d.getVar('MLPREFIX', False) +
> >>>     "hicolor-icon-theme"
> >>>     >          d.appendVar('RDEPENDS_%s' % pkg, rdepends)
> >>>     >
> >>>     > later in that class.
> >>>     >
> >>>     > Cheers,
> >>>     >
> >>>     > Richard
> >>>     Thanks, I will correct it.
> >>>     >
> >>>
> >>
> >> 
> >>
>

--000000000000fe372405aadd9451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Martin, Khem, I still don&#39;t know how to reproduce=
 this error &quot;Unable to=C2=A0find matching sigdata for ....&quot;,=C2=
=A0 could you send how to reproduce?<div><br></div><div>&quot;Unable to=C2=
=
=A0find matching sigdata for ....&quot; part is irrelevant<br></div><div><=
br></div><div>The issue is this:</div><div>&quot;Hash for dependent task gd=
k-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from a72aba843269=
9c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to 1ad4e1bd76921b71482=
657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f&quot;</div><div><br></div><di=
v>and you can reproduce it when you generate the signatures for 2 MACHINEs =
with different TUNE_PKGARCH e.g. qemux86 and qemuarm.<br><div><br></div><di=
v><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Jul 17, 2020 at 9:36 AM Changqing Li &lt;<a href=
=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 7/14/20 12:30 AM, Khem Raj wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 7/12/20 11:03 PM, Changqing Li wrote:<br>
&gt;&gt; Hi, Martin<br>
&gt;&gt;<br>
&gt;&gt; Thanks for tell me the problem.=C2=A0 Maybe I don&#39;t understan=
d you <br>
&gt;&gt; correctly,=C2=A0 but I don&#39;t met your problem, below is what =
I tried,<br>
&gt;&gt;<br>
&gt;&gt; if I am wrong, please tell me how I can reproduce your problem, t=
hanks.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; since gtk+3 or perhaps even gdk-pixbuf is not allarch package being <=
br>
&gt; added as runtime dependency here would mean that any package thats <b=
r>
&gt; inheriting this class and allarch class will have the issue Martin is=
 <br>
&gt; seeing, one way to fix is to call it abi safe using <br>
&gt; SIGGEN_EXCLUDERECIPES_ABISAFE but since its a class, I dont think you=
 <br>
&gt; can easily call that out in layer.conf.<br>
<br>
How about add it in gtk-icon-cache.bbclass,=C2=A0 and check the arch first=
,=C2=A0 <br>
if it is allarch,=C2=A0 then add gtk+3/pixbug into SIGGEN_EXCLUDERECIPES_A=
BISAFE?<br>
<br>
&gt;<br>
&gt;&gt; Here is what I tried:<br>
&gt;&gt;<br>
&gt;&gt; bitbake adwaita-icon-themewithout my patch, and then build <br>
&gt;&gt; adwaita-icon-theme with my patch, and then run below command:<br>
&gt;&gt;<br>
&gt;&gt; bitbake-diffsigs <br>
&gt;&gt; 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.608eb6ea5873c19534fdd=
feacee59d81fa799ce6c965217ffe76a0141885093a <br>
&gt;&gt; 3.36.1-r0.do_prepare_recipe_sysroot.sigdata.b10948f26bfd089980c9f=
9af928e108e9764627201dcfd9db43efc8a455b181b <br>
&gt;&gt;<br>
&gt;&gt; NOTE: Starting bitbake server...<br>
&gt;&gt; runtaskdeps changed:<br>
&gt;&gt; [&#39;autoconf/autoconf_2.69.bb:do_populate_sysroot:virtual:nativ=
e:/poky/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.69.bb" =
rel=3D"noreferrer" target=3D"_blank">autoconf_2.69.bb</a> <br>
&gt;&gt; automake/automake_1.16.2.bb:do_populate_sysroot:virtual:native:/p=
oky/meta/recipes-devtools/automake/<a href=3D"http://automake_1.16.2.bb" re=
l=3D"noreferrer" target=3D"_blank">automake_1.16.2.bb</a>&#39;, <br>
&gt;&gt; +gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot, <br>
&gt;&gt; &#39;gnome/adwaita-icon-theme_3.36.1.bb:do_fetch <br>
&gt;&gt; gnu-config/gnu-config_git.bb:do_populate_sysroot:virtual:native:/=
poky/meta/recipes-devtools/gnu-config/<a href=3D"http://gnu-config_git.bb" =
rel=3D"noreferrer" target=3D"_blank">gnu-config_git.bb</a>&#39;, <br>
&gt;&gt; +gtk+/gtk+3_3.24.21.bb:do_populate_sysroot, <br>
&gt;&gt; &#39;gtk+/gtk+3_3.24.21.bb:do_populate_sysroot:virtual:native:/po=
ky/meta/recipes-gnome/gtk+/gtk+<a href=3D"http://3_3.24.21.bb" rel=3D"noref=
errer" target=3D"_blank">3_3.24.21.bb</a> <br>
&gt;&gt; hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot=
 <br>
&gt;&gt; librsvg/librsvg_2.40.20.bb:do_populate_sysroot:virtual:native:/po=
ky/meta/recipes-gnome/librsvg/<a href=3D"http://librsvg_2.40.20.bb" rel=3D"=
noreferrer" target=3D"_blank">librsvg_2.40.20.bb</a> <br>
&gt;&gt; libtool/libtool-native_2.4.6.bb:do_populate_sysroot <br>
&gt;&gt; pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native:/po=
ky/meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_git.bb" rel=
=3D"noreferrer" target=3D"_blank">pkgconfig_git.bb</a> <br>
&gt;&gt; pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native:/poky/met=
a/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"noreferre=
r" target=3D"_blank">pseudo_git.bb</a>&#39;] <br>
&gt;&gt;<br>
&gt;&gt; Number of task dependencies changed<br>
&gt;&gt; Dependency on task gtk+/gtk+3_3.24.21.bb:do_populate_sysroot was =
<br>
&gt;&gt; added with hash <br>
&gt;&gt; 60018dc07fa11c46226232c0923871b65f88f51a0b7665045f779a1111c1e1dd<=
br>
&gt;&gt; Dependency on task <br>
&gt;&gt; gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot was added wit=
h <br>
&gt;&gt; hash 17cd8a1fe76fa0b342dc50b8e2d71d8d88eec93d0367ae48629ae66f41ec=
a11f<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 7/11/20 12:37 AM, Martin Jansa wrote:<br>
&gt;&gt;&gt; With this change now in master and dunfell there is signature=
 issue <br>
&gt;&gt;&gt; in allarch=C2=A0adwaita-icon-theme now runtime depending on T=
UNE_PKGARCH <br>
&gt;&gt;&gt; gdk-pixbuf as shown by <a href=3D"http://sstate-diff-machines=
.sh/bitbake-diffsigs" rel=3D"noreferrer" target=3D"_blank">sstate-diff-mach=
ines.sh/bitbake-diffsigs</a> <br>
&gt;&gt;&gt; &lt;<a href=3D"http://sstate-diff-machines.sh/bitbake-diffsig=
s" rel=3D"noreferrer" target=3D"_blank">http://sstate-diff-machines.sh/bitb=
ake-diffsigs</a>&gt;:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; bitbake-diffsigs <br>
&gt;&gt;&gt; tmp-glibc/sstate-diff/1594398219/qemu*/all-webos-linux/adwait=
a-icon-theme/*do_prepare_recipe_sysroot*<br>
&gt;&gt;&gt; NOTE: Starting bitbake server...<br>
&gt;&gt;&gt; NOTE: Started PRServer with DBfile: cache/prserv.sqlite3, IP:=
 <br>
&gt;&gt;&gt; 127.0.0.1, PORT: 33511, PID: 36423<br>
&gt;&gt;&gt; Hash for dependent task <br>
&gt;&gt;&gt; gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed f=
rom <br>
&gt;&gt;&gt; a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e40=
7f4 to <br>
&gt;&gt;&gt; 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b15=
20f<br>
&gt;&gt;&gt; Unable to find matching sigdata for <br>
&gt;&gt;&gt; openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.=
40.0.bb:do_populate_sysroot <br>
&gt;&gt;&gt; with hashes <br>
&gt;&gt;&gt; a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e40=
7f4 or <br>
&gt;&gt;&gt; 1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b15=
20f<br>
<br>
Martin, Khem, I still don&#39;t know how to reproduce this error &quot;Una=
ble to <br>
find matching sigdata for ....&quot;,=C2=A0 could you send how to reproduc=
e?<br>
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed, Jul 1, 2020 at 3:39 AM Changqing Li <br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:changqing.li@windriver.com" target=3D"_=
blank">changqing.li@windriver.com</a> &lt;mailto:<a href=3D"mailto:changqin=
g.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;&gt=
; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 On 6/30/20 6:01 PM, Richard Purdie wrote:<=
br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; On Tue, 2020-06-30 at 17:49 +0800, Ch=
angqing Li wrote:<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; From: Changqing Li &lt;<a href=3D=
"mailto:changqing.li@windriver.com" target=3D"_blank">changqing.li@windrive=
r.com</a><br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"mailto:changqing.li@=
windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; fix error:<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; + /usr/lib/gdk-pixbuf-2.0/gdk-pix=
buf-query-loaders <br>
&gt;&gt;&gt; --update-cache<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; /var/tmp/rpm-tmp.mdYxY6: line 12:=
<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; query-loaders: No such file or di=
rectory<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; %post(adwaita-icon-theme-3.36.1-r=
0.0.noarch): waitpid(2961) <br>
&gt;&gt;&gt; rc 2961<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; status 7f00<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; warning: %post(adwaita-icon-theme=
-3.36.1-r0.0.noarch) scriptlet<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; failed, exit status 127<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; when install adwaita-icon-theme, =
which inherit gtk-icon-cache<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; on target, above error reported,=
=C2=A0 fix by add needeed packages<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; in RDEPENDS<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; Signed-off-by: Changqing Li &lt;<=
a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank">changqing.li=
@windriver.com</a><br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"mailto:changqing.li@=
windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;=C2=A0 =C2=A0meta/classes/gtk-icon=
-cache.bbclass | 2 ++<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;=C2=A0 =C2=A01 file changed, 2 ins=
ertions(+)<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; diff --git a/meta/classes/gtk-ico=
n-cache.bbclass<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 b/meta/classes/gtk-<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; icon-cache.bbclass<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; index 91cb4ad409..7f218ce7ae 1006=
44<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; --- a/meta/classes/gtk-icon-cache=
.bbclass<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; +++ b/meta/classes/gtk-icon-cache=
.bbclass<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; @@ -4,6 +4,8 @@ DEPENDS +=3D&quot=
; ${@[&#39;hicolor-icon-theme&#39;,<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &#39;&#39;][&#39;${BPN}&#39; =3D=3D<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; &#39;hicolor-icon-theme&#39;]} gt=
k<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;=C2=A0 =C2=A0PACKAGE_WRITE_DEPS +=
=3D &quot;gtk+3-native gdk-pixbuf-native&quot;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; +RDEPENDS_${PN} +=3D &quot;gdk-pi=
xbuf gtk+3&quot;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; +<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;=C2=A0 =C2=A0gtk_icon_cache_postin=
st() {<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;=C2=A0 =C2=A0if [ &quot;x$D&quot; =
!=3D &quot;x&quot; ]; then<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 $INTERCEPT_DI=
R/postinst_intercept update_gtk_icon_cache <br>
&gt;&gt;&gt; ${PKG}<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;&gt; \<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; This isn&#39;t quite right since the =
postinst may be added to a <br>
&gt;&gt;&gt; package<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; other than ${PN}.<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; You need to add the RDEPENDS to the c=
ode:<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rde=
pends =3D &#39; &#39; + d.getVar(&#39;MLPREFIX&#39;, False) +<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &quot;hicolor-icon-theme&quot;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.a=
ppendVar(&#39;RDEPENDS_%s&#39; % pkg, rdepends)<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; later in that class.<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; Cheers,<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; Richard<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Thanks, I will correct it.<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--000000000000fe372405aadd9451--
