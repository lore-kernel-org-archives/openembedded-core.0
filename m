Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD477F128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:11:16 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id s16so10638226vke.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jMC/QpfrifEkuHSG8lqGLn4JiRdhv6qgEl2+jt4t/+Y=;
	b=o9CCpIdqXDi4eA1J4hQm3bx6ldifdSKrmiTod6C7pJM114L9bFgHMl+wad3AYwL04d
	/B6+2QjnUBHCQC9N5UI+78tdWLM3SJ1gDR+ys+vgvLKRUw4doUlMiBlO4rq/1NTs/eAf
	TeUBMNgKRoP+SqtHyA2XKX9b7DapE2CQFVK9fyFcnEEoKMf6aKM7vMMHs4baQeX+KFJT
	PpLmQsfWRIpBTCuz+NKqTwwfO1AEl6Sw9lUHYujyWLS53ThFoS4JijM5IJ8Tc5pi9TRr
	4wC7Ek5Iqx6EiJzZIhCf2eeFWy1fHZgEehZ5RmiaBekWPJkqTCThWRLU9ukQ6n8wT7GX
	uHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jMC/QpfrifEkuHSG8lqGLn4JiRdhv6qgEl2+jt4t/+Y=;
	b=tDW72dL+/A5g2d1bth9bo99lI15oXLXRXz6cutFSPte3322pP8MFj4gACwhtMLNtIe
	eqYwy3v6wLH/DbAudck72d2ur9CkcdZdn5KpTx4eFtcBRqYfj20wfDgArXHQBY9xHDm0
	mfImPNCx20uX8ZlK9TujLBmfMIjGeUzGm1n40Xs0+p2BBida2cy8wJQCb8NhzrZ6hSFO
	pcHHASg1yi+MtSRPZJ+oX+bIl1Ki4sgRboNRQTkXVgOWfccrmVJO7fk2DriVZnggfZJC
	B/BUCunpI1PUPt7xs+fk6mMPrElLbgZqvOyNSE0mxZekOFzUtWOfKiegN6ghM1aU8NEw
	Pa6w==
X-Gm-Message-State: APjAAAU+xlyHT9o9d/kmz3go1TDwnkCTbjdV/smQ1rI+5dS4DiCd7f8D
	T4v9Y9FfW7yKaYUNo2CnVZVFMzmmLZNnCLFcpwc=
X-Google-Smtp-Source: APXvYqxntM8/pdqHwmhey669583jIcfghGrmJbEyGbiU34FwQAjAX+GPzcpwl62iWQ3sK/28CEzjltxMOQSRpIXelPA=
X-Received: by 2002:a1f:8bc4:: with SMTP id n187mr36315822vkd.32.1564135877469;
	Fri, 26 Jul 2019 03:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190726092342.37231-1-kai.kang@windriver.com>
In-Reply-To: <20190726092342.37231-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jul 2019 13:11:06 +0300
Message-ID: <CANNYZj8Jm7q5NfUjHVuDJGaJHC51txQ-iMWZP7YC4-nWkRstdg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Fri, 26 Jul 2019 10:11:16 -0000
Content-Type: multipart/alternative; boundary="0000000000005b6aab058e92c3f1"

--0000000000005b6aab058e92c3f1
Content-Type: text/plain; charset="UTF-8"

I think you need to use QB_MEM here.

Also, maybe we should just bump the 256M default?

Alex

On Fri, 26 Jul 2019 at 12:24, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> When run do_testimage for core-image-sato-sdk, it fails to pass test
> case:
>
> | RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (0.43s)
>
> It is OOM issue and daemon rpc.statd is killed:
>
> |  [  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or
> sacrifice child
>
> Increase the memory of qemu to 512M to avoid such OOM issue.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
> b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index d7cc52b52b..f7963d018e 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>
>  IMAGE_INSTALL += "kernel-devsrc"
>
> +TEST_QEMUPARAMS = "-m 512"
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005b6aab058e92c3f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think you need to use QB_MEM here.<div><br></div><div>Al=
so, maybe we should just bump the 256M default?</div><div><br></div><div>Al=
ex</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, 26 Jul 2019 at 12:24, &lt;<a href=3D"mailto:kai.kang@windri=
ver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_bla=
nk">kai.kang@windriver.com</a>&gt;<br>
<br>
When run do_testimage for core-image-sato-sdk, it fails to pass test<br>
case:<br>
<br>
| RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (0.43s)<b=
r>
<br>
It is OOM issue and daemon rpc.statd is killed:<br>
<br>
|=C2=A0 [=C2=A0 531.306146] Out of memory: Kill process 193 (rpc.statd) sco=
re 200 or sacrifice child<br>
<br>
Increase the memory of qemu to 512M to avoid such OOM issue.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk=
.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a> b/meta=
/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" rel=3D"noref=
errer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
index d7cc52b52b..f7963d018e 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">core-image-sato-sdk.bb</a><br>
@@ -9,3 +9,4 @@ IMAGE_FEATURES +=3D &quot;dev-pkgs tools-sdk \<br>
<br>
=C2=A0IMAGE_INSTALL +=3D &quot;kernel-devsrc&quot;<br>
<br>
+TEST_QEMUPARAMS =3D &quot;-m 512&quot;<br>
-- <br>
2.20.0<br>
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

--0000000000005b6aab058e92c3f1--
