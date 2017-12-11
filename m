Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8377870D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 14:02:05 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id b5so16047627itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 06:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SHxhDMinPUtKjvui4QdFdqXiKfmpiycNZPoxAQxlZ8E=;
	b=jzVSdmrZTow28KTtmMftQihOObMEr+HI/sv2bFKo5YV2JvT2L+unBfxGaGKuJzYOEg
	uWa4UcKLYWurGaKLZ3jYJ9xXsIMr00hWHeu9lcl5xqKAV0elaOVS16DDR9e2ZntEr3Ke
	ak0GKjAxti4Hs7dFK0sjlBfJoUotZmShchhzEpesvPoLwZcfobeGXMqH33baG1QSKUxi
	0eXDXbGyGbG0hJFbvhbA86/qt/dAjIKstajt/r3LKQMCd6FPhaREdbzgb/LRob4cBg1g
	mtZe7OGENETNYundXfsTA7xiIiKlWeGUMogcN4SSG1rU6igrVBsEtUz8X/1n/o44TBgF
	7wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SHxhDMinPUtKjvui4QdFdqXiKfmpiycNZPoxAQxlZ8E=;
	b=LNhF7juUT8XYYyAMdYjE1Mc7jBZv5uugYf1Y5tXC8JDkXwRR8sE4PO3rJgOgXgc2e7
	2eZE0+tGFZ4zmA85I4C3xUZQ5Jfe0LRVMJvrlAk9QcHSqTUnpzxw79RlVq7mkhmnNCPp
	VSk5ZxxmCTh4qVh/89XPm5HYXzp2eP4OsZC0F/JBNZC2rkJpDgkahYQI6rfcnhOzk1YL
	1eanH/l48RUCM6YfczWoSf1QaRLVMLEv8eXf0tXEd4SGGo2IbnHD7VNuiUckTFWWwscy
	lrOOZmTyYDi4NHvubBCxjKr4rk6pL3Ayct6HKmzfpZBp0+TbYIoUZhuUxNf7gB3UYrvZ
	7LnA==
X-Gm-Message-State: AKGB3mIrseYhlPZdIVAwLvOd4NgZQrsWJsXTFTjez21A+jpBN0HzT6vO
	MN91rbMiKHhI9G6g3303fBGoMVZr+s1oTshNWVfNJw==
X-Google-Smtp-Source: ACJfBov9Tpcyb1wXYpV89IMe4eNSim2O2kjpoW760PXjua70k/GHWXkuaMBaI/ihz+IHj/9CVmCK6T3B0IxC9oKlUzs=
X-Received: by 10.107.47.1 with SMTP id j1mr576746ioo.217.1513000927128; Mon,
	11 Dec 2017 06:02:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Mon, 11 Dec 2017 06:01:46 -0800 (PST)
In-Reply-To: <20171211135720.38714-1-stefan@agner.ch>
References: <20171211135720.38714-1-stefan@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Dec 2017 14:01:46 +0000
Message-ID: <CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Mon, 11 Dec 2017 14:02:06 -0000
Content-Type: multipart/alternative; boundary="001a11377fbcce8cc7056010fa96"

--001a11377fbcce8cc7056010fa96
Content-Type: text/plain; charset="UTF-8"

On 11 December 2017 at 13:57, Stefan Agner <stefan@agner.ch> wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
>
> On some build hosts distros (e.g. Fedora 26) waf tries to be
> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
> This obviously is not what we want for 32-bit targets and usually
> fails in the do_package phase:
>   WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue:
> gstreamer1.0-plugins-imx: Files/directories were installed but not shipped
> in any package:
>     /usr/lib64/libgstimxcommon.so.0
>
> Explicitly pass libdir to waf reliably resolves the issue.
>

What happens if the wscript doesn't recognise --libdir, does it silently
ignore it or throw an error?

If waf supports prefix and libdir and doesn't error on unknown options,
does it also support datadir/sysconfdir and so on?  We should pass as much
as possible.  The gnu_dirs module suggests yes, so you could copy what
autotools passes.

Ross

--001a11377fbcce8cc7056010fa96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 December 2017 at 13:57, Stefan Agner <span dir=3D"lt=
r">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">From: Stefan Agner &lt;<a href=3D"mailt=
o:stefan.agner@toradex.com">stefan.agner@toradex.com</a>&gt;<br>
<br>
On some build hosts distros (e.g. Fedora 26) waf tries to be<br>
smart about libdir detection and defaults to [EXEC_PREFIX/lib64].<br>
This obviously is not what we want for 32-bit targets and usually<br>
fails in the do_package phase:<br>
=C2=A0 WARNING: gstreamer1.0-plugins-imx-0.13.<wbr>0-r0 do_package: QA Issu=
e: gstreamer1.0-plugins-imx: Files/directories were installed but not shipp=
ed in any package:<br>
=C2=A0 =C2=A0 /usr/lib64/libgstimxcommon.so.<wbr>0<br>
<br>
Explicitly pass libdir to waf reliably resolves the issue.<br></blockquote>=
<div><br></div><div>What happens if the wscript doesn&#39;t recognise --lib=
dir, does it silently ignore it or throw an error?</div><div><br></div><div=
>If waf supports prefix and libdir and doesn&#39;t error on unknown options=
, does it also support datadir/sysconfdir and so on?=C2=A0 We should pass a=
s much as possible.=C2=A0 The gnu_dirs module suggests yes, so you could co=
py what autotools passes.</div><div><br></div><div>Ross=C2=A0</div></div></=
div></div>

--001a11377fbcce8cc7056010fa96--
