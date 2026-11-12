Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45.1794497170677048341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 07:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=koZ3KZwz;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b32daac9d7so8509337b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 07:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794497169; cv=none;
        d=google.com; s=arc-20260327;
        b=krX+wmvNGxEB7z3BV08nc7EK9Xlxm6T4i2x6voxgv3hKyghWZQbVF7OjxwR0UdF9Jp
         NC6udPaX+6eFFQYR7SC1Z/4PpcR01J6zc+UuuaOGBV+vs6sjTHXXyLcPoyuV2H6NOyHv
         tQIsRi3zulbcwle3IA5Vwpgc/OjFmXctjGKl6sw7nRAtK+n+soTZMm8VIqUrfZJr5der
         wSeG098RAocWn7W9A9QeiWIvl+brx+t2R+gmEdKHIgJ4pj2KX6INYUWYmGwgodvMbKH2
         q0R51s+ziKxQlXc8MfcuC0DcbvijK7szgbw/Rb3UPp7iC/bfRIDNMjBzz0Z9LDmxjl9w
         IvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jjs5RBf19GTQSbJqxx6rrU3FfqPw4csygSWEHAvB2FQ=;
        fh=xRuD+w+IHMyjVq8vyd07TMh8Y3HLRLd36FRdQnhKZgo=;
        b=FQfdgTjMSztNm0DT3Ws96FxrPSC+balF2quaOIK2TnI1RH/OhgVLORf697CVJB63Cx
         rVblgW5QgA0m1sZt141hI0mwbljapib6niBCKFmHwJdtBuxPZY2BHe4l88UyzlVWTEhh
         +wQ40rNaL8RvQEAu8SE1wHdi3VL01Amw2VN8oJWGRfXbpOu9Yz5t3cYh8gvm6YQ+xYFD
         OkRY9PgOksaznekUuvHAZfBYJPCSyhCw17mlzJwT0/vK3LHYgfKIJG4P34WqTlRvnLwT
         kEqAc+wIzpf2xhJuy6ZhTZwbsfVRGQRFAPn0ROaiyz2ZD7VSDFFg23lL5GZMC6u8CCsf
         A4cQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497169; x=1795101969; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjs5RBf19GTQSbJqxx6rrU3FfqPw4csygSWEHAvB2FQ=;
        b=koZ3KZwzIc67d0+PlMqbj4zJUv7y6UOHd2gHEMBXdi+OWRN9ltAk3u785ScSeRt24E
         gUrj3WnHDuaMGK3jGJRcW01q6OI6wksxOjMbJf1GoCRByipUH9ItRkbXBONym++z01eI
         qkXtn0GrjKAp1y2CZSdFQemFpzdZ86t4VaYl35faGgLWyWUTaGmQ0kqWQBML7jtS5K6g
         lRiFIlv0W7NAi5mYWIG3ogWI86wC3MSRAk+yENd2zpSBRTi0kcy81kTEOhnp6hUjGCZz
         Pi9gNxK+xfb9syESjISKDr/WpfKgh8QBDb53SUhu0rtVn0KwUYFaNMkJzpwUdS4nmv0I
         I/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497169; x=1795101969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjs5RBf19GTQSbJqxx6rrU3FfqPw4csygSWEHAvB2FQ=;
        b=GHDJrWzAvTiBYohDhZU06nIwy8Jz2jM0yo96qMQ0AvNQyavz2yDCo52jR4WIA87n+Y
         KN+LH8NbtGi3gq9A2u9U0BPWQsa57O9QB7xIQjoNglsAsFjDeTVGNzQBZrYjadxy4p+W
         TH+itq/rlqBk0np/GK8ur2RVDcLOBlUdWF/JDAMbrGz6UUQT4OZS5xoVtdYij9vbOlz3
         e85Dsg7ayoCm6W0UXoYd+iF4VnClCYqGpvK735gesHhyGckk5GW5iYOEimgwmL9srgaX
         Fe9WdYKmCbmWVrHZ2E+Hr4zrKgtsMxyoGyqaETzGxWsAv386V5NxNldVSEkAoGICQ2ph
         4sKA==
X-Gm-Message-State: APuU4Z/5e2IpbBsOaz3mBMfkEeg4EFld5ZqngjczS5Qjvg3+VFCn4pL1
	BpKLuMeBkHT8oxausivQYTiBM2Qcs9xYXMjcWRmiNbhKT0/jJjgCAwmFnv0185in7DT3IfYxaDF
	XYX6vaXCx6DF3eIDj0vKrIGG0HiAoeP8=
X-Gm-Gg: AYBFou2P/a3qpytu2GO6vrzICdooYRBvr2qlC0Xrok6d581UrDvGFpUjaXMbp0tPG5q
	jjrrwztx0zVkuMzC+L5MJPcorH4GW5Tw2xcPxapa56b7wcX3dXNh4Di63UbDX88YObR3vLGPodg
	jCe2YSygvWMxFdLjQiVdzkEZ7P7vMH54V4v3gONVuWwJh59rg7G4dKrKOPFdO//yu5DBfjA5Wh2
	QZf/bfQwdJdp17vSZEd9AgyboyhQZOBkX6WsZ3eR+Iy9hJxUb9hwYm9ApWzoZAzgOSh7T6cjMon
	7axrl0YFRWsX55zyfRHGBdENhiZqaCeVQ1DAd6brxxDivolZeJPaX9Do0fqf3+C4xPcrs3yeB2K
	//4vJursIR2QFrY/CieNdM8L1OH5g4oHT0VFT6vZ3cwbCLy9nVcw=
