Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF806204F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:20:20 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 13so2816790lba.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=METflPfaqcp4q8k0mcdHpZoAt/OQNd/CgY3XzaSKS/8=;
	b=EKUSCNX0EfgAPfUxwQgcPURP7mO5aonwQYljeQrC5tgMhZ3ph2xgdMxFiSQ+12wD9g
	FJ836C3e9cOqc3TJkbcOhILT/2caA91Oxr3dUjIUqPdeg3FzrRZm2NOS+dpLJe8XiKC2
	y+6BSDSbgqljXIAcv/5Z9b4+GY90EDiA0vSWrS6+Nrg1/dY5KBv/JBNhwQUDPjS8V1O1
	cTWLQBUXHI8+p7Ggay+ecjbRWxz/hxl03dYoM5xynvbpZsxV1nY7FVSLjnZkcUIlomzE
	7w38R+8/zYy/3d93XE2bFkdZ/MEWrkE6rEQmTmuKFcmnbYZGrZFIQMS5iMgqCLvL+vxh
	hJqQ==
X-Received: by 10.112.143.162 with SMTP id sf2mr7943410lbb.1.1373152820540;
	Sat, 06 Jul 2013 16:20:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.3.5 with HTTP; Sat, 6 Jul 2013 16:20:00 -0700 (PDT)
In-Reply-To: <20130706230840.GE3288@jama>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANmrjid3veZXwq_jh24qDaXBjhf3MvNV5yY+6eCg+Gr5Aw@mail.gmail.com>
	<20130706230840.GE3288@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 6 Jul 2013 16:20:00 -0700
X-Google-Sender-Auth: UfQP2mVn3ZPY8Y6tt06aFr82ZzU
Message-ID: <CABcZAN=oJ5JVRUma+N2V+8xxNZuD+WwOJqmHkEnfcY1EVGa2sA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Sat, 06 Jul 2013 23:20:20 -0000
Content-Type: multipart/alternative; boundary=089e01183038173b7704e0e00e51

--089e01183038173b7704e0e00e51
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 6, 2013 at 4:08 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> In this case yes, but what about allarch recipes, creating
> binutils-cross dependency in their do_package task would probably make
> their stamps depending on architecture.
>

def get_binutils_dep(d):
    if 'target' in d.getVar('OVERRIDES', True).split():
        return d.expand('virtual/${TARGET_PREFIX}binutils')
    else:
        return ''

do_package[depends] += "${@get_binutils_dep(d)}"


-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01183038173b7704e0e00e51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Jul 6, 2013 at 4:08 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1v7" style=3D"overflow:hidden">I=
n this case yes, but what about allarch recipes, creating<br>
binutils-cross dependency in their do_package task would probably make<br>
their stamps depending on architecture.</div></blockquote></div><div class=
=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style>def get_b=
inutils_dep(d):</div><div class=3D"gmail_extra" style>=C2=A0 =C2=A0 if &#39=
;target&#39; in d.getVar(&#39;OVERRIDES&#39;, True).split():</div>

<div class=3D"gmail_extra" style>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return d.expan=
d(&#39;virtual/${TARGET_PREFIX}binutils&#39;)</div><div class=3D"gmail_extr=
a" style>=C2=A0 =C2=A0 else:</div><div class=3D"gmail_extra" style>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return &#39;&#39;</div><br>do_package[depends] +=3D &q=
uot;${@get_binutils_dep(d)}&quot;<br>

<br clear=3D"all"><div><br></div>-- <br>Christopher Larson<br>clarson at ke=
rgoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer =
- Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e01183038173b7704e0e00e51--
