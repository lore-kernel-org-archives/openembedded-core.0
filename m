Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4AC784B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 18:58:01 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id q29so16131172uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eR33EkuvCYOpI6fxMqOAtBAmPbo8lyuKH+/yenCS5Q8=;
	b=nCBwddtRz45IZcvBfdt7zAYHEFpGaBCarwVwi+M33xqaPNNLXsP+p/qWY4CQszQpTt
	X3Doa6bmAh7cdoKZ9EXDahg2bSpxOPgKVDoe2X9vwIb/+CSqJzZeH5BxHZTOKNvpDGXs
	jd5VRAoYizbgz4zzVqS491QS52u8RPK4PFWEh2L6ngs7SixavTtp7LoU1oEIjewFgJnT
	i2CV0Y8cn5s0dHValriQv6DGQW6eKqTC1KGEk9nOXmXnyzBryvAvfI8+IjD+BDz2Dx60
	fSup4AfU6y+YQvvkV0FWaX97Iwb3Pqz7hbNZ3eSGSdaj4pxdKGs3ik0HEIkfR5xwfm/O
	3b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eR33EkuvCYOpI6fxMqOAtBAmPbo8lyuKH+/yenCS5Q8=;
	b=WtKwwkYyRUq/kgFlHzKRVSo1DnuHCrG1qQk5/jvobey5cWrQkeyxreCK5KDsvQksAd
	hc7AezV7Km7k9OjumQCavQigya/nOCo3THO7RGb405RvAMTRHF8C2sNKxNKPNpaeFMbW
	7iiWXNY5PrEFiZRWNBgN3ZXuEFEutXDgzNG2lVrgnCwNLBfmIsH7/kEJ23kCGARIx1Y4
	7qCIQUuu0QT5lRyBtA9J9bUakyR8yWJO11EVGNFAClRLGarYObWJKxK6W3kFtvipQroM
	uYPqOzZqsKoKa3kMiZB/+0QyISh37pUWiAage+pSfO3QtWzBTFQoUeWC8x0stzoASZjZ
	9qbg==
X-Gm-Message-State: AHPjjUjxDr3VNnMuA1bqx+5gYZw1nH+kglEVI/wSkwdKASiq404Gc6b7
	PDJdWMICnYvsh74ekzijL++tTQq/xw==
X-Google-Smtp-Source: ADKCNb4rE2mvZgBVD8jkowx6QFyev01yrTZVcm9Pf30FRk6PooGl2193o5EqU/gbQlmeWgAMMEWVfZlV5psSxSc/9ec=
X-Received: by 10.176.83.149 with SMTP id k21mr11407533uaa.183.1505242682377; 
	Tue, 12 Sep 2017 11:58:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Tue, 12 Sep 2017 11:58:01 -0700 (PDT)
In-Reply-To: <CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
	<CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
	<CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 20:58:01 +0200
Message-ID: <CA+chaQcSMj-47DzgRrwWoUGNyc4WKoGM72bqKSf1YZHO2sskpQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Tue, 12 Sep 2017 18:58:01 -0000
Content-Type: multipart/alternative; boundary="f403045dde20624a7b0559029fdb"

--f403045dde20624a7b0559029fdb
Content-Type: text/plain; charset="UTF-8"

Seems like this version was already picked to master-next, so probably
better to leave as standalone change now.

The version currently in master fails to build for arm with thumb enabled:
http://errors.yoctoproject.org/Errors/Details/155765/

Is it fixed somewhere in this new patchset?

# github.com/golang/dep/cmd/dep
TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link:
R_ARM_THM_CALL, are you using -marm?
WARNING: exit code 2 from a shell command.
ERROR: Function failed: do_compile (log file is located at
TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/temp/log.do_compile.13531)


