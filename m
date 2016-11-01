Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 02CCE71BDF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:46:07 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w194so3639559vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UtCO3TnYi+XaT0uGma8g45HE5OQeOZ2QSMT82ZjN3gA=;
	b=u7HbhOzVx2nK02Js5CJ4zLIEm6Aay7KOkReneRzin0iMZy0k5eawpk2K39iTBXT09x
	QUdFL5KH+Bz9+eAzHRAmC/d+4L04G1mkovToLZifLANPngTWIuQJULtGhjz+quNvipb8
	7xXO0+pIebK7qBiIa25fQG7oBx+kPT2a0m0mFQgKsBE0VeuFBZlVVMt+TTUYKUrmuZjO
	3y392jn2/ccvjmGuYlpJq8675Mag7OUY5BVLOTD0k4DJHYgRdcPuKLJZKx2fWGIj8QSL
	kBL6GjCsg4d876f0aXSnolwzWSG3PrIZZf3GAYwLagPlgh5icsD0ozAg/PONuhj9cy5Z
	RbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UtCO3TnYi+XaT0uGma8g45HE5OQeOZ2QSMT82ZjN3gA=;
	b=chg+iMQc0MFsT2YF2VkzGy4lloyKFAO8UpH8iKWc+OdZ8X9Ciqhxit9JpxxvqOzb44
	8QNpLB5V1bv/5oOc7VYJs9r9DxSWEcybu+WqL5LrhsHc02nihvB9RkbTfRH/LM47nKy7
	YQVJKJEQQoIraZfqRcPzJEwsTBBhAIJrSdikV2grDnRzgfRIkXg5j/wIdUQsjyw76ZBC
	QDHDXCJjnqyWXmr0d74SwzxUJvieNkqOsjxXNBULLIUpdb4pCY3S6SK71nFiW3HesrIg
	nY4Nlc9eJPomaNri0sJN+0LXA9u883278vrDHvLqfZyWAbx7HOsI4TSz4ds1KUjoYKXG
	2UMA==
X-Gm-Message-State: ABUngvdEin0jIIJ+5yxv+evdVeeXTarMx4dqBF+cCwL2exTRsRGlXXjkG3LPkcUO1adpPcOlt6KQ56AvkFKH/Q==
X-Received: by 10.31.8.146 with SMTP id 140mr2904540vki.173.1478025968700;
	Tue, 01 Nov 2016 11:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 1 Nov 2016 11:46:07 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Tue, 1 Nov 2016 11:46:07 -0700 (PDT)
In-Reply-To: <1478007056-16301-1-git-send-email-mike.looijmans@topic.nl>
References: <1478007056-16301-1-git-send-email-mike.looijmans@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Nov 2016 11:46:07 -0700
Message-ID: <CAMKF1sr1X2Szh9YeDH=Vz=PUMqttO55QBJ4z_wM+63oO_fHj6w@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox/mdev.conf: Ignore eMMC RPMB and boot block devices
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
X-List-Received-Date: Tue, 01 Nov 2016 18:46:08 -0000
Content-Type: multipart/alternative; boundary=001a1144fa12d55484054041bcbe

--001a1144fa12d55484054041bcbe
Content-Type: text/plain; charset=UTF-8

Is there any pattern to them ? Then lets ignore or accept the smaller
subset

On Nov 1, 2016 6:42 AM, "Mike Looijmans" <mike.looijmans@topic.nl> wrote:

> eMMC devices may report block devices like "mmcblk0rpmb" and
> "mmcblk0boot0". These are not actually block devices and any
> read/write operation on them will fail. To prevent spamming error
> messages attempting to mount them, just ignore these devices.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  meta/recipes-core/busybox/files/mdev.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/files/mdev.conf
> b/meta/recipes-core/busybox/files/mdev.conf
> index 17e93da..4e9c23f 100644
> --- a/meta/recipes-core/busybox/files/mdev.conf
> +++ b/meta/recipes-core/busybox/files/mdev.conf
> @@ -39,4 +39,6 @@ input/mouse.* 0:0 0660
>  tun[0-9]* 0:0 0660 =net/
>
>  [hs]d[a-z][0-9]? 0:0 660 */etc/mdev/mdev-mount.sh
> +mmcblk[0-9]rpmb 0:0 660
> +mmcblk[0-9]boot[0-9] 0:0 660
>  mmcblk[0-9].* 0:0 660 */etc/mdev/mdev-mount.sh
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144fa12d55484054041bcbe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Is there any pattern to them ? Then lets ignore or accept th=
e smaller subset </p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Nov 1, 2016 6:=
42 AM, &quot;Mike Looijmans&quot; &lt;<a href=3D"mailto:mike.looijmans@topi=
c.nl">mike.looijmans@topic.nl</a>&gt; wrote:<br type=3D"attribution"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">eMMC devices may report block devices like &quot;m=
mcblk0rpmb&quot; and<br>
&quot;mmcblk0boot0&quot;. These are not actually block devices and any<br>
read/write operation on them will fail. To prevent spamming error<br>
messages attempting to mount them, just ignore these devices.<br>
<br>
Signed-off-by: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl=
">mike.looijmans@topic.nl</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/busybox/<wbr>files/mdev.conf | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/busybox/<wbr>files/mdev.conf b/meta/recipes-=
core/busybox/<wbr>files/mdev.conf<br>
index 17e93da..4e9c23f 100644<br>
--- a/meta/recipes-core/busybox/<wbr>files/mdev.conf<br>
+++ b/meta/recipes-core/busybox/<wbr>files/mdev.conf<br>
@@ -39,4 +39,6 @@ input/mouse.* 0:0 0660<br>
=C2=A0tun[0-9]* 0:0 0660 =3Dnet/<br>
<br>
=C2=A0[hs]d[a-z][0-9]? 0:0 660 */etc/mdev/mdev-mount.sh<br>
+mmcblk[0-9]rpmb 0:0 660<br>
+mmcblk[0-9]boot[0-9] 0:0 660<br>
=C2=A0mmcblk[0-9].* 0:0 660 */etc/mdev/mdev-mount.sh<br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--001a1144fa12d55484054041bcbe--
