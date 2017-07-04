Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8C771A65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 22:16:42 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id 16so177200840qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HMetgaMihYai2NptktVkLcQIZ79AL7bKtGkL+/V0VUU=;
	b=QcP36OEablXlM78tnLJS6oAYzyS8vR2Q7bHuh7DmY8WstcChyDGBj7Lp443drWcgxo
	tt+bJHfghUfJIEqWASiaQIfYQtcnUQdevLahO+ayTWfau0RLglyXi1+ekTIe96PAexHy
	+QtrN2faMgsh3nFOG8H5dvRUwmladaOGn6CaLDr3pQVN+XHlfblyVlAJ3AfoOxoac7hI
	twf3POxAyvv5wDRJitJaZ26mAaDO4sfElbrlyfCEam6DT5qK68mN1Z7izNooljWD4kRZ
	uUtRmoNexLiiTgKUu5f1ssqoPltX/RU52c+9Y/M/J97JKigGx1MkLsknf9YAczexWNrX
	sOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HMetgaMihYai2NptktVkLcQIZ79AL7bKtGkL+/V0VUU=;
	b=KCVkJmCA6CD1qbIuEVXWzgqLdaUhtM4UfOt4QArgB7C4YWQIMD/pnjNenk2Kma5pYs
	w1Zy9NFkJbOVxidMfEqtB+ks0PG2tvcao89P/av1YKT4hH64ez9HtOJN+KBsilvZkpB0
	CyDHeTY/pbh5/Ikupp4wRPHVy6OwCJjLdR0zk2wB4W6/NXQVuhrYz5r64XTs0up3QD9S
	O58RflyVH2PrDu3thFe3odeFZ+jksbGZLDdcLJBu8hbyHwVda0yGRmWIr0h2HAJTJlA6
	aso0bfi3e4bSTUZCnCLfpZsti16J8neC3EEJiZ8xPBEu5DVMlGhFd7gN0kU0EEWo8qiw
	DyQQ==
X-Gm-Message-State: AIVw111AxW5s8xyU9rRwWdbFHQf8O29TZeUuOIybfPJ1988DD326PIRS
	Lf7B/xt3tgCRa3dX81mIHOjp3SWGOsUocrk=
X-Received: by 10.55.22.20 with SMTP id g20mr26911165qkh.228.1499206603978;
	Tue, 04 Jul 2017 15:16:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 4 Jul 2017 15:16:23 -0700 (PDT)
In-Reply-To: <3d4d64770e679caa28b6a99486bbbad9a610abb2.1498569961.git.ed.bartosh@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<3d4d64770e679caa28b6a99486bbbad9a610abb2.1498569961.git.ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Jul 2017 23:16:23 +0100
Message-ID: <CAJTo0LZC=Ee+ctXnFCO2WtURObsE=UfuaDqUyrJtgW+1u3_hgw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/5] wic: copy rootfs directory before changing fstab
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
X-List-Received-Date: Tue, 04 Jul 2017 22:16:44 -0000
Content-Type: multipart/alternative; boundary="001a1149392213509a0553853de7"

--001a1149392213509a0553853de7
Content-Type: text/plain; charset="UTF-8"

Bad news: the failure this was meant to fix happened again.

| tar: ./opt/ltp/testcases/bin/dup01: file changed as we read it
| ERROR: Function failed: do_image_tar (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/temp/log.do_image_tar.5535)

As before, image_wic was also running.

Is there any chance this could still be wic, or should we look at the jffs2
image generator?

Ross

