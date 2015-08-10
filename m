Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id E450A76898
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:39:21 +0000 (UTC)
Received: by igfj19 with SMTP id j19so52279302igf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=FkrXEYChwHp4ksVPr5zMNL4/zammy1vc0aZsOGlpJXs=;
	b=IjXXw/vhdbF5XRtY6LRzAlCvrJe2c5DNxUCwjxwdVysFiT/JAQ4hXQKieJDDwojUFc
	WnxhZS33+xrsXw5hfCvDsfbvDEKKMt4BxNYcZKobYIAY/NK4KI7GnA10BP7pd/OxixkT
	vPsArQeuMToeXeqeRIt7DVH64BG4Sk/aRddrN4OntslPff6I3f9cPHeAtg36UxfMeoP0
	mY0INUoO5bRaZHYuPywPZ3iBvQCB2X6CAX+UQjHt/ZwMWUnVsGX2HQHQUTZz/PX5EQ0m
	32MfxSFIF+ZYwLreUibMB4v4nSRpKCOhNbX3wKnzB5u18yxRv49XIaSN8fpP80pwJU+L
	+Ddw==
X-Received: by 10.50.153.112 with SMTP id vf16mr11511594igb.79.1439221161512; 
	Mon, 10 Aug 2015 08:39:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Mon, 10 Aug 2015 08:39:01 -0700 (PDT)
In-Reply-To: <d788ed7b766bcccc2238278d3eca6a45c8a7f3f2.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<d788ed7b766bcccc2238278d3eca6a45c8a7f3f2.1438667914.git.Qi.Chen@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 10 Aug 2015 08:39:01 -0700
X-Google-Sender-Auth: dOOrY8W3hpLxrz-yQ78gPp2gvM0
Message-ID: <CABcZANmTfoP62-VSynUNe5BjhrPpkW-ynA84=4exsi+FiSeHQg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] Extensible SDK: allow for installation without preparing build system
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
X-List-Received-Date: Mon, 10 Aug 2015 15:39:22 -0000
Content-Type: multipart/alternative; boundary=089e01536c1015d5bc051cf6ca34

--089e01536c1015d5bc051cf6ca34
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2015 at 8:18 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> When publishing SDK, what we want is basically its metadata and sstate
> cache objects. We don't want the SDK to be prepared with running bitbake
> as it takes time which reproduces meaningless output for the published SD=
K.
>
> So this patch adds an option to allow for SDK to be extracted without
> preparing the build system.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

I expect the intent behind the preparation was for it to be a build from
100% sstate, but that=E2=80=99s not actually the case on all systems. If th=
at=E2=80=99s the
case, maybe it should be run with locked sigs and ignore failure, to avoid
doing a real from-scratch build at install time.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01536c1015d5bc051cf6ca34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Sun, Aug 9, 2015 at 8:18 PM,=
 Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" tar=
get=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":11n" class=3D"a3s"=
 style=3D"overflow:hidden">When publishing SDK, what we want is basically i=
ts metadata and sstate<br>
cache objects. We don&#39;t want the SDK to be prepared with running <span =
class=3D"il">bitbake</span><br>
as it takes time which reproduces meaningless output for the published SDK.=
<br>
<br>
So this patch adds an option to allow for SDK to be extracted without<br>
preparing the build system.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;</div></blockquote></div><br>I expect the intent behi=
nd the preparation was for it to be a build from 100% sstate, but that=E2=
=80=99s not actually the case on all systems. If that=E2=80=99s the case, m=
aybe it should be run with locked sigs and ignore failure, to avoid doing a=
 real from-scratch build at install time.<br>-- <br><div class=3D"gmail_sig=
nature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBa=
ke, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engin=
eer, Mentor Graphics</div>
</div></div>

--089e01536c1015d5bc051cf6ca34--
