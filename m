Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDB9731A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 22:50:44 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id z8so29790792ige.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 14:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UdV/pWQg7CzxGRfvW4ITMpxIGitNhCs8QgcaPbn0YD4=;
	b=IBxekx/CvvZfDOWLT5O6Q9s0RfxcCXkvR1iEmABSkSQUq5jso6huJfjC24R+fKDXRU
	ZcJFV88kRovNx8V8a6aXQkaEVHhMYbLwZ8WSi4OLfIqaF+aAxOndfIpVa8RUaOc3SyCn
	Jl1KBAarA6r9YmmXXSjNU+VE2RZqzMIzNoAAlctMnohGzaTVmMFcByDjyVQRYBFgZYas
	ZPTv/SxnOGtX0b/BuKs1ulQffqvxd2ev4JbkJe6B89cormAVYvlclbi9q9gdEJQrEof2
	iuJveMRgNYHb3JX04qfmAWKLjztJhf/SzSvqtoqzkjns45twcu+wziHdTkQBZxXDud1K
	h48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UdV/pWQg7CzxGRfvW4ITMpxIGitNhCs8QgcaPbn0YD4=;
	b=XcTgk6Nc8qTg/YRKnQ1nMrb4lncrr0mrJfzACb0qtJep+Mro5CCr6uHIwV8JRg0EAw
	W3bWUFH1DC882wGLThBu4lOQ66sgy9bg+8woEAN2AC2YlWX+mOVmRietfc6Ua6/sLzAd
	HaTZNDAxL4mGc/YX2126OMRlYHfUbw5pdoD3diAAFpTlgeztzjY59nnziOc0uTgKZ6pp
	KL1XJF98eHtdn1pwkyziZgpBPUZQ1m036DRZGrzF8lSnLgmE2gTOMrD0T15BOKryWG1d
	8dE8tkf185AJ0APfpiO/LpQCSc4YJLrrVab97wYugKe9d/WGIq73tcZIyMiyJlFafZIR
	k2vQ==
X-Gm-Message-State: AD7BkJKBhtEUDjkkw1UcjoRctZXYfU+tgFM4p3OYcGDy7kfsgxRivnp19fhbpDcfyXmjYhLfKiCm7hPSbneR1vP8
X-Received: by 10.50.43.226 with SMTP id z2mr1607604igl.78.1456872644898; Tue,
	01 Mar 2016 14:50:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 1 Mar 2016 14:50:25 -0800 (PST)
In-Reply-To: <CAHvQdo3iDgR09e7RgS2BNwSYRWfeqOxbEmNO9HFSOVN_=Cwbyg@mail.gmail.com>
References: <1456868358-9326-1-git-send-email-johannes.pointner@gmail.com>
	<1456870035.25131.20.camel@linuxfoundation.org>
	<CAHvQdo3iDgR09e7RgS2BNwSYRWfeqOxbEmNO9HFSOVN_=Cwbyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Mar 2016 22:50:25 +0000
Message-ID: <CAJTo0LbAJ+Go3bMzkxKV6zTc-zNh1YDanYang_E3fXAb+6J5UA@mail.gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch][jethro][master] xcursor-transparent-theme: insert several cursors
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
X-List-Received-Date: Tue, 01 Mar 2016 22:50:45 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f47b9bc5052d049812

--047d7bfea0f47b9bc5052d049812
Content-Type: text/plain; charset=UTF-8

On 1 March 2016 at 22:22, Johannes Pointner <h4nn35.work@gmail.com> wrote:

> The upstream status is quite difficult to define because I don't know
> if there is an upstream for this package.
>

We're upstream:
http://git.yoctoproject.org/cgit/cgit.cgi/xcursor-transparent-theme/.
Please submit this as a patch to that layer and then a srcrev bump for the
recipe.

Ross

--047d7bfea0f47b9bc5052d049812
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2016 at 22:22, Johannes Pointner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:h4nn35.work@gmail.com" target=3D"_blank">h4nn35.work@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":21o" class=3D"" style=
=3D"overflow:hidden">The upstream status is quite difficult to define becau=
se I don&#39;t know<br>
if there is an upstream for this package.<br></div></blockquote></div><br>W=
e&#39;re upstream:=C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cg=
i/xcursor-transparent-theme/">http://git.yoctoproject.org/cgit/cgit.cgi/xcu=
rsor-transparent-theme/</a>.=C2=A0 Please submit this as a patch to that la=
yer and then a srcrev bump for the recipe.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f47b9bc5052d049812--
