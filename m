Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id E06CD60112
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:04:44 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id q21so551937680iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0MXCWt2NNQPpS+QRugny6m2XQbmZLJCR4ZUP5O6rURE=;
	b=BLv87iMR4WzqvOoRY+g8JZwqad6akiZNKGdGv9I20reIzCOr7Zeo3rNYu/V8ozKz0t
	Qk9ysmfRHou/cCcJb44CbtIsrZeYBvq8nwDTdyltWhx0guf1bQvV0YnWbK+DtCkElnmE
	2wA6CKX1mPT5w/cwtkw/FyW+6oKt5UN+KOZPcoGmTngQTcXqQMf6bP0+njbXfb6kYegW
	rdLY+ByEtRkaYAYY+x/NZ0qpZMXd2glHIQ6B3R4wqO1UPprTFoKCaGnMn9Ypx8H9dzEY
	DBiBoNhTPHM3RZXhPyHg645GpDTHh+35vS5y5eSi2q2Vbs43uu3Od9nmTLNXB2idt+Py
	okfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0MXCWt2NNQPpS+QRugny6m2XQbmZLJCR4ZUP5O6rURE=;
	b=Yb8FMkjnGXZlarXp0oQ3eqHEmMA4O2eTsTQerz72MTen2mpkst2tbt28GYwO9RTu27
	3RptSSPuhHstXbE4Zl7MCS8aqC+o8ZnnA6GHvJFCjhjjRv9kSMksf/33M7ldlSoegY5C
	InsWopOH4JwgB82jus0nSV7/V87/jYCnajj1MIoObEwaXlkZB4jYzr5ZR9kqgVj0Yhug
	tje8DYYEZeWrmlLnQAPBCkeRkgATOsUJCHNLcwZJGLHoqPhGfOet+1t/KLOk01/IpzZo
	+e4fwF0lt2sXOvi8ScUBJmSricD/mfQa3mjXaqnnz1hlrOVSpZB47qmhz+S8uEr1TwbO
	BTew==
X-Gm-Message-State: ALoCoQkhkRJzop8Nr2A0EWrhmgzsCuyihuC4Tk4K+w2rKlcqNy4ANaeuQgdRkCTYIxSpgi1UCMPyqZ5Mq7+RcTNEo7Eu28WVwLCM6MBgl0JA2LQHFrpqfS8=
X-Received: by 10.107.135.104 with SMTP id j101mr25085017iod.133.1453129485435;
	Mon, 18 Jan 2016 07:04:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 07:04:25 -0800 (PST)
In-Reply-To: <1453109582-25485-11-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
	<1453109582-25485-11-git-send-email-b54851@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 15:04:25 +0000
Message-ID: <CAJTo0LZ3d+Bg+78KN4qY-Z2KDF2eriptPj=7EgqA9QDyVagp_w@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 10/13] gstreamer1.0-plugins-bad: Fix frame rate info lost when fixate caps
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
X-List-Received-Date: Mon, 18 Jan 2016 15:04:50 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92cacf3705299d123f

--001a113ebe92cacf3705299d123f
Content-Type: text/plain; charset=UTF-8

On 18 January 2016 at 09:32, Yuqing Zhu <b54851@freescale.com> wrote:

> Frame rate info will be lost when fixate caps. It will
> cause down stream element fail, such as avimux.
>

The upstream bug here rejects the patch, do you plan on improving it as per
Sebastian's comment?

Ross

--001a113ebe92cacf3705299d123f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2016 at 09:32, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:b54851@freescale.com" target=3D"_blank">b54851@freescale.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":364" class=3D"a3=
s" style=3D"overflow:hidden">Frame rate info will be lost when fixate caps.=
 It will<br>
cause down stream element fail, such as avimux.<br></div></blockquote></div=
><br>The upstream bug here rejects the patch, do you plan on improving it a=
s per Sebastian&#39;s comment?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a113ebe92cacf3705299d123f--
