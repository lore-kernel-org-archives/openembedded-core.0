Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1D45F6014F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 23:56:05 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id w85so15396937oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=l2cTH+UAChWJPDdupP6A9Pc2fPCq0pQrvbONrLtxmIY=;
	b=AV0CltSjyL6XZeZ6SN9yqLnHEiy97vGgGzL8mPpAj3qcVgqaIClbxlaUXg0/pHpCEi
	1m7YeLNQmXFMaf/QMKVhuAsqr+r8QNztSvp31kYeDI33yVadTt68Ze6wmWUXkRYwfMDA
	dhpzGJhi0U08Gjns5CUlQ2AeM++dZj0ukGUQhePGvidlXlxy7lDbzc9lFK5Ft91utBeB
	RP0UUJ/nuDA+ZG0qpDZn+iKLNk5bRLsjU73r3ySwrugKNFCRKdYtbOaMWg62KQVKL07R
	E3I4aCdLoQPy/IBQYH6WbfpstmilQ9qL02tEAL21f0KjFMQY1l8Cp9NLBkFX3Tp+FJXD
	ZiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=l2cTH+UAChWJPDdupP6A9Pc2fPCq0pQrvbONrLtxmIY=;
	b=EZIM6THoB5XlsIw/gJZ0/Ds7RbqilMYyXwhKWdanXT/32ydyWXarn0Ud1Wl9MHsC1/
	w4yA18KPz4F19q4lYhpOc2qSrlTBXyBaIETSvJZ9cfN5IafBcskr9XgYnQYqPrkSg41X
	brdSndWcMUScTTAW4p0M4wyhqbV4osQxSQcdCwYQx4wCVd2Lk/AQmDDAOHk1mdj8EmyL
	T75x1oLE2JEvxzf4KVQ4vVHtAyJoNBM7xz80j+EIlOyXQxdqVCbNTYDasj2HzQhDzJOZ
	9aKqqIOSNgPQxprqMeQu+h0vXDKGxI4oXjRsVXmAuSkG9oX6GvMwzdLB49Pr/u9heXcU
	dMqQ==
X-Gm-Message-State: AD7BkJLaHN045C7j5GdIloqiAr5ehDb/i4K4+GYzClbD06N0Qy8rgc8hdLk1QqoZ1VXDn1Mtxxa9Jib0CcV8kA==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr577095oib.96.1459727766544; Sun,
	03 Apr 2016 16:56:06 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Sun, 3 Apr 2016 16:56:06 -0700 (PDT)
In-Reply-To: <1459719999.7348.142.camel@linuxfoundation.org>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
	<CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
	<1459719999.7348.142.camel@linuxfoundation.org>
Date: Sun, 3 Apr 2016 19:56:06 -0400
Message-ID: <CADkTA4Pz5sHPmRMVmQQsoPoQH1tmPkK93QUhtA7LmzibH7-tjQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Sun, 03 Apr 2016 23:56:10 -0000
Content-Type: multipart/alternative; boundary=001a113d5edcfe696e052f9d5a67

--001a113d5edcfe696e052f9d5a67
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:
> >
> >
> > On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
> > liezhi.yang@windriver.com> wrote:
> > > So that iso can work well, otherwise the iso is readonly and there
> > > would
> > > be errors. The other way is aufs, but overlayfs is more pupolar and
> > > had
> > > been merged by kernel mainline, we need make iso work well by
> > > default.
> > Nope. As I mentioned before, this can't be a always on default. It
> > will conflict
> > with other unionFS use cases.
> >
> > If you want overlayfs enabled, it needs to be triggered from a
> > specific image
> > or distro feature.
>
> We can't change the kernel config from an image so it would have to be
> a distro setting. Is there a problem with enabling both as modules btw?
> I assume they can coexist?
>

I've always found it limiting that we can't trigger kernel features based
on what an image'
type actually needs, but I understand why/how it works like this.

If it can't be triggered by an image setting, then just keeping a layer
that is added
to the build, that has a bbappend with the appropriate KERNEL_FEATURES would
also work, and is the approach that I've also taken.

Not that the existing configs are great in this respect (they need a lot of
streamlining),
but building modules 'just in case' eventually leads to allmodconfig :)

I'd imagine they could co-exist, but it isn't something I've tried.

Bruce



>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d5edcfe696e052f9d5a67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfie=
ld wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang &lt;<br>
&gt; <a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com=
</a>&gt; wrote:<br>
&gt; &gt; So that iso can work well, otherwise the iso is readonly and ther=
e<br>
&gt; &gt; would<br>
&gt; &gt; be errors. The other way is aufs, but overlayfs is more pupolar a=
nd<br>
&gt; &gt; had<br>
&gt; &gt; been merged by kernel mainline, we need make iso work well by<br>
&gt; &gt; default.<br>
&gt; Nope. As I mentioned before, this can&#39;t be a always on default. It=
<br>
&gt; will conflict<br>
&gt; with other unionFS use cases.<br>
&gt;<br>
&gt; If you want overlayfs enabled, it needs to be triggered from a<br>
&gt; specific image<br>
&gt; or distro feature.<br>
<br>
</span>We can&#39;t change the kernel config from an image so it would have=
 to be<br>
a distro setting. Is there a problem with enabling both as modules btw?<br>
I assume they can coexist?<br></blockquote><div><br></div><div>I&#39;ve alw=
ays found it limiting that we can&#39;t trigger kernel features based on wh=
at an image&#39;</div><div>type actually needs, but I understand why/how it=
 works like this.</div><div><br></div><div>If it can&#39;t be triggered by =
an image setting, then just keeping a layer that is added</div><div>to the =
build, that has a bbappend with the appropriate KERNEL_FEATURES would</div>=
<div>also work, and is the approach that I&#39;ve also taken.</div><div><br=
></div><div>Not that the existing configs are great in this respect (they n=
eed a lot of streamlining),</div><div>but building modules &#39;just in cas=
e&#39; eventually leads to allmodconfig :)</div><div><br></div><div>I&#39;d=
 imagine they could co-exist, but it isn&#39;t something I&#39;ve tried.</d=
iv><div><br></div><div>Bruce</div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113d5edcfe696e052f9d5a67--
