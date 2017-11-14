Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9238B78535
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:32:43 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id u42so6172973ioi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+T3XpBkj2FtLdXbDNcfnkOxJ7Sh6LvY0pX5IbdxSGek=;
	b=qfz9+u5QE8/qn7JWsbeu7KiIRCbjVOP8XnHkovPa+lQYGOrZ7G36bPRrZUoW/AgTmD
	ZHu5nLxd5mlTJbAm/tm+BiBhg0x/wzQvJ+ZoYFpkYX6efvPsDr686nmQgYiZr8X6j76Q
	lLe/ol2DaStp5GDUgX2EPTLDtZfevoE9atJzAK1tqkGytpeL/2GzjUvaLehBc+sT4w58
	mcB2mEbhxO7xfwdAkMZMemdxX5/YmnVNxGAt9iIVz5ve6oCVvgx1OD4YkJtUFje7cJCm
	llConfrSFy9CIPiqtn/v6+MS+1lB9JbvBP3U0ttrI9MgLXp4MkhGgFqPqpQ3QZ+ZRMlk
	MM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+T3XpBkj2FtLdXbDNcfnkOxJ7Sh6LvY0pX5IbdxSGek=;
	b=PjQi8v3jTf/+Uay2YDKzfrTLwOqDx7EEbgOJo+ujefoVCTZ7PVnpLnBnQcIl7MJVYZ
	7XrEiC5PZSsqGE/DMrRnfm9CZ+KSTNfG125hmvgMeTTcLGKaynHndyrWJNCIheiapt8q
	1dZqfb2KDwl+RiZqC+8vygx2xvYszJScvX9QZtOoD25CPRcf4kf0Uo45iBva3F//2KiR
	8Uev8MUABvvYT1mHF0H7xFksUTuH4ydg1Diy/R8NiJbL7EKlRseqZ/x/AQmqsHwkGm1I
	LiDULx2faFXjx2kXZYNs2WElz90PmIONFrrJ52dIoeH8ucilygwUXRE+t7waaoFOErMi
	R+pA==
X-Gm-Message-State: AJaThX7GO+yjq70brvokQGru/JCse7MVuSSLo8YUL8fBgR1e13K65K/A
	ljkdROm6bpVsnsDVk2YpoQsl1xBp7ftV4hqtMuPuni7v
X-Google-Smtp-Source: AGs4zMb+ubfj1zF1SRyvEHla7K9GywqYPVvOSgQDkRD/akAf3eLYQm8CF7khdbnJU0tcBDgdKMPG7zOPnzL7SNx2C5c=
X-Received: by 10.107.11.228 with SMTP id 97mr10422358iol.227.1510662764228;
	Tue, 14 Nov 2017 04:32:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 04:32:23 -0800 (PST)
In-Reply-To: <20171012233202.1281-2-alistair.francis@xilinx.com>
References: <20171012233202.1281-1-alistair.francis@xilinx.com>
	<20171012233202.1281-2-alistair.francis@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 12:32:23 +0000
Message-ID: <CAJTo0LaSzXV=8qMZecM6QBPnhWiT-+bNnjL26YUgR+hdPkAE2Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: ben.levinsky@xilinx.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] runqemu: Allow the user to override the device tree option
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
X-List-Received-Date: Tue, 14 Nov 2017 12:32:43 -0000
Content-Type: multipart/alternative; boundary="001a113f7c14700a9d055df0952a"

--001a113f7c14700a9d055df0952a
Content-Type: text/plain; charset="UTF-8"

Doesn't actually work if DEVICE_TREE is not set but QB_DTB is:

Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/runqemu",
line 1277, in main
    config.check_and_set()
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/runqemu",
line 692, in check_and_set
    self.check_dtb()
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/runqemu",
line 624, in check_dtb
    cmd_match = "%s/%s" % (deploy_dir_image, dtb)
NameError: name 'deploy_dir_image' is not defined

Ross

On 13 October 2017 at 00:32, Alistair Francis <alistair.francis@xilinx.com>
wrote:

