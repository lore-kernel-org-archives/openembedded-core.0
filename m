Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id BB465784D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 15:28:40 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id u42so29889780ioi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 07:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/qjMIBxjpLDZHuWecGnLgkoISvbKmM6kuecHgqmkaVA=;
	b=A9FdlGGylNbBKueY1t+lYnzlQPy/igQJ2lPDn8GgGipZ8ppHL0ItPauiFCxu1u7n90
	mhvqyul4KAtP7/6nF9x2HxoI6Pitu7LhtShucFe0YptiGP4HHcdava6POT3L0lCyU55t
	oIO+7ybv9utZaJt2vVK9JjrilEWPaZauFzzV5WWiiBQ5G8FVc+5XF8VGEM7422Lca6m7
	SrbcO4AsFD5g6qvO9KP19EtoptK4zyi8tgQBAdFkd1D/FupjmWZWCf7n4HCpq99EuPxb
	VwdTAVhvshNhSIf9NqlHnQMX6y9OaudFMdh+WhSxbihc3ePg3qZzbQCGWpqCNtaYS1R9
	gI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/qjMIBxjpLDZHuWecGnLgkoISvbKmM6kuecHgqmkaVA=;
	b=ShppQJX38R9TnIpI/uBYBb4R/ZfRMxfCVnT8jXD3zdQblmvw6/bRv9CyxYGfn03ziC
	Eh7j4NLHyaRWDBMofSzlxAABZ3E+cmdYxqKBTm9jr6TXwMRrDCqBdVm3OG3s4KcnUSRz
	byd05xSCDgbkHVdJskO90HEYWsdevvHp31fsM5x5qnQYmAjlDQU7rk2XahkNGl6CeUdV
	mDkT3G5S6GdMiUn7jZqoI9shW23FN1k/vo6RnpiMfCeoDsnqYqsTy9WvAgRkfwI7rmoI
	Uko1utr0BlR3cdnhiCwpL3k/wAwrSDko8ND8MK6WlbVaXFcq1L8rXuiMDbXDyU+XxcGs
	rREQ==
X-Gm-Message-State: AJaThX4LW/lXM3Vhp1vAbyunpgM4ho8WtZghik2xCvlp7qFjAfQUV5lx
	V+0wC/nN5etfDyVNHD2dYMkKssMBMymXwtajSnvwMepn
X-Google-Smtp-Source: AGs4zMZcFhGDQhmP9zlf/iZKjud9AA0R/KoPSoF2lfYWFohssZzORaU3mz1hffS20JCdSnucnHSqod4dro3fY3CqEZQ=
X-Received: by 10.107.133.94 with SMTP id h91mr31669991iod.208.1511537321620; 
	Fri, 24 Nov 2017 07:28:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 07:28:21 -0800 (PST)
In-Reply-To: <1510934900-22044-5-git-send-email-trini@konsulko.com>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 15:28:21 +0000
Message-ID: <CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Fri, 24 Nov 2017 15:28:41 -0000
Content-Type: multipart/alternative; boundary="001a113ffc901ed01b055ebc35fb"

--001a113ffc901ed01b055ebc35fb
Content-Type: text/plain; charset="UTF-8"

Still fails on the autobuilder though:

2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu (wic.Wic)
2017-11-24 03:33:51,694 - oe-selftest - INFO -
----------------------------------------------------------------------
2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most recent call
last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
line 58, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
line 639, in test_qemu
    self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3
/mnt\r\n/dev/sda4 /uuid')
AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt' !=
'/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid'
- /dev/root /
  /dev/sda1 /boot
+ /dev/sda2 /
- /dev/sda3 /mnt+ /dev/sda3 /mnt
?               ++
+ /dev/sda4 /uuid



