Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id E346560851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 12:24:40 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id n64-v6so12884716itb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aNKaE3SlKttAuFIxbEjr/NaeSMRKBu+VlspGtGwT7yk=;
	b=qDiU/3VmZJNVSPXTjba4aucRARx26cNIkibfOnTQP2HTyZRc53vCrzOMLd9LZwHSJh
	k1usfzI3vmAExT/exANx9z3afNLLVISad91acDYEdGj5IXg2M/ru7HrvXXoPjrdGLdVh
	cXJn5HNvFQYtfqouZ/JsPh5oMbXKwG6xtPrNpjLHBgIA7JxuooAYXhaJAmXOfuUiZL2M
	sgv+26kqfrStH0trtxnuG9MZm9iilkatRYiF1w8EiychLdx5QIgwJEYEtozfvytWhoJh
	84oAt4k7V5TtjFHvaRUvd8sDrNYw/0OAYUqS8ujWH2tmi2qjoYWacmoB/EAG9Pk/1jbP
	O2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aNKaE3SlKttAuFIxbEjr/NaeSMRKBu+VlspGtGwT7yk=;
	b=h5R3j6FelOYBebESqf5vY8jMLhXI31+qEKw2UfcpY19bqlTQjBOyXnJHAqXxwxzh3H
	gL9je+VyvjzxONHRv7/O0ef4Y3yRQFdAby2LHH4jWMUGZgxbtaDhVb3znZKXG6YB6Ml3
	cTiE5HxhxJN4/XDyGZSEOUqIsFDiC13YNYf1Q7cWA8JzYxklCh08PvnRMmxROHgFt0Rt
	1qsBZFI+dp4R4N5qTJGt/r3SSbM5l/pAc9T51fB7pm8RTY+W7sH/rH/fVLiD7HZhuauW
	Sa3s6ZRPxDtVcpzQQjhMNeTlOg/QblbkWv+wTl1/IhmtE9oi1ogY/KoPu/FisEf72CEC
	GKPw==
X-Gm-Message-State: ALKqPwf7mbK6C8dvrQqg1KlvjRlT7oLi40kefZ7gVzcQyske98q8+xws
	EOGgJHL/SHFLpcZrxL6aqSJKot5TWC5hin5LxWtAQw==
X-Google-Smtp-Source: AB8JxZpDqKsnCkccvofgBGudukC/9U6amc7CQWq0zBl3DEMqO+dhaty6Sl0bTRPuy9qalmmjcujejTK2ESYXiUIzuMc=
X-Received: by 2002:a24:a13:: with SMTP id 19-v6mr7348671itw.104.1526646280988;
	Fri, 18 May 2018 05:24:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.78.5 with HTTP; Fri, 18 May 2018 05:24:20 -0700 (PDT)
X-Originating-IP: [177.194.217.140]
In-Reply-To: <CAJ86T=XbsORQD062SHnacc6kk9+cvfpJGdnpe8m_70V8P1McxA@mail.gmail.com>
References: <20180517191536.12283-1-fabio.berton@ossystems.com.br>
	<CAJ86T=XbsORQD062SHnacc6kk9+cvfpJGdnpe8m_70V8P1McxA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 18 May 2018 09:24:20 -0300
Message-ID: <CAAPZna3aoEwRF-YDB1E1SNEMDouf+mmJW=Y2EBApGVLwCQjJ2Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Add util-linux-umount to RDEPENDS
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
X-List-Received-Date: Fri, 18 May 2018 12:24:41 -0000
Content-Type: multipart/alternative; boundary="00000000000048b30e056c7a091d"

--00000000000048b30e056c7a091d
Content-Type: text/plain; charset="UTF-8"

Yes, I tested this patch seems to work.

But bug report has:

"Yeah, this appears to be a limitation of busybox, and needs to be fixed in
busybox. We focus on util-linux proper, which has supported this option
since generations"

So, I add umount from util-linux because systemd focus on util-linux and
systemd recipe already has util-linux-mount.

If add patch to busybox is a better solution I can do this and send to list.

Fabio

