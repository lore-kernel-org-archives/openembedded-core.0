Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 928EB70178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 15:24:58 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n21so99092111qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+WZvk1F/mz2lbDCg+i0kmQ1bqGaDlS3ZGUsTeL1VK2o=;
	b=Yyq2N7pCD8NnNbEodmOEAMshkPbqy0epxsPfVa/W1moeNCI6Pv0jpT8oWnOVYM2dW9
	ywvGiu/3DUwoLp3ZShM0kUCfL8ErUS9jUDFgB8X7gNsnINBTkJra9neygMirIxn6W7DZ
	5fJaImpJBx/kV5jvHPznBCbqv2wuvy6mA4irm9GQJnFhI1gTG2rMb/AYx9lPGEl5cjz0
	+upvULBU4Ikq4WRFLlOzC5mLU56Rh8Q2+kbZA3slKQkAjpGbAM9EPAM8oSL+rG1BKNXr
	L7ggf8Rih+E0UPXrDk2GftyvwD36pZJcbsF0HyY1IPWqW+AfbPasO5ZIJ54bELPy3/Y7
	v0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+WZvk1F/mz2lbDCg+i0kmQ1bqGaDlS3ZGUsTeL1VK2o=;
	b=Uojco8FIFOEfygxGT4o9cM4y0ZqSRaXQMrkillh8WkSlBMusGzM8Q1IsXp7V0bB5b2
	er00iMDpX/CPKLqjX/XIyAMobKnBo+LoyDNOvKD8ctt9JcRwJTUOsyWirRGI4y1pNFiC
	UZnSaVjzgfunzW3Q4Xu4UK3MXrmwz6rgCI4g6s76RCc8lnX91ScqawHND5K2Nv+L9ZTJ
	JpWdlep5JvE5w9aqPVnEE6wdhC4ZMdv7lZlWY7y6BJBzvZQVX+FaYGY1WxgU/sJHDle4
	VHkc23+BWQvz/42kgqAbYgG+ihGm/5oUVK1uFPlPed3ChL+W2xTQQtbm0TyLf6d0Jntl
	Czcw==
X-Gm-Message-State: ABUngvdG28hJCLmMsuHHE16Y8FuIt7BCIS0Ng1tXCzTvhd5QsaCzFln6Ycq7dv1GQ6i2rt7mmqEsYSc43H0/5yQm
X-Received: by 10.55.106.134 with SMTP id f128mr18870867qkc.121.1479137100393; 
	Mon, 14 Nov 2016 07:25:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 07:24:40 -0800 (PST)
In-Reply-To: <1478886733-27782-1-git-send-email-philip@balister.org>
References: <1478886733-27782-1-git-send-email-philip@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 15:24:40 +0000
Message-ID: <CAJTo0LY3bXxCdX6GOqeY3ZHqiLwJyWkOJmRdyAfXsgmc0zFN=Q@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Fix rootfs_size variable not found error.
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
X-List-Received-Date: Mon, 14 Nov 2016 15:25:01 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6717faf0541447170

--001a114fddf6717faf0541447170
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 17:52, Philip Balister <philip@balister.org> wrote:

> Commit 1ba6101ceaee354816e690d44bc9a5dd8dcf4011 introduced the runtime
> error. Thi scommit should fix it. Tested with an sd card build with
> an ext4 file system.
>

Already sent as "wic: use partition size when creating empty partition
files", should be in master soon.

Ross

--001a114fddf6717faf0541447170
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 17:52, Philip Balister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2e2" class=3D"gmail-=
a3s gmail-aXjCH gmail-m158549c1b58d6e90">Commit 1ba6101ceaee354816e690d44bc=
9a5<wbr>dd8dcf4011 introduced the runtime<br>
error. Thi scommit should fix it. Tested with an sd card build with<br>
an ext4 file system.</div></blockquote></div><br>Already sent as &quot;wic:=
 use partition size when creating empty partition files&quot;, should be in=
 master soon.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a114fddf6717faf0541447170--
