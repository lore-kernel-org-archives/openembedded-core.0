Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web09.5323.1607034935532802549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 14:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pNUNn9Mk;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id p5so3453587iln.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 14:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3sBmsQzdmeXLolk5yBBenby8EizEbMz5CSBgl82rqgY=;
        b=pNUNn9Mk+q5HpEfZvnh3LGzbJ0RM9VdGGtfarMJ2tpvwkL5IAtcxCFkegU+1OuYdFv
         /5auuJpQBV064oT2WMS1NjNDygZ1XKeeIdWUlnPMcUIcxpXTVlDpdu3CXQHo1M7pZF1Y
         CtLxhCv7+d7AN4QrHapbIcvmFXe4Mp0jNz3Rd1ZVCmr4uj5KjJCbM7lNstT/PGLQ5azr
         uGyaX0JlkphfJ5NPh3D6S2q//z0GK3yk7yk51gSDNvGzMlIuEQwjQo0h8TcTYzjSEwgg
         IOeyLs6eIrFh/v6/xBvVSYLqjqfieLS0WHE6NG/x8qBvwQMAg3NnCaqEcQl4ITiTArZ6
         NViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sBmsQzdmeXLolk5yBBenby8EizEbMz5CSBgl82rqgY=;
        b=EIXC4OQxVaz+yHSuSYBRPItqfLkMnobkYUBrliCFXb4dI4MjT+fsd2DzJDywIjeetQ
         mWVzDBjDmRhCwXFxU4K6vfgzpuGRNUVAFo3iWl5xZms1zgn2enn/cyjuYmZzbSH7Caiw
         947wfKLMzxa2Ui26V3n9yWS7Z5/fkCoIhUPOgxQ/+bf6fvJVM3a/IEFNHE8U5sDgazR2
         MI+Ew7qxjco4ECGUChyWTw+8vgOUjHnGrb/05QLvAuu/Xug2CmiuQHXvwhj3FjkaP4PW
         VCr+M3QKB8bKlkiKl+wr8KTb4OdQy9fiqmYUI6XOHRPHX+nETn/jrG/9hsv3ynsHGsaK
         TRtw==
X-Gm-Message-State: AOAM530ipgRV5TjIcNgZH5WzZJ8fM5LyPk5bHJ/dKvnp2QR/FiuEmL1f
	LAngErJA5rk1oGnnOBFhP4cqVxFLt8w7ZqN+c+I9UbjJavz/DA==
X-Google-Smtp-Source: ABdhPJyWNvLCPtXiwoZjXdy9ylhZOdBn56a4Zz8EXIQPUM3zP99PBl5UiX5wkHzqQhRMIdqNZpUqW79j71b9Z0fZoQU=
X-Received: by 2002:a05:6e02:160b:: with SMTP id t11mr1862876ilu.275.1607034934896;
 Thu, 03 Dec 2020 14:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20201203133526.2075-1-twoerner@gmail.com> <036904F4-E7CE-4A5D-B940-DF360F2AAED9@pbcl.net>
In-Reply-To: <036904F4-E7CE-4A5D-B940-DF360F2AAED9@pbcl.net>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Thu, 3 Dec 2020 17:35:23 -0500
Message-ID: <CAHUNapRs_1Dz6ARBfgLk7i3DXx0HHbRgC5u7U=3njQb3ht4cbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa.inc: add dispmanx support
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006faf6405b596fa23"

--0000000000006faf6405b596fa23
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:25 PM Phil Blundell <pb@pbcl.net> wrote:

> If we're talking about OpenGLES applications, wouldn't you already have
> opengl in DISTRO_FEATURES?
>

Not necessarily.

Adding opengl to DISTRO_FEATURES really means "enable a bunch of
PACKAGECONFIGs all over the place because I need x11 and mesa with all the
bells and whistles". These things are not necessary to build and run apps
based on dispmanx. With this patch and my patch to meta-openembedded I'm
able to build "core-image-minimal" with no x11/wayland, no window managers,
with "userland" and with "glmark2". Here is my package list:

  1 base-files_3.0.14-r89_raspberrypi3.ipk
  2 base-passwd_3.5.29-r0_cortexa7t2hf-neon-vfpv4.ipk
  3 bash_5.0-r0_cortexa7t2hf-neon-vfpv4.ipk
  4 busybox_1.32.0-r0_cortexa7t2hf-neon-vfpv4.ipk
  5 busybox-syslog_1.32.0-r0_cortexa7t2hf-neon-vfpv4.ipk
  6 busybox-udhcpc_1.32.0-r0_cortexa7t2hf-neon-vfpv4.ipk
  7 eudev_3.2.9-r0_cortexa7t2hf-neon-vfpv4.ipk
  8 glmark2_2020.11+0+784aca755a-r0_cortexa7t2hf-neon-vfpv4.ipk
  9 init-ifupdown_1.0-r7_raspberrypi3.ipk
 10 initscripts-functions_1.0-r155_cortexa7t2hf-neon-vfpv4.ipk
 11 initscripts_1.0-r155_cortexa7t2hf-neon-vfpv4.ipk
 12 init-system-helpers-service_1.58-r0_cortexa7t2hf-neon-vfpv4.ipk
 13 kbd_2.3.0-r0_cortexa7t2hf-neon-vfpv4.ipk
 14 kernel-5.4.79-v7_1:5.4.79+git0+5d52d9eea9_9797f1a493-r0_raspberrypi3.ipk
 15
