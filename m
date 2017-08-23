Return-Path: <andrei@gherzan.ro>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 09CA171957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:30:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v186so514404wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eGlCkskp3wcYzPX9uTRFKk13FM+GYzodlsKB/Bmakb0=;
	b=hgzPOGfZBp6DSDUFvhuwBY1XNTUlKa1gF7sGgz2t7/da/UaCYypwSdaNY4LfqXlIj1
	ENK2GrSm6/I3AC3KEbmZ0IRnxS0JBsgU/93pctIWxfP6NnOAReyyMA5CVx03UGLtofm5
	0jvK1mpPglbR5fck40n9w4r8yH/tSD1J5tmwbEYOsGsLU0EJpgTL8s3ZDl3lxEZvCpND
	mVWR9plUyBJIA/xlMxLYoOb3idnwUrRruHSMxQRKevLplwKA5eeQ8qBggcXfquoUyx58
	ka1W/fptUUyJlVFPodwY42+E6yyRl3HL4eflLjQz4nFDv1jlrYCRnNSltiLtucf2YRoE
	OFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eGlCkskp3wcYzPX9uTRFKk13FM+GYzodlsKB/Bmakb0=;
	b=hyYqawxLB6uVEcRwXNldicAVqB/RYvbgSZtOHwi7Wa7Tf0U3WnExrNvfdRGKcAhrjR
	lFX3Y8uSx1QV4AbQy9DHj6YsWALc8KCWR8Di2YlQg0iDAbfya3TDcTeoWEnRMKz9KWu7
	HOrVK42T4OuEnXKLGcCPUjWagG+yfoZ3m+a//c/6vatke4bUALn35+wNPvqFFajMhbTN
	8fHqzAqvzLWY1dnuDE+2t9Owt8y4AzAAJ+LwJx0wKZgsH847LpQPRmdKCU5oTA6Ipglv
	264XO7kcyfki73BbSc+vE+f78hH6yxXduXj1mutcYbEFWXE6STPkmpU8tkQXWmrIUxMv
	HhKQ==
X-Gm-Message-State: AHYfb5gycp/5ZGOpUK55FpcMl01AxYHgcW2rBLmSgUwnmqLXDC83ZFHY
	Rs6pBXDfQnhutVMBoDIZGBbsKRrE9Qoj
X-Received: by 10.28.100.194 with SMTP id y185mr1716808wmb.95.1503516626803;
	Wed, 23 Aug 2017 12:30:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.45.195 with HTTP; Wed, 23 Aug 2017 12:29:46 -0700 (PDT)
X-Originating-IP: [82.22.166.118]
In-Reply-To: <1503516020-21385-1-git-send-email-bruce.ashfield@windriver.com>
References: <1503516020-21385-1-git-send-email-bruce.ashfield@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 23 Aug 2017 20:29:46 +0100
Message-ID: <CAK18fxHR10utU+YqNVv09Y7c8bUd_T7fuqGG88SZ5Wr2dtyi8g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-yocto: relax BSP definition test
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
X-List-Received-Date: Wed, 23 Aug 2017 19:30:26 -0000
Content-Type: multipart/alternative; boundary="001a114afa52747ca8055770be5d"

--001a114afa52747ca8055770be5d
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 8:20 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> commit 44aea7b873 [kernel-yocto: ensure that only valid BSPs are built]
> introduced a new check to ensure that a valid BSP definition was found,
> rather than building something that 'closely' matched the current
> MACHINE.
>
> This check breaks valid configurations which do not have a bsp
> definition but are otherwise completely configured machines.
>
> To allow both elements to co-exist (and not add warnings or errors
> to otherwise valid builds), we first check to see if an empty bsp
> definition was found, but then check to see if a defconfig was
> provided.
>
> If a defconfig has been provided, that is a sign that the board
> configuration is complete and we should continue the build without
> otherwise bothering the user.
>
> Tested on meta-raspberrypi and linux-yocto*
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> v2: fixed the badly placed -q
>
>  meta/classes/kernel-yocto.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 3c6df92131bc..20b4942320d6 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -143,8 +143,11 @@ do_kernel_metadata() {
>
>         # expand kernel features into their full path equivalents
>         bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE}
> -DKTYPE=${LINUX_KERNEL_TYPE})
> -       if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
> -               bbfatal_log "Could not locate BSP definiton for
> ${KMACHINE}/${LINUX_KERNEL_TYPE}."
> +       if [ -z "$bsp_definition" ]; then
> +               echo "$sccs" | grep -q defconfig
> +               if [ $? -ne 0 ]; then
> +                       bberror "Could not locate BSP definition for
> ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
> +               fi
>         fi
>         meta_dir=$(kgit --meta)
>
>
Looks good.

--001a114afa52747ca8055770be5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div><div class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><=
br></div></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Aug 23, 2017 at 8:20 PM, Bruce Ashfi=
eld <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" t=
arget=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span class=3D"">commit 44aea7b873 [kernel-yocto=
: ensure that only valid BSPs are built]<br>
introduced a new check to ensure that a valid BSP definition was found,<br>
rather than building something that &#39;closely&#39; matched the current<b=
r>
MACHINE.<br>
<br>
This check breaks valid configurations which do not have a bsp<br>
definition but are otherwise completely configured machines.<br>
<br>
To allow both elements to co-exist (and not add warnings or errors<br>
to otherwise valid builds), we first check to see if an empty bsp<br>
definition was found, but then check to see if a defconfig was<br>
provided.<br>
<br>
If a defconfig has been provided, that is a sign that the board<br>
configuration is complete and we should continue the build without<br>
otherwise bothering the user.<br>
<br>
Tested on meta-raspberrypi and linux-yocto*<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
<br>
</span>v2: fixed the badly placed -q<br>
<span class=3D""><br>
=C2=A0meta/classes/kernel-yocto.<wbr>bbclass | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.<wbr>bbclass b/meta/classes/kernel-y=
octo.<wbr>bbclass<br>
</span>index 3c6df92131bc..20b4942320d6 100644<br>
<span class=3D"">--- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
+++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
@@ -143,8 +143,11 @@ do_kernel_metadata() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # expand kernel features into their full path e=
quivalents<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bsp_definition=3D$(spp ${includes} --find -DKMA=
CHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ] || [ -z &quot;${bsp_definition}=
&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;C=
ould not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_<wbr>TYPE}.&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$bsp_definition&quot; ]; then<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$=
sccs&quot; | grep -q defconfig<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bberror &quot;Could not locate BSP definition for ${KMACHINE}/${L=
INUX_KERNEL_<wbr>TYPE} and no defconfig was provided&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_dir=3D$(kgit --meta)<br><br></div></div></=
blockquote><div><br></div><div>Looks good. =C2=A0</div></div></div></div>

--001a114afa52747ca8055770be5d--
