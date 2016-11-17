Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9433C60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 11:48:22 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n21so215177231qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 03:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hRpQbWlUpuS4SAux60nfqaA23lZDXMBKOvQpNdKPtCU=;
	b=YGJF5BiBjkC4IRmobGfdOIZcFm7xgWMrjxs3q5K82M45Mj6uDaN23IL5qj0CHprHe0
	FmCgRGfv5a51V7qee27yao4ysDI+FYKPzLFRr8kx5rf0AoM/8YcGfnxEU8T3fvCpVHoZ
	GY/ndyUpXuxxjomyR4MbqNy9gZcp9p+GSfm0lgo89yBjIhq3d3ym8D6/raq98ed8xfz8
	EtzFkAFkcqyAWNWnLYlTdYESiX8VRYiGQn0CrVqD8uKzXU8ScDQ62c2pdiSV35ZcdX7o
	OMKhPBvtJdRTW3xQif0E2w/nZNRVTFlbpqA3/efH1OgjBc7+vTGuqKEWB0mmTiuAC1EU
	AhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hRpQbWlUpuS4SAux60nfqaA23lZDXMBKOvQpNdKPtCU=;
	b=F+pY+aGCaegKTab7qKfxrBxFyBDcaxwDcNpLfySMc8gvaRRTOtwByWKuhNceoH9FR9
	VmkKS9INgH+Oxz+q28XV/Iil+Scy5n5RdzPXdbT5WA4xj70NK5c6BjrT3+D2YXN50P90
	lXV5pX28JSj9sO/hs/cr9jGNawYB7eDCnYA4QIbz4EiI3BIZIrXi3QeS/HZvdCPrUU9z
	+qKClqRNuyuWxwcXsLaW9Nj9I+62NyGc2pF/Dy6s6EcMgf15Vvq+NMte2lfDluSLTfjP
	74M7ga2etKNeitT8fo8yDrjOB2xcUS3MOa++8DHIHmBtbVGpPrQoH0O3vqVYuLxwNAw/
	DWug==
X-Gm-Message-State: AKaTC0329O4s/5Inz6adIcf5ox0wKCO7LYp5PYHT4P3QmaDHDFW7CdAdpzGiLcqZBvm+dDYMKm1INO5ITofPEte2
X-Received: by 10.55.31.157 with SMTP id n29mr2467066qkh.221.1479383303566;
	Thu, 17 Nov 2016 03:48:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 17 Nov 2016 03:48:03 -0800 (PST)
In-Reply-To: <2492cb242375d6dbc1efd5c530c555a1cd0dfb72.1479301275.git.jussi.kukkonen@intel.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
	<2492cb242375d6dbc1efd5c530c555a1cd0dfb72.1479301275.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Nov 2016 11:48:03 +0000
Message-ID: <CAJTo0LZn1JAR9KuzYsDyCRAPqJ499hMRkCu_4C9y7S9ctiqpgg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] mesa: Upgrade 12.0.3 -> 13.0.1
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
X-List-Received-Date: Thu, 17 Nov 2016 11:48:22 -0000
Content-Type: multipart/alternative; boundary=001a1147f2284bf1bd05417dc422

--001a1147f2284bf1bd05417dc422
Content-Type: text/plain; charset=UTF-8

On 16 November 2016 at 13:15, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> New major release with OpenGL 4.4 support. Dependency on libudev has
> been removed.
>
> Rebase replace_glibc_check_with_linux.patch.
> Add patch to find native wayland-scanner.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>

This has removed some files:

packages/corei7-64-poky-linux/mesa/libgl-mesa-dev: FILELIST: removed
"/usr/include/GL/osmesa.h /usr/include/GL/wglext.h
/usr/include/GL/mesa_glinterop.h"

osmesa is now behind a disabled configure option, so I guess we should make
that an option at least, even if we do disable it by default.

wglext is Windows specific, and mesa-glinterop.h appears to be internal
only, so they're good.

Ross

--001a1147f2284bf1bd05417dc422
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2016 at 13:15, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:oh" class=
=3D"gmail-a3s gmail-aXjCH gmail-m1586d4ae89439661">New major release with O=
penGL 4.4 support. Dependency on libudev has<br>
been removed.<br>
<br>
Rebase replace_glibc_check_with_<wbr>linux.patch.<br>
Add patch to find native wayland-scanner.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;</div></blockquote></div><br>This has re=
moved some files:</div><div class=3D"gmail_extra"><br></div>packages/corei7=
-64-poky-linux/mesa/libgl-mesa-dev: FILELIST: removed &quot;/usr/include/GL=
/osmesa.h /usr/include/GL/wglext.h /usr/include/GL/mesa_glinterop.h&quot;<b=
r><div><br></div><div>osmesa is now behind a disabled configure option, so =
I guess we should make that an option at least, even if we do disable it by=
 default.</div><div><br></div><div>wglext is Windows specific, and mesa-gli=
nterop.h appears to be internal only, so they&#39;re good.</div><div><br></=
div><div>Ross</div></div>

--001a1147f2284bf1bd05417dc422--
