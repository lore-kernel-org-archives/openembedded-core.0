Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 21ACE70A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 13:45:40 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id dc16so9865687qab.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 05:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QJk1CIv1uIVISmC0b4G2SVL+jrIeyKHsFyYHGwhvySw=;
	b=GEe/+VPvL+fFIlW001rcDRheHPiOevAGb1JpjWavbzykIjG7EnaCQzO4vh9YCe0WQz
	nK3qxFRSlTFofSpRnL8R+ferm1aCfq37HeUUQ9YKomQNeqWw59e4ky5hZVVnRBSj0JC4
	HA7s6fToGt0urj71rrz+tdfdPHMjGzoRbwWiVBxKkchnIzSg2+FeJ++rHPCKCylgYYWN
	Ktc960huxUMtgOU+tw5XhRD5fogldt8OoDTO9L6+Ph28YVmUpTcrEmTDkD40XyK+I5dP
	edh+6j01UwKReem55bBdhpRzGBm8XnkPYSZsEfDvUoQtrbM2Ay52H4BNEJ1e6+K1oyBn
	dF6w==
X-Gm-Message-State: ALoCoQn/yF4Mk805FjrNX+2HQJscE7+0vX8ROpdW9/ehO0V2+t1PAFDBRLyhAqtio1xFiufvbZZi
X-Received: by 10.140.94.246 with SMTP id g109mr42608491qge.77.1415108741620; 
	Tue, 04 Nov 2014 05:45:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Tue, 4 Nov 2014 05:45:21 -0800 (PST)
In-Reply-To: <CACS+7ZSx-yYuC2HXA=OJ=NM+-NmePBtM4VbYKaFnjodHgJ8sig@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
	<CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
	<CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
	<CACS+7ZSx-yYuC2HXA=OJ=NM+-NmePBtM4VbYKaFnjodHgJ8sig@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Nov 2014 13:45:21 +0000
Message-ID: <CAJTo0LZsx0Yswsap_YrKLZNY3E45ZCKdS0asXkQ2iMK7OGbkYw@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Tue, 04 Nov 2014 13:45:49 -0000
Content-Type: multipart/alternative; boundary=001a113a81d6dd3073050708adfb

--001a113a81d6dd3073050708adfb
Content-Type: text/plain; charset=UTF-8

Hi Dan,

On 16 September 2014 19:45, Dan McGregor <danismostlikely@gmail.com> wrote:

> No worries. There's a new version up now. I did some experiments with
> other machines. Turns out it doesn't
> work on aarch64.
>

Said I'd merge these once 1.7 out and sadly there's some bad news:

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/glibc/2.20-r0/git/csu/elf-init.c:86:
undefined reference to `__init_array_start'
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.9.1/ld:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
relocation R_386_GOTOFF against undefined hidden symbol
`__init_array_start' can not be used when making a shared object
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.9.1/ld:
final link failed: Bad value
| collect2: error: ld returned 1 exit status
| Makefile:407: recipe for target 'libasan.la' failed

