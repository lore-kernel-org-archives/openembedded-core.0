Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96B887900D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 12:07:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l2-v6so15415190wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 05:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S/+cQLS1+G+p4KwL8UVnZZcSAh3ePGUJ9fvhy7C7OhM=;
	b=i94p1wU6apV7coUqawZ7gKyliBQ5lCVfzlr//0jEkzr7T5rfbqbNsO3arNdIGCfcE4
	kZP+lcnv9oxmG+swnT/opdbGGGobotCWRvrG2as59YTKHShZkw4Y8XFr+y/9/NzW/hhq
	hqsMFbGl6ZycD9DBPxQyRwu7ZvVSoENEReUiI2mqqVKnmG8X10DFIg9AeN5pTjXXhgrm
	sMKgnWrE8nNYgSLYqqHdzsL1TLr7PxZosUU/VvoT7jQXARV8RF5U7ZoCE+2cYEfxIuY6
	5RpdDB+15IAKd7pUmzqCtoJxbRnfyXUimGcFPiYQqJA+9p1f+w0z8jm/V+TI9dcZ7bbZ
	uoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S/+cQLS1+G+p4KwL8UVnZZcSAh3ePGUJ9fvhy7C7OhM=;
	b=sksW4tEvj+JAKdeeJq6+qZ0Y7bfNTaSena50OmS/bkvm5C4OQo6TyFLQqtlSpQGXHZ
	sCeghXaJ48uL1B5xgPuh9xIijPMduDSrL5bn9vzgUPmqmIWFXJUUyFVOKLbEo+sntmd+
	STOsvM8jUYfRfQ8dk7xbbhN/kikFSX8Qr9YkS52Z8mWV+P09i3ArDo1p2FaCaaXcyFBJ
	OtarUJQlNdpYMU2L9+hb22CAO2OP1QZQNHkO0BZbYpsDieAUz6VRtCU5OmwrVfPSjqSY
	FWg0yvfg2uCN9RIJ9/qeCIqAItY8TqyHrJybx25Z6uWg4SZYIkA5lI8gF2rBObjc8G6o
	SyZQ==
X-Gm-Message-State: AOUpUlFRrxA7qVK8nWg5WGNbSLhtsoZM9gazLoqr/is8rV2E8pVCQ9K6
	Yn8+iM5L2q/dqm+Bl4Q7FwH3HPm0Cfy1TSJJC2Y=
X-Google-Smtp-Source: AA+uWPyzz+SoXmZZHiW9p3Rf71bQA/khVLe7t9xqAEGwf5ubv7QlMr0emAJ77NcmuXnwoMcl8odBAothRdjmAQeJylw=
X-Received: by 2002:a1c:cf0a:: with SMTP id
	f10-v6mr15182690wmg.32.1534421245305; 
	Thu, 16 Aug 2018 05:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <1534153337-27563-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1534153337-27563-1-git-send-email-mikko.rapeli@bmw.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Aug 2018 14:07:16 +0200
Message-ID: <CA+chaQdY2FbG7SFrZm1hdi95JsfJqNZ3ArSpe-0G0iqK6z=OvA@mail.gmail.com>
To: mikko.rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] perf: fail if src path does not exist
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
X-List-Received-Date: Thu, 16 Aug 2018 12:07:24 -0000
Content-Type: multipart/alternative; boundary="00000000000043290005738c49da"

--00000000000043290005738c49da
Content-Type: text/plain; charset="UTF-8"

Thanks for updated version.

Just in case someone needs to build perf with e.g. 3.16 kernel, then you
need bbappend like this:


# need to copy few more files to support building with old 3.16 kernel
PERF_SRC_append = " scripts arch lib"

# ERROR: perf-1.0-r9 do_configure: Path does not exist:
kernel-source/tools/arch. Maybe PERF_SRC does not match the kernel version.
PERF_SRC_remove = "tools/arch tools/build"


