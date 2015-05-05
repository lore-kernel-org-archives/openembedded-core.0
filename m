Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9FA73C7D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 12:21:46 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so86608786qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 05:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=FGKmm792guzRahrmMSTAPUn49c0B88ZdQmn4PzejIrg=;
	b=ZkYRd/GYtcoUxU3+BzNYraUxMDXAf9F9OvEGh0KOZMwkSHZe/mJOU6DJVYnmPemFse
	V77LgGGr63l5zBTTXmQPa95mUbslysBhbpsQsAIJLNQIG1YTaGScSIWgm2Mg0fbnhqqz
	VNqqjJuIw/X+yAUuCG2L8NOv2wDGeDBZqRZISYk0uVeXe+0X8/dro/4856mbWalmjcJn
	hRxl/iPjI+iC/HPpoCDc6Kby9pA1ScelnwDUJxWGe9Edy/wxrjJuqI0uii8dJq3ZMPA5
	jXJcnziCacf+NKQUvY6Hla6x6xIgBjzerhaDgNW1OZzmB0sB/HaE7SUJEPYQozY3mkJV
	FP6g==
X-Gm-Message-State: ALoCoQl44rsZxHeriN4h2ZK2qU8zU4vyeAJ54O45TLUaYCzKKkhxBzBeh/YP2HpW0K4G2Agn5Qcz
X-Received: by 10.55.50.20 with SMTP id y20mr55556110qky.58.1430828506889;
	Tue, 05 May 2015 05:21:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 5 May 2015 05:21:26 -0700 (PDT)
In-Reply-To: <1430828220-14251-1-git-send-email-ross.burton@intel.com>
References: <1430828220-14251-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 May 2015 13:21:26 +0100
Message-ID: <CAJTo0LYPCxdbcKkpJnBhW4ecrAdyPvOURaB6PLLoLWCB_Q-wcA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] poky.conf: remove SVK mirror
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
X-List-Received-Date: Tue, 05 May 2015 12:21:48 -0000
Content-Type: multipart/alternative; boundary=001a11471392e35473051554b8ee

--001a11471392e35473051554b8ee
Content-Type: text/plain; charset=UTF-8

Sorry, my fingers typing on their own, re-sending to the right list now...

Ross

On 5 May 2015 at 13:17, Ross Burton <ross.burton@intel.com> wrote:

> The svk fetcher was removed in bitbake 1.22 and oe-core master doesn't
> consider
> svk: a valid URL for mirrors.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-yocto/conf/distro/poky.conf | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-yocto/conf/distro/poky.conf
> b/meta-yocto/conf/distro/poky.conf
> index 3598f4f..aa6f01e 100644
> --- a/meta-yocto/conf/distro/poky.conf
> +++ b/meta-yocto/conf/distro/poky.conf
> @@ -53,7 +53,6 @@ gitsm://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n \
>  hg://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
>  osc://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
>  p4://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
> -svk://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
>  svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n"
>
>  MIRRORS =+ "\
> --
> 2.1.4
>
>

--001a11471392e35473051554b8ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, my fingers typing on their own, re-sending to the r=
ight list now...<div><br></div><div>Ross</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On 5 May 2015 at 13:17, Ross Burton <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank=
">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">The svk fetcher was removed in bitbake 1.22 and oe-core master doesn&#=
39;t consider<br>
svk: a valid URL for mirrors.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta-yocto/conf/distro/poky.conf | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky=
.conf<br>
index 3598f4f..aa6f01e 100644<br>
--- a/meta-yocto/conf/distro/poky.conf<br>
+++ b/meta-yocto/conf/distro/poky.conf<br>
@@ -53,7 +53,6 @@ gitsm://.*/.* <a href=3D"http://downloads.yoctoproject.or=
g/mirror/sources/" target=3D"_blank">http://downloads.yoctoproject.org/mirr=
or/sources/</a> \n \<br>
=C2=A0hg://.*/.*=C2=A0 =C2=A0 <a href=3D"http://downloads.yoctoproject.org/=
mirror/sources/" target=3D"_blank">http://downloads.yoctoproject.org/mirror=
/sources/</a> \n \<br>
=C2=A0osc://.*/.*=C2=A0 =C2=A0<a href=3D"http://downloads.yoctoproject.org/=
mirror/sources/" target=3D"_blank">http://downloads.yoctoproject.org/mirror=
/sources/</a> \n \<br>
=C2=A0p4://.*/.*=C2=A0 =C2=A0 <a href=3D"http://downloads.yoctoproject.org/=
mirror/sources/" target=3D"_blank">http://downloads.yoctoproject.org/mirror=
/sources/</a> \n \<br>
-svk://.*/.*=C2=A0 =C2=A0<a href=3D"http://downloads.yoctoproject.org/mirro=
r/sources/" target=3D"_blank">http://downloads.yoctoproject.org/mirror/sour=
ces/</a> \n \<br>
=C2=A0svn://.*/.*=C2=A0 =C2=A0<a href=3D"http://downloads.yoctoproject.org/=
mirror/sources/" target=3D"_blank">http://downloads.yoctoproject.org/mirror=
/sources/</a> \n&quot;<br>
<br>
=C2=A0MIRRORS =3D+ &quot;\<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11471392e35473051554b8ee--
