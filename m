Return-Path: <diego.rondini@kynetics.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94A217C7A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 08:41:07 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p10so1228420edq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 01:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SMqJ0mGPUadY+01h+pIad71vC/iR64+5RKPG/8yFqlQ=;
	b=I1l8ikInV13USVLUFXKU1m/eQWjo0r+BAikDbqUerAT+j2o6uFN23/H3NDAFG6YlYB
	JPOxYhWD8TAGd7X2h3Wiv7NEjfDA3Vzdi9R56W/9ddHXvWJ7NWx5oKvOSPjowq0ujq7k
	crJpgDS6a4MRLJLtvT+gDP0iS0aKrZExEp3+ilikO1VFQGLmuORs8veB5BrtJWG87LtV
	jyx+5RFNa1ghpf+iRGPPiu1yb42Pm1oJzBPxiIj+tCllTmF714kS2CYykCplo+sey8jT
	It6qzPV4qzPwUNswBkQTxrR5H/KOsrlIewQ2xDRB1bYnw6+bLoJmR5aLBDSGMi3Kgfli
	0d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SMqJ0mGPUadY+01h+pIad71vC/iR64+5RKPG/8yFqlQ=;
	b=ciUKb+wJ+qASjWRPxM3bW4wMOg4a8SLesG2fAbe8CUc1eoSQ9UpQw9tOPPqUGZfRKB
	sbR1Okmh09Qw0UCizfjij4TLAkZlsR7jJ6pIdbO3uS/DZT0jHNAUx/ZyYRerHDl5H5Ba
	iqhVmWd3QUbHTlyYLhVHUEnpBgyrPKR2PUJw7+8mo55jX18F657t/Oz8h5xI+wc2OVWx
	W6wD0oNm90HnHsCbAJ06ffp4LxmDTXdw6sVC8mbRuXi8UUUCICuZQZSxPAPyyuIki27L
	Ej+bO6hrs7Dbwft7bqkhdqSWxdRzwAYhJdqIKXwv+6dcD89h5XqudpF0bMbgXwsbeBzv
	CUhA==
X-Gm-Message-State: APjAAAVFMach9h2e7FmLhiJQEdYpSlIhW+qFQInb8RvMLUHyPurHkmsE
	owSC5Kla7aGvrEmx/8zqJJoc1dJwJTvuJRQOLVVlTQ==
X-Google-Smtp-Source: APXvYqx5DZmoCBHJTpjKvUUAXOg40Xdq58ArSKs27e4oRLws2TdV2ZIIhvZRlWzMNrAnGPGLJT4uV9iqvVvwWYICJnQ=
X-Received: by 2002:a17:906:bb0f:: with SMTP id
	jz15mr1986692ejb.264.1569487268130; 
	Thu, 26 Sep 2019 01:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190925144933.16030-1-diego.rondini@kynetics.com>
	<bd5c3ea5-aa03-ae71-1257-026d91102a03@intel.com>
In-Reply-To: <bd5c3ea5-aa03-ae71-1257-026d91102a03@intel.com>
From: Diego Rondini <diego.rondini@kynetics.com>
Date: Thu, 26 Sep 2019 10:40:57 +0200
Message-ID: <CAMfw5Yqn7iozG+P2_ve4GUBpZkGgxDp08q8yfRACJfBeG1UB7w@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bmap-tools: add missing python3-misc dependency
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
X-List-Received-Date: Thu, 26 Sep 2019 08:41:08 -0000
Content-Type: multipart/alternative; boundary="00000000000018c77b059370bb19"

--00000000000018c77b059370bb19
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

On Wed, Sep 25, 2019 at 9:40 PM Ross Burton <ross.burton@intel.com> wrote:

> On 25/09/2019 15:49, Diego Rondini wrote:
> > Add runtime dependency on python3-misc as bmaptool depends on ntpath.
> >
> > Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> > ---
> >   meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> > index 7c4db85b32..6be07d7f9c 100644
> > --- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> > +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> > @@ -17,7 +17,7 @@ PV .= "+git${SRCPV}"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> >
> > -RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
> python3-setuptools python3-fcntl python3-six"
> > +RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
> python3-setuptools python3-fcntl python3-six python3-misc"
> >
> >   inherit python3native
> >   inherit setuptools3
> >
>
> ERROR: Nothing RPROVIDES 'python3-misc-native' (but
> virtual:native:/home/ross/Yocto/poky/meta/recipes-support/bmap-tools/
> bmap-tools_3.5.bb
> RDEPENDS on or otherwise requires it)
>
> Ross
>

I've seen ntpath has been added back to python3-core with this commit:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/python/python3/python3-manifest.json?id=9ff61fa83a0a4f2a7b5b0376b6c48fb1173c9ac7
so my change makes sense only in warrior.

Can you please explain how you trigger that error?

Thank you,
Diego

--00000000000018c77b059370bb19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Ross,<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 9:40 =
PM Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@int=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 25/09/2019 15:49, Diego Rondini wrote:<br>
&gt; Add runtime dependency on python3-misc as bmaptool depends on ntpath.<=
br>
&gt; <br>
&gt; Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@kynet=
ics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-support/bmap-tools/<a href=3D"http://bmap-too=
ls_3.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a> | 2 +=
-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-to=
ols_3.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a> b/me=
ta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
&gt; index 7c4db85b32..6be07d7f9c 100644<br>
&gt; --- a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
&gt; +++ b/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.5.bb</a><br>
&gt; @@ -17,7 +17,7 @@ PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\=
.\d+)+)&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -RDEPENDS_${PN} =3D &quot;python3-core python3-compression python3-mma=
p python3-setuptools python3-fcntl python3-six&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;python3-core python3-compression python3-mma=
p python3-setuptools python3-fcntl python3-six python3-misc&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit python3native<br>
&gt;=C2=A0 =C2=A0inherit setuptools3<br>
&gt; <br>
<br>
ERROR: Nothing RPROVIDES &#39;python3-misc-native&#39; (but <br>
virtual:native:/home/ross/Yocto/poky/meta/recipes-support/bmap-tools/<a hre=
f=3D"http://bmap-tools_3.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-to=
ols_3.5.bb</a> <br>
RDEPENDS on or otherwise requires it)<br>
<br>
Ross<br>
</blockquote></div><div><br></div><div>I&#39;ve seen ntpath has been added =
back to python3-core with this commit:</div><div><a href=3D"http://git.open=
embedded.org/openembedded-core/commit/meta/recipes-devtools/python/python3/=
python3-manifest.json?id=3D9ff61fa83a0a4f2a7b5b0376b6c48fb1173c9ac7">http:/=
/git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/python=
/python3/python3-manifest.json?id=3D9ff61fa83a0a4f2a7b5b0376b6c48fb1173c9ac=
7</a></div><div>so my change makes sense only in warrior.</div><div><br></d=
iv><div>Can you please explain how you trigger that error?</div><div><br></=
div><div>Thank you,<br></div><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr">Diego<br></div></div></div>

--00000000000018c77b059370bb19--
