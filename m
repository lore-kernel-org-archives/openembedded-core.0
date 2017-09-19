Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 696AE780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:23:06 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 21so328255iof.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0gTgbNhlQ0NNjes7g0Sq0wnEOYRF9sPaCE7ZBBUVRRI=;
	b=o7VnYIbfkk7A0nYLR4Yggwon+X0LpuVvimjn1W5CtlAZ8kS+2ogmqIlkyrLiJpUFVl
	YGyGvtdJFXlQgIsVm/x2MNo11ZbNkcdRkG5Dq8mb5JHPk3KDmP3O0ZBX+6do358I6VfB
	pxr0m9molE6uxmtLcKbVGitt2C57xYe2AY/nfYteuNstSi+/B2IB4nUCnogzbGhggHha
	ey7bIgrejxJw5OPdx/YVqZ4ggmpoHke1mHoy+I4xFtt4RQRxxKbhusd9bcathMCnthc4
	IJlhGNF0M6cSb/R703vRNBBMh2Y9HW2c0micUB/YcI5ts8Rgg6OLUtAwmP+Z4C4Ao8Z4
	OSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0gTgbNhlQ0NNjes7g0Sq0wnEOYRF9sPaCE7ZBBUVRRI=;
	b=S4cDA+4keigC5f6ebXd4hsiEHKCz5gtI1oaDFaLxe6arxom+aZs4vPsCFZLwJSbsmL
	IN5OiYxqqSMUvVoHGo0ZcrD5cncHSRHLOxlSKRb0Iny1xy7unCDtEgAi/hvqjngJjgCR
	STuF0AJP/3EyNC3edHFJD1hkpPA0ZO08HR8XuGcEzsBIe2BPeB2DnoOrzTaQDJ5VX+FY
	wrFPLC2lzEvy+TmM9DNatUKD4iSvPNve950VmcX5DR9X1+uzlxHBRBG/hJEzQzpYCrZ5
	NXUlT7bjMk8N5Gh8j6TL2V0/Yhvb/8kN5zEsPhhw2RRmC2pCfOC0cVf6M80TveN3FkLQ
	Yy4w==
X-Gm-Message-State: AHPjjUjiBRiOQTYgaN/GZOAQIpue6267fBGBMJ2oKjLlaT+aYggSpcQu
	wAxdSUoKl3vaZog50jkp6oUgI+Sc3Xom3sb7mXeAsQ==
X-Google-Smtp-Source: AOwi7QD7la3RH5Aa+oaxhSgngSbFfL5grZa75gSyHOZmaLlLbRgI8k0nAbdbXVYu6PkvmhPavQXCG/ytTv0r64L/6pQ=
X-Received: by 10.107.135.72 with SMTP id j69mr2872171iod.210.1505838185584;
	Tue, 19 Sep 2017 09:23:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 09:22:45 -0700 (PDT)
In-Reply-To: <CAJTo0LZmbdxxsxVnvxa_h9LCX2Sy9La=+OqiQ1pBzADmfoKHhg@mail.gmail.com>
References: <20170919103653.23870-1-tomasz.meresinski@comarch.pl>
	<CAJTo0LZmbdxxsxVnvxa_h9LCX2Sy9La=+OqiQ1pBzADmfoKHhg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 17:22:45 +0100
Message-ID: <CAJTo0La10Uta7_QSA-QM3N7iczvRrOHONy5CnHw78Gj-JhFFpQ@mail.gmail.com>
To: =?UTF-8?Q?Tomasz_Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/image: fix do_image_qa dependencies
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
X-List-Received-Date: Tue, 19 Sep 2017 16:23:06 -0000
Content-Type: multipart/alternative; boundary="001a113f8e702439ae05598d46b8"

--001a113f8e702439ae05598d46b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 19 September 2017 at 17:07, Burton, Ross <ross.burton@intel.com> wrote:

> On 19 September 2017 at 11:36, Tomasz Meresi=C5=84ski <
> tomasz.meresinski@comarch.pl> wrote:
>
>> After do_image_complete IMAGE_ROOTFS directory is empty so qa checks do
>> not work
>
>
> Important context: this only happens if rm_work is enabled.  I'm wonderin=
g
> if the task should be moved earlier so its between rootfs and image, as
> it's actually a *rootfs* QA hook (its expected that functions examine the
> contents of IMAGE_ROOTFS).
>
> I think we need to push the task back a bit in the tree and put it in
> between rootfs and image.  This way if it fails the image generation
> doesn't happen, and rm_work won't break it.
>

I've just sent an alternative patch the list, can you verify that it solves
your problem and doesn't break your existing image QA functions?

Cheers,
Ross

--001a113f8e702439ae05598d46b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 September 2017 at 17:07, Burton, Ross <span dir=3D"l=
tr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.bur=
ton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span cla=
ss=3D"">On 19 September 2017 at 11:36, Tomasz Meresi=C5=84ski <span dir=3D"=
ltr">&lt;<a href=3D"mailto:tomasz.meresinski@comarch.pl" target=3D"_blank">=
tomasz.meresinski@comarch.pl</a>&gt;</span> wrote:<br></span><div class=3D"=
gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">After do_image_complete IMAGE_ROOTFS directory is empty so qa=
 checks do not work</blockquote><div><br></div></span><div>Important contex=
t: this only happens if rm_work is enabled.=C2=A0 I&#39;m wondering if the =
task should be moved earlier so its between rootfs and image, as it&#39;s a=
ctually a *rootfs* QA hook (its expected that functions examine the content=
s of IMAGE_ROOTFS).</div><div><br></div><div>I think we need to push the ta=
sk back a bit in the tree and put it in between rootfs and image.=C2=A0 Thi=
s way if it fails the image generation doesn&#39;t happen, and rm_work won&=
#39;t break it.</div></div></div></div></blockquote><div><br></div><div>I&#=
39;ve just sent an alternative patch the list, can you verify that it solve=
s your problem and doesn&#39;t break your existing image QA functions?</div=
><div><br></div><div>Cheers,</div><div>Ross=C2=A0</div></div><br></div></di=
v>

--001a113f8e702439ae05598d46b8--
