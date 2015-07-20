Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id D2C0F65CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 10:59:32 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so109245810qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 03:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NGAIySljwFcUcyv53BIEVj3Hy0gQrDynSClP6BbF1fU=;
	b=KdgVmQ4v34mnHltXsjBjoHnIYbTI+fVRvTVj+BUesKpzrXxUNXyewIkmD6VJRk3CfT
	t4tfyBFFoF4qXH2v96d5qFy/yrhW0d6BO9SNCpj0dZQoh76MthFBMhDC0o0+OnZupDZt
	BfXIHdy+W/xfQdv+DCoQQfl4vDXYY5gmvXwRbtnFklnA9Afp4GKySM6KQH0vATi2ZXeN
	DWzb3X3Lyj4noRokzTImgL4Is6kfVfgyze90SP1SXTqh5ndKPKxilFfI5YqWLDpgpv85
	aKhLu9JfL0AFGoX1wsjcDSg6ZkBE8ngkjVRR0+MvAQlSL3UHOOThy8nnXPuDntZkj/7e
	4+Jg==
X-Gm-Message-State: ALoCoQkE9AufL5U6/oiz6y6dLMtr8wOS3NdI/yCq18RiXEB++Z+MRsbb0Uwgp696W0BhUNKDbb+b
X-Received: by 10.55.15.129 with SMTP id 1mr44818984qkp.29.1437389972304; Mon,
	20 Jul 2015 03:59:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 20 Jul 2015 03:59:12 -0700 (PDT)
In-Reply-To: <1437136453-28323-1-git-send-email-otavio@ossystems.com.br>
References: <1437136453-28323-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jul 2015 11:59:12 +0100
Message-ID: <CAJTo0LZgGsOv-rK20BSvJ-SFPycT0_WyT6zA_7FgRdrXOQjDDQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Upgrade to 2015.07 release
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
X-List-Received-Date: Mon, 20 Jul 2015 10:59:38 -0000
Content-Type: multipart/alternative; boundary=001a1146f100b40859051b4c6ec7

--001a1146f100b40859051b4c6ec7
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 13:34, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This upgrades the U-Boot and its related recipes for the 2015.07
> release.
>
> The following recipes has been upgraded:
>
>  - u-boot
>  - u-boot-mkimage
>  - u-boot-fw-utils
>
> The patches which were applied on top of the 2015.01 release are
> dropped as those are not needed in this release.
>
> The license checksum update was due minimal changes in the text, those
> have no impact in the license terms.

This breaks on the autobuilder (
http://errors.yoctoproject.org/Errors/Details/13435/):

powerpc-poky-linux-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined in linker
created .got
powerpc-poky-linux-ld.bfd: final link failed: Bad value
Makefile:1141: recipe for target 'u-boot' failed

Ross

--001a1146f100b40859051b4c6ec7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 July 2015 at 13:34, Otavio Salvador &lt;<a href=3D"m=
ailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br>&g=
t; This upgrades the U-Boot and its related recipes for the 2015.07<br>&gt;=
 release.<br>&gt;<br>&gt; The following recipes has been upgraded:<br>&gt;<=
br>&gt; =C2=A0- u-boot<br>&gt; =C2=A0- u-boot-mkimage<br>&gt; =C2=A0- u-boo=
t-fw-utils<br>&gt;<br>&gt; The patches which were applied on top of the 201=
5.01 release are<br>&gt; dropped as those are not needed in this release.<b=
r>&gt;<br>&gt; The license checksum update was due minimal changes in the t=
ext, those<br>&gt; have no impact in the license terms.<br><br>This breaks =
on the autobuilder (<a href=3D"http://errors.yoctoproject.org/Errors/Detail=
s/13435/">http://errors.yoctoproject.org/Errors/Details/13435/</a>):<br><br=
>powerpc-poky-linux-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined in linker cre=
ated .got<br>powerpc-poky-linux-ld.bfd: final link failed: Bad value<br>Mak=
efile:1141: recipe for target &#39;u-boot&#39; failed<div><br></div><div>Ro=
ss</div></div>

--001a1146f100b40859051b4c6ec7--