kernel-module-i2c-bcm2708-5.4.79-v7_1:5.4.79+git0+5d52d9eea9_9797f1a493-r0_raspberrypi3.ipk
 16
kernel-module-i2c-dev-5.4.79-v7_1:5.4.79+git0+5d52d9eea9_9797f1a493-r0_raspberrypi3.ipk
 17 keymaps_1.0-r31_raspberrypi3.ipk
 18 ldconfig_2.32-r0_cortexa7t2hf-neon-vfpv4.ipk
 19 libblkid1_2.36-r0_cortexa7t2hf-neon-vfpv4.ipk
 20 libc6_2.32-r0_cortexa7t2hf-neon-vfpv4.ipk
 21 libgcc1_10.2.0-r0_cortexa7t2hf-neon-vfpv4.ipk
 22 libjpeg62_1:2.0.6-r0_cortexa7t2hf-neon-vfpv4.ipk
 23 libkmod2_27-r0_cortexa7t2hf-neon-vfpv4.ipk
 24 libpng16-16_1.6.37-r0_cortexa7t2hf-neon-vfpv4.ipk
 25 libstdc++6_10.2.0-r0_cortexa7t2hf-neon-vfpv4.ipk
 26 libtinfo5_6.2-r0_cortexa7t2hf-neon-vfpv4.ipk
 27 libz1_1.2.11-r0_cortexa7t2hf-neon-vfpv4.ipk
 28 modutils-initscripts_1.0-r7_cortexa7t2hf-neon-vfpv4.ipk
 29 ncurses-terminfo-base_6.2-r0_cortexa7t2hf-neon-vfpv4.ipk
 30 netbase_1:6.1-r0_cortexa7t2hf-neon-vfpv4.ipk
 31 packagegroup-core-boot_1.0-r17_raspberrypi3.ipk
 32 run-postinsts_1.0-r10_all.ipk
 33 sysvinit-inittab_2.88dsf-r10_raspberrypi3.ipk
 34 sysvinit-pidof_2.97-r0_cortexa7t2hf-neon-vfpv4.ipk
 35 sysvinit_2.97-r0_cortexa7t2hf-neon-vfpv4.ipk
 36 update-alternatives-opkg_0.4.3-r0_cortexa7t2hf-neon-vfpv4.ipk
 37 update-rc.d_0.8-r0_all.ipk
 38 userland_20201027-r0_cortexa7t2hf-neon-vfpv4.ipk

In my case my DISTRO_FEATURES include "x11" and this new "dispmanx".
"userland" also includes a bunch of dispmanx test programs such as
hello_tiger.bin that work as well.





> I'm not sure it makes a lot of sense to introduce a check for dispmanx to
> oe-core if nothing in oe-core ever defines that feature.
>

As I mentioned to Khem, I added this patch in order to support the changes
I made to the recipe for glmark2 in meta-openembedded. If those can be done
in a bbappend in the BSP layer then I'd be happy to re-asses, but I don't
think they can.

Maybe a better question is: does adding this DISTRO_FEATURE hurt anything
in oe-core?

--0000000000006faf6405b596fa23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 3, 2020 at 5:25 PM Phil Blund=
ell &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div>If we&#39;re talking about OpenGLES applications, wouldn&#39;t you a=
lready have opengl in DISTRO_FEATURES?<br></div></blockquote><div><br></div=
><div>Not necessarily.</div><div><br></div><div>Adding opengl to DISTRO_FEA=
TURES really means &quot;enable a bunch of PACKAGECONFIGs all over the plac=
e because I need x11 and mesa with all the bells and whistles&quot;. These =
things are not necessary to build and run apps based on dispmanx. With this=
 patch and my patch to meta-openembedded I&#39;m able to build &quot;core-i=
