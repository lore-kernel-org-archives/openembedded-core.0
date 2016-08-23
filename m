Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC5776294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:53:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id e63so152109331ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LFnWYs2CGAl5v+TYMDLUfjb9GqhPhM84KFsZWUtIHqc=;
	b=XR0P8OYC5sfPyi1eu02SbZBeSUUl6FoXVi5Gv/AV5bP35f39sMV0oJMj3KMwScXtJH
	DTpWzGtNi2RVJfMucAAqyVtoAudJ/8ydsMYh/GdeS7XfJLMkPXcoehdbcXLTrBg1VTmO
	soOuhP0w0LMJnSRPrxJPeEtnvI/HJht0mGU7T8nWpK8DrF5qz3h+pVXEB4miNV21WuKy
	eOIMh6jggzKeiTmbcZ64KgX4kdRr3KHeFcb4sz4t/jCdvRqMFyZ/6PBSFBdMb++Aw5D/
	ibZS1BczvRmaIcMEAy5ZMvusuLGd4yG88LMvJ+pBHChLLMLr7TvI56Ii4u6mYHuIdKE2
	87RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LFnWYs2CGAl5v+TYMDLUfjb9GqhPhM84KFsZWUtIHqc=;
	b=Lb3tRsBczNFKurt2cZPtoGKJfOLs6K9gJTqOjcZi1BZ4Coh0aTz2770CMogHSm/fY9
	8XeNJqtBfWxcFN4smNytIaD6MRWUXlyMNvSJq1uiSi5SbxkWkVrpeGBI25Ufcci3Na+k
	gs5K+0DXYi7VWJ0c/c5vGAjMAQi5359GJJFTD2mCZFElorTtjuGgL+RbOKfaFAKWy6FK
	3qGD7MQ3YnVKXMhGgIDHhAE09Ikimn2YoNSNCjltYSlvPEdlJibBzD07Db0v/rsOKfy+
	vuFj9m5HezPUktB1CCi9BVm+LEbG44sdgONosvWuS3Vw4ExPvU/t4sJVgXBjwWOwIOA7
	14cw==
X-Gm-Message-State: AEkooutDd2VYgf/O6io6E9pNzjSbjDOOT7pvLFnDHwJxQpEhPX7rlIOyWF/nwy1l2Q9KLl+VoBseXO3vEPIevJNt
X-Received: by 10.36.19.75 with SMTP id 72mr26706531itz.83.1471964036524; Tue,
	23 Aug 2016 07:53:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 07:53:36 -0700 (PDT)
In-Reply-To: <9492b5e7b4b350b21762201a11f189e35c0cfb04.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9492b5e7b4b350b21762201a11f189e35c0cfb04.1471936926.git-series.jeremy.rosen@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 15:53:36 +0100
Message-ID: <CAJTo0LZfB-Lu75cvN9CBN3Xx9uqpLMEWdPMJZL5MFGSy0+bciw@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] [sanity] fix hardcoded references to gcc
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
X-List-Received-Date: Tue, 23 Aug 2016 14:53:57 -0000
Content-Type: multipart/alternative; boundary=001a1145180a8558e1053abe5528

--001a1145180a8558e1053abe5528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> Signed-off-by: J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr>
>

Did you test this patch with a totally clean build directory?

ross@flashheart ~/Yocto/poky/boofo (mut %)
$ bitbake m4
ERROR:  OE-core's config sanity checker detected a potential
misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Please install the following missing utilities: C Compiler (gcc ),C++
Compiler (g++ )

I think this is because BUILD_CC by default contains whitespace, and
bb.utils.which looks for "gcc ".  I added a strip() to check_app_exists and
it passed, so can you please verify that your series doesn't regress when
BUILD_CC isn't overridden?

Ross

--001a1145180a8558e1053abe5528
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile=
.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><div id=3D":1u0" class=3D"">S=
igned-off-by: J=C3=A9r=C3=A9my Rosen &lt;<a href=3D"mailto:jeremy.rosen@smi=
le.fr">jeremy.rosen@smile.fr</a>&gt;<br></div></blockquote></div><br>Did yo=
u test this patch with a totally clean build directory?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra=
">ross@flashheart ~/Yocto/poky/boofo (mut %)</div><div class=3D"gmail_extra=
">$ bitbake m4</div><div class=3D"gmail_extra">ERROR: =C2=A0OE-core&#39;s c=
onfig sanity checker detected a potential misconfiguration.</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 Either fix the cause of this error or at you=
r own risk disable the checker (see sanity.conf).</div><div class=3D"gmail_=
extra">=C2=A0 =C2=A0 Following is the list of potential problems / advisori=
es:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 Please install the following missing utilities: C Compiler (g=
cc ),C++ Compiler (g++ )</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">I think this is because BUILD_CC by default contains whi=
tespace, and bb.utils.which looks for &quot;gcc &quot;.=C2=A0 I added a str=
ip() to check_app_exists and it passed, so can you please verify that your =
series doesn&#39;t regress when BUILD_CC isn&#39;t overridden?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></=
div>

--001a1145180a8558e1053abe5528--
