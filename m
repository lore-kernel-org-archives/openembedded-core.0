Return-Path: <ticotimo@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id D4D4E7D245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 05:24:52 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id o33so400771uae.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 22:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZCRkSdyEp3CNxb1zx2hlaIX9j4aQZkcrjlDu3dgO0Gw=;
	b=JgStW2RYrJkdUNE1ybVEff6cRrlBYwVeo/WuLRPyA9XEnGSfehciH2az0H5QLpGfrj
	NRMIPdd9d7wDw7moMIEt+fFX0oqK4DrcDjg8Tj4pZy1ikVATrxsOdiPkm/i1FqFZFhfQ
	WAHSJbIt/x1NYia5wawIjNMA3xFcaS5wO1qUw4W0rFvWXuw+xcsbn+ndnI21eDg7ggU/
	BWS4d/iaRlS7UKyp88aWWagbvotfzHg+fdKQguS10jGbCe0dZYJMSBn/z/QdlbC0kv7Y
	f1DG5BNj+c4hdQxI8afvQRDcuLlHds3glzeWv6GjZzlblr0dq7Nvn/+K94FKrLTZEDM/
	FZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZCRkSdyEp3CNxb1zx2hlaIX9j4aQZkcrjlDu3dgO0Gw=;
	b=i//jvYgXMHyIpdPwp63qKF3bdp8GtiV6NztvaEO3KUupbiYNIkGR7jzXN151JVhbE2
	/31Bue9XH4fk1i3gto8Sa5U4XWPHNaQJhBpszW+K98stTe6RJAWaVduOdZ+pzpJNAfwt
	V4m5s4xqK6Sxa4KQ7YTVL2Y7U28Ro7F4S4iLo5Qp/otw1pv8UYyFnFOer5+YOBCTtlMV
	jDkj+ZF2M6lgooaXOwxBSWehHZRmJDqwebpYqTeF5oajS+rKXbnvbGEXVStX0A7sg2Lc
	TonNBYwAGMIONMQacQ+q+Hffw94KUHUvmyJkm7nommcZ6O5hwIWtQBKU+4QXe4AHCtJT
	KAwg==
X-Gm-Message-State: APjAAAUlHD2l13ztMyoQUKhBJbDuoUr66KhS6PU7kqvBupEIwa/J0Z+G
	Bvg0bT8vKWufLbm/i2yjtifiT7Z9Av9rorCYJXM=
X-Google-Smtp-Source: APXvYqwBTcjNhpNznRMAJxUE7QVoeZO3E5npk2lwMt8F6yCpRUQ2OCwqflqWav/FwTT0v2JspU6K/1olOHV++ZxKK9A=
X-Received: by 2002:ab0:c01:: with SMTP id a1mr15380428uak.116.1556083493464; 
	Tue, 23 Apr 2019 22:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
	<20190424011742.GE30419@bill-the-cat>
In-Reply-To: <20190424011742.GE30419@bill-the-cat>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 23 Apr 2019 22:24:42 -0700
Message-ID: <CANx9H-DVnmfTte4yWsYWLcdh2pQWMNY8Eum9CyFJ=AisbVu=Pg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Wed, 24 Apr 2019 05:24:53 -0000
Content-Type: multipart/alternative; boundary="000000000000de6f9d05873feb8d"

--000000000000de6f9d05873feb8d
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 23, 2019 at 6:17 PM Tom Rini <trini@konsulko.com> wrote:

> On Tue, Apr 23, 2019 at 11:22:14PM +0100,
> richard.purdie@linuxfoundation.org wrote:
> > On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> > > On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > > > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > > > This brings us to the current version of vim.
> > > > >
> > > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > > ---
> > > > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> > > > > tiny_8.1.1198.bb} | 0
> > > > >  meta/recipes-support/vim/{vim_8.1.1017.bb =>
> > > > > vim_8.1.1198.bb}           | 2 +-
> > > > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > > > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> > > > > tiny_8.1.1198.bb} (100%)
> > > > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =>
> vim_8.1.1198.bb}
> > > > > (98%)
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527
> > >
> > > Does the current version even work in this case?  Digging down into
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/steps/7/logs/step1b
> > > there's a certain level of "how does that even work today then?" that
> > > springs to mind.
> > >
> > > I need a few more details to know how to reproduce this locally as I
> > > don't see whatever must be in site.conf/etc to turn regular poky into
> > > no-x11.  The errors are also around iconv stuff so maybe nls is also
> > > removed here?  Thanks!
> >
> > perhaps simpler, qemux86-world also failed:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515
> >
> > with:
> >
> > | /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/i586-
> > poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt: Cannot
> > convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
> > iconv() does not support this conversion.
> > | make[2]: *** [gvim.desktop] Error 1
> >
> > So perhaps there is host contamination and this works one some build
> > machine setups but not more minimal ones?
> >
> > The build configuration hasn't changed, just the new version upgrade
> > and the other patch. I suppose its possible it depends which of our
> > workers its built upon but that seems unlikely for two world failures
> > (no-x11 is also a world failure).
>
> Current poky master-next + my patches (and bitbake -k'ing around
> gobject-introspection-native failing to configure over passing
> -Ddocs=false) and vim builds on a FC29 "Cloud" image + documented
> additional packages off of
> https://www.openembedded.org/wiki/Getting_started
>

