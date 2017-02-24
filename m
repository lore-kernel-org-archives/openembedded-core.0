Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D092272F12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 20:45:40 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s186so28871150qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 12:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h2zkb455OSRjkyDkioPSdHFoZyaJoyuuviQAsZTEK7Q=;
	b=tE252lE24yH/ShBq+QgGCploOguuspGRQ2b5cxky37YpydzgnU4vlqPSCZxTsPGs90
	m8pAX3i5VdplDdRwhEtZRK8BD9gP20UvVVmA6VX07+7o7xFw+izW7dpKKjTwhoEa0kwr
	W1lZu7ys/ulbnvud2dZ4SOfvSjYrsRaFEeZdaFP8lg4o5B6xcOTZPtdktYgLeRL9vpij
	71G+1Y1RYkUguDrb6NNIZWjctS3+Id9B4YmAp13zdl5daUDN5BBx29d1DOun4/qHPLCA
	+QWdhlSqJZcNF5bfD2nnxHDO0mjn+WjTNF8E8sQZMHM7B7O+ncUeS/ZrhYaXHOSd2Zjm
	9lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h2zkb455OSRjkyDkioPSdHFoZyaJoyuuviQAsZTEK7Q=;
	b=dLVlVJgSIV2uf2W8ObeZqj++b5XmFy4krqhKe7BixEC1zlDsQuIp57VnMy/WNJtBAM
	plMJ5Fez4qVPbT8w/855ngW4IIxYSKwRh46wvgjpGPXoDP5NVo28ooWeOVF7+cDuSzi6
	pFqkd658BkgZ/hbf71r8v9JHoKSXvU9S6HBd3pRI0Vs+4Secm2IKmixh7TmY75kAnkLJ
	Nt1cObPEXH1WlpUNmrF7Hk44AVHRLrd4OqX6EAr5PoJm73kjDO5W2mocEDfSkhIessGP
	Rb0kcvxWPmhaI49574MlwobONhfGWVHT5vWTkulYcidF3WJX1cuK7xppeqa+H9pJ3Vt3
	E1pQ==
X-Gm-Message-State: AMke39knMjLK54LZTx3uGylxRD0O3+t8E9Vw6T6QAHB04LqniLQZUylZYr1pSvDNIn7lCu5ud9ucp8CrLif4xspw
X-Received: by 10.55.183.133 with SMTP id h127mr5056917qkf.121.1487969141689; 
	Fri, 24 Feb 2017 12:45:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 24 Feb 2017 12:45:21 -0800 (PST)
In-Reply-To: <1487961739-4548-1-git-send-email-ankit.tarot@gmail.com>
References: <1487961739-4548-1-git-send-email-ankit.tarot@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Feb 2017 20:45:21 +0000
Message-ID: <CAJTo0Lak84XUFb8WM1WuZ_w2a1wHtKwoWwDTtZ_wtXK5_x3uFw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: Initial recipe for Embedded Linux Library
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
X-List-Received-Date: Fri, 24 Feb 2017 20:45:41 -0000
Content-Type: multipart/alternative; boundary=94eb2c06005620d14405494cd09c

--94eb2c06005620d14405494cd09c
Content-Type: text/plain; charset=UTF-8

On 24 February 2017 at 18:42, Ankit Navik <ankit.tarot@gmail.com> wrote:

> Add generic recipe for ELL.
>

This doesn't answer the question of "why?".

Ross

--94eb2c06005620d14405494cd09c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2017 at 18:42, Ankit Navik <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ankit.tarot@gmail.com" target=3D"_blank">ankit.tarot@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":42d" class=
=3D"a3s aXjCH m15a716bd694c7a01">Add generic recipe for ELL.<br></div></blo=
ckquote></div><br>This doesn&#39;t answer the question of &quot;why?&quot;.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--94eb2c06005620d14405494cd09c--
