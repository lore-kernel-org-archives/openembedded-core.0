Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DA81D734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 20:53:17 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id u185so67649880iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XSSt0gqa+uXuyely3ayK2Qr7aDp29oj9mhRkxFJ0TRo=;
	b=c3tsIUWzHYIewBQ8hVTUlxT7IlaTkWt+UOEVWmPF/5AqV4hRFgwMWFPrHn7d456EQN
	9/xzEdnr9+SNVm0gBcRlYEaH0leqEPwr3NOEjjtmWHBiXGkloZkgfqZxRqc1nfuT63x3
	Wtd0e+iTyLxTjOCWtk+S+Cfkhf2208Ly/hXKEFgPceXlJfUtBbAOHtKePut1zpIqBQ0a
	QwDA3runkra2Q182b6F8v26+H353CHNjuu/gEbsmc4DUnOYRYU2DFle6XJ/t3gJaBpeI
	WU5OFQc/fCAOpg957RJjVwouyonOTKpV95L8QOq1JQUreJS2yN30u9wFbSaO1z1+S7GX
	HBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XSSt0gqa+uXuyely3ayK2Qr7aDp29oj9mhRkxFJ0TRo=;
	b=GY1dd4gw7yasvN/7NyJhkTw8HSFO3DuoXAphgdbq8mlg8ilQVqZENONaRxAxvePOjF
	MdF79Eb7oZfSkwogylf24vzPAU788yFZtZjwmet1ykaucB9sQfVbudt0S3bvR1SgKxSK
	tSCiFnJlsvwZINZLf8VOXe4vlZ1a8/JkqSPvkkMeOsBFYBqpqU1/+7q7QjHY9FjVoWy6
	SvbKjbOfkI4TWestozAcl2oK0jKQAs68m47FBxYksul2Q4qd20kJuG/cBvqhUqHYdU4S
	ZXxd3b7qVuAk4QZhluXDLKYwfXZqWfaAoZldMZ04gZqSUI80QnlUnDuCk+eXuZ4kPGPm
	RqMg==
X-Gm-Message-State: AOPr4FUcXDmij/Fz4Pest1i+h6sa/TUIA3l+cYfEfDpYllyAfs4L0N+eZOOO+fTo0qd3JJ4VlY7/QxE6pO9LYut2
X-Received: by 10.107.51.213 with SMTP id z204mr12027684ioz.148.1461790398598; 
	Wed, 27 Apr 2016 13:53:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 13:52:59 -0700 (PDT)
In-Reply-To: <1461331489-995-2-git-send-email-awais_belal@mentor.com>
References: <1461331489-995-1-git-send-email-awais_belal@mentor.com>
	<1461331489-995-2-git-send-email-awais_belal@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 21:52:59 +0100
Message-ID: <CAJTo0Lb+rS0yUSLq6KSYE4iN0yxFOowsjTNY3H=6S5ogVfg3aQ@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa-demos: provide option for disabling GLX demos
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
X-List-Received-Date: Wed, 27 Apr 2016 20:53:21 -0000
Content-Type: multipart/alternative; boundary=001a11440cd071f2af05317d991d

--001a11440cd071f2af05317d991d
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 14:24, Awais Belal <awais_belal@mentor.com> wrote:

> +PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 glx \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> glew glu', '', d)}"
>

Shouldn't glx be inside the x11 DISTRO_FEATURE check?

Ross

--001a11440cd071f2af05317d991d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2016 at 14:24, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:awais_belal@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4xl" class=3D=
"a3s aXjCH">+PACKAGECONFIG ?=3D &quot;drm osmesa freetype2 gbm egl gles1 gl=
es2 glx \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.=
utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 glew glu&=
#39;, &#39;&#39;, d)}&quot;<br></div></blockquote></div><br>Shouldn&#39;t g=
lx be inside the x11 DISTRO_FEATURE check?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11440cd071f2af05317d991d--
