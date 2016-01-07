Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E7EF565CC3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:34:45 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q21so266269290iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Im5CQ+ai0649h36gJBWoVFZKJCwL/5MsHcAfFuH4zbQ=;
	b=ruNN+1oR08M7JDdQYjNbkOTKobT55eOQD4fidGme/cnQWpSPKa23zOyNvHH7vUzLCI
	ix8QfIr85CGGNYKoVRTvRuncy3SP5GUYEJtKfiy3jMqyeYdDOJ9KdoH6sOJkntRNNiQk
	6vB34qQ7SDXGSl5oO0bSX2uqVoHExCdzo/DkFCm8qaEEMckuEcgnwvCmakHRW4ztGuwM
	MxfKt6n5EdNUA1xeeczSjUY0joDFYgBn7O6I+e59lf1fMMySmG7QJAuIY0lZfrcqIjs6
	ktxXy5+W5F8WPftoSSOaFbHGNNzth0TwxHm+VkF5388hIuf/7DICDxppuRAXInDsrF4I
	Zpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Im5CQ+ai0649h36gJBWoVFZKJCwL/5MsHcAfFuH4zbQ=;
	b=PFTkps4sl4eOfGksPtQTHdHWSsKitZo442o50QAfJ+gJ0WbEkYbl55FdiU/6ha1FtR
	KFqJhE+h19IimKF9fw7GmI7CVAgJXHF7oBxU6qN9jV0ErHEQQ4jztnUPc614B6Jt2X+I
	utPilO1KmMjTacshI6ew1f6PD5+41w3wAYlaGsXFwLAQepK7R0bjBVDvedLT5GbNZSIn
	ra8tY87GbH71NbtT1GcSE2t62OnvsMDugfB4+CZQ5LBYs3f7ZD8wyGQ9ooL+v7AU6lDs
	qGzWukia9ne2DdWIaR7ofzkHbngZEB2RJZRknkqLFV3hq9DGdDnxQiA7VA1PE3giM8Aj
	byhw==
X-Gm-Message-State: ALoCoQn1FzOcM3F7j6LZ6Coiw03glINjXIrByokDS/ImbcQp2lF03NOYJq/lk1NYhlyBcjnQ7sVeT7rio3EQ/ZJnTOTSLtCpb8gamFxHVcNFCeGuS7nZ0eI=
X-Received: by 10.107.164.161 with SMTP id d33mr90037025ioj.148.1452202486849; 
	Thu, 07 Jan 2016 13:34:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 13:34:27 -0800 (PST)
In-Reply-To: <1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 21:34:27 +0000
Message-ID: <CAJTo0LZwhxNv47sKdHn4fEd550X6+sdodD53+0WKRvUtqhy4PA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 3/4] packagegroup-core-x11-base: Remove matchbox for XWayland case.
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
X-List-Received-Date: Thu, 07 Jan 2016 21:34:49 -0000
Content-Type: multipart/alternative; boundary=001a1141c9765ef9ac0528c53ddf

--001a1141c9765ef9ac0528c53ddf
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 22:04, Tom Hochstein <tom.hochstein@freescale.com>
wrote:

> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '',
> 'matchbox-terminal matchbox-wm', d)} \
>

No, this is broken.

Poky (and others) build with wayland and x11 DISTRO_FEATURES, the presence
of wayland DISTRO_FEATURE doesn't mean that XWayland is being used.  If
you're using XWayland then you'll either have to create your own package
groups, use appends to remove matchbox, or just live with matchbox being
installed.

Ross

--001a1141c9765ef9ac0528c53ddf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 22:04, Tom Hochstein <span dir=3D"ltr">&lt;<a href=
=3D"mailto:tom.hochstein@freescale.com" target=3D"_blank">tom.hochstein@fre=
escale.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":29h" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 ${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;, &#39;wayland&#39;, &#39;&#39;, &#39;m=
atchbox-terminal matchbox-wm&#39;, d)} \<br></div></blockquote></div><br></=
div><div class=3D"gmail_extra">No, this is broken.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Poky (and others) build with w=
ayland and x11 DISTRO_FEATURES, the presence of wayland DISTRO_FEATURE does=
n&#39;t mean that XWayland is being used.=C2=A0 If you&#39;re using XWaylan=
d then you&#39;ll either have to create your own package groups, use append=
s to remove matchbox, or just live with matchbox being installed.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a1141c9765ef9ac0528c53ddf--