On Tue, Sep 12, 2017 at 3:32 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Sep 12, 2017 at 10:15 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Doesn't this belong into:
> > [OE-core] [PATCH v8 03/13] go: split out go-runtime into separate recipe
> > where it packaging change was probably introduced?
>
> I can squash it; in fact the change was introduced on "[v8,05/13]
> go.bbclass: remove some xxx_FINAL variables". Not sure if it is better
> or worse in this case. What do you think?
>
> > Also just RFC question, would it make sense to use:
> >
> > VIRTUAL-RUNTIME_bash ?= "bash"
> > RDEPENDS_${PN}-dev += "${VIRTUAL-RUNTIME_bash}"
> >
> > instead of the bash dependency directly? If it's acceptable for oe-core
> I'll
> > create change to do it for all recipe (I don't mind waiting after 2.4 is
> > released).
> >
> > Because right now for reasons described in
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217 I need to do the
> > above +
> > RDEPENDS_${PN}-dev_remove = "bash"
> > for many recipes with many bbappends, for our distro where we RPROVIDE
> bash
> > by busybox, which is good enough for package manager, but QA error is
> still
> > shown in cases where the real bash is built before the component
> rdpenending
> > on it.
>
> I'd be fine with this. It does make sense to allow the replacement of bash.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--f403045dde20624a7b0559029fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seems like this version was already picked to master-next,=
 so probably better to leave as standalone change now.<div><br></div><div>T=
he version currently in master fails to build for arm with thumb enabled:</=
div><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/155765/">=
http://errors.yoctoproject.org/Errors/Details/155765/</a><br></div><div><br=
></div><div>Is it fixed somewhere in this new patchset?</div><div><br></div=
><div><pre style=3D"padding:9.5px;font-family:Monaco,Menlo,Consolas,&quot;C=
ourier New&quot;,monospace;font-size:13px;color:rgb(51,51,51);border-radius=
:4px;margin-top:0px;margin-bottom:10px;line-height:20px;word-break:break-al=
l;word-wrap:break-word;white-space:pre-wrap;background-color:rgb(245,245,24=
5);border:1px solid rgba(0,0,0,0.15)"># <a href=3D"http://github.com/golang=
/dep/cmd/dep
TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysro=
ot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link">github=
.com/golang/dep/cmd/dep
TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysro=
ot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link</a>: R_=
ARM_THM_CALL, are you using -marm?
WARNING: exit code 2 from a shell command.
ERROR: Function failed: do_compile (log file is located at TOPDIR/tmp-glibc=
/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/temp/log.do_compile.13531)</=
pre></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Tue, Sep 12, 2017 at 3:32 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.sal=
vador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">On Tue, Sep 12, 2017 at 10:15 AM, Martin Jansa &lt;<a =
href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote=
:<br>
&gt; Doesn&#39;t this belong into:<br>
&gt; [OE-core] [PATCH v8 03/13] go: split out go-runtime into separate reci=
pe<br>
&gt; where it packaging change was probably introduced?<br>
<br>
</span>I can squash it; in fact the change was introduced on &quot;[v8,05/1=
3]<br>
go.bbclass: remove some xxx_FINAL variables&quot;. Not sure if it is better=
<br>
or worse in this case. What do you think?<br>
<span class=3D""><br>
&gt; Also just RFC question, would it make sense to use:<br>
&gt;<br>
&gt; VIRTUAL-RUNTIME_bash ?=3D &quot;bash&quot;<br>
&gt; RDEPENDS_${PN}-dev +=3D &quot;${VIRTUAL-RUNTIME_bash}&quot;<br>
&gt;<br>
&gt; instead of the bash dependency directly? If it&#39;s acceptable for oe=
-core I&#39;ll<br>
&gt; create change to do it for all recipe (I don&#39;t mind waiting after =
2.4 is<br>
&gt; released).<br>
&gt;<br>
&gt; Because right now for reasons described in<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9217" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/=
show_bug.cgi?id=3D9217</a> I need to do the<br>
&gt; above +<br>
&gt; RDEPENDS_${PN}-dev_remove =3D &quot;bash&quot;<br>
&gt; for many recipes with many bbappends, for our distro where we RPROVIDE=
 bash<br>
&gt; by busybox, which is good enough for package manager, but QA error is =
still<br>
&gt; shown in cases where the real bash is built before the component rdpen=
ending<br>
&gt; on it.<br>
<br>
</span>I&#39;d be fine with this. It does make sense to allow the replaceme=
nt of bash.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span></blockquote></div><br></div>

--f403045dde20624a7b0559029fdb--
