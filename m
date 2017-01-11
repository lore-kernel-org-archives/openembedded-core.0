Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 059B771AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 17:29:50 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s140so193403074qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EyZmf34oyk7fu0+7xmxSHGd2bWyEUPd/0KrrUEGaU3w=;
	b=Wrs4BImZjjTwPSOKhvav7Ikur6Bc4AJznZM75YQUwY5n4kKPIeMDxh/fWfKwAO1TM0
	rCuXYZW3kjC0SGwaNySvyTgnkGibho6RkFs5a8s5qMWKvFo+VWTHKI7UVvG6apquqpxz
	4o+f6M3OY3xgodQzuiK1PlYd83jOUabeySaTD1j9dyyGc2g/NqkVtQ0wVpxh7PtIYN9X
	Q+ezMsechtKx3wfCbLAVpvCJAFAjId7wBmRfvxuUKjdR/miyYNNeTCAs9rucKfRs7bsX
	u4ZaTV+N3FAqAe0VTwqCoT3Dm7f4uFqjQTwbZhk//pVR8/lobnbwVnsYO03kkP7i28ov
	lZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EyZmf34oyk7fu0+7xmxSHGd2bWyEUPd/0KrrUEGaU3w=;
	b=cZH2++DCG9AhsNmCOPMAvV/nZAeoOXdP94EXmFLsvi8fpGh6iyAqlxz2SAT18F6ejd
	SBd5zBujNS55GjJZPFdZ95++8AojLc1bmalZYOaiMEJtKhImDX7hVexDOgvLNG8CL+e1
	c1rEhombJ5CPun0++wtgqtnsw/Sb39TV3hTZ1kS251+XnjbdeYtfyBR1CVBMO7RlW9o9
	/2tfwpvpWFiubpUTCKHWxhO8eVAVbvjWZyPY+x9c7JBzxisja4Tln1su2T9Pc9xW+Res
	h4xa9mAqUH/Nlvwz8sKb8O5W/quPks7Xl5j1BxJlL5MnzSDAGnBKhQ4TgSE58Wj6aZ3P
	WLAA==
X-Gm-Message-State: AIkVDXKcbkkIHfYD7D2BGFs1dTUUGtVPDJnJFeAsK3jzA7+6/IM4gus1notrDeE+H+KgAGSzwfMfY2avFwrIOp0V
X-Received: by 10.55.47.4 with SMTP id v4mr9159138qkh.77.1484155791030; Wed,
	11 Jan 2017 09:29:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 09:29:30 -0800 (PST)
In-Reply-To: <aef76aaebfb78d7e724d695d6702d55a962992d1.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<aef76aaebfb78d7e724d695d6702d55a962992d1.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 17:29:30 +0000
Message-ID: <CAJTo0LbVjZ1w-navSNGkRNfOyHuDCCGF3KQYt5TGqHDo=Mkxig@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 4/4] selftest: sstatetests: skip glibc-initial tests and use a more generic image
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
X-List-Received-Date: Wed, 11 Jan 2017 17:29:51 -0000
Content-Type: multipart/alternative; boundary=001a114f4108b75e360545d4f2f6

--001a114f4108b75e360545d4f2f6
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 17:45, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> -        bitbake("core-image-sato -S none")
> +        bitbake("core-image-minimal -S none")
>

As this is just stamp calculation, could we just do "world" instead...

Ross

--001a114f4108b75e360545d4f2f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 17:45,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonar=
do.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.g=
onzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":2r1" class=3D"a3s aXjCH m1598450bb8bce8eb">-=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 bitbake(&quot;core-image-sato -S none&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;core-image-minimal -S none&quot;=
)<br></div></blockquote></div><br></div><div class=3D"gmail_extra">As this =
is just stamp calculation, could we just do &quot;world&quot; instead...</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114f4108b75e360545d4f2f6--
