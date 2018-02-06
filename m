Return-Path: <sstncr@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D6D4971ABD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 10:29:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i8so1598800qtj.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 02:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=BR/B7kATkCDl0FOphYjDX2xRUPyxDHTrVVKHijTDCAE=;
	b=GPt+HgYOLhb42nYaJo2H7HeUHFn4xon6jWhBXXRQoRFPg6FkpSJkQezhSry3+U0tum
	tfc/0YDdanOmxIevZBLh1o2GW7e96KsF9y09Xi51d90s4ctHVru+vHZTY/Evltf7LbhJ
	VzA2HtVj4ds0J87ZmY+pCuSJjKV+3sYQpvyGsHM0JmqJMTfA/dKDuVa2WCREjxMU08No
	OQrCXlm0sjaI3lgomXcbeiv95QAJa9IaUsK0dx/xwOb7snzOHND3VlhVIjCrRFj44ZvL
	73q50dTXQb8Zsut8HvTqOyYQE+K1AuadjNoDUSbB7jCW66qK2rfn+9/Giv4AyIydnL8c
	xniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=BR/B7kATkCDl0FOphYjDX2xRUPyxDHTrVVKHijTDCAE=;
	b=OkNVO+KSHFH+GRUfca68mXe1UwDXhcXqgNuI65xe8Y3bcCFjlFT7CgvgXFHVLx23Pv
	sPE81jb/1hnr1ozJeqK6fNPsl58snqNkEfMlIu5x0NDX6oam1QCu771qY5nxIQ1LfGOk
	UHJGDj6Xnrdb0+Nq10K90plA3j0+kdXpJ3827dMaXiLYoxe8GNg9ROGTQYyju+kh2ZcI
	edBxggNG876uUIzsSAKA5wDKM7SPH48+TYj+LXfmVZJ3mq18VSQxFbYaJ4o4aET5xBno
	/72QPo5c1muLdKwuLDdc/Ji7dhX4+/wImX1Ax2p5+UzxQubAfjJvjnuhXAzkmC1EDRyc
	XoNQ==
X-Gm-Message-State: APf1xPBVzFLYZUb+ybXEuWL+omrExqweptGxr9EmVp+2CXrsK5gff4QN
	wCWsZGqouVlntrZjWg38hXI1/8P7+lzbQ9rH7RVneA==
X-Google-Smtp-Source: AH8x226YYoNeTLFoPQ1vPv04xSW0vV5anntggGpIIBVFqx4c95sADpgEy/i2K9bPjI9dBWb9PwAOdo24S6LmT0PX+zA=
X-Received: by 10.237.54.132 with SMTP id f4mr2534799qtb.139.1517912950674;
	Tue, 06 Feb 2018 02:29:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.56.246 with HTTP; Tue, 6 Feb 2018 02:29:10 -0800 (PST)
In-Reply-To: <1517236726-28726-1-git-send-email-sstncr@gmail.com>
References: <1517236726-28726-1-git-send-email-sstncr@gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
Date: Tue, 6 Feb 2018 12:29:10 +0200
Message-ID: <CANr+NRux9=8NBmQKY7a0o5MYoT8Y77pwzVFtGQrdQVJnFpFUGw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Tue, 06 Feb 2018 10:29:10 -0000
Content-Type: multipart/alternative; boundary="001a1144d68439a86e056488a61b"

--001a1144d68439a86e056488a61b
Content-Type: text/plain; charset="UTF-8"

Ping?

On Mon, Jan 29, 2018 at 4:38 PM, Stefan Stanacar <sstncr@gmail.com> wrote:

> do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run,
> since
> do_unpack gets removed by when externalsrc is enabled.
>
> This was hidden because externalsrc does actually run do_fetch and
> do_unpack if
> there are type=kmeta or file:// entries in the SRC_URI value of the kernel
> recipe.
> (which is the case for linux-yocto).
>
> Make this a separate task so that it actually gets run for kernel recipes
> with
> no file:// or type=kmeta in SRC_URI.
>
> Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 2f6eca3..6a8d6e8 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -125,7 +125,7 @@ inherit ${KERNEL_CLASSES}
>  # the symlink.
>  do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}
> ${STAGING_KERNEL_BUILDDIR}"
>  do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}
> ${STAGING_KERNEL_BUILDDIR}"
> -base_do_unpack_append () {
> +python do_symlink_staging_dir () {
>      s = d.getVar("S")
>      if s[-1] == '/':
>          # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use
> s as directory name and fail
> @@ -142,6 +142,7 @@ base_do_unpack_append () {
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> +addtask do_symlink_staging_dir after do_unpack before do_patch
> do_configure
>
>  inherit kernel-arch deploy
>
> --
> 2.7.4
>
>

--001a1144d68439a86e056488a61b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping?<br><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Mon, Jan 29, 2018 at 4:38 PM, Stefan Stanacar <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:sstncr@gmail.com" target=3D"_blank">sstncr@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">do_unpack is by de=
fault in SRCTREECOVEREDTASKS so this append can&#39;t run, since<br>
do_unpack gets removed by when externalsrc is enabled.<br>
<br>
This was hidden because externalsrc does actually run do_fetch and do_unpac=
k if<br>
there are type=3Dkmeta or file:// entries in the SRC_URI value of the kerne=
l recipe.<br>
(which is the case for linux-yocto).<br>
<br>
Make this a separate task so that it actually gets run for kernel recipes w=
ith<br>
no file:// or type=3Dkmeta in SRC_URI.<br>
<br>
Signed-off-by: Stefan Stanacar &lt;<a href=3D"mailto:sstncr@gmail.com">sstn=
cr@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 2f6eca3..6a8d6e8 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -125,7 +125,7 @@ inherit ${KERNEL_CLASSES}<br>
=C2=A0# the symlink.<br>
=C2=A0do_unpack[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_DIR} ${B} ${ST=
AGING_KERNEL_BUILDDIR}&quot;<br>
=C2=A0do_clean[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_DIR} ${B} ${STA=
GING_KERNEL_BUILDDIR}&quot;<br>
-base_do_unpack_append () {<br>
+python do_symlink_staging_dir () {<br>
=C2=A0 =C2=A0 =C2=A0s =3D d.getVar(&quot;S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if s[-1] =3D=3D &#39;/&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# drop trailing slash, so that os.symlink=
(kernsrc, s) doesn&#39;t use s as directory name and fail<br>
@@ -142,6 +142,7 @@ base_do_unpack_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(kernsrc, s)<br>
=C2=A0}<br>
+addtask do_symlink_staging_dir after do_unpack before do_patch do_configur=
e<br>
<br>
=C2=A0inherit kernel-arch deploy<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a1144d68439a86e056488a61b--