On Mon, Aug 13, 2018 at 11:42 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> A missing src directory from a broken kernel recipe resulted
> only in a warning:
>
> WARNING: copyfile: stat of
> /home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch
> failed ([Errno 2] No such file or directory:
> '/home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch')
>
> and the build failed horribly.
>
> With this change it's an error which can not be missed:
>
> ERROR: perf-1.0-r9 do_configure: Path does not exist:
> /home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch.
> Maybe PERF_SRC does not match the kernel version.
> ERROR: perf-1.0-r9 do_configure: Function failed:
> copy_perf_source_from_kernel
> ERROR: Logfile of failure stored in:
> /home/builder/src/tmp-glibc/work/target-linux/perf/1.0-r9/temp/log.do_configure.21083
> NOTE: recipe perf-1.0-r9: task do_configure: Failed
> ERROR: Task (/home/builder/src/poky/meta/recipes-kernel/perf/perf.bb:do_configure)
> failed with exit code '1'
>
> To get get perf compiling from a custom kernel, a perf.bbappend can be
> created which defines PERF_SRC as list of files and directories needed
> from kernel source tree to compile perf. This varies between kernel
> versions.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> v1:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154028.html
> Added PERF_SRC variable to the error message and commit message
> as suggested by Martin Jansa in
>
> http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154038.html
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 2c6bbb4..c1ce4b4 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -147,6 +147,8 @@ python copy_perf_source_from_kernel() {
>      for s in sources:
>          src = oe.path.join(src_dir, s)
>          dest = oe.path.join(dest_dir, s)
> +        if not os.path.exists(src):
> +            bb.fatal("Path does not exist: %s. Maybe PERF_SRC does not
> match the kernel version." % src)
>          if os.path.isdir(src):
>              oe.path.copyhardlinktree(src, dest)
>          else:
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000043290005738c49da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for updated version.</div><div><br></div><div>=
Just in case someone needs to build perf with e.g. 3.16 kernel, then you ne=
ed bbappend like this:</div><div><br></div><div><br></div><div># need to co=
py few more files to support building with old 3.16 kernel</div><div>PERF_S=
RC_append =3D &quot; scripts arch lib&quot;</div><div><br></div><div># ERRO=
R: perf-1.0-r9 do_configure: Path does not exist: kernel-source/tools/arch.=
 Maybe PERF_SRC does not match the kernel version.</div><div>PERF_SRC_remov=
e =3D &quot;tools/arch tools/build&quot;</div><div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Aug 13, 2018 at 11:42 AM Mi=
kko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de">mikko.rapeli@bmw.de</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">A missing src directo=
ry from a broken kernel recipe resulted<br>
only in a warning:<br>
<br>
WARNING: copyfile: stat of /home/builder/src/tmp-glibc/work-shared/target/k=
ernel-source/tools/arch failed ([Errno 2] No such file or directory: &#39;/=
home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch&#39;=
)<br>
<br>
and the build failed horribly.<br>
<br>
With this change it&#39;s an error which can not be missed:<br>
<br>
ERROR: perf-1.0-r9 do_configure: Path does not exist: /home/builder/src/tmp=
-glibc/work-shared/target/kernel-source/tools/arch. Maybe PERF_SRC does not=
 match the kernel version.<br>
ERROR: perf-1.0-r9 do_configure: Function failed: copy_perf_source_from_ker=
nel<br>
ERROR: Logfile of failure stored in: /home/builder/src/tmp-glibc/work/targe=
t-linux/perf/1.0-r9/temp/log.do_configure.21083<br>
NOTE: recipe perf-1.0-r9: task do_configure: Failed<br>
ERROR: Task (/home/builder/src/poky/meta/recipes-kernel/perf/perf.bb:do_con=
figure) failed with exit code &#39;1&#39;<br>
<br>
To get get perf compiling from a custom kernel, a perf.bbappend can be<br>
created which defines PERF_SRC as list of files and directories needed<br>
from kernel source tree to compile perf. This varies between kernel<br>
versions.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" targ=
et=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
v1: <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/20=
18-August/154028.html" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/pipermail/openembedded-core/2018-August/154028.html</a><br>
Added PERF_SRC variable to the error message and commit message<br>
as suggested by Martin Jansa in<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-A=
ugust/154038.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openem=
bedded.org/pipermail/openembedded-core/2018-August/154038.html</a><br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 2c6bbb4..c1ce4b4 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -147,6 +147,8 @@ python copy_perf_source_from_kernel() {<br>
=C2=A0 =C2=A0 =C2=A0for s in sources:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D oe.path.join(src_dir, s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D oe.path.join(dest_dir, s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(src):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Path does not exi=
st: %s. Maybe PERF_SRC does not match the kernel version.&quot; % src)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.isdir(src):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.copyhardlinktree(sr=
c, dest)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000043290005738c49da--
