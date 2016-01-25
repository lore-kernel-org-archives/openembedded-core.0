Return-Path: <srifenbark@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id C19C476DBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:30:48 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id x5so9722539obg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 08:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wucW0ENJkanZjxAYCEi1EWrLszBenSug/xHYrNT6Juk=;
	b=u102rL+XzeEdN0OxGHpq0aOZdlrpHWeel5HqYUVK5qgoe5VN/t8/FK++ekEyLE1fzs
	XO5uikM/BvYjfW4QyFH31zOFYyuk8btzUFRwtMOb/t+VIJGcNHJKCVmknmdnRx6Dubq/
	js1HRyqI+LVgqcStzotZSqcIRNcSh9bKOKSR0ACu7isonaOHc3KexPvBYMZP2hRVwJZq
	Enz0D5uizCT+uaRiTcWJmZFcodmACQSLSEZZ+8RRwPZA3nx0YLW3t1vg3y0u/Flu3BMA
	Rv2Cez8MiLfAfV3VKqAsYhoWm3385ksLmSXsszsdTcnxf5Hprq6BkMWDcCWwSSUpR4pM
	uYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=wucW0ENJkanZjxAYCEi1EWrLszBenSug/xHYrNT6Juk=;
	b=mLVF/gO0zYUBHTwijt+PbkvRp+KEMlI/UvnZJMb37KefWFJg7JCcXnKMbvB9+Qrx6+
	3MTqmMSSvRgy0wJlxPJYKOW3YqVRYFy/29js+h3e+GNgFeEeF+H37XP2lA/8Pw9XZUUq
	vXLn0Fyf4scrF1XAZaIRmxHi+olKo6XpIrpurYB0GprgWDcUhgHZIyoV7aNlZFcd46ld
	c0fUuDi2S2vpovJXZK0/rzSGTQ03Ik9pC0THffCstuzFWbS2oeYq3Rdqut+hZJudHGqm
	YTi9zUvq9C+TjU3ZHasKG0W/H6qyD1R4XX0IEyOLe2vVfsNH5LUTopMzrruztavUWBV5
	cJfQ==
X-Gm-Message-State: AG10YORPMbm2n0g0XhaeZLliqKRWzFKbD8POLh7cpV5+vlwUKFGP7WCI2I+fDSHPS1PrYy1xTqsj5DjCgODDdw==
MIME-Version: 1.0
X-Received: by 10.182.210.234 with SMTP id mx10mr13909314obc.47.1453739448920; 
	Mon, 25 Jan 2016 08:30:48 -0800 (PST)
Received: by 10.182.251.133 with HTTP; Mon, 25 Jan 2016 08:30:48 -0800 (PST)
In-Reply-To: <23b13a29380ef5ce43dac44f683d1d48e9734ed4.1453711529.git.liezhi.yang@windriver.com>
References: <cover.1453711529.git.liezhi.yang@windriver.com>
	<23b13a29380ef5ce43dac44f683d1d48e9734ed4.1453711529.git.liezhi.yang@windriver.com>
Date: Mon, 25 Jan 2016 08:30:48 -0800
Message-ID: <CAFNP8Ov7FSQV2Y4FA+9n4ymckotb4R66OnVLMxHEJyiS=ZkCLw@mail.gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: check INITRAMFS_MAXSIZE
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
X-List-Received-Date: Mon, 25 Jan 2016 16:30:49 -0000
Content-Type: multipart/alternative; boundary=001a11c2b46472f279052a2b17d6

--001a11c2b46472f279052a2b17d6
Content-Type: text/plain; charset=UTF-8

Hi,

I noticed we do not document INITRAMFS_MAXSIZE in the ref-manual.  Should
we be?

Thanks,
Scott

