Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id E8CA3607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:55:06 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so32450916ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pXQC9oUt6yxgDxUFKIfkH9V8wj2XSVYodwIPS4A5Wzg=;
	b=T/FHFUx3Ftp8WgR6lmNM4cA37T2bPMxTXW8vm0xfxMdNbAQaJJk4f2fpm11ncdA+aW
	HM8UTT6YD5ksR0XW+HOEzgNtuU8XxO/2kKvVnKqEW8W8dLdhDat0BftpVWHpTzB5zdan
	XTs0hA53LmaGXBF7k7qOzElXWp+qr2tryXMrZllRpyNlR6CvNRRQ5+o+/Ls63pYQV0td
	qRaqAOKwZLqYzelMNnOc/Mu0+xaVapgofvvUH0jvqbuh1sj2t4C6+d90jI/l1Qr52iIU
	xSnN97n4IzTKAeijZfz5ZJwPVehvtdq5zytYc3Z48N9gMrp2QxO5dL8X/fMEts7+HTC4
	ISAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pXQC9oUt6yxgDxUFKIfkH9V8wj2XSVYodwIPS4A5Wzg=;
	b=Lp71LaeBNu9EQrawar1M7btGsJEYgfW5NMTPb3F27XiRC7fHIjEmOGF9euSevqvBJ0
	9RtzDi7g8l8Sf9RqmhSkHCK/DZ2Lsp/QWR8RMk+h/6OMjh20GXwDk3cu5yews5PpvP8m
	vT2wz8PpnkHbJFtz+vwnvuUYteP+2FYjTO3+RcoYT9BVsFaVhaPoYZxinEaHE0xcVJqn
	emEfASgFNBCfUPRom6Ewknwjy/bDwFJSEpqwYQXqO+QrqHG3+Ot82sbTlgAu79fC0l9S
	ZodReo7ss3gzrVRtn+FqxVHDjGi4bgmDTqBMbvJfMPhcBMXQ3UqKkU67z9TrdozBJ5Gs
	+3nQ==
X-Gm-Message-State: AEkoousGtToVJUfh4Frc74P5+tsOzSK4yyDCjnSe9/RMBb1HfZrW2cfslv9JfDM6Xxwc+lxHJ2uR4R2V15gqNjmy
X-Received: by 10.36.87.140 with SMTP id u134mr3142570ita.38.1469177706576;
	Fri, 22 Jul 2016 01:55:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 22 Jul 2016 01:54:47 -0700 (PDT)
In-Reply-To: <ac77505921ddfb1e69efd7e46dafca9707b112a4.1468935802.git.liezhi.yang@windriver.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<ac77505921ddfb1e69efd7e46dafca9707b112a4.1468935802.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jul 2016 09:54:47 +0100
Message-ID: <CAJTo0LY9LrXHQDb4ORk+LTj7SZ_p7wG=7FFtJ98TgqjCUOLtVA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] slang: 2.2.4 -> 2.3.0
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
X-List-Received-Date: Fri, 22 Jul 2016 08:55:10 -0000
Content-Type: multipart/alternative; boundary=001a1135018c500f5005383597c4

--001a1135018c500f5005383597c4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 July 2016 at 14:44, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Removed:
>   change-char-type-to-signed-char-in-macros.patch
>   sprintf-bug-concerning-8-bit-characters.patch
>   They are already in the source.
>
> * Updated:
>   fix-check-pcre.patch
>   fix-check-pcre.patch
>   slang-fix-the-iconv-existence-checking.patch
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

This fails in all the poky-lsb configurations (which generally implicates
the security flags):

make[1]: Entering directory
'/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/=
build/po'
/bin/sh: 6: @mkdir_p@: not found
/usr/bin/install: cannot create regular file
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo=E2=80=99:
No such file or directory
installing ../../git/po/ca.gmo as
/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/i=
mage/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo
/bin/sh: 6: @mkdir_p@: not found
/usr/bin/install: cannot create regular file
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo=E2=80=99:
No such file or directory
installing ../../git/po/cs.gmo as
/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/i=
mage/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo
/bin/sh: 6: @mkdir_p@: not found
/usr/bin/install: cannot create regular file
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/da/LC_MESSAGES/e2fsprogs.mo=E2=80=99:
No such file or directory
...

(http://errors.yoctoproject.org/Errors/Details/72820/)

as-needed dropping libraries that are needed later maybe?

Ross

--001a1135018c500f5005383597c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 July 2016 at 14:44, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":6pc" class=3D"">* Remo=
ved:<br>
=C2=A0 change-char-type-to-signed-char-in-macros.patch<br>
=C2=A0 sprintf-bug-concerning-8-bit-characters.patch<br>
=C2=A0 They are already in the source.<br>
<br>
* Updated:<br>
=C2=A0 fix-check-pcre.patch<br>
=C2=A0 fix-check-pcre.patch<br>
=C2=A0 <span class=3D"">slang</span>-fix-the-iconv-existence-checking.patch=
<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>This fails i=
n all the poky-lsb configurations (which generally implicates the security =
flags):</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
"><div class=3D"gmail_extra">make[1]: Entering directory &#39;/data/poky-ma=
ster/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/build/po&#39;<=
/div><div class=3D"gmail_extra">/bin/sh: 6: @mkdir_p@: not found</div><div =
class=3D"gmail_extra">/usr/bin/install: cannot create regular file =E2=80=
=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r=
0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo=E2=80=99: No such file=
 or directory</div><div class=3D"gmail_extra">installing ../../git/po/ca.gm=
o as /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1=
-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo</div><div class=3D"g=
mail_extra">/bin/sh: 6: @mkdir_p@: not found</div><div class=3D"gmail_extra=
">/usr/bin/install: cannot create regular file =E2=80=98/data/poky-master/t=
mp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/loca=
le/cs/LC_MESSAGES/e2fsprogs.mo=E2=80=99: No such file or directory</div><di=
v class=3D"gmail_extra">installing ../../git/po/cs.gmo as /data/poky-master=
/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/lo=
cale/cs/LC_MESSAGES/e2fsprogs.mo</div><div class=3D"gmail_extra">/bin/sh: 6=
: @mkdir_p@: not found</div><div class=3D"gmail_extra">/usr/bin/install: ca=
nnot create regular file =E2=80=98/data/poky-master/tmp-glibc/work/corei7-6=
4-poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/da/LC_MESSAGES/e2fs=
progs.mo=E2=80=99: No such file or directory</div><div class=3D"gmail_extra=
">...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
(<a href=3D"http://errors.yoctoproject.org/Errors/Details/72820/">http://er=
rors.yoctoproject.org/Errors/Details/72820/</a>)</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">as-needed dropping libraries tha=
t are needed later maybe?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div></div>

--001a1135018c500f5005383597c4--
