Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id CE13C788E2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 17:55:38 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id n136so6367812itg.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 09:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CtGhEntdXikTVlxa23s35t+UZIe7CzXL6bALeMuDQCA=;
	b=VS49a4F0nXLhbpBaDQMIn4P1uZjIDH2yDYJKbus7x+BskYbzkrW41jaCLKyuiQ5R60
	TYBIT6AS5lj4b7u459euHCYmFvAXeY41LsNw1h8ordP7KAKuVwvv6rPd6f1R7JH9Gkuo
	zzYBbSZAPjwY4kNizAHDA2gZoc02IjdQOaUXZR8AJcmIgNzgUSAiUPyfvGGwxJow/0yr
	skFAaY7s/5Gyk26RZpfw3WufP3wjcWy6ItB6ZQPoXGSHbD9/Sr1cC0+QNniCU7ZYm9Va
	7NvPCu5OEVKlpaJZeFNfcPCTI7bKUD1IPGxktsPaROFGityY+d7n5jc6LAFg+tyGSozY
	/PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CtGhEntdXikTVlxa23s35t+UZIe7CzXL6bALeMuDQCA=;
	b=DneS0SJiEbHZsF+RlHdDgqXzuO72qAuqT9ebx6epxZbURqmmOl/rGCGUCfR+8l8OAV
	qR06+INkHdhh8Kpxghs2FGV1chMfShFdJYw+LaQI4q46WVnw9AMuTOskVQQFtyZV5DWa
	p80HA2+egN8sMhRVrr+47yArxdAx3cBRCRGv6xygTEJx36NUruqrsNHrZYZE6GVOTYnV
	/lSbe2NXM4AnTK1r+jPN1/WFZ2AD5XjLX1URwNBC0MLNWJCb90R63B6krWUCWZ20Ky9t
	v2OMpCre+Trz+KIm++IZfWMKZtl8i5/Iwm7kbNmWJUJkjOL0jcsSnV2ptSV286ne5GbI
	DZZQ==
X-Gm-Message-State: AElRT7G4lSa7J6eLjBzprl3sNoxKbAaS08hPra31Pw29acxIqBugs6Ay
	mBOvrgevZHfx+chTHkPd28qOev/1NPNJYwm3Fi5eAA==
X-Google-Smtp-Source: AG47ELsSWEDI9L6wn6MDFabfBIN086k/epucVCB7Pc1llnowQCUD4GeEEwRXQNEWyQpbawJFCRiqyNw+tzQ4guPyhUQ=
X-Received: by 10.36.198.7 with SMTP id j7mr2570180itg.34.1520704539893; Sat,
	10 Mar 2018 09:55:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Sat, 10 Mar 2018 09:55:19 -0800 (PST)
In-Reply-To: <20180310002346.6086-1-california.l.sullivan@intel.com>
References: <20180310002346.6086-1-california.l.sullivan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 10 Mar 2018 17:55:19 +0000
Message-ID: <CAJTo0Lbw3obJmC44nLGXxNGb1AuVFxGQzH69ckDZzM76qOkwLQ@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc: use xf86-video-modesettings as default xserver
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
X-List-Received-Date: Sat, 10 Mar 2018 17:55:39 -0000
Content-Type: multipart/alternative; boundary="94eb2c089ed6e8c0de0567129dbe"

--94eb2c089ed6e8c0de0567129dbe
Content-Type: text/plain; charset="UTF-8"

From memory there are some chipsets which the Intel driver *is* better on.
I recommend we look at the Fedora patches for the intel driver, I believe
that massively reduces the chips that the intel driver will be the primary
driver for.  We can then continue to ship both and not break anything.

Ross

On 10 March 2018 at 00:23, California Sullivan <
california.l.sullivan@intel.com> wrote:

> Most distros have switched to this, and we're seeing better results in
> some areas as well. E.g., on a NUC6CAYS the x11perf -aa10text and
> -rgb10text results see a 20x increase.
>
> [YOCTO #12019].
> [YOCTO #12590].
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  meta/conf/machine/include/x86-base.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/x86-base.inc
> b/meta/conf/machine/include/x86-base.inc
> index f8aacea64cc..e6bfdc6f770 100644
> --- a/meta/conf/machine/include/x86-base.inc
> +++ b/meta/conf/machine/include/x86-base.inc
> @@ -34,11 +34,11 @@ XSERVER_X86_EXT = " \
>             xserver-xorg-module-libint10 \
>             "
>
> -XSERVER_X86_I915 = "xf86-video-intel \
> +XSERVER_X86_I915 = "xf86-video-modesetting \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-i915', '', d)} \
>             "
>
> -XSERVER_X86_I965 = "xf86-video-intel \
> +XSERVER_X86_I965 = "xf86-video-modesetting \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-i965', '', d)} \
>             "
>
> --
> 2.14.3
>
>

--94eb2c089ed6e8c0de0567129dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From memory there are some chipsets which the Intel driver=
 *is* better on.=C2=A0 I recommend we look at the Fedora patches for the in=
tel driver, I believe that massively reduces the chips that the intel drive=
r will be the primary driver for.=C2=A0 We can then continue to ship both a=
nd not break anything.<div><br></div><div>Ross</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 10 March 2018 at 00:23, Califor=
nia Sullivan <span dir=3D"ltr">&lt;<a href=3D"mailto:california.l.sullivan@=
intel.com" target=3D"_blank">california.l.sullivan@intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Most distros have switched to thi=
s, and we&#39;re seeing better results in<br>
some areas as well. E.g., on a NUC6CAYS the x11perf -aa10text and<br>
-rgb10text results see a 20x increase.<br>
<br>
[YOCTO #12019].<br>
[YOCTO #12590].<br>
<br>
Signed-off-by: California Sullivan &lt;<a href=3D"mailto:california.l.sulli=
van@intel.com">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/x86-<wbr>base.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/<wbr>x86-base.inc b/meta/conf/machin=
e/include/<wbr>x86-base.inc<br>
index f8aacea64cc..e6bfdc6f770 100644<br>
--- a/meta/conf/machine/include/<wbr>x86-base.inc<br>
+++ b/meta/conf/machine/include/<wbr>x86-base.inc<br>
@@ -34,11 +34,11 @@ XSERVER_X86_EXT =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-module-libint10 \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-XSERVER_X86_I915 =3D &quot;xf86-video-intel \<br>
+XSERVER_X86_I915 =3D &quot;xf86-video-modesetting \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
<wbr>FEATURES&#39;, &#39;opengl&#39;, &#39;mesa-driver-i915&#39;, &#39;&#39=
;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-XSERVER_X86_I965 =3D &quot;xf86-video-intel \<br>
+XSERVER_X86_I965 =3D &quot;xf86-video-modesetting \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
<wbr>FEATURES&#39;, &#39;opengl&#39;, &#39;mesa-driver-i965&#39;, &#39;&#39=
;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.14.3<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c089ed6e8c0de0567129dbe--
