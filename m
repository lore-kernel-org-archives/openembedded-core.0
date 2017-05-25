Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 34926780BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 09:41:01 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id k74so173359625qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=akTn7ZZ43A4EowjGrlfZYsupD/oKCd8aHtMZZfQrJZM=;
	b=U3+Iqz2LMYEwj1S1TljkqyJYliYWii0Yr7DQ+kXW4yA//EJlEpYBGfmSghsTJiWplT
	v1+AVFk1WGPE+dP8olPyBEL/QjRj9PEV0c8LSYEsksA8S3jRSVKikhGRstcPh1oClKQ1
	sY3eezhP3CzDI+JzSJWT9vg9vuqEqkH02Im+owhpoEsTohgtS+B8otr0MIBE8DjA9mKS
	zjW7/R2tGQ3pa/zPtywG4Raak4eRgMFbL+OFCmPFFZDZEunuKH98WY+s8yfMaxfFE5md
	hFx6U+6fuKSXfOrJgTw69jslzmJKjjgDpGwdlmRSIbvLNrfZ91diLy1Pv2ptHtlFPfXC
	pk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=akTn7ZZ43A4EowjGrlfZYsupD/oKCd8aHtMZZfQrJZM=;
	b=C74jDd80SzFhLEkQTs9P0vzJvE3c8CB/tx9mhTTHoeNjDohTEPZ0GP3Ue+wdIJinM3
	FqBSLABwHLQAKqmG34h3eaL7H/ovpaP2ynRmXW1a5ZlocOcCyk9y+vmmgGt+kQkhuwMa
	mI76b3dOxqJoE8v/2tpkAfdm/mVPZ/24M2zXTvGcMwN9J1RHVEyv3POmCaaQbodZiqyE
	AUKrzzBuw8iK/taSA2d3sh7GibcUTLmqRmtr29ug9gczBmNTEjFSP4OCQ1GuSrrzBLmC
	mwp9vxW0ycWf2GrPuS3luW4ej0g+st3gn6D/DjmW5mQAuuAX2oBDp8g2Uq8rFTW5L0L4
	n4WQ==
X-Gm-Message-State: AODbwcANjYC9hJHZrQqkWEKJMZSiz9G1+WGn2neYe8BTH8qpQ3N4vqT/
	9KHMk0n3i7a40YBBR8yknsG1navLsj6p
X-Received: by 10.55.146.199 with SMTP id u190mr38089956qkd.109.1495705263023; 
	Thu, 25 May 2017 02:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 02:40:42 -0700 (PDT)
In-Reply-To: <1495170714-23503-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495170714-23503-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 10:40:42 +0100
Message-ID: <CAJTo0LYX8Zhxh5jxP8V2Sb8y42jHuL+L5aFcpMR+a3B03y0X3w@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: 3.5.9 -> 3.5.11
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
X-List-Received-Date: Thu, 25 May 2017 09:41:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c08bd70e445c00550560417"

--94eb2c08bd70e445c00550560417
Content-Type: text/plain; charset="UTF-8"

On 19 May 2017 at 06:11, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade gnutls from 3.5.9 to 3.5.11.
> 2) Delete one patch "use-pkg-config-to-locate-zlib.patch", since it is
> integrated upstream.
>

Looks like upstream broke something on multilib:
http://errors.yoctoproject.org/Errors/Details/143109/

Ross

--94eb2c08bd70e445c00550560417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2017 at 06:11, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:26v" class=3D"=
gmail-a3s gmail-aXjCH gmail-m15c1f1f6d4add713">1) Upgrade <span class=3D"gm=
ail-il">gnutls</span> from 3.5.9 to 3.5.11.<br>
2) Delete one patch &quot;use-pkg-config-to-locate-<wbr>zlib.patch&quot;, s=
ince it is integrated upstream.<br></div></blockquote></div><br>Looks like =
upstream broke something on multilib:=C2=A0<a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/143109/">http://errors.yoctoproject.org/Errors/Det=
ails/143109/</a></div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--94eb2c08bd70e445c00550560417--
