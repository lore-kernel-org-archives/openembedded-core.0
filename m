Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 94094798D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 11:13:39 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u12-v6so5181016wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E6Z5FPP8jaDz8UiQRtz5bKx5LvAZUqjLRRMqk+xjS9s=;
	b=mTuLeMMK6Nqg7bd0Rlgh85fJvNTMn4cE+GGOmhNK13Bj+PTnA+5MZfw/c1ams3PTuI
	709lncoeSA+Ja75Cei5L5Qwe0fh0IKMnRm/28gs9Ue3kmRgQTgKM7cTvXBSVHGrTlOLc
	52qjjHWEByMsItuSOisN/PxuyQqzhemMKDjGZ4WC2N07NpwtHdNIolZ9jxtKC2tf25WB
	ECmNCrV2aLCEFX2dUgj1GLdh6YTSw3ZXp2ExCy2PTxx53oHqF7h7tohR1pcE/RnCbqCW
	NG1ttCUlmzzVjJCarzUpAatNif8sCAulTC4qHHhFrusokmkQgO57oTDygNsQcXNI2eby
	FlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E6Z5FPP8jaDz8UiQRtz5bKx5LvAZUqjLRRMqk+xjS9s=;
	b=UnjAM+30WJdlcbu94GZJe8HzAl/dncV90DDePb8YdImFeFxzpkSjOMp7OozwMN1zf5
	MZRbUscn46SQLfs0a4CwtTO8npS4wBm2ekcJRZ9n0rVrhsFGWLh/DanePLnH36N36KUN
	vX2AswhIiFVoML9lHVNBYxKaGNg+lfSjoovd19ZrEgRvOiKuqMoAvPZByLRPcbK5kppM
	w3nbn6xuGFhkVD7hE6CKb9Z02Tyi55nh/jaLZEqt8CSamFT3nuwkJjltU6NywTBmp5/U
	/3hgGoIlNXJENQ1eskfY6+fY3cuAdBL250Flvlc41zWt3IbDEDk2OfGsnK0oLHlfsp+F
	J4wg==
X-Gm-Message-State: APzg51Bgs8NP/8YJCT/88xrMTMCV4eB3camfnvZ8UWYhR+uc87j12PhN
	1SgasfjBYjpXraqoWwQ80oJ3WaI8/0LthUslbIo=
X-Google-Smtp-Source: ANB0VdbKmWU2rpr2XLwGqJ0TbyZ4XrOY+/rqn3Pcky0KLBw8u5w6ykK77b3pkTXaKvEUGQvaaIR0LSOL5MFbQTHkZBE=
X-Received: by 2002:adf:f28c:: with SMTP id
	k12-v6mr5312234wro.263.1536837220171; 
	Thu, 13 Sep 2018 04:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20180913104859.29275-1-ovidiu.panait@windriver.com>
In-Reply-To: <20180913104859.29275-1-ovidiu.panait@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Sep 2018 13:13:28 +0200
Message-ID: <CA+chaQchuQ4naHj5FSohvGX4nV8ZVaGzJo20pCC4tst6QA3q5A@mail.gmail.com>
To: ovidiu.panait@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] qemux86-64: wic: Add MLPREFIX to syslinux
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
X-List-Received-Date: Thu, 13 Sep 2018 11:13:40 -0000
Content-Type: multipart/alternative; boundary="00000000000096048c0575beccd3"

--00000000000096048c0575beccd3
Content-Type: text/plain; charset="UTF-8"

The same should IMHO be applied in qemux86.conf as well.

And I don't see this change in pyro, rocko, sumo, master branches, it
should be applied there first (or explained in commit message why newer
branches aren't affected by this).

On Thu, Sep 13, 2018 at 1:01 PM Ovidiu Panait <ovidiu.panait@windriver.com>
wrote:

> Fix the following do_image_wic failure for lib32-core-image-minimal:
> | DEBUG: Executing python function set_image_size
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | Error: Please build syslinux first
>
> Test case:
> MACHINE ?= "qemux86-64"
>
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>
> IMAGE_FSTYPES_append = " wic wic.bmap"
>
> $ bitbake lib32-core-image-minimal
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/conf/machine/qemux86-64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemux86-64.conf
> b/meta/conf/machine/qemux86-64.conf
> index 4f30033e51..e093078d9d 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -33,4 +33,4 @@ MACHINE_FEATURES += "x86"
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>
>  WKS_FILE ?= "directdisk.wks"
> -do_image_wic[depends] += "syslinux:do_build
> syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot
> dosfstools-native:do_populate_sysroot"
> +do_image_wic[depends] += "${MLPREFIX}syslinux:do_build
> syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot
> dosfstools-native:do_populate_sysroot"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000096048c0575beccd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The same should IMHO be applied in qemux86.conf as well.<d=
iv><br></div><div>And I don&#39;t see this change in pyro, rocko, sumo, mas=
ter branches, it should be applied there first (or explained in commit mess=
age why newer branches aren&#39;t affected by this).</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Thu, Sep 13, 2018 at 1:01 PM Ovidiu=
 Panait &lt;<a href=3D"mailto:ovidiu.panait@windriver.com">ovidiu.panait@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fix the =
following do_image_wic failure for lib32-core-image-minimal:<br>
| DEBUG: Executing python function set_image_size<br>
| DEBUG: Python function set_image_size finished<br>
| DEBUG: Executing shell function do_image_wic<br>
| Error: Please build syslinux first<br>
<br>
Test case:<br>
MACHINE ?=3D &quot;qemux86-64&quot;<br>
<br>
require conf/multilib.conf<br>
MULTILIBS =3D &quot;multilib:lib32&quot;<br>
DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;x86&quot;<br>
<br>
IMAGE_FSTYPES_append =3D &quot; wic wic.bmap&quot;<br>
<br>
$ bitbake lib32-core-image-minimal <br>
<br>
Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@windriver.=
com" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/qemux86-64.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-=
64.conf<br>
index 4f30033e51..e093078d9d 100644<br>
--- a/meta/conf/machine/qemux86-64.conf<br>
+++ b/meta/conf/machine/qemux86-64.conf<br>
@@ -33,4 +33,4 @@ MACHINE_FEATURES +=3D &quot;x86&quot;<br>
=C2=A0MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D &quot;v86d&quot;<br>
<br>
=C2=A0WKS_FILE ?=3D &quot;directdisk.wks&quot;<br>
-do_image_wic[depends] +=3D &quot;syslinux:do_build syslinux-native:do_popu=
late_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populat=
e_sysroot&quot;<br>
+do_image_wic[depends] +=3D &quot;${MLPREFIX}syslinux:do_build syslinux-nat=
ive:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native=
:do_populate_sysroot&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000096048c0575beccd3--
