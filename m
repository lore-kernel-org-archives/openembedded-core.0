Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id A32A3731C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 21:49:12 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 124so96777523iov.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I1gMG4zszyeJxUFU9juD31LGxRIcC1u+4gXvUGLSNAo=;
	b=oIIwYSa2K6i9ioFp5j8uTqJg3vcsAxuT1/59597KtQH9qAD+tGOi4D7IPlBFLl8cVK
	SCK3dCIuMuVGQGReBfZlllBBZYGupddPsVH6nqtxJ9/YM76fM/4B1T9ZWPLZf6qE3+7n
	/m/pPIEcU0CiZDdyAEEL3Y40jBr0vmCdQqIDDIUxiAOP59curdRHFBA9Iogq3fwUJkl5
	wAvfNAVk130d5BbGku0rhZAMGYC/99ZQffesA75TF6ByTm1H1vRk7AfFPOSI21wds6n1
	PUMXK4iR+Y0ckF/PcO4iahbJPNc8/S7nU2lPc/sqw78lmFYAtCv+1uo+jhbPVj/5MIrF
	vHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I1gMG4zszyeJxUFU9juD31LGxRIcC1u+4gXvUGLSNAo=;
	b=YYTQ2osg7bA34TbKZm4t0wLFHgQR5MjeZNd0b6MrxR90mYYb2AtkO2Kg3AJrQMeT9K
	eKGZTvoeVru7us6ljcfePkAdCbh1A0DWFiWtgoq4UYLuj/wH85kjnSFmy6/ixH7XR0UD
	toHewIwJtiieJiw12plftTAxG4f/5x5zgOZJkzb/h8Z8LjloBKzXoToZg/M1e7m80O0F
	TDjW+pi6Ytv14ck4BZQrk/QjYxHRAJJTnjyiNeLN0lQq1qGSjrwMkGpmf/Rlbpu9VKOC
	73XMjCV8lQDqEsEG9p1Wt6NUq45ZDO1lHrBs97XtbVcMLfYGpsdIFS23WYx34hzYDxcy
	Msow==
X-Gm-Message-State: AD7BkJLacIi3KYBqWJpW61GxChQrfe7/1QEqBmosixEZYS6F47f6EWXET1hWEp3snlOl134F0rPTkOHpx6RkQ2Xc
X-Received: by 10.107.6.32 with SMTP id 32mr10521430iog.99.1458856153382; Thu,
	24 Mar 2016 14:49:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 24 Mar 2016 14:48:54 -0700 (PDT)
In-Reply-To: <1455701436-11645-1-git-send-email-u.oelmann@pengutronix.de>
References: <1455701436-11645-1-git-send-email-u.oelmann@pengutronix.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Mar 2016 21:48:54 +0000
Message-ID: <CAJTo0LYboOzaym+2+dBNg5s96cqybgMXxNoCJX4uvy+YZA2epg@mail.gmail.com>
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Thu, 24 Mar 2016 21:49:17 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5ccd369c052ed26a5e

--001a113fbf5ccd369c052ed26a5e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 February 2016 at 09:30, Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
wrote:

> Upstream nfs-utils use 'rpc-statd.service' and Yocto introduced
> 'nfs-statd.service' instead but forgot to update the mount.nfs helper
> 'start-statd' accordingly.
>

Having less patches seems sensible, so would it be simple if we move to the
upstream names instead of away from upstream?

Ross

--001a113fbf5ccd369c052ed26a5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 February 2016 at 09:30, Ulrich =C3=96lmann <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:u.oelmann@pengutronix.de" target=3D"_blank">u.oelmann@pengutr=
onix.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:h0d" class=3D"a3s" style=3D"overflow:hidden">Upstream nfs-utils use &#39;r=
pc-statd.service&#39; and Yocto introduced<br>
&#39;nfs-statd.service&#39; instead but forgot to update the mount.nfs help=
er<br>
&#39;start-statd&#39; accordingly.</div></blockquote></div><br>Having less =
patches seems sensible, so would it be simple if we move to the upstream na=
mes instead of away from upstream?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113fbf5ccd369c052ed26a5e--
