Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 00C96606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 15:19:40 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n4so29533114qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 07:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+iFVpRpSOVJ3U4APNjL5jAeVkQA1ua0AT3D5jdYgXBM=;
	b=ezBLKO92hrMO23FWLmfmdrwIjJZjTm63Q6aAcXNt9xLhGZ66aI/K3Uq4PfOjBSldgl
	PJH30t7Xoz7caztmr/J1d2dDE+tfGmHUV2GJgTIJ8O6lXE8UWw3iArCjv/haPcCqX9AA
	93WbzVdP+CxkqjCVW0Bbgn9raNvrfpe1LswylAgc8zK+kA/79WQ5TRRGPgn5ihcltnwB
	dx5lo46EjoSPL6jKK6c2dFUfelEvzosUs/8um+XZAIVMvZuMv+fwlEVoBsXv3C45t7Uy
	NlavHwEdD2SPJxEGsWKAERFF8bPwzWClx+QKcNp5dFG3n+DzBVD+Zl8IJKd/dfTrcytG
	fhCA==
X-Gm-Message-State: ALoCoQkoVIwsh/kwr7w7t4kLQCa/6nO80Ep7R5jyBlijLgmZPjW+W14Jfbki4jOAr4a15kbsKmV5
X-Received: by 10.140.39.179 with SMTP id v48mr22799214qgv.77.1422890380981;
	Mon, 02 Feb 2015 07:19:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 07:19:19 -0800 (PST)
In-Reply-To: <a5726f608827c0a0325705eae8dadbf90edd7c5f.1420813096.git.timo.mueller@bmw-carit.de>
References: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
	<a5726f608827c0a0325705eae8dadbf90edd7c5f.1420813096.git.timo.mueller@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 15:19:19 +0000
Message-ID: <CAJTo0LaOUYJTw7j7XEyh-JM_q-F5Xuze4Mq6gqufpgRm9E94GA@mail.gmail.com>
To: Timo Mueller <mail@timomueller.eu>
Cc: Timo Mueller <timo.mueller@bmw-carit.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] apr-util: Allow use in SDK
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
X-List-Received-Date: Mon, 02 Feb 2015 15:19:42 -0000
Content-Type: multipart/alternative; boundary=001a11c131f6b6ae45050e1c7b71

--001a11c131f6b6ae45050e1c7b71
Content-Type: text/plain; charset=UTF-8

Hi Timo,

On 2 February 2015 at 14:03, Timo Mueller <mail@timomueller.eu> wrote:

> From: Timo Mueller <timo.mueller@bmw-carit.de>
>
> This adds 'nativesdk' in the BBCLASSEXTEND.
>

This doesn't apply to master, can you rebase?

Ross

--001a11c131f6b6ae45050e1c7b71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Timo,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 2 February 2015 at 14:03, Timo =
Mueller <span dir=3D"ltr">&lt;<a href=3D"mailto:mail@timomueller.eu" target=
=3D"_blank">mail@timomueller.eu</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":30d" class=3D"a3s" style=3D"overflow:hidden">From=
: Timo Mueller &lt;<a href=3D"mailto:timo.mueller@bmw-carit.de">timo.muelle=
r@bmw-carit.de</a>&gt;<br>
<br>
This adds &#39;nativesdk&#39; in the BBCLASSEXTEND.</div></blockquote></div=
><br>This doesn&#39;t apply to master, can you rebase?</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c131f6b6ae45050e1c7b71--
