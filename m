Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09A3E607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 17:01:24 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id g127so9480034ith.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=FHP39hFa+h2wWss6q5MUUe4N7J/9Z7te/++zMWIWoI4=;
	b=C81jmH1ZO/W0kQCnJFSRV9UAX83zwEIWmM8zCYLpYvf1i9E+xSfKN4gw4oZE6JJiVz
	vxIFCvO/FX6G5ZBeZJvK1CmgbN7kYZPEGJkGJb0LW/jFW8dJBBUF2awdTsx/1ZSXl9BU
	cIil17dH7W7SNtloHK9mmPahKTRCQzGbiuEpfPJ+op9SawRff/o/VbFoxaChnKfrp6EO
	IW1sSiGsVH1FmGlx/Pa/99NlZd4h+CHJnv5Nf1TcQYpKpn4irlwWQXikMoS5sY0D7VAV
	fsZvYVxDGin66f/a8N8ahfqbj/K3uyeRZCBtDdqHzjgxvtpBK7MQQTVvjZlLfOl58JvT
	q+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=FHP39hFa+h2wWss6q5MUUe4N7J/9Z7te/++zMWIWoI4=;
	b=JQI7cwg2oSDYrFF5uF7ehgVhEaKANuSRRQg9ue4KOP8tGseusJDUTqcvgBAebuKXFY
	+L/SiDsP714pGS/WvZlflDUSB3iVnOJqPyciQkhWVMiZAnYPLzpIeQeOiK4ZmXR/N64r
	H8H7CszfykIncE/vILufNqwCoV901Iq/VifZO9M3pXCdkddpJbpT1+FIMg4tgutC5KCl
	NqEW/aCHNfrucjLouI9B/yVlVP171YTXYNkGA3Vj4Ixg36EDh0xd43XC4cJU5DnXQmzc
	scqAcs7RvTTQvjQ22eaFZ73IxdNaQKFLWRVc6Q6YWdLYUjobPsiTFUTELsATd6wfvAqX
	12ew==
X-Gm-Message-State: ALyK8tIaerGEZKvm6+MmV+5PSTTrKF33Vz4AU+fo1wErdoNXmwWZfwBgLcNRUSthi/Zd4Pr38HWQsd3CI49Wsw==
X-Received: by 10.36.216.5 with SMTP id b5mr16475283itg.19.1467306084921; Thu,
	30 Jun 2016 10:01:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Thu, 30 Jun 2016 10:01:05 -0700 (PDT)
In-Reply-To: <1467296262-3088-1-git-send-email-michael.davis@essvote.com>
References: <1467296262-3088-1-git-send-email-michael.davis@essvote.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 30 Jun 2016 10:01:05 -0700
X-Google-Sender-Auth: _EhDZt25gCHAuWmMerJtxtGQ_gY
Message-ID: <CABcZAN=2jFoPiCKudWxgMzn8zRLrT0kF498eMLzZzHQxRnmwSg@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Disable unit tests
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
X-List-Received-Date: Thu, 30 Jun 2016 17:01:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c05cc14f7f797053681d131

--94eb2c05cc14f7f797053681d131
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 30, 2016 at 7:18 AM, Davis, Michael <michael.davis@essvote.com>
wrote:

> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 8a28ca7..accafe1 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -30,6 +30,7 @@ EXTRA_OECONF = "\
>                 --without-zsh-completion-dir \
>                 --with-udev-rules-dir=`pkg-config --variable=udevdir
> udev`/rules.d \
>                  ac_cv_header_valgrind_memcheck_h=no \
> +                --disable-tests \
>  "
>
>  # soxr (the SoX Resampler library) doesn't seem to be currently packaged
> in
> --
> 2.5.5
>

The commit message says nothing about *why* you're doing this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05cc14f7f797053681d131
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 30, 2016 at 7:18 AM, Davis, Michael <span dir=3D"ltr">&lt;<=
a href=3D"mailto:michael.davis@essvote.com" target=3D"_blank">michael.davis=
@essvote.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed=
-off-by: Michael Davis &lt;<a href=3D"mailto:michael.davis@essvote.com">mic=
hael.davis@essvote.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc<br>
index 8a28ca7..accafe1 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
@@ -30,6 +30,7 @@ EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-zsh-compl=
etion-dir \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-udev-rules-d=
ir=3D`pkg-config --variable=3Dudevdir udev`/rules.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_header_=
valgrind_memcheck_h=3Dno \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-tests \<=
br>
=C2=A0&quot;<br>
<br>
=C2=A0# soxr (the SoX Resampler library) doesn&#39;t seem to be currently p=
ackaged in<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br></font></span></blockquote><div>=C2=A0</div></div><div>The commit =
message says nothing about *why* you&#39;re doing this.</div>-- <br><div cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher Lars=
on<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZa=
urus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</di=
v>
</div></div>

--94eb2c05cc14f7f797053681d131--
