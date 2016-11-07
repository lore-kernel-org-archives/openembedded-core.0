Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 66C7671A3E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:01:00 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id q130so179093377qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+QhTK/xT029EuOPLt9g/86oIB26tYM2wUNshAtGGxEQ=;
	b=m0W8405sJOKo8nBELybVaVEBgg5xvLZP5xT8g8e6c6Yh3BgUjdtcjSX3dgpbc5VDTT
	qrEfMTG+ARXu6yPqxQDV6DtiEljgliVB7uDuGluZephcB1ovtfnGbtWDVe0iresF2EzA
	3Kc2u1qsU4cUbhz63OzHVRMarecrndGuXsX2KldbgwJwmRq6MEXGSfbVie0kqG6JTEyV
	1xEZtOkJQAtX3x6xbLDVXYKV72RtUI6Y0DvcVRh8cgNWFSK1MzrFi779SIAu0/iDps4k
	uEetPZjV+sDwfCmNIuH9O4qlQrbRzMjtibV3NegXudnhJW5M2U5VdXLetp1Nfx7dIbfm
	hf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+QhTK/xT029EuOPLt9g/86oIB26tYM2wUNshAtGGxEQ=;
	b=J02lDauyfYY/7zAG0hBWI+VDR8JRoZevL72rUHdTblDKYKUQB3fyHn4k4fQpGduqIr
	VpP4li1pT8Noku66w0k4iXIsfvR6EGUffGm++PEqOCqX94DuEtBP0mZm3FoMXBS201fv
	XrNAAG6QNVZX0T5HRqo8ZmM8bmioHrSncRb4gF9VEZDuRetMvxrWiGTDVnoYbYfjHjdj
	Y9z2Rd06lZuDQ8UFnzytuGqf9UUK5ZUYb9zv5zcKglUhAPOZVeadczbjeg66QfZSX8nz
	MAiswMReYjUoY7KDW9AYegFYBmgeey4f9+7Gailk0Vw3Z504aopyDgunbOejuBLxiMIx
	Q14Q==
X-Gm-Message-State: ABUngvcDvFlh7xszGfLVuyhWqwU72kVxC/tVTjNVLG83LAB2MjWu+f2RIQPncC+ah5nvL7bc8B1bB2yLlX6MnceN
X-Received: by 10.55.207.78 with SMTP id e75mr8286066qkj.36.1478530861463;
	Mon, 07 Nov 2016 07:01:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 07:00:40 -0800 (PST)
In-Reply-To: <1478257606-15637-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1478257606-15637-1-git-send-email-s.mueller-klieser@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 15:00:40 +0000
Message-ID: <CAJTo0Lb1-FjGzvxn6Lsc6Lme4LB6=Rs8rv_vggS8SkXPHRcduw@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: fix build
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
X-List-Received-Date: Mon, 07 Nov 2016 15:01:00 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8c9d6d70540b74ae1

--001a1145b7b8c9d6d70540b74ae1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 November 2016 at 11:06, Stefan M=C3=BCller-Klieser <
s.mueller-klieser@phytec.de> wrote:

> This fixes the mkimage build for situations where HOSTCC and friends
> need to be overridden and the u-boot makefile defaults don't work.
>

I applied this on top of the u-boot upgrades and it still breaks:

make -f ./scripts/Makefile.build obj=3Dtools
  x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dss=
e
-msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64
-Wp,-MD,tools/.bin2header.d -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3D/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/=
u-boot-mkimage/2016.09.01-r0=3D/usr/src/debug/u-boot-mkimage/2016.09.01-r0
-fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/x86_64-linux=3D
-fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64=
=3D
 -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security   -DCONFIG_FIT_SIGNATURE -inclu=
de
./include/libfdt_env.h -idirafterinclude -idirafter./arch/sandbox/include
-I./lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=3D0 -DUSE_HOSTCC
-D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -o tools/bin2header
tools/bin2header.c
...
cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
tools/bin2header license_gzip > ./include/license.h
/bin/sh: 2: tools/bin2header: not found
tools/Makefile:256: recipe for target 'include/license.h' failed

Looks like HOSTCC isn't being set correctly.

Ross

--001a1145b7b8c9d6d70540b74ae1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2016 at 11:06, Stefan M=C3=BCller-Klieser <span dir=3D"ltr">&=
lt;<a href=3D"mailto:s.mueller-klieser@phytec.de" target=3D"_blank">s.muell=
er-klieser@phytec.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"g=
mail-:45g" class=3D"gmail-a3s gmail-aXjCH gmail-m1582f16c0e103bb2">This fix=
es the mkimage build for situations where HOSTCC and friends<br>
need to be overridden and the <span class=3D"gmail-il">u</span>-<span class=
=3D"gmail-il">boot</span> makefile defaults don&#39;t work.<br></div></bloc=
kquote></div><br>I applied this on top of the u-boot upgrades and it still =
breaks:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
"><div class=3D"gmail_extra">make -f ./scripts/Makefile.build obj=3Dtools</=
div><div class=3D"gmail_extra">=C2=A0 x86_64-poky-linux-gcc =C2=A0-m64 -mar=
ch=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-=
master/tmp-glibc/sysroots/intel-corei7-64 -Wp,-MD,tools/.bin2header.d -O2 -=
pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/data/poky-mast=
er/tmp-glibc/work/corei7-64-poky-linux/u-boot-mkimage/2016.09.01-r0=3D/usr/=
src/debug/u-boot-mkimage/2016.09.01-r0 -fdebug-prefix-map=3D/data/poky-mast=
er/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/data/poky-maste=
r/tmp-glibc/sysroots/intel-corei7-64=3D =C2=A0-fstack-protector-strong -pie=
 -fpie -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity =C2=A0 -DCONFIG_FIT_SIGNATURE -include ./include/libfdt_env.h -idira=
fterinclude -idirafter./arch/sandbox/include -I./lib/libfdt -I./tools -DCON=
FIG_SYS_TEXT_BASE=3D0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE =
=C2=A0-o tools/bin2header tools/bin2header.c =C2=A0</div><div>...</div><div=
><div>cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \</div><div><span class=3D"=
gmail-Apple-tab-span" style=3D"white-space:pre">	</span>tools/bin2header li=
cense_gzip &gt; ./include/license.h</div><div>/bin/sh: 2: tools/bin2header:=
 not found</div><div>tools/Makefile:256: recipe for target &#39;include/lic=
ense.h&#39; failed</div></div><div><br></div><div>Looks like HOSTCC isn&#39=
;t being set correctly.</div><div><br></div><div>Ross</div></div></div>

--001a1145b7b8c9d6d70540b74ae1--