(
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/87/steps/BuildImages/logs/stdio
)

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/imx53qsb/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/glibc/2.20-r0/git/csu/elf-init.c:87:
undefined reference to `__init_array_end'
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/glibc/2.20-r0/git/csu/elf-init.c:87:
undefined reference to `__init_array_start'
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.1/ld:
.libs/libasan.so.1.0.0: hidden symbol `__init_array_end' isn't defined
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.1/ld:
final link failed: Bad value
| collect2: error: ld returned 1 exit status
| make[2]: *** [libasan.la] Error 1

(
https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/builds/85/steps/BuildImages/logs/stdio
)

ERROR: Nothing RPROVIDES 'libsanitizer' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/recipes-core/packagegroups/
packagegroup-core-sdk.bb RDEPENDS on or otherwise requires it)
ERROR: libsanitizer was skipped: incompatible with host mips-poky-linux
(not in COMPATIBLE_HOST)

(
https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/89/steps/BuildImages/logs/stdio
)

Will you be able to work on these?

Ross

--001a113a81d6dd3073050708adfb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Dan,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 16 September 2014 19:45, Dan McG=
regor <span dir=3D"ltr">&lt;<a href=3D"mailto:danismostlikely@gmail.com" ta=
rget=3D"_blank">danismostlikely@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-l=
eft:1ex"><div id=3D":1r5" class=3D"" style=3D"overflow:hidden">No worries. =
There&#39;s a new version up now. I did some experiments with<br>
other machines. Turns out it doesn&#39;t<br>
work on aarch64.</div></blockquote></div><br>Said I&#39;d merge these once =
1.7 out and sadly there&#39;s some bad news:</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| /home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sys=
roots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS): In function `__libc_cs=
u_init&#39;:</div><div class=3D"gmail_extra">| /home/pokybuild/yocto-autobu=
ilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/gli=
bc/2.20-r0/git/csu/elf-init.c:86: undefined reference to `__init_array_star=
t&#39;</div><div class=3D"gmail_extra">| /home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libe=
xec/i586-poky-linux/gcc/i586-poky-linux/4.9.1/ld: /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/qemux86/usr/=
lib/libc_nonshared.a(elf-init.oS): relocation R_386_GOTOFF against undefine=
d hidden symbol `__init_array_start&#39; can not be used when making a shar=
ed object</div><div class=3D"gmail_extra">| /home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-x86-lsb/build/build/tmp/sysroots/x86_64-linux/usr/l=
ibexec/i586-poky-linux/gcc/i586-poky-linux/4.9.1/ld: final link failed: Bad=
 value</div><div class=3D"gmail_extra">| collect2: error: ld returned 1 exi=
t status</div><div class=3D"gmail_extra">| Makefile:407: recipe for target =
&#39;<a href=3D"http://libasan.la">libasan.la</a>&#39; failed</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(<a href=3D"https:/=
/autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/87/steps=
/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/main/builders=
/nightly-x86-lsb/builds/87/steps/BuildImages/logs/stdio</a>)</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">| /home/pokybuild/yo=
cto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysroots/i=
mx53qsb/usr/lib/libc_nonshared.a(elf-init.oS): In function `__libc_csu_init=
&#39;:</div><div class=3D"gmail_extra">| /home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/work/armv7a-vfp-neon-poky-=
linux-gnueabi/glibc/2.20-r0/git/csu/elf-init.c:87: undefined reference to `=
__init_array_end&#39;</div><div class=3D"gmail_extra">| /home/pokybuild/yoc=
to-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/work/armv7a=
-vfp-neon-poky-linux-gnueabi/glibc/2.20-r0/git/csu/elf-init.c:87: undefined=
 reference to `__init_array_start&#39;</div><div class=3D"gmail_extra">| /h=
ome/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/buil=
d/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky=
-linux-gnueabi/4.9.1/ld: .libs/libasan.so.1.0.0: hidden symbol `__init_arra=
y_end&#39; isn&#39;t defined</div><div class=3D"gmail_extra">| /home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-fsl-arm-lsb/build/build/tmp/sysr=
oots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnu=
eabi/4.9.1/ld: final link failed: Bad value</div><div class=3D"gmail_extra"=
>| collect2: error: ld returned 1 exit status</div><div class=3D"gmail_extr=
a">| make[2]: *** [<a href=3D"http://libasan.la">libasan.la</a>] Error 1</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(<a href=
=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/=
builds/85/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.or=
g/main/builders/nightly-fsl-arm-lsb/builds/85/steps/BuildImages/logs/stdio<=
/a>)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">E=
RROR: Nothing RPROVIDES &#39;libsanitizer&#39; (but /home/pokybuild/yocto-a=
utobuilder/yocto-worker/nightly-mips/build/meta/recipes-core/packagegroups/=
<a href=3D"http://packagegroup-core-sdk.bb">packagegroup-core-sdk.bb</a> RD=
EPENDS on or otherwise requires it)<br></div><div class=3D"gmail_extra"><di=
v class=3D"gmail_extra">ERROR: libsanitizer was skipped: incompatible with =
host mips-poky-linux (not in COMPATIBLE_HOST)</div><div><br></div><div>(<a =
href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-mips/bui=
lds/89/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/m=
ain/builders/nightly-mips/builds/89/steps/BuildImages/logs/stdio</a>)</div>=
<div><br></div><div>Will you be able to work on these?</div><div><br></div>=
<div>Ross</div></div></div></div>

--001a113a81d6dd3073050708adfb--