mage-minimal&quot; with no x11/wayland, no window managers, with &quot;user=
land&quot; and with &quot;glmark2&quot;. Here is my package list:</div><div=
><br></div><div>=C2=A0 1 base-files_3.0.14-r89_raspberrypi3.ipk<br>=C2=A0 2=
 base-passwd_3.5.29-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A0 3 bash_5.0-r0_=
cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A0 4 busybox_1.32.0-r0_cortexa7t2hf-neon=
-vfpv4.ipk<br>=C2=A0 5 busybox-syslog_1.32.0-r0_cortexa7t2hf-neon-vfpv4.ipk=
<br>=C2=A0 6 busybox-udhcpc_1.32.0-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A0=
 7 eudev_3.2.9-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A0 8 glmark2_2020.11+0=
+784aca755a-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A0 9 init-ifupdown_1.0-r7=
_raspberrypi3.ipk<br>=C2=A010 initscripts-functions_1.0-r155_cortexa7t2hf-n=
eon-vfpv4.ipk<br>=C2=A011 initscripts_1.0-r155_cortexa7t2hf-neon-vfpv4.ipk<=
br>=C2=A012 init-system-helpers-service_1.58-r0_cortexa7t2hf-neon-vfpv4.ipk=
<br>=C2=A013 kbd_2.3.0-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A014 kernel-5.=
4.79-v7_1:5.4.79+git0+5d52d9eea9_9797f1a493-r0_raspberrypi3.ipk<br>=C2=A015=
 kernel-module-i2c-bcm2708-5.4.79-v7_1:5.4.79+git0+5d52d9eea9_9797f1a493-r0=
_raspberrypi3.ipk<br>=C2=A016 kernel-module-i2c-dev-5.4.79-v7_1:5.4.79+git0=
+5d52d9eea9_9797f1a493-r0_raspberrypi3.ipk<br>=C2=A017 keymaps_1.0-r31_rasp=
berrypi3.ipk<br>=C2=A018 ldconfig_2.32-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=
=C2=A019 libblkid1_2.36-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A020 libc6_2.=
32-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A021 libgcc1_10.2.0-r0_cortexa7t2h=
f-neon-vfpv4.ipk<br>=C2=A022 libjpeg62_1:2.0.6-r0_cortexa7t2hf-neon-vfpv4.i=
pk<br>=C2=A023 libkmod2_27-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A024 libpn=
g16-16_1.6.37-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A025 libstdc++6_10.2.0-=
r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A026 libtinfo5_6.2-r0_cortexa7t2hf-ne=
on-vfpv4.ipk<br>=C2=A027 libz1_1.2.11-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=
=A028 modutils-initscripts_1.0-r7_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A029 n=
curses-terminfo-base_6.2-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A030 netbase=
_1:6.1-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A031 packagegroup-core-boot_1.=
0-r17_raspberrypi3.ipk<br>=C2=A032 run-postinsts_1.0-r10_all.ipk<br>=C2=A03=
3 sysvinit-inittab_2.88dsf-r10_raspberrypi3.ipk<br>=C2=A034 sysvinit-pidof_=
2.97-r0_cortexa7t2hf-neon-vfpv4.ipk<br>=C2=A035 sysvinit_2.97-r0_cortexa7t2=
hf-neon-vfpv4.ipk<br>=C2=A036 update-alternatives-opkg_0.4.3-r0_cortexa7t2h=
f-neon-vfpv4.ipk<br>=C2=A037 update-rc.d_0.8-r0_all.ipk<br>=C2=A038 userlan=
d_20201027-r0_cortexa7t2hf-neon-vfpv4.ipk<br></div><div><br></div><div>In m=
y case my DISTRO_FEATURES include &quot;x11&quot; and this new &quot;dispma=
nx&quot;. &quot;userland&quot; also includes a bunch of dispmanx test progr=
ams such as hello_tiger.bin that work as well.</div><div><br></div><div><br=
></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>I&#39;m not sure it makes a lot of sense to introduce a =
check for dispmanx to oe-core if nothing in oe-core ever defines that featu=
re. <br></div></blockquote><div><br></div><div>As I mentioned to Khem, I ad=
ded this patch in order to support the changes I made to the recipe for glm=
ark2 in meta-openembedded. If those can be done in a bbappend in the BSP la=
yer then I&#39;d be happy to re-asses, but I don&#39;t think they can.</div=
><div><br></div><div>Maybe a better question is: does adding this DISTRO_FE=
ATURE hurt anything in oe-core?</div><div>=C2=A0</div></div></div>

--0000000000006faf6405b596fa23--