On Mon, Jan 25, 2016 at 12:45 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Usually, the initramfs' maxsize can be 1/2 of ram size since modern
> kernel uses tmpfs as initramfs by dafault, and tmpfs allocates 1/2 of
> ram by default at boot time, which will be used to locate the initramfs.
>
> Set INITRAMFS_MAXSIZE to 131072K (128M) by default (ram 256M), the
> initramfs is small usually, for example, core-image-minimal-initramfs is
> about 21M (uncompressed, 17M * 1.3) by default, but if the user add a
> lot pkgs to initramfs, we can error and stop to let the user know ealier
> rather than fail to boot (e.g., OOM-killer) at boot time.
>
> Please see the bug for more info:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5963
>
> [YOCTO #5963]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/image.bbclass |   14 +++++++++++++-
>  meta/conf/bitbake.conf     |    6 ++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3870516..30d1173 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -423,6 +423,9 @@ def get_rootfs_size(d):
>      rootfs_req_size = int(d.getVar('IMAGE_ROOTFS_SIZE', True))
>      rootfs_extra_space = eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE', True))
>      rootfs_maxsize = d.getVar('IMAGE_ROOTFS_MAXSIZE', True)
> +    image_fstypes = d.getVar('IMAGE_FSTYPES', True) or ''
> +    initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES', True) or ''
> +    initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE', True)
>
>      output = subprocess.check_output(['du', '-ks',
>                                        d.getVar('IMAGE_ROOTFS', True)])
> @@ -443,8 +446,17 @@ def get_rootfs_size(d):
>      if rootfs_maxsize:
>          rootfs_maxsize_int = int(rootfs_maxsize)
>          if base_size > rootfs_maxsize_int:
> -            bb.fatal("The rootfs size %d(K) overrides the max size %d(K)"
> % \
> +            bb.fatal("The rootfs size %d(K) overrides
> IMAGE_ROOTFS_MAXSIZE: %d(K)" % \
>                  (base_size, rootfs_maxsize_int))
> +
> +    # Check the initramfs size against INITRAMFS_MAXSIZE (if set)
> +    if image_fstypes == initramfs_fstypes != ''  and initramfs_maxsize:
> +        initramfs_maxsize_int = int(initramfs_maxsize)
> +        if base_size > initramfs_maxsize_int:
> +            bb.error("The initramfs size %d(K) overrides
> INITRAMFS_MAXSIZE: %d(K)" % \
> +                (base_size, initramfs_maxsize_int))
> +            bb.error("You can set INITRAMFS_MAXSIZE a larger value.
> Usually, it should")
> +            bb.fatal("be less than 1/2 of ram size, or you may fail to
> boot it.\n")
>      return base_size
>
>  python set_image_size () {
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7451eb8..e80ee18 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -712,7 +712,13 @@ require conf/sanity.conf
>  DL_DIR ?= "${TOPDIR}/downloads"
>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>  IMAGE_FSTYPES ?= "tar.gz"
> +
>  INITRAMFS_FSTYPES ?= "cpio.gz"
> +# The maximum size in Kbytes for the generated initramfs image size.
> +# Usually, it should be less than 1/2 of ram size, or you may fail to
> +# boot it.
> +INITRAMFS_MAXSIZE ??= "131072"
> +
>  DEFAULT_TASK_PROVIDER ?= "packagegroup-base"
>  MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c2b46472f279052a2b17d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi, <br><br></div>I noticed we do not docum=
ent INITRAMFS_MAXSIZE in the ref-manual.=C2=A0 Should we be?<br><br></div>T=
hanks,<br></div>Scott<br></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Mon, Jan 25, 2016 at 12:45 AM, Robert Yang <span dir=3D"lt=
r">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezh=
i.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Usually, the initramfs&#39; maxsize can be 1/2 of ram size since modern<b=
r>
kernel uses tmpfs as initramfs by dafault, and tmpfs allocates 1/2 of<br>
ram by default at boot time, which will be used to locate the initramfs.<br=
>
<br>
Set INITRAMFS_MAXSIZE to 131072K (128M) by default (ram 256M), the<br>
initramfs is small usually, for example, core-image-minimal-initramfs is<br=
>
about 21M (uncompressed, 17M * 1.3) by default, but if the user add a<br>
lot pkgs to initramfs, we can error and stop to let the user know ealier<br=
>
rather than fail to boot (e.g., OOM-killer) at boot time.<br>
<br>
Please see the bug for more info:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5963" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D5963</a><br>
<br>
[YOCTO #5963]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/classes/image.bbclass |=C2=A0 =C2=A014 ++++++++=
+++++-<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 ++++++<br>
=C2=A02 files changed, 19 insertions(+), 1 deletion(-)<br>
<br>
</span>diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass=
<br>
index 3870516..30d1173 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -423,6 +423,9 @@ def get_rootfs_size(d):<br>
=C2=A0 =C2=A0 =C2=A0rootfs_req_size =3D int(d.getVar(&#39;IMAGE_ROOTFS_SIZE=
&#39;, True))<br>
=C2=A0 =C2=A0 =C2=A0rootfs_extra_space =3D eval(d.getVar(&#39;IMAGE_ROOTFS_=
EXTRA_SPACE&#39;, True))<br>
=C2=A0 =C2=A0 =C2=A0rootfs_maxsize =3D d.getVar(&#39;IMAGE_ROOTFS_MAXSIZE&#=
39;, True)<br>
+=C2=A0 =C2=A0 image_fstypes =3D d.getVar(&#39;IMAGE_FSTYPES&#39;, True) or=
 &#39;&#39;<br>
+=C2=A0 =C2=A0 initramfs_fstypes =3D d.getVar(&#39;INITRAMFS_FSTYPES&#39;, =
True) or &#39;&#39;<br>
+=C2=A0 =C2=A0 initramfs_maxsize =3D d.getVar(&#39;INITRAMFS_MAXSIZE&#39;, =
True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0output =3D subprocess.check_output([&#39;du&#39;, &#39;=
-ks&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(=
&#39;IMAGE_ROOTFS&#39;, True)])<br>
@@ -443,8 +446,17 @@ def get_rootfs_size(d):<br>
=C2=A0 =C2=A0 =C2=A0if rootfs_maxsize:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_maxsize_int =3D int(rootfs_maxsize=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if base_size &gt; rootfs_maxsize_int:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;The rootfs size %=
d(K) overrides the max size %d(K)&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;The rootfs size %=
d(K) overrides IMAGE_ROOTFS_MAXSIZE: %d(K)&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(base_size, r=
ootfs_maxsize_int))<br>
+<br>
+=C2=A0 =C2=A0 # Check the initramfs size against INITRAMFS_MAXSIZE (if set=
)<br>
+=C2=A0 =C2=A0 if image_fstypes =3D=3D initramfs_fstypes !=3D &#39;&#39;=C2=
=A0 and initramfs_maxsize:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 initramfs_maxsize_int =3D int(initramfs_maxsiz=
e)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if base_size &gt; initramfs_maxsize_int:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;The initramfs siz=
e %d(K) overrides INITRAMFS_MAXSIZE: %d(K)&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (base_size, initra=
mfs_maxsize_int))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;You can set INITR=
AMFS_MAXSIZE a larger value. Usually, it should&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;be less than 1/2 =
of ram size, or you may fail to boot it.\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0return base_size<br>
<br>
=C2=A0python set_image_size () {<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 7451eb8..e80ee18 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -712,7 +712,13 @@ require conf/sanity.conf<br>
=C2=A0DL_DIR ?=3D &quot;${TOPDIR}/downloads&quot;<br>
=C2=A0SSTATE_DIR ?=3D &quot;${TOPDIR}/sstate-cache&quot;<br>
=C2=A0IMAGE_FSTYPES ?=3D &quot;tar.gz&quot;<br>
+<br>
=C2=A0INITRAMFS_FSTYPES ?=3D &quot;cpio.gz&quot;<br>
+# The maximum size in Kbytes for the generated initramfs image size.<br>
+# Usually, it should be less than 1/2 of ram size, or you may fail to<br>
+# boot it.<br>
+INITRAMFS_MAXSIZE ??=3D &quot;131072&quot;<br>
+<br>
=C2=A0DEFAULT_TASK_PROVIDER ?=3D &quot;packagegroup-base&quot;<br>
=C2=A0MACHINE_TASK_PROVIDER ?=3D &quot;${DEFAULT_TASK_PROVIDER}&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11c2b46472f279052a2b17d6--