Or you could use a CROPS container?
https://hub.docker.com/r/crops/poky/


> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000de6f9d05873feb8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Apr 23, 2019 at 6:17 PM Tom Rini &lt;<a href=3D"mai=
lto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Tue, Apr 23, 2019 at 11:22:14PM +0100, <a href=3D=
"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdi=
e@linuxfoundation.org</a> wrote:<br>
&gt; On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:<br>
&gt; &gt; On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:<b=
r>
&gt; &gt; &gt; On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:<br>
&gt; &gt; &gt; &gt; This brings us to the current version of vim.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-support/vim/{<a href=3D"http://vim-t=
iny_8.1.1017.bb" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1017.bb<=
/a> =3D&gt; vim-<br>
&gt; &gt; &gt; &gt; <a href=3D"http://tiny_8.1.1198.bb" rel=3D"noreferrer" =
target=3D"_blank">tiny_8.1.1198.bb</a>} | 0<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-support/vim/{<a href=3D"http://vim_8=
.1.1017.bb" rel=3D"noreferrer" target=3D"_blank">vim_8.1.1017.bb</a> =3D&gt=
;<br>
&gt; &gt; &gt; &gt; <a href=3D"http://vim_8.1.1198.bb" rel=3D"noreferrer" t=
arget=3D"_blank">vim_8.1.1198.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 2 files changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-support/vim/{<a href=3D"http:=
//vim-tiny_8.1.1017.bb" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1=
017.bb</a> =3D&gt; vim-<br>
&gt; &gt; &gt; &gt; <a href=3D"http://tiny_8.1.1198.bb" rel=3D"noreferrer" =
target=3D"_blank">tiny_8.1.1198.bb</a>} (100%)<br>
&gt; &gt; &gt; &gt;=C2=A0 rename meta/recipes-support/vim/{<a href=3D"http:=
//vim_8.1.1017.bb" rel=3D"noreferrer" target=3D"_blank">vim_8.1.1017.bb</a>=
 =3D&gt; <a href=3D"http://vim_8.1.1198.bb" rel=3D"noreferrer" target=3D"_b=
lank">vim_8.1.1198.bb</a>}<br>
&gt; &gt; &gt; &gt; (98%)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/40/builds/527" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yoctoproject.org/typhoon/#/builders/40/builds/527</a><br>
&gt; &gt; <br>
&gt; &gt; Does the current version even work in this case?=C2=A0 Digging do=
wn into<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/40/builds/527/steps/7/logs/step1b" rel=3D"noreferrer" target=3D"_blank">h=
ttps://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/steps/=
7/logs/step1b</a><br>
&gt; &gt; there&#39;s a certain level of &quot;how does that even work toda=
y then?&quot; that<br>
&gt; &gt; springs to mind.<br>
&gt; &gt; <br>
&gt; &gt; I need a few more details to know how to reproduce this locally a=
s I<br>
&gt; &gt; don&#39;t see whatever must be in site.conf/etc to turn regular p=
oky into<br>
&gt; &gt; no-x11.=C2=A0 The errors are also around iconv stuff so maybe nls=
 is also<br>
&gt; &gt; removed here?=C2=A0 Thanks!<br>
&gt; <br>
&gt; perhaps simpler, qemux86-world also failed:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/=
builds/515" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctop=
roject.org/typhoon/#/builders/52/builds/515</a><br>
&gt; <br>
&gt; with:<br>
&gt; <br>
&gt; | /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/i586=
-<br>
&gt; poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt: Canno=
t<br>
&gt; convert from &quot;ISO-8859-2&quot; to &quot;UTF-8&quot;. msgfmt relie=
s on iconv(), and<br>
&gt; iconv() does not support this conversion.<br>
&gt; | make[2]: *** [gvim.desktop] Error 1<br>
&gt; <br>
&gt; So perhaps there is host contamination and this works one some build<b=
r>
&gt; machine setups but not more minimal ones?<br>
&gt; <br>
&gt; The build configuration hasn&#39;t changed, just the new version upgra=
de<br>
&gt; and the other patch. I suppose its possible it depends which of our<br=
>
&gt; workers its built upon but that seems unlikely for two world failures<=
br>
&gt; (no-x11 is also a world failure).<br>
<br>
Current poky master-next + my patches (and bitbake -k&#39;ing around<br>
gobject-introspection-native failing to configure over passing<br>
-Ddocs=3Dfalse) and vim builds on a FC29 &quot;Cloud&quot; image + document=
ed<br>
additional packages off of<br>
<a href=3D"https://www.openembedded.org/wiki/Getting_started" rel=3D"norefe=
rrer" target=3D"_blank">https://www.openembedded.org/wiki/Getting_started</=
a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Or you could use=
 a CROPS container?</div><div dir=3D"auto"><div><a href=3D"https://hub.dock=
er.com/r/crops/poky/">https://hub.docker.com/r/crops/poky/</a></div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><br>
-- <br>
Tom<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000de6f9d05873feb8d--
