Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id A6B33731D8;
	Fri, 11 Mar 2016 16:21:23 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id c3so139808302vkb.3;
	Fri, 11 Mar 2016 08:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=4ovDmWQjlxVOC/kuoGJOxw7tcQIXv311WqtbEHH/Bfs=;
	b=wQiaB9/vLSFJAfxyzYt5zJx5TX0LnCIbfrf6jE+diY3kDAMUdZnJd284S4pgE1t2UG
	KT7wDRfvtpN07H4upyYCMOgbS9AK3vBorZGmX3xVeRffNv1UXtI60aRGIIIOIGkrVS+O
	elB7aLzRVfb3fl8Hl9wZ2Zw5OyUOY8V+YR5hpFdDXyTRfJb5nfu0nTglZa5z56LwN8F5
	lbIDCaGgPwk2M5n7iAGgg3E/RSlX+Fg/AMg6a9SOM9yzEiZOiMxHtaotB5Ho2wSGbhtY
	D9x9SLxS0u8DM8hvvhwb9eYKDSFQjGqW3uHwt64bCRwdnHyZ/lr/LL9SyNSoy7Sfdsih
	Nu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=4ovDmWQjlxVOC/kuoGJOxw7tcQIXv311WqtbEHH/Bfs=;
	b=V+TqArIemcu0IerbHf1+b1idJeRTvzm6WkgJ80Ao6Zro7nsk8hJR+mZsjfEhFv7WGT
	Yt/1NNmzbKuGB1Yu1RmLZWsAFeNjuDjgUrHDUFiUB1J+3TJSoKJ6Y14YCzeWrmHB/u3R
	/mnmSIFb8ew+kLi4kXjqT+o7wpDi9nDOv0+wbP8pkHB12X7aNFO/OC4NUIra3jkfHXjd
	BO0FIj+iczEzcKDOwuL28iudZnpKR3pohci1gY64ytHe+UH6PsHAc1jV1VswJsV3s5LI
	QqJaBJhWKPQzn9g06FLxMxXrkTooYPwnOqmzzTCFJ/J5mYwn87O8gfFULoX5VtL3Or/z
	W0Xw==
X-Gm-Message-State: AD7BkJJKQ19Vl0Ot6RDbyyaw18rF0/lwtoCWWv8215RvIvBwJ2VF9aPFJv99Mh7JymzA5mfRkkM8kYjmZLPoPg==
MIME-Version: 1.0
X-Received: by 10.31.6.17 with SMTP id 17mr10782219vkg.75.1457713284624; Fri,
	11 Mar 2016 08:21:24 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Fri, 11 Mar 2016 08:21:24 -0800 (PST)
In-Reply-To: <20160311161353.GA2646@jama>
References: <20160310115301.GC2573@jama> <56E2E731.1040005@windriver.com>
	<CADkTA4N43Zi=oLVRe99eEvvPjgYethKFNKH3J90Bss_AzqovVg@mail.gmail.com>
	<20160311161353.GA2646@jama>
Date: Fri, 11 Mar 2016 11:21:24 -0500
Message-ID: <CADkTA4N9fYRt15y36RBUYrQBu=7DAdWdw7iAamMY7s0xvSfLaQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-03-09
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
X-List-Received-Date: Fri, 11 Mar 2016 16:21:27 -0000
Content-Type: multipart/alternative; boundary=001a1143f24a83b860052dc85262

--001a1143f24a83b860052dc85262
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 11:13 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Mar 11, 2016 at 10:52:14AM -0500, Bruce Ashfield wrote:
> > On Fri, Mar 11, 2016 at 10:41 AM, Mark Hatle <mark.hatle@windriver.com>
> > wrote:
> >
> > > On 3/10/16 5:53 AM, Martin Jansa wrote:
> > > > Aggressive PNBLACKLISTing continues. But linux-yocto (and modules
> > > depending on it)
> > > > are still broken :/.
> > > >
> > > > I'll look at cef3 and chromium issue, my recent patch for
> meta-browser
> > > > fixed the build for armv7a MACHINEs, so it probably needs to be
> extended
> > > > a bit to cover warnings in x86 and then duplicate the same to cef3.
> > > > This issue is there for so long, slowing down the builds
> significantly
> > > > (and causing logs to be much bigger) - I don't use these recipes but
> I
> > > > hate the failures even more.
> > > >
> > >
> > > Is see the reported log failure, but I've been building with the
> oe-core
> > > and
> > > poky linux-yocto head of master for the last couple weeks, all arches
> > > includes
> > > qemux86.
> > >
> >
> >
> > I don't know what to say about those failures either. I've been chasing
> > perf build
> > races for the past week, and that includes building linux-yocto hundreds
> of
> > times,
> > and I've never seen the uapi headers not be in place like the logs show.
>
> My guess (and supported by Andrea) is that it's caused by
> linux-yocto-tiny which is built as part of bitbake world and probably
> not included in your tests when you build the same linux-yocto.
>
>
Aha. Thanks, I'm working those problems as well and did reproduce a variant
when rm_work is enabled. So I do have a thread to tug on for the failure.

With that, plus your description below, I've got a better chance of seeing
it.

Cheers,

Bruce


