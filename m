Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 856E6780CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 09:43:36 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y201so172966745qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NJuSX8by6+JAkZdEaig9ONqS6f2BCkwphJOtRTLM8oc=;
	b=X+hMUAkgoE4poUaLhLs6Xx5F14SOjqWij64mTzQn6pwzUoKPtDusWJP4CGigpngIAM
	lnHieW0UkZqqNwj5kyTigyWEw0UCxKAbZEzCpv5Zi0NMG4jvQEs+TmMRyBLHAVCYtO2X
	+/TWlxeK9N+rxLKZaDf5+CsokG/hoWkQ7gd8qpHhAAWhDQ6T92w4TAKdKyy5Y+chyXy0
	DpjdVlk8DpyUZ2yWwWdXdF/3o3rdgEiiEuez4ghGTxbhCfFnLJCKVKGM38OdjajvpuVV
	jtvkdxDPgDfz+vWEvYQMiT01Od7z82fBxGIyqd7AhYRHeEB8PCOPa2MtEWY+vn0V/RdA
	03ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NJuSX8by6+JAkZdEaig9ONqS6f2BCkwphJOtRTLM8oc=;
	b=KSwnf825FmtFDbZE6Y5+ov5mdF64/MI6MTySGG6Tgni2JigZAXBRLnpcqsPOUXNT3m
	/J/2Hrfr3zaezuu7xFJ9M7zF2X/Takvz6rAlVXWKmR9xzCXvdq+7AtG/Ht/7HkaPTrqu
	G6IibeTuP8XJZvudPZ2DaZ8leVnPd3AVKACRgj0hDjAo5Z2dXsPmnE8oNsmYf43vZ9HO
	ifvjXw9vFl1SzlcNOkOszCz76rKr7r7U9/3PSOz30FpFCq9pHOQ6YjA7YPLzmPGmHsJw
	d/16W9tynHM9tD2ulnIxVvk15XUY809knHBrZfWMrlkoydGJQMvEgxQAG6+bBEuXxHic
	93Iw==
X-Gm-Message-State: AODbwcB8mLharTmeEALfp2EK98iDsN9C73ztN9qaombiY2bK8+G8lSCm
	4awrvYsk3Tpj7B85WhnkAkKqKUq6TLzZ
X-Received: by 10.55.24.158 with SMTP id 30mr34264412qky.171.1495705417187;
	Thu, 25 May 2017 02:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 02:43:16 -0700 (PDT)
In-Reply-To: <1495704204-228972-1-git-send-email-wenlin.kang@windriver.com>
References: <1495704204-228972-1-git-send-email-wenlin.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 10:43:16 +0100
Message-ID: <CAJTo0Lb2eEw+mSuVgsJEoqN0L7tBJo9Df2gA4ao6q_BSdenaLw@mail.gmail.com>
To: Wenlin Kang <wenlin.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: Fix some CVE
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
X-List-Received-Date: Thu, 25 May 2017 09:43:36 -0000
Content-Type: multipart/alternative; boundary="001a113b38e8149e040550560eb3"

--001a113b38e8149e040550560eb3
Content-Type: text/plain; charset="UTF-8"

On 25 May 2017 at 10:23, Wenlin Kang <wenlin.kang@windriver.com> wrote:

> Fix the follow CVE.
>   CVE-2017-7864
>   CVE-2017-7858
>   CVE-2017-7857
>   CVE-2017-8105
>   CVE-2017-8287
>

How many of these are fixed in the 2.8 release, which we should be
upgrading to instead of backporting patches as oe-core is now open for
upgrades.

Ross

--001a113b38e8149e040550560eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2017 at 10:23, Wenlin Kang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wenlin.kang@windriver.com" target=3D"_blank">wenlin.kang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">Fix t=
he follow CVE.<br>
=C2=A0 CVE-2017-7864<br>
=C2=A0 CVE-2017-7858<br>
=C2=A0 CVE-2017-7857<br>
=C2=A0 CVE-2017-8105<br>
=C2=A0 CVE-2017-8287</div></blockquote></div><br>How many of these are fixe=
d in the 2.8 release, which we should be upgrading to instead of backportin=
g patches as oe-core is now open for upgrades.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113b38e8149e040550560eb3--
