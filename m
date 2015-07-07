Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0F77B72E97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:38:25 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so139706047qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 06:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FG7Zfxc1d3XRexnxm8WLDRR2jY52SdTuZ/BQxhd33+8=;
	b=DozsEY6GXmWnE5dDnMwnnPWWrzateZiy2tTpiLGI1z2RBzp5db36uqbUn9hiZ3h+5u
	8EwmtPk+CDRKkLAId41B7PWdG6Jhu+b3gDWyJxWSjXoHCyKJcYPLEZZDS7dkYLSaaFLv
	+UZhygAcVnHMvj+Nku5/ZU007UJnWSZZYxSrfnAZl/54EgwuEiFAHIYclzBOQeHrTdGP
	/JHqOul56GQCP2jm7rNSfI8q8Y/Lv5lm4880PTIBJ3qEUI6yxYw4PMdMa/xKcwQcqSEl
	IFKYw2VTOHbAQxPTBP3QbaIO/9z+MQVR1FtUpjtLwgv5sD7/Dg6cGUG11XolgnSzAryQ
	Z8Xw==
X-Gm-Message-State: ALoCoQk8ayvuK2s3jQtKsKzwykdmAiBf93PDAPwfSnTVmKrbPLHH0H64q2pG7yWtxvmMvytL2gMH
X-Received: by 10.55.53.193 with SMTP id c184mr6575662qka.62.1436276305948;
	Tue, 07 Jul 2015 06:38:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 06:38:06 -0700 (PDT)
In-Reply-To: <559BD488.8090306@linux.intel.com>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
	<559BD488.8090306@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 14:38:06 +0100
Message-ID: <CAJTo0LY5fEmX8Of5d2prJ01fHvf7LV170qTz+r1kd0vtkGgesQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Tue, 07 Jul 2015 13:38:26 -0000
Content-Type: multipart/alternative; boundary=001a11476f1404073e051a4923ab

--001a11476f1404073e051a4923ab
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 14:30, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> How about renaming the recipe, so that it doesn't clash with the GPLv3
> version? For example, parted1_1.8.6.bb. Then it can be kept outside of
> oe-core.
>

As they're just version variations that would be overly complex.  Dropping
it in oe-core as it's a non-v3 alternative doesn't seem to be a problem to
me (as there's plenty of precedent for that already).

Ross

--001a11476f1404073e051a4923ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2015 at 14:30, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":28i" class=3D"a3s" style=3D"overflow:hidden">How about renamin=
g the recipe, so that it doesn&#39;t clash with the GPLv3 version? For exam=
ple, <a href=3D"http://parted1_1.8.6.bb" rel=3D"noreferrer" target=3D"_blan=
k">parted1_1.8.6.bb</a>. Then it can be kept outside of oe-core.<br></div><=
/blockquote></div><br>As they&#39;re just version variations that would be =
overly complex.=C2=A0 Dropping it in oe-core as it&#39;s a non-v3 alternati=
ve doesn&#39;t seem to be a problem to me (as there&#39;s plenty of precede=
nt for that already).</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11476f1404073e051a4923ab--