X-Received: by 2002:a05:690c:4990:b0:8b3:51f0:d4b3 with SMTP id
 00721157ae682-8b3bb1dd767mr19637767b3.21.1794497169641; Thu, 12 Nov 2026
 07:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com> <20261109194759.550935-6-JPEWhacker@gmail.com>
 <DMT7E9PPDIER.2WUJHFY3VAJ6O@bootlin.com>
In-Reply-To: <DMT7E9PPDIER.2WUJHFY3VAJ6O@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 12 Nov 2026 08:25:57 -0700
X-Gm-Features: AclHuK-15pWm73kEg8Fk1GvUhsS9nax2QaI81dw3hl4Do47pSPqFRUL2wWnDR7s
Message-ID: <CAJdd5GYQmp9sba6cMO4f92j+2q16Lu0pT+TMdkqSnFC3SKaO3A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v9 5/9] classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000058d49b066015ee42"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 15:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250106

--00000000000058d49b066015ee42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent a patch to meta-virt

On Thu, Nov 12, 2026 at 4:42=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Mon Nov 9, 2026 at 8:45 PM CET, Joshua Watt via openembedded-core wrot=
e:
> > Any recipe that inherits this class will automatically generate deploy
> > SPDX data for the do_deploy task
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
>
> Hi Bruce, Joshua,
>
> I just note this is breaking meta-virt builds:
>
> ERROR: xen-tools-4.21.1+stable-r0 do_deploy: No deployed artifacts found
> in
> /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky=
-linux/xen-tools/4.21.1+stable/deploy-xen-tools
> ...
> ERROR: Logfile of failure stored in:
> /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky=
-linux/xen-tools/4.21.1+stable/temp/log.do_deploy.2548044
> NOTE: recipe xen-tools-4.21.1+stable-r0: task do_deploy: Failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4815
>
> Here is the full content of the said log file:
>
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing shell function do_deploy
> NOTE: make
> STDVGA_ROM=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x=
86-64-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/firmwa=
re/vgabios-0.8a.bin
> CIRRUSVGA_ROM=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/wor=
k/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/fir=
mware/vgabios-0.8a.cirrus.bin
> SEABIOS_ROM=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/=
x86-64-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/firmw=
are/bios.bin
> ETHERBOOT_ROMS=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/wo=
rk/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/fi=
rmware/rtl8139.rom
> WGET=3D/bin/false GIT=3D/bin/false XEN_BUILD_DATE=3D2026-09-10
> XEN_BUILD_TIME=3D10:36:15 XEN_CONFIG_EXPERT=3Dy debug=3Dn -C
> /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky=
-linux/xen-tools/4.21.1+stable/sources/xen-tools-4.21.1+stable/xen
> xenversion --no-print-directory
> Makefile:57: "You must use e.g. 'make menuconfig' to enable/disable debug
> now."
> DEBUG: Shell function do_deploy finished
> DEBUG: Executing python function create_deploy_spdx
> ERROR: No deployed artifacts found in
> /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky=
-linux/xen-tools/4.21.1+stable/deploy-xen-tools
> DEBUG: Python function create_deploy_spdx finished
>
> So this will not block merge in oe-core, but will probably need a fix in
> meta-virt.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000058d49b066015ee42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I sent a patch to meta-virt</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, N=
ov 12, 2026 at 4:42=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:=
mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon =
Nov 9, 2026 at 8:45 PM CET, Joshua Watt via openembedded-core wrote:<br>
&gt; Any recipe that inherits this class will automatically generate deploy=
<br>
&gt; SPDX data for the do_deploy task<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Bruce, Joshua,<br>
<br>
I just note this is breaking meta-virt builds:<br>
<br>
ERROR: xen-tools-4.21.1+stable-r0 do_deploy: No deployed artifacts found in=
 /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky-=
linux/xen-tools/4.21.1+stable/deploy-xen-tools<br>
...<br>
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/meta-virt/=
build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/temp/log.=
do_deploy.2548044<br>
NOTE: recipe xen-tools-4.21.1+stable-r0: task do_deploy: Failed<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/buil=
ds/4815" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/89/builds/4815</a><br>
<br>
Here is the full content of the said log file:<br>
<br>
DEBUG: Executing python function sstate_task_prefunc<br>
DEBUG: Python function sstate_task_prefunc finished<br>
DEBUG: Executing shell function do_deploy<br>
NOTE: make STDVGA_ROM=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/t=
mp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/sha=
re/firmware/vgabios-0.8a.bin CIRRUSVGA_ROM=3D/srv/pokybuild/yocto-worker/me=
ta-virt/build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/r=
ecipe-sysroot/usr/share/firmware/vgabios-0.8a.cirrus.bin SEABIOS_ROM=3D/srv=
/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky-linux=
/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/firmware/bios.bin ETHERBO=
OT_ROMS=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64=
-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/firmware/rt=
l8139.rom WGET=3D/bin/false GIT=3D/bin/false XEN_BUILD_DATE=3D2026-09-10 XE=
N_BUILD_TIME=3D10:36:15 XEN_CONFIG_EXPERT=3Dy debug=3Dn -C /srv/pokybuild/y=
octo-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4=
.21.1+stable/sources/xen-tools-4.21.1+stable/xen xenversion --no-print-dire=
ctory<br>
Makefile:57: &quot;You must use e.g. &#39;make menuconfig&#39; to enable/di=
sable debug now.&quot;<br>
DEBUG: Shell function do_deploy finished<br>
DEBUG: Executing python function create_deploy_spdx<br>
ERROR: No deployed artifacts found in /srv/pokybuild/yocto-worker/meta-virt=
/build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/deploy-x=
en-tools<br>
DEBUG: Python function create_deploy_spdx finished<br>
<br>
So this will not block merge in oe-core, but will probably need a fix in<br=
>
meta-virt.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000058d49b066015ee42--
