Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B3E7978F12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 12:58:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h14-v6so10463192wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9h/X4KqPmShjjwstPcp0hOQ7tnPtXD6sue39RZMou0I=;
	b=tf7/yGUrdNF8wJrGk+lV+9zvGsBXTYQ0MzSHujEmklO16tnBsEW6LJpg0iLUYDMxMe
	MuQHuWsPsWH1A610RgQqkinH52VBwqXu8atVKPQ1ArrNhOXientAGqsLdI2bKyU5rakQ
	YUY1cDK2A+tIvuoFgzSnbJEprxZxElam1wYN5Hl32fEnHj2xl76WPFCN/kOLrOT3oDqP
	os034a6ZN/9A/nHa84X8WWJOQ95+x00Ktf1WYIC+2tJEMJ28imGVQVc7xUQylrF8NzNF
	W4gnjIz5CQa/2LavE2b0WkVnW548kzGufKnfT/EB37kztnoppXhqLu8GMXngoS63tBYL
	TfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9h/X4KqPmShjjwstPcp0hOQ7tnPtXD6sue39RZMou0I=;
	b=PalnddUQjKg5+ltLN/+DAou25xVMalCAcsO16hEXKnYBSHV8sESVva0PDSTkLaqf3S
	Eg/6pwgbYyUsVRd7HKVfJiaSGVWGgaKtSI6/4WZ/7V1soAFSzSn5zODTdykiRo6uUzU3
	yIkp2uuj1fuW8j4QYjHAhRFmVfVEs4bGEYnbt8fG1KHfS3ifL/z7KIPiihGgf4zE/FL/
	hySQC3EWJGe2tGzp6dA4vT3ySDmSJeO2VkK6QSNU4xRozz2vdtB87qflmgqL7sz27+T1
	BrizHSrYXz2Rh43kxX1NT5vPo0zTbuh63+SGLnvYpDJcIhRqbjmNhGCo+Do+ogF+ccmU
	34Vg==
X-Gm-Message-State: AOUpUlGbnYEFkafCAwQeZKzdqK5gPbSpI2LHh3bk8VJm6SH/iqT1Y61F
	Osl+aYq9t+65wXOEb7iChjgr83FavycFrkme2eE=
X-Google-Smtp-Source: AA+uWPywD9Wu41enOr0gH6dGBJtZQXd5Zi9Sbx1HVWaPnqGgJiChM+zMe8hzNOz2cw6ZuYt7sdNnAp79PoZlpk7/z3E=
X-Received: by 2002:adf:aadb:: with SMTP id
	i27-v6mr6603001wrc.149.1533992328182; 
	Sat, 11 Aug 2018 05:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <1533911276-12983-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1533911276-12983-1-git-send-email-mikko.rapeli@bmw.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 Aug 2018 14:58:37 +0200
Message-ID: <CA+chaQdP0Lq3fWvPBAk4hzwnO-6bYvfTg0oXLC-OWVV=hPxJVA@mail.gmail.com>
To: mikko.rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: fail if src path does not exist
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
X-List-Received-Date: Sat, 11 Aug 2018 12:58:48 -0000
Content-Type: multipart/alternative; boundary="000000000000cf45cd0573286b98"

--000000000000cf45cd0573286b98
Content-Type: text/plain; charset="UTF-8"

I think this will break support for older kernels added in:
http://git.openembedded.org/openembedded-core/commit/?id=19fb2d11a8bb3c6dfdd5edc1b9155d642dc0f5e0

kernel-source/tools/arch and kernel-source/tools/build are missing in 3.16
kernel even when it's not completely broken.

I'm not completely against this change, maybe just add to commit message
that for older kernels you need to add .bbappend which removes the
directories which really doesn't exist in your kernel version from PERF_SRC.

On Fri, Aug 10, 2018 at 4:55 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> A missing src directory from a broken kernel recipe resulted
> only in a warning:
>
> WARNING: copyfile: stat of
> /home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch
> failed ([Errno 2] No such file or directory:
> '/home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch')
>
> With this change it's an error which can not be missed:
>
> ERROR: perf-1.0-r9 do_configure: Path does not exist:
> /home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch
> ERROR: perf-1.0-r9 do_configure: Function failed:
> copy_perf_source_from_kernel
> ERROR: Logfile of failure stored in:
> /home/builder/src/tmp-glibc/work/target-linux/perf/1.0-r9/temp/log.do_configure.21083
> NOTE: recipe perf-1.0-r9: task do_configure: Failed
> ERROR: Task (/home/builder/src/poky/meta/recipes-kernel/perf/perf.bb:do_configure)
> failed with exit code '1'
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 2c6bbb4..c07afeb 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -147,6 +147,8 @@ python copy_perf_source_from_kernel() {
>      for s in sources:
>          src = oe.path.join(src_dir, s)
>          dest = oe.path.join(dest_dir, s)
> +        if not os.path.exists(src):
> +            bb.fatal("Path does not exist: %s" % src)
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

--000000000000cf45cd0573286b98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this will break support for older kernels add=
ed in:</div><div><a href=3D"http://git.openembedded.org/openembedded-core/c=
ommit/?id=3D19fb2d11a8bb3c6dfdd5edc1b9155d642dc0f5e0">http://git.openembedd=
ed.org/openembedded-core/commit/?id=3D19fb2d11a8bb3c6dfdd5edc1b9155d642dc0f=
5e0</a><br></div><div><br></div>kernel-source/tools/arch and=C2=A0kernel-so=
urce/tools/build are missing in=C2=A03.16 kernel even when it&#39;s not com=
pletely broken.<br><div><br></div><div>I&#39;m not completely against this =
change, maybe just add to commit message that for older kernels you need to=
 add .bbappend which removes the directories which really doesn&#39;t exist=
 in your kernel version from PERF_SRC.</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Fri, Aug 10, 2018 at 4:55 PM Mikko Rapeli &lt;<a =
href=3D"mailto:mikko.rapeli@bmw.de">mikko.rapeli@bmw.de</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">A missing src directory from a broken k=
ernel recipe resulted<br>
only in a warning:<br>
<br>
WARNING: copyfile: stat of /home/builder/src/tmp-glibc/work-shared/target/k=
ernel-source/tools/arch failed ([Errno 2] No such file or directory: &#39;/=
home/builder/src/tmp-glibc/work-shared/target/kernel-source/tools/arch&#39;=
)<br>
<br>
With this change it&#39;s an error which can not be missed:<br>
<br>
ERROR: perf-1.0-r9 do_configure: Path does not exist: /home/builder/src/tmp=
-glibc/work-shared/target/kernel-source/tools/arch<br>
ERROR: perf-1.0-r9 do_configure: Function failed: copy_perf_source_from_ker=
nel<br>
ERROR: Logfile of failure stored in: /home/builder/src/tmp-glibc/work/targe=
t-linux/perf/1.0-r9/temp/log.do_configure.21083<br>
NOTE: recipe perf-1.0-r9: task do_configure: Failed<br>
ERROR: Task (/home/builder/src/poky/meta/recipes-kernel/perf/perf.bb:do_con=
figure) failed with exit code &#39;1&#39;<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" targ=
et=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 2c6bbb4..c07afeb 100644<br>
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
st: %s&quot; % src)<br>
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

--000000000000cf45cd0573286b98--
