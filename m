Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0272B6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 23:03:30 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id f23-v6so6735986plr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 16:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fcsleLA2YsBPcXUaT/KZS5u+CtlbiqiDJ7P3fntDnio=;
	b=G5p1b+h+SBVx0QAcEzkWg8CuokwOiEEK22PlEnSG8mT+Gd9UOwyfKz3ys8UcrkN4R8
	zvzDJK+2mhibcr4Hfp+HYCMcK0DXRr+84HzBExWKy5kEyzGWbmGx7LbmaeD/OB/ICGfs
	GROJdsYXkmKDGdWMUDfDnWmW4ZrXjbCJVYgNElKBhRIcfKbOxauntXMcec7NMhbz53hd
	W6XR+zvSSTCR2t0lmiWg36IjD3X03G1d1WlL/Pb8w5u9R0L8SXwwug/l1kbusvb6vqID
	+8mUP2k2gn7bF6U3phmrLZrBtdivbqo8tasidKIgsOlfWS8Cr/0D0pnqswdnPYpyuxs9
	x7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fcsleLA2YsBPcXUaT/KZS5u+CtlbiqiDJ7P3fntDnio=;
	b=KsegoxSAVwWKvV1c4BxkcAtcN7yeW1LkzOv+T/H0IyuGLaAmXKyvldyV3P3GgXzXN1
	r13KpbW9TAzpo3CRdwX7tmow6CHayyicasLS5ABx9VTLXVLlHBea7MP+dMKV6DZi8XrE
	fIY8ZR5tbt85xo4ZVH5jTxTCumxipfFhi/JRdbOZi5AI06bxrBjI2l3VDp+pd6+ytsjq
	eDn8I2jje0Mj7WK/aKZR89h4BxJ+ODHbrpuNftFjq+NfUj0wmVTli39WIS3Yn0wctdDW
	B4qb8+A4cFj0y0zx3kbibBSz5cQ/CEqCxKSMmWVMUVqa0OrKFqpExu3zyRWCd2tPqrjR
	CnmQ==
X-Gm-Message-State: AElRT7GwNftWhh2pMp9VomeWtOTJ+kprFA9c4TOdDovQ9k/aKvUxvlBn
	Yns0IMSTSHbTYrwWvneA8MeTCDQScs9NIZyr0YU=
X-Google-Smtp-Source: AG47ELudJrUqkwiTAQ6VDhqoS2W/oV7LNw437qkWTeEUwn/tg4rHRR5RyKqfaU5cDLAH2FvbIU+1IFf5w3bbBOvv+3w=
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr3842852plo.162.1521241412050; 
	Fri, 16 Mar 2018 16:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180316092126.1D843440088@auh.yoctoproject.org>
In-Reply-To: <20180316092126.1D843440088@auh.yoctoproject.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Mar 2018 23:03:21 +0000
Message-ID: <CAMKF1soSg4otE53o6TNE74RjQNxxFSnh3SbxLLWF9jOOdfi_2Q@mail.gmail.com>
To: auh@auh.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] Upgrade status: 2018-03-16
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
X-List-Received-Date: Fri, 16 Mar 2018 23:03:31 -0000
Content-Type: multipart/alternative; boundary="000000000000fba41f05678f9dae"

--000000000000fba41f05678f9dae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Glibc 2.27.9 seems not right here glibc should only track major.minor for
release number

On Fri, Mar 16, 2018 at 10:21 AM <auh@auh.yoctoproject.org> wrote:

> Recipe upgrade statistics:
>
>     * Failed (devtool error): 22
>         busybox, 1.28.1, Armin Kuster <akuster808@gmail.com>
>         dropbear, 2018.76, Yi Zhao <yi.zhao@windriver.com>
>         linux-yocto, 4.15.7, Bruce Ashfield <bruce.ashfield@windriver.com=
>
>         libical, 3.0.3, Maxin B. John <maxin.john@intel.com>
>         libxml2, 2.9.8, Hongxu Jia <hongxu.jia@windriver.com>
>         weston, 3.0.91, Denys Dmytriyenko <denys@ti.com>
>         gobject-introspection, 1.56.0, Alexander Kanavin <
> alexander.kanavin@intel.com>
>         acpica, 20180313, Fathi Boudra <fathi.boudra@linaro.org>
>         iproute2, 4.15.0, Changhyeok Bae <changhyeok.bae@lge.com>
>         automake, 1.16.1, Robert Yang <liezhi.yang@windriver.com>
>         fontconfig, 2.13.0, Maxin B. John <maxin.john@intel.com>
>         ncurses, 6.1, Hongxu Jia <hongxu.jia@windriver.com>
>         libgpg-error, 1.28, Hongxu Jia <hongxu.jia@windriver.com>
>         gnu-efi, 3.0.8, Yi Zhao <yi.zhao@windriver.com>
>         nspr, 4.19, Armin Kuster <akuster@mvista.com>
>         mpfr, 4.0.1, Khem Raj <raj.khem@gmail.com>
>         bash, 4.4.18, Hongxu Jia <hongxu.jia@windriver.com>
>         meson, 0.45.0, Alexander Kanavin <alexander.kanavin@intel.com>
>         e2fsprogs, 1.44.0, Robert Yang <liezhi.yang@windriver.com>
>         python3, 3.6.4, Derek Straka <derek@asterius.io>
>         ifupdown, 0.8.31, Maxin B. John <maxin.john@intel.com>
>         libcap-ng, 0.7.9, Yi Zhao <yi.zhao@windriver.com>
>     * Succeeded: 33
>         util-macros, 1.19.2, Armin Kuster <akuster@mvista.com>
>         xkbcomp, 1.4.1, Armin Kuster <akuster@mvista.com>
>         slang, 2.3.2, Yi Zhao <yi.zhao@windriver.com>
>         linux-firmware, 0.0-new-commits-available, Otavio Salvador <
> otavio.salvador@ossystems.com.br>
>         dtc, 1.4.6, Alexander Kanavin <alexander.kanavin@intel.com>
>         man-db, 2.8.2, Hongxu Jia <hongxu.jia@windriver.com>
>         atk, 2.28.1, Maxin B. John <maxin.john@intel.com>
>         mkfontscale, 1.1.3, Armin Kuster <akuster@mvista.com>
>         less, 530, Yi Zhao <yi.zhao@windriver.com>
>         python-numpy, 1.14.2, Derek Straka <derek@asterius.io>
>         autoconf-archive, 2018.03.13, Robert Yang <
> liezhi.yang@windriver.com>
>         curl, 7.59.0, Armin Kuster <akuster@mvista.com>
>         nss, 3.35, Armin Kuster <akuster@mvista.com>
>         kmscube, git-new-commits-available, Carlos Rafael Giani <
> dv@pseudoterminal.org>
>         ccache, 3.4.1, Robert Yang <liezhi.yang@windriver.com>
>         wayland, 1.14.91, Denys Dmytriyenko <denys@ti.com>
>         dbus-glib, 0.110, Chen Qi <Qi.Chen@windriver.com>
>         xcb-proto, 1.13, Armin Kuster <akuster@mvista.com>
>         lzip, 1.20, Denys Dmytriyenko <denys@ti.com>
>         gnutls, 3.6.2, Armin Kuster <akuster@mvista.com>
>         xkeyboard-config, 2.23.1, Armin Kuster <akuster@mvista.com>
>         python3-numpy, 1.14.2, Derek Straka <derek@asterius.io>
>         man-pages, 4.15, Hongxu Jia <hongxu.jia@windriver.com>
>         libxshmfence, 1.3, Armin Kuster <akuster@mvista.com>
>         logrotate, 3.14.0, Yi Zhao <yi.zhao@windriver.com>
>         time, 1.9, Robert Yang <liezhi.yang@windriver.com>
>         gnupg, 2.2.5, Hongxu Jia <hongxu.jia@windriver.com>
>         sysstat, 11.7.2, Chen Qi <Qi.Chen@windriver.com>
>         libxml-sax-perl, 1.00, Tim Orling <
> timothy.t.orling@linux.intel.com>
>         libevdev, 1.5.9, Maxin B. John <maxin.john@intel.com>
>         ethtool, 4.15, Changhyeok Bae <changhyeok.bae@lge.com>
>         gawk, 4.2.1, Chen Qi <Qi.Chen@windriver.com>
>         libpcre2, 10.31, Armin Kuster <akuster@mvista.com>
>     * Failed(do_compile): 10
>         dpkg, 1.19.0.5, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>         libtirpc, 1.0.3, Maxin B. John <maxin.john@intel.com>
>         git, 2.16.2, Robert Yang <liezhi.yang@windriver.com>
>         harfbuzz, 1.7.6, Maxin B. John <maxin.john@intel.com>
>         glibc, 2.27.9000, Khem Raj <raj.khem@gmail.com>
>         calibrateproto, 0.0-new-commits-available, Armin Kuster <
> akuster@mvista.com>
>         sysprof, 3.28.0, Alexander Kanavin <alexander.kanavin@intel.com>
>         linux-libc-headers, 4.15.10, Bruce Ashfield <
> bruce.ashfield@windriver.com>
>         xserver-xorg, 1.19.99.901, Armin Kuster <akuster@mvista.com>
>         u-boot-mkimage, 2018.03, Marek Vasut <marek.vasut@gmail.com>
>     * Failed(other errors): 41
>         lighttpd, 1.4.49, Alexander Kanavin <alexander.kanavin@intel.com>
>         xeyes, 1.1.2, Armin Kuster <akuster@mvista.com>
>         xset, 1.2.4, Armin Kuster <akuster@mvista.com>
>         at-spi2-atk, 2.26.2, Maxin B. John <maxin.john@intel.com>
>         libinput, 1.10.3, Maxin B. John <maxin.john@intel.com>
>         vulkan, 1.1.70.0, Maxin B. John <maxin.john@intel.com>
>         glibc-initial, 2.27.9000, Khem Raj <raj.khem@gmail.com>
>         bind, 9.12.1, Armin Kuster <akuster@mvista.com>
>         glib-2.0, 2.56.0, Maxin B. John <maxin.john@intel.com>
>         python3-pygobject, 3.28.0, Derek Straka <derek@asterius.io>
>         at-spi2-core, 2.28.0, Maxin B. John <maxin.john@intel.com>
>         vte, 0.52.0, Maxin B. John <maxin.john@intel.com>
>         gnome-desktop3, 3.28.0, Alexander Kanavin <
> alexander.kanavin@intel.com>
>         libxcb, 1.13, Armin Kuster <akuster@mvista.com>
>         hdparm, 9.54, Denys Dmytriyenko <denys@ti.com>
>         glib-networking, 2.56.0, Maxin B. John <maxin.john@intel.com>
>         dbus, 1.12.6, Chen Qi <Qi.Chen@windriver.com>
>         epiphany, 3.28.0.1, Alexander Kanavin <alexander.kanavin@intel.co=
m
> >
>         tcf-agent, 1.7.0, Randy Witt <randy.e.witt@linux.intel.com>
>         systemd-boot, 238, Chen Qi <Qi.Chen@windriver.com>
>         strace, 4.21, Robert Yang <liezhi.yang@windriver.com>
>         adwaita-icon-theme, 3.28.0, Maxin B. John <maxin.john@intel.com>
>         gcr, 3.28.0, Alexander Kanavin <alexander.kanavin@intel.com>
>         ofono, 1.23, Maxin B. John <maxin.john@intel.com>
>         xf86-video-vesa, 2.4.0, Armin Kuster <akuster@mvista.com>
>         pango, 1.42.0, Maxin B. John <maxin.john@intel.com>
>         dhcp, 4.4.1, Hongxu Jia <hongxu.jia@windriver.com>
>         xprop, 1.2.3, Armin Kuster <akuster@mvista.com>
>         xinit, 1.4.0, Armin Kuster <akuster@mvista.com>
>         build-appliance-image, 18.0.2, Cristian Iorga <
> cristian.iorga@intel.com>
>         clutter-gst-3.0, 3.0.26, Maxin B. John <maxin.john@intel.com>
>         gdb, 8.1, Khem Raj <raj.khem@gmail.com>
>         python3-pycairo, 1.16.3, Derek Straka <derek@asterius.io>
>         gsettings-desktop-schemas, 3.28.0, Maxin B. John <
> maxin.john@intel.com>
>         vala, 0.40.0, Alexander Kanavin <alexander.kanavin@intel.com>
>         dbus-test, 1.12.6, Chen Qi <Qi.Chen@windriver.com>
>         libsoup-2.4, 2.62.0, Maxin B. John <maxin.john@intel.com>
>         xwininfo, 1.1.4, Armin Kuster <akuster@mvista.com>
>         gtk+3, 3.22.29, Maxin B. John <maxin.john@intel.com>
>         bluez5, 5.49, Maxin B. John <maxin.john@intel.com>
>         webkitgtk, 2.20.0, Alexander Kanavin <alexander.kanavin@intel.com=
>
>
>     TOTAL: attempted=3D106 succeeded=3D33(31.13%) failed=3D73(68.87%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Fathi Boudra <fathi.boudra: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Armin Kuster <akuster808: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Tim Orling <timothy.t.orling: attempted=3D1 succeeded=3D1(100.00%)
> failed=3D0(0.00%)
>     Alexander Kanavin <alexander.kanavin: attempted=3D10 succeeded=3D1(10=
.00%)
> failed=3D9(90.00%)
>     Hongxu Jia <hongxu.jia: attempted=3D8 succeeded=3D3(37.50%)
> failed=3D5(62.50%)
>     An=C3=ADbal Lim=C3=B3n <limon.anibal: attempted=3D1 succeeded=3D0(0.0=
0%)
> failed=3D1(100.00%)
>     Khem Raj <raj.khem: attempted=3D4 succeeded=3D0(0.00%) failed=3D4(100=
.00%)
>     Otavio Salvador <otavio.salvador: attempted=3D1 succeeded=3D1(100.00%=
)
> failed=3D0(0.00%)
>     Chen Qi <Qi.Chen: attempted=3D6 succeeded=3D3(50.00%) failed=3D3(50.0=
0%)
>     Yi Zhao <yi.zhao: attempted=3D6 succeeded=3D3(50.00%) failed=3D3(50.0=
0%)
>     Cristian Iorga <cristian.iorga: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Derek Straka <derek: attempted=3D5 succeeded=3D2(40.00%) failed=3D3(6=
0.00%)
>     Bruce Ashfield <bruce.ashfield: attempted=3D2 succeeded=3D0(0.00%)
> failed=3D2(100.00%)
>     Changhyeok Bae <changhyeok.bae: attempted=3D2 succeeded=3D1(50.00%)
> failed=3D1(50.00%)
>     Randy Witt <randy.e.witt: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
>     Maxin B. John <maxin.john: attempted=3D22 succeeded=3D2(9.09%)
> failed=3D20(90.91%)
>     Robert Yang <liezhi.yang: attempted=3D7 succeeded=3D3(42.86%)
> failed=3D4(57.14%)
>     Carlos Rafael Giani <dv: attempted=3D1 succeeded=3D1(100.00%)
> failed=3D0(0.00%)
>     Denys Dmytriyenko <denys: attempted=3D4 succeeded=3D2(50.00%)
> failed=3D2(50.00%)
>     Armin Kuster <akuster: attempted=3D21 succeeded=3D10(47.62%)
> failed=3D11(52.38%)
>     Marek Vasut <marek.vasut: attempted=3D1 succeeded=3D0(0.00%)
> failed=3D1(100.00%)
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fba41f05678f9dae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Glibc 2.27.9 seems not right here glibc should only =
track major.minor for release number=C2=A0</div><br><div class=3D"gmail_quo=
te"><div>On Fri, Mar 16, 2018 at 10:21 AM &lt;<a href=3D"mailto:auh@auh.yoc=
toproject.org">auh@auh.yoctoproject.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Recipe upgrade statistics:<br>
<br>
=C2=A0 =C2=A0 * Failed (devtool error): 22<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 busybox, 1.28.1, Armin Kuster &lt;<a href=3D"ma=
ilto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dropbear, 2018.76, Yi Zhao &lt;<a href=3D"mailt=
o:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-yocto, 4.15.7, Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@w=
indriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libical, 3.0.3, Maxin B. John &lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml2, 2.9.8, Hongxu Jia &lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 weston, 3.0.91, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gobject-introspection, 1.56.0, Alexander Kanavi=
n &lt;<a href=3D"mailto:alexander.kanavin@intel.com" target=3D"_blank">alex=
ander.kanavin@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 acpica, 20180313, Fathi Boudra &lt;<a href=3D"m=
ailto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a=
>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 iproute2, 4.15.0, Changhyeok Bae &lt;<a href=3D=
"mailto:changhyeok.bae@lge.com" target=3D"_blank">changhyeok.bae@lge.com</a=
>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 automake, 1.16.1, Robert Yang &lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com=
</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fontconfig, 2.13.0, Maxin B. John &lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ncurses, 6.1, Hongxu Jia &lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgpg-error, 1.28, Hongxu Jia &lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnu-efi, 3.0.8, Yi Zhao &lt;<a href=3D"mailto:y=
i.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nspr, 4.19, Armin Kuster &lt;<a href=3D"mailto:=
akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mpfr, 4.0.1, Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash, 4.4.18, Hongxu Jia &lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson, 0.45.0, Alexander Kanavin &lt;<a href=3D=
"mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavin@in=
tel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 e2fsprogs, 1.44.0, Robert Yang &lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3, 3.6.4, Derek Straka &lt;<a href=3D"mai=
lto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifupdown, 0.8.31, Maxin B. John &lt;<a href=3D"=
mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap-ng, 0.7.9, Yi Zhao &lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 * Succeeded: 33<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 util-macros, 1.19.2, Armin Kuster &lt;<a href=
=3D"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xkbcomp, 1.4.1, Armin Kuster &lt;<a href=3D"mai=
lto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 slang, 2.3.2, Yi Zhao &lt;<a href=3D"mailto:yi.=
zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-firmware, 0.0-new-commits-available, Otav=
io Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=
=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtc, 1.4.6, Alexander Kanavin &lt;<a href=3D"ma=
ilto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavin@intel=
.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 man-db, 2.8.2, Hongxu Jia &lt;<a href=3D"mailto=
:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 atk, 2.28.1, Maxin B. John &lt;<a href=3D"mailt=
o:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfontscale, 1.1.3, Armin Kuster &lt;<a href=3D=
"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 less, 530, Yi Zhao &lt;<a href=3D"mailto:yi.zha=
o@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-numpy, 1.14.2, Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoconf-archive, 2018.03.13, Robert Yang &lt;<=
a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@w=
indriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 curl, 7.59.0, Armin Kuster &lt;<a href=3D"mailt=
o:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nss, 3.35, Armin Kuster &lt;<a href=3D"mailto:a=
kuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kmscube, git-new-commits-available, Carlos Rafa=
el Giani &lt;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@=
pseudoterminal.org</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ccache, 3.4.1, Robert Yang &lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland, 1.14.91, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-glib, 0.110, Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xcb-proto, 1.13, Armin Kuster &lt;<a href=3D"ma=
ilto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lzip, 1.20, Denys Dmytriyenko &lt;<a href=3D"ma=
ilto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls, 3.6.2, Armin Kuster &lt;<a href=3D"mail=
to:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xkeyboard-config, 2.23.1, Armin Kuster &lt;<a h=
ref=3D"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-numpy, 1.14.2, Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 man-pages, 4.15, Hongxu Jia &lt;<a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxshmfence, 1.3, Armin Kuster &lt;<a href=3D"=
mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 logrotate, 3.14.0, Yi Zhao &lt;<a href=3D"mailt=
o:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 time, 1.9, Robert Yang &lt;<a href=3D"mailto:li=
ezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnupg, 2.2.5, Hongxu Jia &lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysstat, 11.7.2, Chen Qi &lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-sax-perl, 1.00, Tim Orling &lt;<a href=
=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">timothy.t.or=
ling@linux.intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libevdev, 1.5.9, Maxin B. John &lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ethtool, 4.15, Changhyeok Bae &lt;<a href=3D"ma=
ilto:changhyeok.bae@lge.com" target=3D"_blank">changhyeok.bae@lge.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gawk, 4.2.1, Chen Qi &lt;<a href=3D"mailto:Qi.C=
hen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libpcre2, 10.31, Armin Kuster &lt;<a href=3D"ma=
ilto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 * Failed(do_compile): 10<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpkg, 1.19.0.5, An=C3=ADbal Lim=C3=B3n &lt;<a h=
ref=3D"mailto:limon.anibal@gmail.com" target=3D"_blank">limon.anibal@gmail.=
com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libtirpc, 1.0.3, Maxin B. John &lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git, 2.16.2, Robert Yang &lt;<a href=3D"mailto:=
liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 harfbuzz, 1.7.6, Maxin B. John &lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 glibc, 2.27.9000, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 calibrateproto, 0.0-new-commits-available, Armi=
n Kuster &lt;<a href=3D"mailto:akuster@mvista.com" target=3D"_blank">akuste=
r@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysprof, 3.28.0, Alexander Kanavin &lt;<a href=
=3D"mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavin=
@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-libc-headers, 4.15.10, Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.as=
hfield@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg, 1.19.99.901, Armin Kuster &lt;<a =
href=3D"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u-boot-mkimage, 2018.03, Marek Vasut &lt;<a hre=
f=3D"mailto:marek.vasut@gmail.com" target=3D"_blank">marek.vasut@gmail.com<=
/a>&gt;<br>
=C2=A0 =C2=A0 * Failed(other errors): 41<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lighttpd, 1.4.49, Alexander Kanavin &lt;<a href=
=3D"mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavin=
@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xeyes, 1.1.2, Armin Kuster &lt;<a href=3D"mailt=
o:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xset, 1.2.4, Armin Kuster &lt;<a href=3D"mailto=
:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 at-spi2-atk, 2.26.2, Maxin B. John &lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libinput, 1.10.3, Maxin B. John &lt;<a href=3D"=
mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan, 1.1.70.0, Maxin B. John &lt;<a href=3D"=
mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 glibc-initial, 2.27.9000, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bind, 9.12.1, Armin Kuster &lt;<a href=3D"mailt=
o:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-2.0, 2.56.0, Maxin B. John &lt;<a href=3D"=
mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pygobject, 3.28.0, Derek Straka &lt;<a =
href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 at-spi2-core, 2.28.0, Maxin B. John &lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vte, 0.52.0, Maxin B. John &lt;<a href=3D"mailt=
o:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnome-desktop3, 3.28.0, Alexander Kanavin &lt;<=
a href=3D"mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.k=
anavin@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxcb, 1.13, Armin Kuster &lt;<a href=3D"mailt=
o:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hdparm, 9.54, Denys Dmytriyenko &lt;<a href=3D"=
mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 glib-networking, 2.56.0, Maxin B. John &lt;<a h=
ref=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com<=
/a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus, 1.12.6, Chen Qi &lt;<a href=3D"mailto:Qi.=
Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 epiphany, 3.28.0.1, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanav=
in@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcf-agent, 1.7.0, Randy Witt &lt;<a href=3D"mai=
lto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.inte=
l.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd-boot, 238, Chen Qi &lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 strace, 4.21, Robert Yang &lt;<a href=3D"mailto=
:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adwaita-icon-theme, 3.28.0, Maxin B. John &lt;<=
a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.c=
om</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gcr, 3.28.0, Alexander Kanavin &lt;<a href=3D"m=
ailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavin@inte=
l.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ofono, 1.23, Maxin B. John &lt;<a href=3D"mailt=
o:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-vesa, 2.4.0, Armin Kuster &lt;<a hre=
f=3D"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pango, 1.42.0, Maxin B. John &lt;<a href=3D"mai=
lto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dhcp, 4.4.1, Hongxu Jia &lt;<a href=3D"mailto:h=
ongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xprop, 1.2.3, Armin Kuster &lt;<a href=3D"mailt=
o:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xinit, 1.4.0, Armin Kuster &lt;<a href=3D"mailt=
o:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 build-appliance-image, 18.0.2, Cristian Iorga &=
lt;<a href=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cristian.i=
orga@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clutter-gst-3.0, 3.0.26, Maxin B. John &lt;<a h=
ref=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com<=
/a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdb, 8.1, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pycairo, 1.16.3, Derek Straka &lt;<a hr=
ef=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gsettings-desktop-schemas, 3.28.0, Maxin B. Joh=
n &lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@=
intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vala, 0.40.0, Alexander Kanavin &lt;<a href=3D"=
mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavin@int=
el.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-test, 1.12.6, Chen Qi &lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libsoup-2.4, 2.62.0, Maxin B. John &lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xwininfo, 1.1.4, Armin Kuster &lt;<a href=3D"ma=
ilto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk+3, 3.22.29, Maxin B. John &lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bluez5, 5.49, Maxin B. John &lt;<a href=3D"mail=
to:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 webkitgtk, 2.20.0, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alexander.kanavin@intel.com" target=3D"_blank">alexander.kanavi=
n@intel.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 TOTAL: attempted=3D106 succeeded=3D33(31.13%) failed=3D73(68.=
87%)<br>
<br>
Recipe upgrade statistics per Maintainer:<br>
<br>
=C2=A0 =C2=A0 Fathi Boudra &lt;fathi.boudra: attempted=3D1 succeeded=3D0(0.=
00%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Armin Kuster &lt;akuster808: attempted=3D1 succeeded=3D0(0.00=
%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Tim Orling &lt;timothy.t.orling: attempted=3D1 succeeded=3D1(=
100.00%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Alexander Kanavin &lt;alexander.kanavin: attempted=3D10 succe=
eded=3D1(10.00%) failed=3D9(90.00%)<br>
=C2=A0 =C2=A0 Hongxu Jia &lt;hongxu.jia: attempted=3D8 succeeded=3D3(37.50%=
) failed=3D5(62.50%)<br>
=C2=A0 =C2=A0 An=C3=ADbal Lim=C3=B3n &lt;limon.anibal: attempted=3D1 succee=
ded=3D0(0.00%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Khem Raj &lt;raj.khem: attempted=3D4 succeeded=3D0(0.00%) fai=
led=3D4(100.00%)<br>
=C2=A0 =C2=A0 Otavio Salvador &lt;otavio.salvador: attempted=3D1 succeeded=
=3D1(100.00%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Chen Qi &lt;Qi.Chen: attempted=3D6 succeeded=3D3(50.00%) fail=
ed=3D3(50.00%)<br>
=C2=A0 =C2=A0 Yi Zhao &lt;yi.zhao: attempted=3D6 succeeded=3D3(50.00%) fail=
ed=3D3(50.00%)<br>
=C2=A0 =C2=A0 Cristian Iorga &lt;cristian.iorga: attempted=3D1 succeeded=3D=
0(0.00%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Derek Straka &lt;derek: attempted=3D5 succeeded=3D2(40.00%) f=
ailed=3D3(60.00%)<br>
=C2=A0 =C2=A0 Bruce Ashfield &lt;bruce.ashfield: attempted=3D2 succeeded=3D=
0(0.00%) failed=3D2(100.00%)<br>
=C2=A0 =C2=A0 Changhyeok Bae &lt;changhyeok.bae: attempted=3D2 succeeded=3D=
1(50.00%) failed=3D1(50.00%)<br>
=C2=A0 =C2=A0 Randy Witt &lt;randy.e.witt: attempted=3D1 succeeded=3D0(0.00=
%) failed=3D1(100.00%)<br>
=C2=A0 =C2=A0 Maxin B. John &lt;maxin.john: attempted=3D22 succeeded=3D2(9.=
09%) failed=3D20(90.91%)<br>
=C2=A0 =C2=A0 Robert Yang &lt;liezhi.yang: attempted=3D7 succeeded=3D3(42.8=
6%) failed=3D4(57.14%)<br>
=C2=A0 =C2=A0 Carlos Rafael Giani &lt;dv: attempted=3D1 succeeded=3D1(100.0=
0%) failed=3D0(0.00%)<br>
=C2=A0 =C2=A0 Denys Dmytriyenko &lt;denys: attempted=3D4 succeeded=3D2(50.0=
0%) failed=3D2(50.00%)<br>
=C2=A0 =C2=A0 Armin Kuster &lt;akuster: attempted=3D21 succeeded=3D10(47.62=
%) failed=3D11(52.38%)<br>
=C2=A0 =C2=A0 Marek Vasut &lt;marek.vasut: attempted=3D1 succeeded=3D0(0.00=
%) failed=3D1(100.00%)<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000fba41f05678f9dae--