On 17 November 2017 at 16:08, Tom Rini <trini@konsulko.com> wrote:
>
> - Add a '/uuid' partition to wic-image-minimal.wks with a known UUID.
> - In test_qemu, sort our output from checking the output of 'mount' as
>   it may not be stable.  Also, do not check the exit code as passing any
>   output to cut ensures a 0 exit code.
> - Check for a 'UUID=' line in /etc/fstab with out expected output.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta-selftest/recipes-test/images/wic-image-minimal.wks | 1 +
>  meta/lib/oeqa/selftest/cases/wic.py                     | 9 ++++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks
b/meta-selftest/recipes-test/images/wic-image-minimal.wks
> index 9410b684bed8..2fb34c4ef40a 100644
> --- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
> +++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
> @@ -5,5 +5,6 @@
>  part /boot --source bootimg-pcbios --ondisk sda --label boot --active
--align 1024
>  part / --source rootfs --ondisk sda --fstype=ext4 --label platform
--align 1024 --use-uuid
>  part /mnt --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda
--fstype=ext4 --label core --align 1024
> +part /uuid --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda
--fstype=ext4 --label uuid-test --align 1024 --use-uuid --fsuuid
2c71ef06-a81d-4735-9d3a-379b69c6bdba
>
>  bootloader --ptable gpt --timeout=0  --append="rootwait console=tty0"
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py
b/meta/lib/oeqa/selftest/cases/wic.py
> index 651d575dc3b2..969ee1054d8b 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0
--fstype=ext4 --exclude-path bin/ --r
>          self.assertEqual(0, bitbake('wic-image-minimal').status)
>          self.remove_config(config)
>
> -        with runqemu('wic-image-minimal', ssh=False) as qemu:
> -            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> +        with runqemu('wic-image-minimal', ssh=False,
runqemuparams="nographic") as qemu:
> +            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
/\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
> +            cmd = "grep UUID= /etc/fstab"
>              status, output = qemu.run_serial(cmd)
>              self.assertEqual(1, status, 'Failed to run command "%s": %s'
% (cmd, output))
> -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
/boot\r\n/dev/sda3 /mnt')
> +            self.assertEqual(output,
'UUID=2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\tdefaults\t0\t0')
>
>      @only_for_arch(['i586', 'i686', 'x86_64'])
>      @OETestID(1852)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113ffc901ed01b055ebc35fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Still fails on the autobuilder though:<br><br>2017-11-24 0=
3:33:51,694 - oe-selftest - INFO - FAIL: test_qemu (wic.Wic)<br>2017-11-24 =
03:33:51,694 - oe-selftest - INFO - ---------------------------------------=
-------------------------------<br>2017-11-24 03:33:51,694 - oe-selftest - =
INFO - Traceback (most recent call last):<br>=C2=A0 File &quot;/home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/=
core/decorator/__init__.py&quot;, line 32, in wrapped_f<br>=C2=A0 =C2=A0 re=
turn func(*args, **kwargs)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autob=
uilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/=
wic.py&quot;, line 58, in wrapped_f<br>=C2=A0 =C2=A0 return func(*args, **k=
wargs)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/=
nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py&quot;, line 6=
39, in test_qemu<br>=C2=A0 =C2=A0 self.assertEqual(output, &#39;/dev/sda1 /=
boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid&#39;)<br>Assertion=
Error: &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt&#39; !=3D &#39=
;/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid&#39;<b=
r>- /dev/root /<br>=C2=A0 /dev/sda1 /boot<br>+ /dev/sda2 /<br>- /dev/sda3 /=
mnt+ /dev/sda3 /mnt<br>? =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
+<br>+ /dev/sda4 /uuid<br><br><br><br>On 17 November 2017 at 16:08, Tom Rin=
i &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrot=
e:<br>&gt;<br>&gt; - Add a &#39;/uuid&#39; partition to wic-image-minimal.w=
ks with a known UUID.<br>&gt; - In test_qemu, sort our output from checking=
 the output of &#39;mount&#39; as<br>&gt; =C2=A0 it may not be stable.=C2=
=A0 Also, do not check the exit code as passing any<br>&gt; =C2=A0 output t=
o cut ensures a 0 exit code.<br>&gt; - Check for a &#39;UUID=3D&#39; line i=
n /etc/fstab with out expected output.<br>&gt;<br>&gt; Signed-off-by: Tom R=
ini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt;<br=
>&gt; ---<br>&gt; =C2=A0meta-selftest/recipes-test/images/wic-image-minimal=
.wks | 1 +<br>&gt; =C2=A0meta/lib/oeqa/selftest/cases/wic.py =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++++++---<br>&g=
t; =C2=A02 files changed, 7 insertions(+), 3 deletions(-)<br>&gt;<br>&gt; d=
iff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-=
selftest/recipes-test/images/wic-image-minimal.wks<br>&gt; index 9410b684be=
d8..2fb34c4ef40a 100644<br>&gt; --- a/meta-selftest/recipes-test/images/wic=
-image-minimal.wks<br>&gt; +++ b/meta-selftest/recipes-test/images/wic-imag=
e-minimal.wks<br>&gt; @@ -5,5 +5,6 @@<br>&gt; =C2=A0part /boot --source boo=
timg-pcbios --ondisk sda --label boot --active --align 1024<br>&gt; =C2=A0p=
art / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --align=
 1024 --use-uuid<br>&gt; =C2=A0part /mnt --source rootfs --rootfs-dir=3Dwic=
-image-minimal --ondisk sda --fstype=3Dext4 --label core --align 1024<br>&g=
t; +part /uuid --source rootfs --rootfs-dir=3Dwic-image-minimal --ondisk sd=
a --fstype=3Dext4 --label uuid-test --align 1024 --use-uuid --fsuuid 2c71ef=
06-a81d-4735-9d3a-379b69c6bdba<br>&gt;<br>&gt; =C2=A0bootloader --ptable gp=
t --timeout=3D0 =C2=A0--append=3D&quot;rootwait console=3Dtty0&quot;<br>&gt=
; diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py<br>&gt; index 651d575dc3b2..969ee1054d8b 100644<br>&gt; --- a=
/meta/lib/oeqa/selftest/cases/wic.py<br>&gt; +++ b/meta/lib/oeqa/selftest/c=
ases/wic.py<br>&gt; @@ -633,11 +633,14 @@ part /etc --source rootfs --ondis=
k mmcblk0 --fstype=3Dext4 --exclude-path bin/ --r<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.assertEqual(0, bitbake(&#39;wic-image-minimal&#39;).s=
tatus)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.remove_config(config)=
<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0with runqemu(&#39;wic-image-m=
inimal&#39;, ssh=3DFalse) as qemu:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cmd =3D &quot;mount |grep &#39;^/dev/&#39; | cut -f1,3 -d &#39=
; &#39;&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0with runqemu(&#39;wic-im=
age-minimal&#39;, ssh=3DFalse, runqemuparams=3D&quot;nographic&quot;) as qe=
mu:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;mount =
|grep &#39;^/dev/&#39; | cut -f1,3 -d &#39; &#39; | sort&quot;<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D qemu.run_serial=
(cmd)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(o=
utput, &#39;/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /=
uuid&#39;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot=
;grep UUID=3D /etc/fstab&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0status, output =3D qemu.run_serial(cmd)<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(1, status, &#39;Failed t=
o run command &quot;%s&quot;: %s&#39; % (cmd, output))<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(output, &#39;/dev/root /\r\=
n/dev/sda1 /boot\r\n/dev/sda3 /mnt&#39;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.assertEqual(output, &#39;UUID=3D2c71ef06-a81d-4735-9d=
3a-379b69c6bdba\t/uuid\text4\tdefaults\t0\t0&#39;)<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0@only_for_arch([&#39;i586&#39;, &#39;i686&#39;, &#39;x86_64&#3=
9;])<br>&gt; =C2=A0 =C2=A0 =C2=A0@OETestID(1852)<br>&gt; --<br>&gt; 2.7.4<b=
r>&gt;<br>&gt; --<br>&gt; _______________________________________________<b=
r>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedde=
d-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>=
<br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core=
</a></div>

--001a113ffc901ed01b055ebc35fb--
