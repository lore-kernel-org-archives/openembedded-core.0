Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 70AC16E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:43:32 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so58202311igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 06:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qRP2+akLPWbkNmFNsphfzfBN03/h/x0zeV02+zWaFJ0=;
	b=pnzIHfaQqrCJILRaJYmAyF/eNOq+TIpZdLwS6Yy4gPq9w22R1KQw1er002ZBuBogbU
	BKsAGXJXmhpbOTnwzX/Hl6MruOfQJuZe38pOPLGpKQ0UMhoVbhVdoYr7d0KrlOx2nBno
	Uc8SCPsDSe/R3NPeB9DNfd/DGeb5mCQKBDwsYQZFJoOzQFCrwflghOrr6Wyma1kxjKFM
	XPyABU+oeiQsbKMEjpLe72NDyPnfDr1ad6sTYxjXgKETjCuIe6E5a9w53rO+rYp9JV6Z
	JaSsQA9DPxrKAUx/z7si6wxm8YS7YMJ3i10ry/51Ki4Ob+RNMtPxoKCI0AaU/xdsQrli
	v6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qRP2+akLPWbkNmFNsphfzfBN03/h/x0zeV02+zWaFJ0=;
	b=EgzHEtpi3FmbJIrFEfXm+ZCG0SFsALU6uNXsEr8Z4vc01PcJYS4pndvHMuUoOOBhPD
	j7MsUP19DHIYid++VR+LUDcaKjrDSdvohCplrReCOoo0+YJwWw2Q53V5y4msY/N+I8B2
	glko3YkOOUtbrMb3o95aY1weltemqysI+EIwNQNPGvgwXf3gPX6uHmxADKajJRYp+LgX
	YeXrB08PqMihsabN0XFJXYwhkVUFQacfsCbKVqE/8t/Rb0yPeZGOWnzo1N0N7ziNouhn
	lNu3wd/yZ2pXHHc41uVQvQKgOGMljQBv9U0FUXqRYm/YSs8yv3o+R/7gBM2VuHSiQL3C
	eR8w==
X-Gm-Message-State: ALoCoQn0n2aWo+TYoLWG1Tl47agnaKUqgkPQTf+lrRsWXC4jXlB6E7mrA6JfJUnDD16MXLjq4kY4
X-Received: by 10.50.112.99 with SMTP id ip3mr17591007igb.78.1447685013077;
	Mon, 16 Nov 2015 06:43:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 06:43:13 -0800 (PST)
In-Reply-To: <1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
References: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
	<1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 14:43:13 +0000
Message-ID: <CAJTo0LZ7334nHja8NNE0hDh2X2kfM3s1vtcRtXo_V9L_FnMNDA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 16 Nov 2015 14:43:35 -0000
Content-Type: multipart/alternative; boundary=047d7b3a97c4f39bd90524a96e25

--047d7b3a97c4f39bd90524a96e25
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 11:39, Otavio Salvador <otavio@ossystems.com.br>
wrote:

>  rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng
> -tools_git.bb} (90%)
>

There are upstream tarballs, is there a good reason this recipe is taken
from git?

Ross

--047d7b3a97c4f39bd90524a96e25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 11:39, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2g" =
class=3D"a3s" style=3D"overflow:hidden">=C2=A0rename meta/recipes-kernel/<s=
pan class=3D"il">lttng</span>/{<a href=3D"http://lttng-tools_2.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">lttng-tools_2.6.0.bb</a> =3D&gt; <a href=
=3D"http://lttng-tools_git.bb" rel=3D"noreferrer" target=3D"_blank"><span c=
lass=3D"il">lttng</span>-tools_git.bb</a>} (90%)<br></div></blockquote></di=
v><br>There are upstream tarballs, is there a good reason this recipe is ta=
ken from git?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--047d7b3a97c4f39bd90524a96e25--
