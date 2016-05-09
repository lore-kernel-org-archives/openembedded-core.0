Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 826B773167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:05:06 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id n10so81938879obb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=KFL8OjPt5G8CNGNecSsn0juUqFrn0zch+/pKwYpuho8=;
	b=auu85H9OdvFc9HvjE9dQeAWnZbw9nZ1J0JqtmiUiUgPXLg/kCUogXREPsHxGY6ck5e
	or2RBdjflDnNX1f2g1tlnZasVZxhLN5XwDXj4+Yg0TqvhSBADLKkqPOeiIH6zyGhzbCc
	Z59mOOi44CW8f/Hy73BfPv4fwn3DeL9f8GZBmG4lw0Y9xIx6FyUJgBOIrPg6PT5fT7xg
	F/Em5cMcJZCwfBsRUZYDh+1JK0GXhWIz/HLhQv6b7HQ4vXNztBkFCBVDGrCBPxx1PMLH
	sYjBfTKrEX7/atnGhunxNe7EAiIH2KTy+xCmyp8qZuCgxFAtUUUdT90cDxWyyrk2xzGs
	UxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=KFL8OjPt5G8CNGNecSsn0juUqFrn0zch+/pKwYpuho8=;
	b=bubOODI/4du/ClHxDYAdhgeCVU/MBH9pBeskU+GrNWlI6YRYyJlKfLAfq4TeS8Nt7V
	Xv9mf+ululD22nqkJCsHvDIpPVPYaKe/jnbwcvzFc1bNwskhDO+MFoC9AX0IXahB/bYZ
	/t/gT4fHQ+aFPL2H+Ccnyu8ItdZG+Fef8ykXV3giH1T9AxDBCpn4RoLAZKNSfNoUuNoW
	169uRb40SxpiiDXuuTumpsnbmKFzzV6dz7EgE2oZ02Mmidgukfr0wzh3PMjI4RjRgmoR
	OVsyD3K6Tj75IM/WrEe1OPX02p9rpJFJLurgzNE4K9BiSMHxfMpBxtuF5rE8wNGaJ27j
	8zgQ==
X-Gm-Message-State: AOPr4FVVbSeUVsF0DE+1RUqQ5OkbNU1enN45R1GIUGyXNVibJ7kxk4A2Nvw8jAGA5FIEn+PWAc8EHi9mfDHsug==
MIME-Version: 1.0
X-Received: by 10.182.72.104 with SMTP id c8mr15849781obv.83.1462795506906;
	Mon, 09 May 2016 05:05:06 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 05:05:06 -0700 (PDT)
In-Reply-To: <29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
Date: Mon, 9 May 2016 08:05:06 -0400
Message-ID: <CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 6/6] classes/image: check kernel config supports IMAGE_FSTYPES items
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
X-List-Received-Date: Mon, 09 May 2016 12:05:06 -0000
Content-Type: multipart/alternative; boundary=f46d0447862f91827f0532679e18

--f46d0447862f91827f0532679e18
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> A lot of the IMAGE_FSTYPES items require the appropriate filesystem
> driver to be enabled in the kernel configuration; e.g. in order to read
> a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check
> to ensure that is the case.
>


So what's the overall design for this ? Is it documented anywhere ? This is
something
that we talked about a couple of years and I have reservations and
objections to
the current implementation.

.. but since I can only see bits and chunks of patches, I'd rather read
something
complete and offer some more detailed feedback.

Bottom line: I see a slippery slope to tightly specified option that depend
on kernel
versions, I see kernel options sprayed all over layers, etc, etc. Which is
exactly
what we've been trying to avoid with the centralized kernel meta-data, and
again,
there's a mechanism that I finished early this year to extend those options
to any
kernel, enforce, warn, error, etc .. but now, I'll just toss it into the
bin.

Cheers,

Bruce