On 27 June 2017 at 14:28, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>
> wic updates /etc/fstab on root partition if there are
> valid mount points in .wks
>
> When wic runs from bitbake this can cause incorrect results
> or even breakage of other tasks working with rootfs directory
> in parallel with do_image_wic.
>
> Implemented copying rootfs directory to a temporary location
> using copyhardlinktree before updating fstab to avoid conflicts with
> other tasks working with rootfs.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
b/scripts/lib/wic/plugins/imager/direct.py
> index aa9cc9f..f707365 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -32,6 +32,8 @@ import uuid
>
>  from time import strftime
>
> +from oe.path import copyhardlinktree
> +
>  from wic import WicError
>  from wic.filemap import sparse_copy
>  from wic.ksparser import KickStart, KickStartError
> @@ -115,12 +117,16 @@ class DirectPlugin(ImagerPlugin):
>              fstab_lines = fstab.readlines()
>
>          if self._update_fstab(fstab_lines, self.parts):
> -            shutil.copyfile(fstab_path, fstab_path + ".orig")
> +            # copy rootfs dir to workdir to update fstab
> +            # as rootfs can be used by other tasks and can't be modified
> +            new_rootfs = os.path.realpath(os.path.join(self.workdir,
"rootfs_copy"))
> +            copyhardlinktree(image_rootfs, new_rootfs)
> +            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
>
>              with open(fstab_path, "w") as fstab:
>                  fstab.writelines(fstab_lines)
>
> -            return fstab_path
> +            return new_rootfs
>
>      def _update_fstab(self, fstab_lines, parts):
>          """Assume partition order same as in wks"""
> @@ -156,7 +162,10 @@ class DirectPlugin(ImagerPlugin):
>          filesystems from the artifacts directly and combine them into
>          a partitioned image.
>          """
> -        fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
> +        new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
> +        if new_rootfs:
> +            # rootfs was copied to update fstab
> +            self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
>
>          for part in self.parts:
>              # get rootfs size from bitbake variable if it's not set in
.ks file
> @@ -172,12 +181,7 @@ class DirectPlugin(ImagerPlugin):
>                      if rsize_bb:
>                          part.size = int(round(float(rsize_bb)))
>
> -        try:
> -            self._image.prepare(self)
> -        finally:
> -            if fstab_path:
> -                shutil.move(fstab_path + ".orig", fstab_path)
> -
> +        self._image.prepare(self)
>          self._image.layout_partitions()
>          self._image.create()
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1149392213509a0553853de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bad news: the failure this was meant to fix happened again=
.<br><br>| tar: ./opt/ltp/testcases/bin/dup01: file changed as we read it<b=
r>| ERROR: Function failed: do_image_tar (log file is located at /home/poky=
build/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/temp/log.do_image=
_tar.5535)<br><br>As before, image_wic was also running.<div><br></div><div=
>Is there any chance this could still be wic, or should we look at the jffs=
2 image generator?</div><div><br></div><div>Ross</div><div><br>On 27 June 2=
017 at 14:28, Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com">=
ed.bartosh@linux.intel.com</a>&gt; wrote:<br>&gt;<br>&gt; wic updates /etc/=
fstab on root partition if there are<br>&gt; valid mount points in .wks<br>=
&gt;<br>&gt; When wic runs from bitbake this can cause incorrect results<br=
>&gt; or even breakage of other tasks working with rootfs directory<br>&gt;=
 in parallel with do_image_wic.<br>&gt;<br>&gt; Implemented copying rootfs =
directory to a temporary location<br>&gt; using copyhardlinktree before upd=
ating fstab to avoid conflicts with<br>&gt; other tasks working with rootfs=
.<br>&gt;<br>&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartos=
h@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>&gt; ---<br>&gt; =
=C2=A0scripts/lib/wic/plugins/imager/direct.py | 22 +++++++++++++---------<=
br>&gt; =C2=A01 file changed, 13 insertions(+), 9 deletions(-)<br>&gt;<br>&=
gt; diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic=
/plugins/imager/direct.py<br>&gt; index aa9cc9f..f707365 100644<br>&gt; ---=
 a/scripts/lib/wic/plugins/imager/direct.py<br>&gt; +++ b/scripts/lib/wic/p=
lugins/imager/direct.py<br>&gt; @@ -32,6 +32,8 @@ import uuid<br>&gt;<br>&g=
t; =C2=A0from time import strftime<br>&gt;<br>&gt; +from oe.path import cop=
yhardlinktree<br>&gt; +<br>&gt; =C2=A0from wic import WicError<br>&gt; =C2=
=A0from wic.filemap import sparse_copy<br>&gt; =C2=A0from wic.ksparser impo=
rt KickStart, KickStartError<br>&gt; @@ -115,12 +117,16 @@ class DirectPlug=
in(ImagerPlugin):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
stab_lines =3D fstab.readlines()<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if self._update_fstab(fstab_lines, self.parts):<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(fstab_path, fstab_path + =
&quot;.orig&quot;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# cop=
y rootfs dir to workdir to update fstab<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# as rootfs can be used by other tasks and can&#39;t be mo=
dified<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_rootfs =3D os=
.path.realpath(os.path.join(self.workdir, &quot;rootfs_copy&quot;))<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copyhardlinktree(image_rootfs, =
new_rootfs)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fstab_path =
=3D os.path.join(new_rootfs, &#39;etc/fstab&#39;)<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(fstab_path, &quot;w&quot=
;) as fstab:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fstab.writelines(fstab_lines)<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return fstab_path<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return new_rootfs<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0d=
ef _update_fstab(self, fstab_lines, parts):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;&quot;&quot;Assume partition order same as in wks&quot;&=
quot;&quot;<br>&gt; @@ -156,7 +162,10 @@ class DirectPlugin(ImagerPlugin):<=
br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesystems from the artifacts di=
rectly and combine them into<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a pa=
rtitioned image.<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quo=
t;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0fstab_path =3D self._write_fstab(se=
lf.rootfs_dir.get(&quot;ROOTFS_DIR&quot;))<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0new_rootfs =3D self._write_fstab(self.rootfs_dir.get(&quot;ROOTFS_DIR=
&quot;))<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if new_rootfs:<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# rootfs was copied to update fstab<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rootfs_dir[&#39;ROOT=
FS_DIR&#39;] =3D new_rootfs<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0for part in self.parts:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# get rootfs size from bitbake variable if it&#39;s not set in .k=
s file<br>&gt; @@ -172,12 +181,7 @@ class DirectPlugin(ImagerPlugin):<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if rsize_bb:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.size =3D int(round(float(rsi=
ze_bb)))<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>&gt; - =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._image.prepare(self)<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0finally:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if fstab_path:<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0shutil.move(fstab_path + &quot;.orig&quot;, fstab_path)<br=
>&gt; -<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0self._image.prepare(self)<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._image.layout_partitions()<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._image.create()<br>&gt;<br>&gt; -=
-<br>&gt; 2.1.4<br>&gt;<br>&gt; --<br>&gt; ________________________________=
_______________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"m=
ailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.ope=
nembedded.org</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/=
listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/=
openembedded-core</a></div></div>

--001a1149392213509a0553853de7--
