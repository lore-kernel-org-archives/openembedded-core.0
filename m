Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 65C9462252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:10:39 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id l4so16523144lbv.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 01:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=K6SkCiCKV/A+GjCIM96eBld8a5JXZlH8IDFv3pZjpVM=;
	b=JW4SiR4MoQ/eol6LnoAMufYIdTCUDsoUEPjFOSqHZ9/rFjAD6Qg4B6ADFYRdGyftFA
	XmcU0/Os1cOl1MX0Wzf79OgCzlcOIHo5kX/lcGNS/kfqu02Muz5bq6H59X9WyT5h4b5j
	u5vmcYce7Rfx6aqoLXtQktQkL4BFO8G4/fTZ9VH50mwVPCh1UgOQ9pDxDstbbqYK+OV4
	UtkCqMWgx8/K43xTjpz8WHfyAdFGd8wxySrXoSR2ZNA+cAZgHMEtftxXxr8HwNHmGZKj
	hUxHkUWEp19RgURZcaH8SRkT8nkH4yVxhzX2/i7iouPblNurUFNKIpXYCF+9MTr/K+CP
	eGfA==
MIME-Version: 1.0
X-Received: by 10.152.205.104 with SMTP id lf8mr29795965lac.94.1421053839865; 
	Mon, 12 Jan 2015 01:10:39 -0800 (PST)
Received: by 10.25.155.18 with HTTP; Mon, 12 Jan 2015 01:10:39 -0800 (PST)
In-Reply-To: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1421032337-50265-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Mon, 12 Jan 2015 10:10:39 +0100
Message-ID: <CAPbeDCmTJe1TgY4kYG0+pEyz7LbhiOreMdeSsczFa6R_5a2Rzg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: upgrade to 4.9.2 and fix the bug #6824
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
X-List-Received-Date: Mon, 12 Jan 2015 09:10:46 -0000
Content-Type: multipart/alternative; boundary=001a1133a57454ffa6050c70e164

--001a1133a57454ffa6050c70e164
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon, Jan 12, 2015 at 4:12 AM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:
<snip>

>
>  EXTRA_OECONF_PATHS = "\
> -    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
> -    --with-sysroot=/not/exist \
> +
> --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV}
> \
> +    --with-sysroot=${STAGING_DIR_TARGET} \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
>

Unless things have changed, the sysroot is supposed to be poisoned by
default, see commit 04b725511a505c582a3abdf63d096967f0320779 in OE-Core.

--001a1133a57454ffa6050c70e164
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Jan 12, 2015 at 4:12 AM, Lei Maohui <span dir=3D"ltr">&=
lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@=
cn.fujitsu.com</a>&gt;</span> wrote:<br></div><div class=3D"gmail_quote">&l=
t;snip&gt;<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
=C2=A0EXTRA_OECONF_PATHS =3D &quot;\<br>
-=C2=A0 =C2=A0 --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/$=
{BINV} \<br>
-=C2=A0 =C2=A0 --with-sysroot=3D/not/exist \<br>
+=C2=A0 =C2=A0 --with-gxx-include-dir=3D${STAGING_DIR_TARGET}${target_inclu=
dedir}/c++/${BINV} \<br>
+=C2=A0 =C2=A0 --with-sysroot=3D${STAGING_DIR_TARGET} \<br>
=C2=A0 =C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET} \<br>
=C2=A0&quot;<br></blockquote></div><br></div><div class=3D"gmail_extra">Unl=
ess things have changed, the sysroot is supposed to be poisoned by default,=
 see commit 04b725511a505c582a3abdf63d096967f0320779 in OE-Core.<br><br></d=
iv></div></div>

--001a1133a57454ffa6050c70e164--
