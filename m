Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E085746E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 22:27:03 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id n15-v6so22200131lfn.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J5Dve+NvkCzjCW1XXnA4dyVk7BE4nyVukpGbMGzf/Wo=;
	b=hUS74Mhw31T+yWY+3A0wG0DP3noAjfqte0YgeTv9iB385HFr2ZL3ohBfx7s55O2fQV
	oaR2UJE4qLKmZN0z2aIjQW0bETuG2SHqr6FW4qe5NbMxHbIretSuk1wOLjUHrknGERNE
	zy6uD4izkRKnDTgj4D++zrZ1HenlL2idg5DFtGb2IbYhtMjtMHjZdQNGbRcp7PWG2lLr
	kdl5DCBGWeRgBQccu78sMFgeuHehTuzlOCOvEIkdRfXsg3F/vngL4hYL4MQ1bzznESHm
	y8HlI6d49NgPfk04G0Ku5F2vYIzjUSJBhizu7zaGMPniI0wTzSzdiuHobapvSEhB/0DB
	Yl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J5Dve+NvkCzjCW1XXnA4dyVk7BE4nyVukpGbMGzf/Wo=;
	b=JRiuB0+z1hQt9qv4sW5Ciw/F1i2noyyM+ouDrWIALYJNkvc7ijSqZ99lx64MquvT7E
	+dF9W4YHy5L7T7i3LdoGpd9hI8K20X+42kluAkYmirlAZB6mUBJCfyZh9ORHgSRtPo9R
	gJLzCtCi8stATZxtvTD/te+/dX9nA/QtGQDk+n05dBWklADzbpQ9QXyu7rxE6l0M4hH3
	j+ge9FugKBebmCxmXYoSuDHdu3Rm6rd+BGeQlcet//Akfgcr8Pd1yWNv4PPjyI+uaHGs
	ZdSwc8ntuGHM4htNutlu76aJjTYzyE3lVO+pwQevu9IUvqFgIPSGZemeAIgUKbM0cIjv
	o3qg==
X-Gm-Message-State: APt69E1uNcrKhmg9ThwFPruQdFjXzFsk8J9os+VjZk1wVNZVwSLFDpRw
	LnSKKyNCAs03BwaOLPUmQxQZHYxS/VKi96fiutM=
X-Google-Smtp-Source: ADUXVKLO2kPmrgScjUmr6gvUpQ9qt/vCawx7PCk6zXaPIiuhwI6F87RPZ+e9aL6vTDZgsbru579WhVqoay/nDh6CyNE=
X-Received: by 2002:a2e:8455:: with SMTP id
	u21-v6mr5535619ljh.66.1528496824006; 
	Fri, 08 Jun 2018 15:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1528442551.git.raj.khem@gmail.com>
	<5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
In-Reply-To: <5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 8 Jun 2018 16:26:52 -0600
Message-ID: <CACS+7ZSGxyfMhN0SRti8m1h9t1n_HCGfQC1-myiFj+UnkjAGbA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Fri, 08 Jun 2018 22:27:03 -0000
Content-Type: multipart/alternative; boundary="0000000000003c3ced056e28e67d"

--0000000000003c3ced056e28e67d
Content-Type: text/plain; charset="UTF-8"

Should the subject read switch to gcc 8.1?

On Fri, 8 Jun 2018, 01:29 Khem Raj, <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 8e15f694d0..cb17061706 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial
> = "${TCLIBC}-initial"
>  PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=
> "nativesdk-glibc-initial"
>  PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>
> -GCCVERSION ?= "7.%"
> +GCCVERSION ?= "8.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.30%"
>  GDBVERSION ?= "8.1%"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003c3ced056e28e67d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Should the subject read switch to gcc 8.1?<br><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 8 Jun 2018, 01:29 Khem Ra=
j, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj=
.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 8e15f694d0..cb17061706 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =
=3D &quot;${TCLIBC}-initial&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=3D &=
quot;nativesdk-glibc-initial&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&quot;<br>
<br>
-GCCVERSION ?=3D &quot;7.%&quot;<br>
+GCCVERSION ?=3D &quot;8.%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
=C2=A0BINUVERSION ?=3D &quot;2.30%&quot;<br>
=C2=A0GDBVERSION ?=3D &quot;8.1%&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000003c3ced056e28e67d--
