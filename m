Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id AD9107C61F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 16:40:55 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f2so11254410edy.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KR9uW+m3b45OoGhZMQRU5QoMgYw70KVymfxrJB6D0SM=;
	b=nSx6WaDjMGF3eWz1lEFx26mZD3JlGcd1cagZ/EZkSH//ZZRHEpd3oTg0LP0Z76fkqg
	JNr/65lFk3YlYb28n7f8L4bwZadB5r5iKnJMHQWio+ngdPwDawetceUmGAmkNzCHUsxF
	RIchH8yph32Bv+0JckJlkGM5U+ufFkAdVfRuWZZrCIzooJOydaz3rMwoDv+rNWX/V3jA
	/tnoFhdoYg6FOiyLWbWVusdS9GHtYoJhOCNBXWsTMmOWudGOlr0UgY0Zupq8g8HtYN3r
	JboiA5irLXePWzqoyciV2jdDyRPYuP9CqLAusP3ypJM5xlxxsvkF4ZA3kio5GbmIp/h3
	Qgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KR9uW+m3b45OoGhZMQRU5QoMgYw70KVymfxrJB6D0SM=;
	b=VJxyWxGiJ7M1TFWUWL7HiY3KRXbuzTEhKma8LjtTKNAT9FWzfaKjy7M5RecWCOtScJ
	0klepDU9ILgCemy1IG6WOmCrDpgLc1jSIdB6Yo5kFm6erYsEDlr2bCV49u2XZrAPiaCz
	nz24IR2e8uFg2+wjyQ+uGwVgjKWEcDfl6uPapAW4lbOnw5APbvIZa3XehXvK3y1m1X62
	hdoVbUfsgBr8c1t0Q+NmgXLtLYEqJp7Nh1syqxMqMrjgXlSZj51SiN1ZEmDKjFLoAwL5
	PNiwqvbq8DwYcXqURLav+4EKT98gHy82UVOKdMJAhRqgvaBJEEQgt67XJ7J7WMBMDjCX
	Q+HQ==
X-Gm-Message-State: AHQUAubzp0w63w5ZaysAch3NjzzKFjb9DDmnZyszx9UStN6I+aGECxza
	eeHJ2Kl12rgvlq8tDCrcNB1pAP7KRX/vxMPRpN4=
X-Google-Smtp-Source: AHgI3IYW1slbsZh/1WNJrv448T2a6GZcOYCS/Y/gAUltO/mx5g4L5GFwRBWbslcGZbc4cS1H0JO6dsp/ZxirjvLWDAo=
X-Received: by 2002:a17:906:d1cc:: with SMTP id
	bs12mr17535763ejb.79.1551199256168; 
	Tue, 26 Feb 2019 08:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20190225185954.15628-1-raj.khem@gmail.com>
In-Reply-To: <20190225185954.15628-1-raj.khem@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Tue, 26 Feb 2019 08:40:44 -0800
Message-ID: <CAFNP8OuB-dL0xRv975XEhx6zgU6xmjhZeFj7P0xj1jVsjB8+4A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Tue, 26 Feb 2019 16:40:55 -0000
Content-Type: multipart/alternative; boundary="000000000000a3cd640582ceb84b"

--000000000000a3cd640582ceb84b
Content-Type: text/plain; charset="UTF-8"

Hi,

The DISTRO_FEATURES_LIBC variable appears in the YP reference manual.  Will
it be safe to remove this for the 2.7 release?

Scott

On Mon, Feb 25, 2019 at 11:00 AM Khem Raj <raj.khem@gmail.com> wrote:

> After eglibc was merged into glibc, Kconfig support was also dropped so
> these libc features therefore are not effective anymore and can be
> removed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 10 +---------
>  meta/conf/local.conf.sample.extended            | 16 ++--------------
>  2 files changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> index 76edff6480..35da7f10e1 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -11,15 +11,7 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
>  LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
>
>  DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile
> pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
> -DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros
> libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -                                       libc-crypt-ufc libc-db-aliases
> libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> -                                       libc-getlogin libc-idn
> libc-inet-anl libc-libm libc-locales libc-locale-code \
> -                                       libc-memusage libc-nsswitch
> libc-rcmd libc-rtld-debug libc-spawn libc-streams \
> -                                       libc-utmp libc-utmpx libc-wordexp
> libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> -                                       libc-posix-wchar-io"
> -DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
> +DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
>
>  IMAGE_FEATURES ?= ""
>
> diff --git a/meta/conf/local.conf.sample.extended
> b/meta/conf/local.conf.sample.extended
> index 010bf6ca6f..91e321047f 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -24,22 +24,10 @@
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j
> 4" would
>  # be appropriate for example.
>
> -
> -# glibc configurability is used to reduce minimal image's size.
> -# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
> -# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
> -# and DISTRO_FEATURES definitions to local.conf to enable the options.
> -#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd
> libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt
> libc-fmtmsg libc-fstab libc-ftraverse \
> -#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm
> libc-locales libc-locale-code \
> -#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug
> libc-spawn libc-streams \
> -#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar
> libc-posix-regexp libc-posix-regexp-glibc \
> -#               libc-posix-wchar-io"
> -
> -#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost
> wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost
> wifi nfs zeroconf pci"
>
>  # If you want to get an image based on directfb without x11, Please copy
> this variable to build/conf/local.conf
> -#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia
> usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb
> ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia
> usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
>
>  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
>  # packages at build time using qemu-native. Disabling it (by setting it
> to 0)
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a3cd640582ceb84b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>The DISTRO_FEATURES=
_LIBC variable appears in the YP reference manual.=C2=A0 Will it be safe to=
 remove this for the 2.7 release?</div><div><br></div><div>Scott<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Feb 25, 2019 at 11:00 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">After eglibc was merged into glibc, Kconfig suppo=