> That would also explain why these issues break almost every qemux86 and
> I haven't seen them for qemuarm, linux-yocto-tiny has:
>   COMPATIBLE_MACHINE = "(qemux86)"
>
> Try to run
> "bitbake linux-yocto linux-yocto-tiny" couple times and maybe you'll be
> able to reproduce it.
>
> For next runs I've PNBLACKLISTED linux-yocto-tiny and
> linux-yocto-tiny-kexecboot:
>
> https://github.com/shr-project/jenkins-jobs/commit/c168b7824c2c68bd5894532fc122929d2d9df9a7
>
> > The Yocto AB is also not showing it to me.
> >
> > Unless I can get access to a broken build, I'm at a loss to actually
> debug
> > and
> > fix it.
> >
> > Bruce
> >
> >
> > >
> > > I don't see the error on my builder.  Is something changing the default
> > > recipe/kernel configuration triggering the fault?
> > >
> > > --Mark
> > >
> > > > === qemux86 (2) ===
> > > >     * /meta-openembedded/meta-python/recipes-devtools/python/
> > > python-m2crypto_0.23.0.bb, do_compile
> > > >     * /openembedded-core/meta/recipes-kernel/linux/
> linux-yocto_4.4.bb,
> > > do_compile
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> > at its end"
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143f24a83b860052dc85262
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Mar 11, 2016 at 11:13 AM, Martin Jansa <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Fri, Mar 11, 2016 at 10:52:14AM -0500, Bruce Ashfield wrote:<br>
&gt; On Fri, Mar 11, 2016 at 10:41 AM, Mark Hatle &lt;<a href=3D"mailto:mar=
k.hatle@windriver.com">mark.hatle@windriver.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On 3/10/16 5:53 AM, Martin Jansa wrote:<br>
&gt; &gt; &gt; Aggressive PNBLACKLISTing continues. But linux-yocto (and mo=
dules<br>
&gt; &gt; depending on it)<br>
&gt; &gt; &gt; are still broken :/.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ll look at cef3 and chromium issue, my recent patch fo=
r meta-browser<br>
&gt; &gt; &gt; fixed the build for armv7a MACHINEs, so it probably needs to=
 be extended<br>
&gt; &gt; &gt; a bit to cover warnings in x86 and then duplicate the same t=
o cef3.<br>
&gt; &gt; &gt; This issue is there for so long, slowing down the builds sig=
nificantly<br>
&gt; &gt; &gt; (and causing logs to be much bigger) - I don&#39;t use these=
 recipes but I<br>
&gt; &gt; &gt; hate the failures even more.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Is see the reported log failure, but I&#39;ve been building with =
the oe-core<br>
&gt; &gt; and<br>
&gt; &gt; poky linux-yocto head of master for the last couple weeks, all ar=
ches<br>
&gt; &gt; includes<br>
&gt; &gt; qemux86.<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t know what to say about those failures either. I&#39;ve bee=
n chasing<br>
&gt; perf build<br>
&gt; races for the past week, and that includes building linux-yocto hundre=
ds of<br>
&gt; times,<br>
&gt; and I&#39;ve never seen the uapi headers not be in place like the logs=
 show.<br>
<br>
</span>My guess (and supported by Andrea) is that it&#39;s caused by<br>
linux-yocto-tiny which is built as part of bitbake world and probably<br>
not included in your tests when you build the same linux-yocto.<br>
<br></blockquote><div><br></div><div>Aha. Thanks, I&#39;m working those pro=
blems as well and did reproduce a variant<br></div><div>when rm_work is ena=
bled. So I do have a thread to tug on for the failure.<br><br></div><div>Wi=
th that, plus your description below, I&#39;ve got a better chance of seein=
g it.<br><br></div><div>Cheers,<br><br></div><div>Bruce<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
That would also explain why these issues break almost every qemux86 and<br>
I haven&#39;t seen them for qemuarm, linux-yocto-tiny has:<br>
=C2=A0 COMPATIBLE_MACHINE =3D &quot;(qemux86)&quot;<br>
<br>
Try to run<br>
&quot;bitbake linux-yocto linux-yocto-tiny&quot; couple times and maybe you=
&#39;ll be<br>
able to reproduce it.<br>
<br>
For next runs I&#39;ve PNBLACKLISTED linux-yocto-tiny and<br>
linux-yocto-tiny-kexecboot:<br>
<a href=3D"https://github.com/shr-project/jenkins-jobs/commit/c168b7824c2c6=
8bd5894532fc122929d2d9df9a7" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/shr-project/jenkins-jobs/commit/c168b7824c2c68bd5894532fc122929d2=
d9df9a7</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; The Yocto AB is also not showing it to me.<br>
&gt;<br>
&gt; Unless I can get access to a broken build, I&#39;m at a loss to actual=
ly debug<br>
&gt; and<br>
&gt; fix it.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t see the error on my builder.=C2=A0 Is something chang=
ing the default<br>
&gt; &gt; recipe/kernel configuration triggering the fault?<br>
&gt; &gt;<br>
&gt; &gt; --Mark<br>
&gt; &gt;<br>
&gt; &gt; &gt; =3D=3D=3D qemux86 (2) =3D=3D=3D<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-python/recipes-=
devtools/python/<br>
&gt; &gt; <a href=3D"http://python-m2crypto_0.23.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-m2crypto_0.23.0.bb</a>, do_compile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0* /openembedded-core/meta/recipes-kernel/=
linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">linux-yocto_4.4.bb</a>,<br>
&gt; &gt; do_compile<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee<br>
&gt; at its end&quot;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--001a1143f24a83b860052dc85262--
