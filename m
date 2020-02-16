Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 332C9613FD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 17:07:34 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x18so9244506vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=egiLWC/Th1SwJtB4kAiVHddovrRLyLOhE2o+wxeCl4U=;
	b=TxTDuDWp4FVZ5D9P2+7QFvFpYfzp19nQk5ND2YrZ+LDdjDjy3yHxFIZgMA7wqvEcMD
	3RY5TxNJJWmZpD+UV/W79HOR/edzGOCm76aF+jF65Hp8bObeMZ6gnTXiawxsFoJ3tjas
	OTsp6d5YtjWD4JEexs8J+F9dTjHUlZKYunooOHWpmwSrrVa9xmNViFHVQGUCSkqMJCWu
	NySpYD6UFacW1ASwhIAt3RNVIkEABSoPKONcX/zWMjL0LAu7OlU08yAm0CRnjr5lCBSh
	7r6cC6DlHClFOk8IDgvY4+QynRqCb7RmjnuMD+/5qkGFVyMENga27/GpR5CSsILNsihB
	KR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=egiLWC/Th1SwJtB4kAiVHddovrRLyLOhE2o+wxeCl4U=;
	b=cn3WbESLfrPLUMBd2OKSo9qiWSUHzypVQy8UMB10fDM0Du1mPiEuXcQ2QVa5ZGEr1z
	+y4tMSHUAFdmHscKrwb6j4pbydk72nYllnCyrUYfweHntAtyw3e/0DnM49r5GnhPfz4R
	CzwKSl2UN5H48wfWR+u8q8WEOPpVAjAsmPVAp8EOOp1A3fg+VQIU3eacsmhKIz1Ny4g7
	Jd46k0t9GYri4Q1kNkAYa3bY9I/0RPE6fnmLeveYE+v9VnHW9HYHbkCNg+P2QWfAPgYd
	cfnoaAllrXyR5ShxW1k8dqL8kaQjBcHWQ/W9yiv03siGxKwXrKhYO5d/y6V8YQR/SOP5
	4hQQ==
X-Gm-Message-State: APjAAAUTxCnP5aE1uMw7s8OBQYC/eoM8WKW15LeuK86UBhIs0G+NCBBJ
	E5jjXOTv8GrRbOCYlfBSjP7ONyo6t/a2R6/mhS0=
X-Google-Smtp-Source: APXvYqzPtQuZTbbZxJiHtvgX07jT/Boa7gWJOFWdangKLw406wBjE6xFIV5xZwpMw12qLAolZVJqXVPT7C4x92pDfBA=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr6363475vsq.23.1581872855076; 
	Sun, 16 Feb 2020 09:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
In-Reply-To: <CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 18:07:21 +0100
Message-ID: <CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Sun, 16 Feb 2020 17:07:34 -0000
Content-Type: multipart/alternative; boundary="0000000000009b535f059eb47918"

--0000000000009b535f059eb47918
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2020 at 18:00, Khem Raj <raj.khem@gmail.com> wrote:

> Please specify what all qemu machines have been tested, since we do
> not test weston images
> runtime, this will silently break untested qemu machines.
>

Autobuilder does test core-image-weston on qemux86_64 and that's where I
verified the change.

Alex


> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2 --
> >  1 file changed, 2 deletions(-)
> >  delete mode 100644
> meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
> >
> > diff --git
> a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
> b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
> > deleted file mode 100644
> > index 17ebd7fdab..0000000000
> > --- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
> > +++ /dev/null
> > @@ -1,2 +0,0 @@
> > -[core]
> > -backend=fbdev-backend.so
> > --
> > 2.25.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009b535f059eb47918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 16 Feb 2020 at 18:00, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Please specify what all qemu machines have been tested, since we do<br>
not test weston images<br>
runtime, this will silently break untested qemu machines.<br></blockquote><=
div><br></div><div>Autobuilder does test core-image-weston on qemux86_64 an=
d that&#39;s where I verified the change.</div><div><br></div><div></div><d=
iv>Alex<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2=
 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qem=
uall/weston.ini<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.=
ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini<br>
&gt; deleted file mode 100644<br>
&gt; index 17ebd7fdab..0000000000<br>
&gt; --- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,2 +0,0 @@<br>
&gt; -[core]<br>
&gt; -backend=3Dfbdev-backend.so<br>
&gt; --<br>
&gt; 2.25.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000009b535f059eb47918--