>
> Fixes [YOCTO #5574].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/image.bbclass       | 23 +++++++++++++++++++++++
>  meta/classes/image_types.bbclass | 11 +++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4542e95..c56b053 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -238,9 +238,32 @@ do_rootfs[cleandirs] += "${S}"
>  do_rootfs[umask] = "022"
>  addtask rootfs before do_build
>
> +inherit kernel-check
> +
> +def check_image_fstypes_kernel(d):
> +    """
> +    Check that the kernel we have built has the appropriate config
> options enabled
> +    to support the image formats specified in IMAGE_FSTYPES
> +    """
> +    fstypes = (d.getVar('IMAGE_FSTYPES', True) or '').split()
> +    ctypes = (d.getVar('COMPRESSIONTYPES', True) or '').split()
> +    for fstype in fstypes:
> +        kernconfig = (d.getVar('IMAGE_TYPE_KERNEL_OPTIONS_' + fstype,
> True) or '').split()
> +        for ctype in ctypes:
> +            if fstype.endswith("." + ctype):
> +                basetype = fstype[:-len("." + ctype)]
> +                kernconfig.extend((d.getVar('IMAGE_TYPE_KERNEL_OPTIONS_'
> + basetype, True) or '').split())
> +        kernconfig = list(set(kernconfig))
> +        if kernconfig:
> +            missing, diffvalue = check_kernel_config_options(kernconfig,
> d)
> +            if missing or diffvalue:
> +                bb.warn('IMAGE_FSTYPES contains %s, but the following
> required kernel configuration items are not present in the kernel
> configuration:\n  %s' % (fstype, '\n  '.join(missing + ['%s=%s (actual
> value %s)' % item for item in diffvalue])))
> +
>  fakeroot python do_image () {
>      from oe.utils import execute_pre_post_process
>
> +    check_image_fstypes_kernel(d)
> +
>      pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
>
>      execute_pre_post_process(d, pre_process_cmds)
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 53af7ca..dd79726 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -240,6 +240,17 @@ IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  IMAGE_DEPENDS_multiubi = "mtd-utils-native"
>  IMAGE_DEPENDS_wic = "parted-native"
>
> +IMAGE_TYPE_KERNEL_OPTIONS_jffs2 = "CONFIG_JFFS2_FS"
> +IMAGE_TYPE_KERNEL_OPTIONS_jffs2.sum = "CONFIG_JFFS2_SUMMARY"
> +IMAGE_TYPE_KERNEL_OPTIONS_cramfs = "CONFIG_CRAMFS"
> +IMAGE_TYPE_KERNEL_OPTIONS_ext2 =
> "CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23"
> +IMAGE_TYPE_KERNEL_OPTIONS_ext3 =
> "CONFIG_EXT3_FS|CONFIG_EXT4_USE_FOR_EXT23"
> +IMAGE_TYPE_KERNEL_OPTIONS_ext4 = "CONFIG_EXT4_FS"
> +IMAGE_TYPE_KERNEL_OPTIONS_btrfs = "CONFIG_BTRFS_FS"
> +IMAGE_TYPE_KERNEL_OPTIONS_squashfs = "CONFIG_SQUASHFS"
> +IMAGE_TYPE_KERNEL_OPTIONS_squashfs-xz = "CONFIG_SQUASHFS_XZ"
> +IMAGE_TYPE_KERNEL_OPTIONS_squashfs-lzo = "CONFIG_SQUASHFS_LZO"
> +
>  # This variable is available to request which values are suitable for
> IMAGE_FSTYPES
>  IMAGE_TYPES = " \
>      jffs2 jffs2.sum \
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d0447862f91827f0532679e18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>A lot of the IMAGE_FSTYPES items require the appropriate filesystem<br>
driver to be enabled in the kernel configuration; e.g. in order to read<br>
a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check<br>
to ensure that is the case.<br></blockquote><div><br></div><div><br></div><=
div>So what&#39;s the overall design for this ? Is it documented anywhere ?=
 This is something</div><div>that we talked about a couple of years and I h=
ave reservations and objections to=C2=A0</div><div>the current implementati=
on.</div><div><br></div><div>.. but since I can only see bits and chunks of=
 patches, I&#39;d rather read something</div><div>complete and offer some m=
ore detailed feedback.</div><div><br></div><div>Bottom line: I see a slippe=
ry slope to tightly specified option that depend on kernel</div><div>versio=
ns, I see kernel options sprayed all over layers, etc, etc. Which is exactl=
y</div><div>what we&#39;ve been trying to avoid with the centralized kernel=
 meta-data, and again,</div><div>there&#39;s a mechanism that I finished ea=
rly this year to extend those options to any</div><div>kernel, enforce, war=
n, error, etc .. but now, I&#39;ll just toss it into the bin.</div><div><br=
></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
Fixes [YOCTO #5574].<br>
<br>
Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++++++++=
++++++++++++<br>
=C2=A0meta/classes/image_types.bbclass | 11 +++++++++++<br>
=C2=A02 files changed, 34 insertions(+)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 4542e95..c56b053 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -238,9 +238,32 @@ do_rootfs[cleandirs] +=3D &quot;${S}&quot;<br>
=C2=A0do_rootfs[umask] =3D &quot;022&quot;<br>
=C2=A0addtask rootfs before do_build<br>
<br>
+inherit kernel-check<br>
+<br>
+def check_image_fstypes_kernel(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Check that the kernel we have built has the appropriate conf=
ig options enabled<br>
+=C2=A0 =C2=A0 to support the image formats specified in IMAGE_FSTYPES<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 fstypes =3D (d.getVar(&#39;IMAGE_FSTYPES&#39;, True) or &#39=
;&#39;).split()<br>
+=C2=A0 =C2=A0 ctypes =3D (d.getVar(&#39;COMPRESSIONTYPES&#39;, True) or &#=
39;&#39;).split()<br>
+=C2=A0 =C2=A0 for fstype in fstypes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernconfig =3D (d.getVar(&#39;IMAGE_TYPE_KERNE=
L_OPTIONS_&#39; + fstype, True) or &#39;&#39;).split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ctype in ctypes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fstype.endswith(&quot;.&quot;=
 + ctype):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basetype =3D fstyp=
e[:-len(&quot;.&quot; + ctype)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernconfig.extend(=
(d.getVar(&#39;IMAGE_TYPE_KERNEL_OPTIONS_&#39; + basetype, True) or &#39;&#=
39;).split())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernconfig =3D list(set(kernconfig))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if kernconfig:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing, diffvalue =3D check_ker=
nel_config_options(kernconfig, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if missing or diffvalue:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&#39;IMAGE=
_FSTYPES contains %s, but the following required kernel configuration items=
 are not present in the kernel configuration:\n=C2=A0 %s&#39; % (fstype, &#=
39;\n=C2=A0 &#39;.join(missing + [&#39;%s=3D%s (actual value %s)&#39; % ite=
m for item in diffvalue])))<br>
+<br>
=C2=A0fakeroot python do_image () {<br>
=C2=A0 =C2=A0 =C2=A0from oe.utils import execute_pre_post_process<br>
<br>
+=C2=A0 =C2=A0 check_image_fstypes_kernel(d)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0pre_process_cmds =3D d.getVar(&quot;IMAGE_PREPROCESS_CO=
MMAND&quot;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0execute_pre_post_process(d, pre_process_cmds)<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index 53af7ca..dd79726 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -240,6 +240,17 @@ IMAGE_DEPENDS_ubifs =3D &quot;mtd-utils-native&quot;<b=
r>
=C2=A0IMAGE_DEPENDS_multiubi =3D &quot;mtd-utils-native&quot;<br>
=C2=A0IMAGE_DEPENDS_wic =3D &quot;parted-native&quot;<br>
<br>
+IMAGE_TYPE_KERNEL_OPTIONS_jffs2 =3D &quot;CONFIG_JFFS2_FS&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_jffs2.sum =3D &quot;CONFIG_JFFS2_SUMMARY&quot;<b=
r>
+IMAGE_TYPE_KERNEL_OPTIONS_cramfs =3D &quot;CONFIG_CRAMFS&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_ext2 =3D &quot;CONFIG_EXT2_FS|CONFIG_EXT4_USE_FO=
R_EXT23&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_ext3 =3D &quot;CONFIG_EXT3_FS|CONFIG_EXT4_USE_FO=
R_EXT23&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_ext4 =3D &quot;CONFIG_EXT4_FS&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_btrfs =3D &quot;CONFIG_BTRFS_FS&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_squashfs =3D &quot;CONFIG_SQUASHFS&quot;<br>
+IMAGE_TYPE_KERNEL_OPTIONS_squashfs-xz =3D &quot;CONFIG_SQUASHFS_XZ&quot;<b=
r>
+IMAGE_TYPE_KERNEL_OPTIONS_squashfs-lzo =3D &quot;CONFIG_SQUASHFS_LZO&quot;=
<br>
+<br>
=C2=A0# This variable is available to request which values are suitable for=
 IMAGE_FSTYPES<br>
=C2=A0IMAGE_TYPES =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0jffs2 jffs2.sum \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--f46d0447862f91827f0532679e18--
