Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1063965CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 14:06:43 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id 123so19499120ybe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 06:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zIVkmE+UQTX2E5A7NWAWPSNFc8NRBX1780ZySRsI/0g=;
	b=0olnJxdtxo19J7IV0aQRyeE+uqQrY5+UCAiiKtKfbZfRnGc60EZlwO8HJr8BAuGv88
	IrrkcoyzftZQNTZH8Y/VAszTEQOuN5cQGeA4Rons9HICAfEJkwdPJW0fot6cDge5fcK9
	NLPklyFYoXaya3xXy5x3HXtpa5muaUoy+8t9xo/1ZZQS86AbikkdBXiwaxOyJGDfgERx
	fUdMK2qU+oY2/NhAH0bvm9Xbt7c4cpvwlDzesEsxmIl/Z6nsmQ/ncQurEcNBfZCgHh7W
	s38S/sAalHgfD9wbbMxuPc/NKoiyB94EyGpFoE5ZPg7/Y8m3W9smFWqiKwcjhQWeiHXV
	9m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zIVkmE+UQTX2E5A7NWAWPSNFc8NRBX1780ZySRsI/0g=;
	b=Ax+ixST3RyvzGy9C3xIX9LZeZV1/yHchzYVoVNfjRVB9/s6OmmXPBj1aw544jyJ7ue
	FjHRHydCPR6QXan/wk2OSLjKUJYbqnQVrwljBWk7bWN1b+606LcRKZ/Nt0761ULsKc7L
	InI595faOd5y0VVSjw8H6G2Z/f1cjk5JAZ7aB61W4hrdL4duH9uTc6ZuBUzBNUBIgrHv
	cJBA+Ypt8Gg+eLKMxGXGq6HHWszI4RUG0ZdVGJCg7+iYYsi/wu4IW3IoZ36gJlf4mbPc
	WbyVHNIi7MjOgYo1lHfffFKbPAGIU5Xt9LkP6/ALB2tZEhyhIbbHqhGE4EsrDqvVNPeZ
	pl4Q==
X-Gm-Message-State: AIkVDXLldZPp8csUTs+mglyYX7G9lmEDc/r4v6zfQ7LeqQxVHjK0nsETSM5PcvuSwvYfXjsppBoNwX+z+9wHWmM5
X-Received: by 10.55.106.193 with SMTP id f184mr8880782qkc.36.1484834803947;
	Thu, 19 Jan 2017 06:06:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 06:06:23 -0800 (PST)
In-Reply-To: <7fdbf6137f68f008170006c2ba7bb99d4e1e8504.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
	<7fdbf6137f68f008170006c2ba7bb99d4e1e8504.1484747560.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 14:06:23 +0000
Message-ID: <CAJTo0La77QUiZm1yqvVfL4Mj44rXf6sVOBXThp_z4EDYdsB0qw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] kern-tools: kconf_check: flag CONFIG options with invalid spaces
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
X-List-Received-Date: Thu, 19 Jan 2017 14:06:44 -0000
Content-Type: multipart/alternative; boundary=001a114ff8c20a3b2f0546730b8b

--001a114ff8c20a3b2f0546730b8b
Content-Type: text/plain; charset=UTF-8

On 18 January 2017 at 13:54, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> -SRCREV = "be79004cb2535e79271822b3d74eda5ba12233d2"
> +SRCREV = "bf2942f7559d114e96f7c7f1287bf7e5120632a"
>

Somehow you managed to drop a digit from the SHA, I've a fix locally.

Ross

--001a114ff8c20a3b2f0546730b8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2017 at 13:54, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":r4" class=3D"a3s aXjCH m159b1dd825380a32">-SRCREV =3D &quot;<wbr>be79=
004cb2535e79271822b3d74eda<wbr>5ba12233d2&quot;<br>
+SRCREV =3D &quot;<wbr>bf2942f7559d114e96f7c7f1287bf7<wbr>e5120632a&quot;<b=
r></div></blockquote></div><br>Somehow you managed to drop a digit from the=
 SHA, I&#39;ve a fix locally.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a114ff8c20a3b2f0546730b8b--
