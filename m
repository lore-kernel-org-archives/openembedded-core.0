Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 215716FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:39:27 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g203so150046293iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ulRlcncJWO0hsC3fzZ0maPxz3iI0KIXPyUYVtEWe8jc=;
	b=zlPOQ4Vgo9OulYctclhHjjJ4hLlH7C77++OtNfG65dhy5AuI/VNvOB9KJOpKXYGVXg
	KSdddER1614tlAMCroq1Oiuf+YQqwwT5Y65nU8GVzG9yinCJR616zLgpO9RiaR4HJDkh
	VzucKweb4NDyeMLkNo+IDd++GEhtg8Zg0SdqQNf75xMF6UmhqfP9FUjE6x59zMLvif8Z
	25D6JprwOUE0DVhTY4HILOItm4sZoPvJ3wl+yxCCM1HLJFGDZilfQBQyN3LKoc+bNJEi
	feE+xudTMJCJFqtFcf8bWYW/Fue3mW4f2DAFT5ee8pP5SLyGQHZhn6DB4DtoNRlXnPpy
	mLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ulRlcncJWO0hsC3fzZ0maPxz3iI0KIXPyUYVtEWe8jc=;
	b=U8xaP6FYMLHeeFAjxNzVMSQl9DzddlllEa1bqlF9ZfsuF0EeO6Mbos2Qm8bh9jhtZL
	7tdYOfm1RLQu2v5qpluTGjh1d4xha4dECh5KmQsfgtkjim8TkNg36skCMLzAiiwIstgp
	c13dgwFGH9UIGYP4WiOVAwgBSyqlH2udhHhsF3NalwXYGBhLG4b74iwLfQZYMbiqradm
	NNamRFyXiIxrb9xNip5F1mV1dZLlV6yOX4sUTGQhPCY8hwBAmRB4/SilW+Fg3AXIq+CF
	i42XhTW3j8DoERV1IyYrrIpUVU0CIHPZt4j6mk1shTJj+/9zq69eXDqjWcb7Q9uYjhfH
	+fcA==
X-Gm-Message-State: AD7BkJKz5/wOWf/Jv8UnLGU8W4VmhI5BZl89JAKnxGpg9UM2CO/EFqqNRZPuV6p71C2FoWx+r7gLZbHG44Qq3o45
X-Received: by 10.107.16.19 with SMTP id y19mr10357430ioi.148.1457710768161;
	Fri, 11 Mar 2016 07:39:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 07:39:08 -0800 (PST)
In-Reply-To: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 15:39:08 +0000
Message-ID: <CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
To: helio.castro@bmw-carit.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 15:39:28 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea859cec052dc7bc1a

--001a113fd1ea859cec052dc7bc1a
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 14:24, <helio.castro@bmw-carit.de> wrote:

> -# Most libraries are licensed with the exception, but
> -# one library is really GPLv3.
> -#
> -LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception & GPLv3"
> -LICENSE_libstdc++ = "GPL-3.0-with-GCC-exception"
> -LICENSE_libstdc++-precompile-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libstdc++-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libstdc++-staticdev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libg2c = "GPL-3.0-with-GCC-exception"
> -LICENSE_libg2c-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libssp = "GPL-3.0-with-GCC-exception"
> -LICENSE_libssp-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libssp-staticdev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libgfortran = "GPL-3.0-with-GCC-exception"
> -LICENSE_libgfortran-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libgfortran-staticdev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libmudflap = "GPL-3.0-with-GCC-exception"
> -LICENSE_libmudflap-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libmudflap-staticdev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libquadmath = "GPL-3.0-with-GCC-exception"
> -LICENSE_libquadmath-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libquadmath-staticdev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libatomic = "GPL-3.0-with-GCC-exception"
> -LICENSE_libatomic-dev = "GPL-3.0-with-GCC-exception"
> -LICENSE_libatomic-staticdev = "GPL-3.0-with-GCC-exception"
> -
> -LICENSE_libgomp = "GPLv3"
> -LICENSE_libgomp-dev = "GPLv3"
> -LICENSE_libgomp-staticdev = "GPLv3"
> +LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
> +LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
> +LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
> +LICENSE_${PN}-staticdev = "GPL-3.0-with-GCC-exception"
>

This patch doesn't look right...

Ross

--001a113fd1ea859cec052dc7bc1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 14:24,  <span dir=3D"ltr">&lt;<a href=3D"mailto:helio.c=
astro@bmw-carit.de" target=3D"_blank">helio.castro@bmw-carit.de</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":aon" class=3D"a3s"=
 style=3D"overflow:hidden">-# Most libraries are licensed with the exceptio=
n, but<br>
-# one library is really GPLv3.<br>
-#<br>
-LICENSE_${PN}-dbg =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption &amp; GPLv3&quot;<br>
-LICENSE_libstdc++ =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption&quot;<br>
-LICENSE_libstdc++-precompile-dev =3D &quot;GPL-3.0-with-<span class=3D"il"=
>GCC</span>-exception&quot;<br>
-LICENSE_libstdc++-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>=
-exception&quot;<br>
-LICENSE_libstdc++-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC<=
/span>-exception&quot;<br>
-LICENSE_libg2c =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-except=
ion&quot;<br>
-LICENSE_libg2c-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-ex=
ception&quot;<br>
-LICENSE_libssp =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-except=
ion&quot;<br>
-LICENSE_libssp-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-ex=
ception&quot;<br>
-LICENSE_libssp-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</sp=
an>-exception&quot;<br>
-LICENSE_libgfortran =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-e=
xception&quot;<br>
-LICENSE_libgfortran-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</spa=
n>-exception&quot;<br>
-LICENSE_libgfortran-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GC=
C</span>-exception&quot;<br>
-LICENSE_libmudflap =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-ex=
ception&quot;<br>
-LICENSE_libmudflap-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span=
>-exception&quot;<br>
-LICENSE_libmudflap-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC=
</span>-exception&quot;<br>
-LICENSE_libquadmath =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-e=
xception&quot;<br>
-LICENSE_libquadmath-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</spa=
n>-exception&quot;<br>
-LICENSE_libquadmath-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GC=
C</span>-exception&quot;<br>
-LICENSE_libatomic =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption&quot;<br>
-LICENSE_libatomic-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>=
-exception&quot;<br>
-LICENSE_libatomic-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC<=
/span>-exception&quot;<br>
-<br>
-LICENSE_libgomp =3D &quot;GPLv3&quot;<br>
-LICENSE_libgomp-dev =3D &quot;GPLv3&quot;<br>
-LICENSE_libgomp-staticdev =3D &quot;GPLv3&quot;<br>
+LICENSE_${PN}-dbg =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption&quot;<br>
+LICENSE_${PN} =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-excepti=
on&quot;<br>
+LICENSE_${PN}-dev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</span>-exc=
eption&quot;<br>
+LICENSE_${PN}-staticdev =3D &quot;GPL-3.0-with-<span class=3D"il">GCC</spa=
n>-exception&quot;<br></div></blockquote></div><br>This patch doesn&#39;t l=
ook right...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a113fd1ea859cec052dc7bc1a--
