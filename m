Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id CD6FE65C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:58:45 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so9347906qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7HuuResJFyPf4MSyna46VM+mRLxUaz8jN7umpgk6oho=;
	b=M/QAdglsV2k4D41lAGlaIGn6t1dW+CsxeOxRXpa+WQNHDPxViyDOuEqJ9IrY9FmsKL
	zfHJusNjnN8lwEfKpY1dA/RczQtLv/9obAke4QB2OkbZFH0LmDOjbViHa6fSzlhC9+/c
	EBdu1Lv3T4PKA+0bV9pFqCZ2XdD4PN6R5JyBs/5LSiroa9KQ9txUfbqZnTSSBZMjkpZ1
	GYGmyMFkH2YSiGA+U2w2+hHPSPeuIc9QeGQsWIM2zBLWEK78O788rVdLXLTmENKoUKJg
	QZsEWw3X5SZKNIXHYgA9x1fL+PUwIcoF3CRXS5QFWoOFJm+UztkjjcM0fRNwg8Dlrjhe
	2Wuw==
X-Received: by 10.140.28.247 with SMTP id 110mr51006239qgz.16.1436889525837;
	Tue, 14 Jul 2015 08:58:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.55 with HTTP; Tue, 14 Jul 2015 08:58:26 -0700 (PDT)
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 14 Jul 2015 08:58:26 -0700
Message-ID: <CABcZANk+tfyHNHsRnWjjs=6O_jTJ+TGushPLxUcUMQ-W_H55JA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Tue, 14 Jul 2015 15:58:45 -0000
Content-Type: multipart/alternative; boundary=001a113b31c8c4e451051ad7e931

--001a113b31c8c4e451051ad7e931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2015 at 8:57 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Ensures that recipetool and devtool pull plugins from layers, and
> oe-selftest will pull tests from layers.
>
> Unrelated to that, also prevents a traceback on parsing failure, and adds
> a tiny feature to appendsrc to facilitate reuse by other sub-commands.
>
> [YOCTO #7625]
>

This series supercedes '[PATCH 0/3] One recipetool fix and a couple
enhancements=E2=80=99.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113b31c8c4e451051ad7e931
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Jul 14, 2015 at 8:57 AM, Christopher Larson <span =
dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kerg=
oth@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Ensures that recipetool and devtool pull plugins from layers, and<br>
oe-selftest will pull tests from layers.<br>
<br>
Unrelated to that, also prevents a traceback on parsing failure, and adds<b=
r>
a tiny feature to appendsrc to facilitate reuse by other sub-commands.<br>
<br>
[YOCTO #7625]<br></blockquote><div><br></div><div>This series supercedes &#=
39;[PATCH 0/3] One recipetool fix and a couple enhancements=E2=80=99.</div>=
</div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher La=
rson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZa=
urus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</di=
v></div>
</div></div>

--001a113b31c8c4e451051ad7e931--
