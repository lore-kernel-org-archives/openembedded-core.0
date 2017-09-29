Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 56202779F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 11:02:58 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id d192so1773956itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fkyw/H7tOlfE2wfyYg5cqfzlakIT+32PIZYf2r75xTg=;
	b=F40p9uLKgnt8FaH46FeAUj0EvhgeqGt7n7aQu7ChLJc0+Ea5cJEVCn+nFwCbbsCnNF
	ikdedH+jYqP+iKcTnkId9Jd36Rx3ie9qj+LctZCmTzsfj7LGRmqyWBerAf7sjd8xlXz+
	mV8GWjXJK2GE96NuHvwVTXCgOiffgG1cctxmA5ltM/iT9WSZLc6Jr7htSq9d0D02NLay
	cN87QgJIxlVgUgPUD/pvk+hhbW2dHxWoLgudfjqaQLtIvlCBU9YaiRInh4m7Q5l5Astz
	C2OwYQoiIfqBn0PGOxtZJHpK1ByQqAPQXR3MbuEuMyQcApC+YE5A7y96GePLyvuS0M41
	BeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fkyw/H7tOlfE2wfyYg5cqfzlakIT+32PIZYf2r75xTg=;
	b=QvSHx+iCz3g8Io71zQ+oKWifVgJ4B+XFTeAY9WlkkXeICdj1oEl3SjNxgp+aWO585J
	I+W/JB1nYZoFMI8YTJ0/uXXM/aOCRBB9+ExtjNFsPsIN/nNWWpWYeUzxtKHeD42THYY8
	2rNoYsvvcSVrfSUBskj+SWg1PpmS7Xt1eth3rt9UFJpDCdh0815nrqLTsd2teEIUr3xP
	OjdlHI694DzPfSiw5vINEQzCN+3JBGkvomLhfc29+FWNbT1vs+Avn6qCofNosVFJyuh5
	WQoOXMVJxCgcAp5zhNVhSBO//LglR6YCNjCsQD1kKwD0fINBUmCXrmDvR5DEBrQ9I97F
	hD/g==
X-Gm-Message-State: AHPjjUjiNCXcUYIJBZ07oy535kIp+cGYzD54OgEZtaxJ5Q49PhlYOX4q
	ONZKTMPNnNZ2pNCZ2cJi6qjJTg55bVgw+tpOXd5k2Q==
X-Google-Smtp-Source: AOwi7QCWEuiE0bSf0xUYrCBMwC/MpKEUHrJGfJ417eFRY2Q7AQoLv16OD/ITmK2fNFarV5ea1PxeEibeCRYEeL27kgk=
X-Received: by 10.36.162.67 with SMTP id o3mr6797810iti.27.1506682980355; Fri,
	29 Sep 2017 04:03:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 04:02:39 -0700 (PDT)
In-Reply-To: <CAEQ58sh2WoS01ktF=2yVVXuyoYu3+dHpTB6UbqaQBcUeGA-6WQ@mail.gmail.com>
References: <20170929094702.5334-1-francescogiancane8@gmail.com>
	<CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
	<CAEQ58siT6Lw_W9Oe60v125ZZak2UXQ0L-R4PvaHAz6NKRi_-vA@mail.gmail.com>
	<CAJTo0LYaN8SapMtgpQhNkPz7TKR9JgOMhroxWp4Q1+BDkcucMQ@mail.gmail.com>
	<CAEQ58sgLXBEc4k=E2A2=SoG360_8zva-w+Y+Q9P_QauTK0uznw@mail.gmail.com>
	<CAEQ58sh2WoS01ktF=2yVVXuyoYu3+dHpTB6UbqaQBcUeGA-6WQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 12:02:39 +0100
Message-ID: <CAJTo0LaEGQGNzMf7BYRs+TZnA3L=e-g8YZKPn3+gstWRAQPipA@mail.gmail.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 11:02:59 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a2d584db055a51f7d8"

--f403045fb2a2d584db055a51f7d8
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 11:54, Francesco Giancane <
francescogiancane8@gmail.com> wrote:

> Hi again Ross,
> sorry to still bother but grepping inside poky recipes I did found no
> references to 'libegl'. Every (virtual) dependency is built upon
> virtual/egl; Maybe folks at meta-raspberrypi where not wrong... The
> same apply for Freescale GPU recipes: they do not provide libegl, only
> egl.
> Francesco Giancane
>

You're confusing runtime and buildtime dependencies.

In oe-core the mesa recipes PROVIDES virtual/egl.  It generates a package
libegl-mesa, which RPROVIDES libegl and libegl1.

It is expected that other GL providers would follow the same pattern.

Ross

--f403045fb2a2d584db055a51f7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 September 2017 at 11:54, Francesco Giancane <span di=
r=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" target=3D"_bl=
ank">francescogiancane8@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gm=
ail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi aga=
in Ross,<br>
sorry to still bother but grepping inside poky recipes I did found no<br>
references to &#39;libegl&#39;. Every (virtual) dependency is built upon<br=
>
virtual/egl; Maybe folks at meta-raspberrypi where not wrong... The<br>
same apply for Freescale GPU recipes: they do not provide libegl, only<br>
egl.<br>
<span class=3D"">Francesco Giancane<br></span></blockquote><div><br></div><=
div>You&#39;re confusing runtime and buildtime dependencies.</div><div><br>=
</div><div>In oe-core the mesa recipes PROVIDES virtual/egl.=C2=A0 It gener=
ates a package libegl-mesa, which RPROVIDES libegl and libegl1.</div><div><=
br></div><div>It is expected that other GL providers would follow the same =
pattern.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045fb2a2d584db055a51f7d8--
