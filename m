Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E06AC6093B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 11:08:09 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c47so7416465qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vGv2dKLu8Ioo1ScG/3xDOLP+81hHytLEcQmcKyjNOSE=;
	b=VNW+RgpxABjix543NJaHhMkYMF0gONVds5wjLnWyBPo41QM87aR9y0z1GTkUYnmIt8
	Obj+tV6cbb7KicNRpeiUc7cO65+0MTCN0mzWfkg86ZKIyrag11Y18IjCUMr4maQ5P1YV
	skhaR5utD4YBRTsOSsze02Qp2deuzejGIoyzKBf1OgyKZtGD27DsDCTC/hUR7VZsEYdA
	KxQrbl6qGGZw1/ZNHCr0iyVVbV09I2z3meaDw9frJEXPXAQbaWNh/cN2F7xwBIM9zHD+
	vaXsvDEzDioVtCg07EJ/LgT1ENsd12ZwMioWZ6aIh22r00/N9Y0gKZ55fwtUo/A4zRAT
	uadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vGv2dKLu8Ioo1ScG/3xDOLP+81hHytLEcQmcKyjNOSE=;
	b=NnQMK3bl89K10FpSi0cIvZuSTtHpj+JNGGpSl68JWJ1PheOks6VjouAngMxd66Ju7N
	wcKDYl85S7WLZKIkl7n2LBGS9x6UV/w9p3WH1T3veBVn4/VdNcDkcNf3Hk6vbwE4m8mt
	JSDRqGxeEFyF8NEcGKS1oBRElrCpB8q70rO8Cajm9ScgWSDbWaq7EHJ+ACNLZtxtsJhD
	nI139JlIq8dBkk9nJBPuF/dTCeoUW+hsQduvRjnmOG3hz1Ab4que/tiIe+S5ya6P9UUK
	Gus3LDM92OTDz70593QsIPKVXHTa3/gn63BJ1/lrF2d7WdC9G1bweub6z3cxgbwa6tDX
	7nEA==
X-Gm-Message-State: ABUngvfVRQpllxjIcCLL4FK+AoYNtcAdswwjv3VkcyKTJNd1I4CZVXl2c3Rie2jngXYKUF2MeWvoA8W3+8QXYwEi
X-Received: by 10.200.53.69 with SMTP id z5mr2581101qtb.64.1478862490813; Fri,
	11 Nov 2016 03:08:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 03:07:50 -0800 (PST)
In-Reply-To: <1478857754-61379-12-git-send-email-sona.sarmadi@enea.com>
References: <1478857754-61379-1-git-send-email-sona.sarmadi@enea.com>
	<1478857754-61379-12-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 11:07:50 +0000
Message-ID: <CAJTo0LZoc39Bu9aM5L_+J_gj8JavO2MuqAFi5sVpXWeTqHaGpg@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: sona@enea.se, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][krogoth 12/12] curl/url: remove unconditional idn2.h include
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
X-List-Received-Date: Fri, 11 Nov 2016 11:08:12 -0000
Content-Type: multipart/alternative; boundary=001a114058586fdad5054104812a

--001a114058586fdad5054104812a
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 09:49, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> +From c27013c05d99d92370b57e1a7af1b854eef4e7c1 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 31 Oct 2016 09:49:50 +0100
> +Subject: [PATCH] url: remove unconditional idn2.h include
> +
> +Mistake brought by 9c91ec778104a [fix to CVE-2016-8625]
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
>

No Upstream-Status in this.  If it's part of the fix to the CVE, maybe it
should be applied in the same patch?

Ross

--001a114058586fdad5054104812a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 09:49, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50c" class=
=3D"a3s aXjCH m15852e2e9535a1ff">+From c27013c05d99d92370b57e1a7af1b8<wbr>5=
4eef4e7c1 Mon Sep 17 00:00:00 2001<br>
+From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se">daniel@haxx.se=
</a>&gt;<br>
+Date: Mon, 31 Oct 2016 09:49:50 +0100<br>
+Subject: [PATCH] url: remove unconditional idn2.h include<br>
+<br>
+Mistake brought by 9c91ec778104a [fix to CVE-2016-8625]<br>
+<br>
+Signed-off-by: Sona Sarmadi &lt;<a href=3D"mailto:sona.sarmadi@enea.com">s=
ona.sarmadi@enea.com</a>&gt;</div></blockquote></div><br>No Upstream-Status=
 in this.=C2=A0 If it&#39;s part of the fix to the CVE, maybe it should be =
applied in the same patch?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a114058586fdad5054104812a--