> Update the runqemu script to allow the user to specify a device tree
> to boot when calling runqemu.
>
> This involves creating a seperate check_dtb() function incase the user
> has specified 'none' for the kernel but still wants a device tree.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Cc: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  scripts/runqemu | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c3719a86f7..1be6db0eea 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -69,6 +69,7 @@ Usage: you can run this script with any valid combination
>  of the following environment variables (in any order):
>    KERNEL - the kernel image file to use
>    ROOTFS - the rootfs image file or nfsroot directory to use
> +  DEVICE_TREE - the device tree blob to use
>    MACHINE - the machine name (optional, autodetected from KERNEL filename
> if unspecified)
>    Simplified QEMU command-line options can be passed with:
>      nographic - disable video console
> @@ -178,6 +179,7 @@ class BaseConfig(object):
>          self.env_vars = ('MACHINE',
>                          'ROOTFS',
>                          'KERNEL',
> +                        'DEVICE_TREE',
>                          'DEPLOY_DIR_IMAGE',
>                          'OE_TMPDIR',
>                          'OECORE_NATIVE_SYSROOT',
> @@ -579,7 +581,7 @@ class BaseConfig(object):
>                  raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
>
>      def check_kernel(self):
> -        """Check and set kernel, dtb"""
> +        """Check and set kernel"""
>          # The vm image doesn't need a kernel
>          if self.fstype in self.vmtypes:
>              return
> @@ -608,6 +610,15 @@ class BaseConfig(object):
>          if not os.path.exists(self.kernel):
>              raise RunQemuError("KERNEL %s not found" % self.kernel)
>
> +    def check_dtb(self):
> +        """Check and set dtb"""
> +        # Did the user specify a device tree?
> +        if self.get('DEVICE_TREE'):
> +            self.dtb = self.get('DEVICE_TREE')
> +            if not os.path.exists(self.dtb):
> +                raise RunQemuError('Specified DTB not found: %s' %
> self.dtb)
> +            return
> +
>          dtb = self.get('QB_DTB')
>          if dtb:
>              cmd_match = "%s/%s" % (deploy_dir_image, dtb)
> @@ -678,6 +689,7 @@ class BaseConfig(object):
>          self.check_rootfs()
>          self.check_ovmf()
>          self.check_kernel()
> +        self.check_dtb()
>          self.check_biosdir()
>          self.check_mem()
>          self.check_tcpserial()
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f7c14700a9d055df0952a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t actually work if DEVICE_TREE is not set but QB=
_DTB is:<br><br>Traceback (most recent call last):<br>=C2=A0 File &quot;/ho=
me/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/scripts/r=
unqemu&quot;, line 1277, in main<br>=C2=A0 =C2=A0 config.check_and_set()<br=
>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-a=
rm-lsb/build/scripts/runqemu&quot;, line 692, in check_and_set<br>=C2=A0 =
=C2=A0 self.check_dtb()<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-arm-lsb/build/scripts/runqemu&quot;, line 624, in =
check_dtb<br>=C2=A0 =C2=A0 cmd_match =3D &quot;%s/%s&quot; % (deploy_dir_im=
age, dtb)<br>NameError: name &#39;deploy_dir_image&#39; is not defined<br><=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 13 October 2017 at 00:32, Alistair Francis <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alistair.francis@xilinx.com" target=3D"_blan=
k">alistair.francis@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Update the runqemu script to allow the user to specify a devi=
ce tree<br>
to boot when calling runqemu.<br>
<br>
This involves creating a seperate check_dtb() function incase the user<br>
has specified &#39;none&#39; for the kernel but still wants a device tree.<=
br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xili=
nx.com">alistair.francis@xilinx.com</a>&gt;<br>
Reviewed-by: Ben Levinsky &lt;<a href=3D"mailto:ben.levinsky@xilinx.com">be=
n.levinsky@xilinx.com</a>&gt;<br>
Cc: Ben Levinsky &lt;<a href=3D"mailto:ben.levinsky@xilinx.com">ben.levinsk=
y@xilinx.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 14 +++++++++++++-<br>
=C2=A01 file changed, 13 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index c3719a86f7..1be6db0eea 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -69,6 +69,7 @@ Usage: you can run this script with any valid combination=
<br>
=C2=A0of the following environment variables (in any order):<br>
=C2=A0 =C2=A0KERNEL - the kernel image file to use<br>
=C2=A0 =C2=A0ROOTFS - the rootfs image file or nfsroot directory to use<br>
+=C2=A0 DEVICE_TREE - the device tree blob to use<br>
=C2=A0 =C2=A0MACHINE - the machine name (optional, autodetected from KERNEL=
 filename if unspecified)<br>
=C2=A0 =C2=A0Simplified QEMU command-line options can be passed with:<br>
=C2=A0 =C2=A0 =C2=A0nographic - disable video console<br>
@@ -178,6 +179,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.env_vars =3D (&#39;MACHINE&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;ROOTFS&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;KERNEL&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;DEVICE_TREE&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;DEPLOY_DIR_IMAGE&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;OE_TMPDIR&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;OECORE_NATIVE_SYSROOT&#39;,<br>
@@ -579,7 +581,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemu=
Error(&quot;Can&#39;t find OVMF firmware: %s&quot; % ovmf)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def check_kernel(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Check and set kernel, dtb&qu=
ot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Check and set kernel&quot;&q=
uot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The vm image doesn&#39;t need a kernel<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.fstype in self.vmtypes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
@@ -608,6 +610,15 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.kernel):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemuError(&quot;KE=
RNEL %s not found&quot; % self.kernel)<br>
<br>
+=C2=A0 =C2=A0 def check_dtb(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Check and set dtb&quot;&quot=
;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Did the user specify a device tree?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.get(&#39;DEVICE_TREE&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dtb =3D self.get(&#39;DEVIC=
E_TREE&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(self.dtb):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise RunQemuError=
(&#39;Specified DTB not found: %s&#39; % self.dtb)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb =3D self.get(&#39;QB_DTB&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dtb:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_match =3D &quot;%s/%s&q=
uot; % (deploy_dir_image, dtb)<br>
@@ -678,6 +689,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_rootfs()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_ovmf()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_kernel()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_dtb()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_biosdir()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_mem()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check_tcpserial()<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f7c14700a9d055df0952a--