rt was also dropped so<br>
these libc features therefore are not effective anymore and can be<br>
removed<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/default-distrovars.inc | 10 +---------<br>
=C2=A0meta/conf/local.conf.sample.extended=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 16 ++--------------<br>
=C2=A02 files changed, 3 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/di=
stro/include/default-distrovars.inc<br>
index 76edff6480..35da7f10e1 100644<br>
--- a/meta/conf/distro/include/default-distrovars.inc<br>
+++ b/meta/conf/distro/include/default-distrovars.inc<br>
@@ -11,15 +11,7 @@ LOCALE_UTF8_IS_DEFAULT ?=3D &quot;1&quot;<br>
=C2=A0LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D &quot;0&quot;<br>
<br>
=C2=A0DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa argp bluetooth ext2 irda =
largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11&q=
uot;<br>
-DISTRO_FEATURES_LIBC_DEFAULT ?=3D &quot;ipv4 ipv6 libc-backtrace libc-big-=
macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-cryp=
t-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftrav=
erse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-getl=
ogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-memu=
sage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-utmp=
 libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posi=
x-regexp-glibc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-posi=
x-wchar-io&quot;<br>
-DISTRO_FEATURES_LIBC ?=3D &quot;${DISTRO_FEATURES_LIBC_DEFAULT}&quot;<br>
-DISTRO_FEATURES_LIBC_class-nativesdk =3D &quot;${DISTRO_FEATURES_LIBC_DEFA=
ULT}&quot;<br>
-DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LI=
BC}&quot;<br>
+DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT}&quot;<br>
<br>
=C2=A0IMAGE_FEATURES ?=3D &quot;&quot;<br>
<br>
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sa=
mple.extended<br>
index 010bf6ca6f..91e321047f 100644<br>
--- a/meta/conf/local.conf.sample.extended<br>
+++ b/meta/conf/local.conf.sample.extended<br>
@@ -24,22 +24,10 @@<br>
=C2=A0# For a quad-core machine, BB_NUMBER_THREADS =3D &quot;4&quot;, PARAL=
LEL_MAKE =3D &quot;-j 4&quot; would<br>
=C2=A0# be appropriate for example.<br>
<br>
-<br>
-# glibc configurability is used to reduce minimal image&#39;s size.<br>
-# the all supported glibc options are listed in DISTRO_FEATURES_LIBC<br>
-# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC<br>
-# and DISTRO_FEATURES definitions to local.conf to enable the options.<br>
-#DISTRO_FEATURES_LIBC =3D &quot;ipv6 libc-backtrace libc-big-macros libc-b=
sd libc-cxx-tests libc-catgets libc-charsets libc-crypt \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-crypt-ufc lib=
c-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \<br=
>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-getlogin libc=
-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-memusage libc=
-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-utmp libc-utm=
px libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-=
glibc \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-posix-wchar-i=
o&quot;<br>
-<br>
-#DISTRO_FEATURES =3D &quot;alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}&quot;<br>
+#DISTRO_FEATURES =3D &quot;alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci&quot;<br>
<br>
=C2=A0# If you want to get an image based on directfb without x11, Please c=
opy this variable to build/conf/local.conf<br>
-#DISTRO_FEATURES =3D &quot;alsa argp bluetooth ext2 irda largefile pcmcia =
usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES=
_LIBC}&quot;<br>
+#DISTRO_FEATURES =3D &quot;alsa argp bluetooth ext2 irda largefile pcmcia =
usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb&quot;<br>
<br>
=C2=A0# ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary l=
ocale<br>
=C2=A0# packages at build time using qemu-native. Disabling it (by setting =
it to 0)<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a3cd640582ceb84b--
