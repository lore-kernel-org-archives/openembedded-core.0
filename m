Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC9DE6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 11:16:25 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ph11so12156762igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fPP97Pyl+ztUKZ+J5LX1aN6O6GSWiA1MLSndIJ1W60o=;
	b=JnzmXPW4HWqGqpl0i9+bHY03ql8YSkaP1dH1WYCfbDxioZoJJqK31ET8XiQiBcXY3n
	eVyaXqxWgYB8f6JVvlXIsdBW6Du86KSSTZfGMdiO1tgbk5djqmVZzt3fl5lxBGE7Y8Y+
	/Ai3V+wSLstdtZm+P0kGbcV4UtdeFiZn91pRq/3qZWLv4lnslsGJ2Ur4WUah/9o2I0LZ
	l5va9xuuxVzo0IXgbqaVvG97/QFurBx51rPlJPkGKxQc7M9h1GWqk6TrNV5bhwTJDrCC
	6+AEoPBBg3fHYdu/DI4kDgIt5EfSm3HwSnDkaDERRu6dyc3DpQledjYYojfWuz9bMpNk
	iZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fPP97Pyl+ztUKZ+J5LX1aN6O6GSWiA1MLSndIJ1W60o=;
	b=jEpaNzgk2UmUnUyl1GHah9HKIHCETNDVV/L4drVDy1eR+3GSKXxl03ZJ+fN30bMlQX
	+D4ljkMl7NPD0PJ0YatOm68YcDx+Bx2Avfq8A3y++3uisT8FZaAE7Zswm66KudNRqT6D
	sNdP5EF/nNUf2hkBiulGFUK+TeM7Z56h2uCdgvoVTG6EnmgZrnI+QdDJCy8eUOaIPtfA
	Zwki7lR7sh5OD0bFnZGGhYMhtyOFW8Q/THvSh+EywMasPocaqJJOVS6JnMH58IEf6OPe
	ONi/RGw4PPvW5BTDaYdu2FdtVR95ycxNQLfn2UsU7l/2pU5B/cjBm2qltLYX1HZAoOa0
	nQXQ==
X-Gm-Message-State: ALoCoQmioNvgQ2ymmgCOdm3wu34HcV8pEAx3rTU/NzS4BUGDF1QKlElub7t2Txf1fipXN54U1vn8+ikEsBta7XIdZ6kdh3cLea68ytbs0ikIdjwtnDu16o4=
X-Received: by 10.50.126.8 with SMTP id mu8mr3094510igb.52.1451992586184; Tue,
	05 Jan 2016 03:16:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 03:16:06 -0800 (PST)
In-Reply-To: <20160105104620.1367caef@adi-pc-linux>
References: <1449137834-20165-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYjcHpM20DUiu2CzR8hw-wH0zCya+nUzGjBC1FkMRmzPw@mail.gmail.com>
	<20151211170921.5def47d6@adi-pc-linux>
	<20160105104620.1367caef@adi-pc-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 11:16:06 +0000
Message-ID: <CAJTo0LbShuO99dzkc4n89OYm_4Q2Pv=tcGt_+O_ZOm+R8XrLYg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Tue, 05 Jan 2016 11:16:26 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf5108270528945e8b

--047d7b1635bf5108270528945e8b
Content-Type: text/plain; charset=UTF-8

Hi,

On 5 January 2016 at 08:46, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> ping? anyone? The x11vnc recipe is in meta-oe master since 18 dec
>

Can you rebase to master and actually remove all the other references to
x11vnc?  For example, packagegroup-core-x11-sato still depends on x11vnc.

Ross

--047d7b1635bf5108270528945e8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 5 January 2016 at 08:46, Ioan-Adrian=
 Ratiu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu@ni.com" target=
=3D"_blank">adrian.ratiu@ni.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div style=3D"overflow:hidden">ping? anyone? The x11vnc recip=
e is in meta-oe master since 18 dec</div></blockquote></div><br>Can you reb=
ase to master and actually remove all the other references to x11vnc?=C2=A0=
 For example, packagegroup-core-x11-sato still depends on x11vnc.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--047d7b1635bf5108270528945e8b--