On Thu, May 17, 2018 at 4:53 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, May 17, 2018 at 12:15 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > Images with systemd fails on reboot with error:
> >
> >    [FAILED] Failed unmounting Temporary Directory (/tmp).
> >
> > This happens because busybox umount command doesn't has -c
> > option. Add util-linux-umount that has this option to fix
> > this issue.
> >
> > See details: https://github.com/systemd/systemd/issues/7786
>
> That bug report mentions a fix to busybox. Since the fix is available
> in upstream busybox, maybe better to just backport the patch to our
> version of buysbox:
>
>   https://git.busybox.net/busybox/commit/?id=
> 426134128112738c97a665170b21153ef0764b7d
>
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  meta/recipes-core/systemd/systemd_237.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_237.bb
> b/meta/recipes-core/systemd/systemd_237.bb
> > index b7c2113255f..3b0f4580d49 100644
> > --- a/meta/recipes-core/systemd/systemd_237.bb
> > +++ b/meta/recipes-core/systemd/systemd_237.bb
> > @@ -478,7 +478,7 @@ FILES_${PN} = " ${base_bindir}/* \
> >
> >  FILES_${PN}-dev += "${base_libdir}/security/*.la
> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> >
> > -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})
> util-linux-agetty"
> > +RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (=
> ${EXTENDPKGV}) util-linux-agetty"
> >  RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
> >  RDEPENDS_${PN} += "volatile-binds update-rc.d"
> >
> > --
> > 2.14.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000048b30e056c7a091d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Yes, I tested this patch seems to work.</div><=
div class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-family:mono=
space,monospace;font-size:small">But bug report has:</div><div class=3D"gma=
il_default" style=3D"font-family:monospace,monospace;font-size:small"><br><=
/div><div class=3D"gmail_default"><font face=3D"monospace, monospace">&quot=
;Yeah, this appears to be a limitation of busybox, and needs to be fixed in=
 busybox. We focus on util-linux proper, which has supported this option si=
nce generations&quot;</font><br></div><div class=3D"gmail_default"><font fa=
ce=3D"monospace, monospace"><br></font></div><div class=3D"gmail_default"><=
font face=3D"monospace, monospace">So, I add umount from util-linux because=
 systemd focus on=C2=A0util-linux and systemd recipe already has=C2=A0util-=
linux-mount.</font></div><div class=3D"gmail_default"><font face=3D"monospa=
ce, monospace"><br></font></div><div class=3D"gmail_default"><font face=3D"=
monospace, monospace">If add patch to busybox is a better solution I can do=
 this and send to list.</font></div><div class=3D"gmail_default"><font face=
=3D"monospace, monospace"><br></font></div><div class=3D"gmail_default"><fo=
nt face=3D"monospace, monospace">Fabio</font></div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Thu, May 17, 2018 at 4:53 PM, An=
dre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" ta=
rget=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D"">On Thu, May 17, 2018 at 12:15 PM, Fabio B=
erton<br>
&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems=
.com.br</a><wbr>&gt; wrote:<br>
&gt; Images with systemd fails on reboot with error:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 [FAILED] Failed unmounting Temporary Directory (/tmp).<br=
>
&gt;<br>
&gt; This happens because busybox umount command doesn&#39;t has -c<br>
&gt; option. Add util-linux-umount that has this option to fix<br>
&gt; this issue.<br>
&gt;<br>
&gt; See details: <a href=3D"https://github.com/systemd/systemd/issues/7786=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/<wbr>syst=
emd/issues/7786</a><br>
<br>
</span>That bug report mentions a fix to busybox. Since the fix is availabl=
e<br>
in upstream busybox, maybe better to just backport the patch to our<br>
version of buysbox:<br>
<br>
=C2=A0 <a href=3D"https://git.busybox.net/busybox/commit/?id=3D426134128112=
738c97a665170b21153ef0764b7d" rel=3D"noreferrer" target=3D"_blank">https://=
git.busybox.net/<wbr>busybox/commit/?id=3D<wbr>426134128112738c97a665170b21=
15<wbr>3ef0764b7d</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyste=
ms.com.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">syst<wbr>emd_237.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a> b/meta/reci=
pes-core/systemd/<a href=3D"http://systemd_237.bb" rel=3D"noreferrer" targe=
t=3D"_blank">sy<wbr>stemd_237.bb</a><br>
&gt; index b7c2113255f..3b0f4580d49 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_237.bb</a><br>
&gt; @@ -478,7 +478,7 @@ FILES_${PN} =3D &quot; ${base_bindir}/* \<br>
&gt;<br>
&gt;=C2=A0 FILES_${PN}-dev +=3D &quot;${base_libdir}/security/*.la ${datadi=
r}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.<wbr>systemd&quot;<br>
&gt;<br>
&gt; -RDEPENDS_${PN} +=3D &quot;kmod dbus util-linux-mount udev (=3D ${EXTE=
NDPKGV}) util-linux-agetty&quot;<br>
&gt; +RDEPENDS_${PN} +=3D &quot;kmod dbus util-linux-mount util-linux-umoun=
t udev (=3D ${EXTENDPKGV}) util-linux-agetty&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGE=
CONFIG&#39;, &#39;serial-getty-generator&#39;, &#39;&#39;, &#39;systemd-ser=
ialgetty&#39;, d)}&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;volatile-binds update-rc.d&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.14.2<br>
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

--00000000000048b30e056c7a091d--
