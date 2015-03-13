Return-Path: <naresh.bhat@linaro.org>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0916E71637
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:14:47 +0000 (UTC)
Received: by lams18 with SMTP id s18so22873042lam.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=pSnVYk1C7RzBljI0fUAGPwdLQOhn/KgeRYAs7QSgWLA=;
	b=ZyLAYwWQ9Ix9bpdLZElhKVIyATPHOEVagtvAS0TlZHIyV7qE4OGG9t3ATsFLzO7/t/
	tW2tPQQudkzxXmZ1m8fQ9/DbhNfAO++11Gfols1mYmqb1qkY6+IFcxPGe3SucmhZRp/X
	Fc7ZukBUXcKMqeYUelipZnwwFmzKQtTMwyAv1whjyvZ2pBkhEvxdvggr671xOpGbzoX6
	g/KvEIuszxuQXlRASPfQOdPX68kcPBV0cmBBTLP4msM1uCC/a/vmX4IS+QWQxmsD9ZcV
	+IWxvKuJhKyj5WJyD7mjp7W/E4vt2JLc8xpN9D7CvMyaEhw0tTkskQA2VSkDTObXdfGp
	Ew1A==
X-Gm-Message-State: ALoCoQmeJTYsKeXBvOCTRYBFmlhmm1FjwQa6u2CQqsARt+pRH6iy1WxzAqP8/yUnZ0+LHv0r0I8x
MIME-Version: 1.0
X-Received: by 10.112.188.163 with SMTP id gb3mr16782041lbc.10.1426256087793; 
	Fri, 13 Mar 2015 07:14:47 -0700 (PDT)
Received: by 10.112.5.73 with HTTP; Fri, 13 Mar 2015 07:14:47 -0700 (PDT)
In-Reply-To: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
References: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
Date: Fri, 13 Mar 2015 19:44:47 +0530
Message-ID: <CAFoFrHbR_5UU-pnb8iDQ1VQTyFR+iy_2nTL1BMGc=_m_g=xiRA@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v1 PATCH 0/5] aarch64 changes for meta layer
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
X-List-Received-Date: Fri, 13 Mar 2015 14:14:49 -0000
Content-Type: multipart/alternative; boundary=001a11c37a0478d7be05112c1f89

--001a11c37a0478d7be05112c1f89
Content-Type: text/plain; charset=UTF-8

Hi,

Please, Ignore this series for review.  I will resend the same series with
few corrections.  My apologies for noise.

Thanks and Regards
-Naresh

On 10 March 2015 at 00:01, Naresh Bhat <naresh.bhat@linaro.org> wrote:

> I am adding the support of aarch64 to LUV OS Distribution project.
> The luv-yocto project is based on poky distribution.
>
> https://01.org/linux-uefi-validation
>
> While adding support I find that these are the few meta layer changes,
> which I have been asked to upstream. If we merge these changes into
> openembedded-core it will be more helpful to maintain the minimum set
> patches at dependency projects like luv-yocto.
>
> Changes since V0:[RFC series]
> - Include all the chages suggested by Bernhard Reutner-Fischer
> - Add grub recipe changes suggested by Burton Ross
>
> Naresh Bhat (5):
>   bootimg: Add support to install Image
>   syslinux: Remove bootimg dependency for aarch64
>   bootimg: Skip iso image build for aarch64
>   grub: Update grub git recipe
>   grub-efi: Add support to install grubaa64 efi
>
>  meta/classes/bootimg.bbclass      |   17 ++++++++++---
>  meta/classes/grub-efi.bbclass     |   17 ++++++++-----
>  meta/classes/syslinux.bbclass     |   11 ++++++++-
>  meta/recipes-bsp/grub/grub_git.bb |   48
> +++++++++++++++++++++++++++++++------
>  4 files changed, 76 insertions(+), 17 deletions(-)
>
> --
> 1.7.9.5
>
>

--001a11c37a0478d7be05112c1f89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>Please, Ignore this series=
 for review.=C2=A0 I will resend the same series with few corrections.=C2=
=A0 My apologies for noise.<br><br></div>Thanks and Regards<br></div>-Nares=
h<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 March =
2015 at 00:01, Naresh Bhat <span dir=3D"ltr">&lt;<a href=3D"mailto:naresh.b=
hat@linaro.org" target=3D"_blank">naresh.bhat@linaro.org</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">I am adding the support of aarch64 to=
 LUV OS Distribution project.<br>
The luv-yocto project is based on poky distribution.<br>
<br>
<a href=3D"https://01.org/linux-uefi-validation" target=3D"_blank">https://=
01.org/linux-uefi-validation</a><br>
<br>
While adding support I find that these are the few meta layer changes,<br>
which I have been asked to upstream. If we merge these changes into<br>
openembedded-core it will be more helpful to maintain the minimum set<br>
patches at dependency projects like luv-yocto.<br>
<br>
Changes since V0:[RFC series]<br>
- Include all the chages suggested by Bernhard Reutner-Fischer<br>
- Add grub recipe changes suggested by Burton Ross<br>
<br>
Naresh Bhat (5):<br>
=C2=A0 bootimg: Add support to install Image<br>
=C2=A0 syslinux: Remove bootimg dependency for aarch64<br>
=C2=A0 bootimg: Skip iso image build for aarch64<br>
=C2=A0 grub: Update grub git recipe<br>
=C2=A0 grub-efi: Add support to install grubaa64 efi<br>
<br>
=C2=A0meta/classes/bootimg.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +++=
+++++++---<br>
=C2=A0meta/classes/grub-efi.bbclass=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +++=
+++++-----<br>
=C2=A0meta/classes/syslinux.bbclass=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A011 +++=
+++++-<br>
=C2=A0meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_blank=
">grub_git.bb</a> |=C2=A0 =C2=A048 +++++++++++++++++++++++++++++++------<br=
>
=C2=A04 files changed, 76 insertions(+), 17 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c37a0478d7be05112c1f89--
