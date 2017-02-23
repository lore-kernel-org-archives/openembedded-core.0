Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id ABB1A73126
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 22:13:18 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u188so4673419qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y0OHXgNm1IKfF5vK15HU35/jW3xb4QOO9DdmMcVKW9I=;
	b=TRXZmALHz+Sbu3upvxqeM252Ge0kV09Im4z8AdhOVGgnq600Jy0fsElSzDFJm5MSZy
	dyQyhe2IRMk3IkHJAaRLXyN3wCsiXuLpR/t7hz9YS+Q7jOWCyvSpf+7njrJcYFLgZHT5
	8N8HFfSVwjfGwOw5mwEwQY3t1VPeZUIxc3C4o6kPZpzCs0j0nueWsaQkAnZjVvlKoHzu
	oLNBdRuOtJRm/fe+b0DcuU4Hdr4bHLxKm0QJ/YvkdN0/JaYp/FoNbm1653cVY5pv46ot
	ksz27ESnlxuhoenH9ra7qABVxM2iQwPuSDTn85wpWl5rcqOlQ/Y+HHMsyGHr78ND+0yt
	Mc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y0OHXgNm1IKfF5vK15HU35/jW3xb4QOO9DdmMcVKW9I=;
	b=jtES1/61S0taeCxG1gnefAmy0z7ymA7ZKeAafjSZ50Czs2CCHrL8R62e/QBzC1lfKU
	ZhM9zjd+vNQV+9Ym07DUhkbVTXcqpGhcEVJEf4y8mv303LfZ2qSXECXSbWub/+zzeiP6
	8qZE1MSf1baiXTGfyxZUwmmcWfuWwekoFu7OdJaHyaF8oPSp9X7RvCcD+nBcIB+YltP/
	L4d8l1voxY/lVTEdCJ0hJvUw7bOnZyka8DXVgcjtgfD/BGkzUT/PyqmVQfz2g/mFWMWv
	xPVZ0fl9l3c30zGvFPdrpF1h+vYDEI84fyEpMiiO3viRo81uv7UJ1vRe8Ikeuo5jo5tg
	f/Yw==
X-Gm-Message-State: AMke39luWIEP6t7J1KJqHeWQ2RxMgifNjs+7/UiEN3vxnNamR0pklPAGw0Yc9XE2E6gCtmXkGMrrPcM0YFXZgsJQ
X-Received: by 10.55.183.133 with SMTP id h127mr42315729qkf.121.1487888000078; 
	Thu, 23 Feb 2017 14:13:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 23 Feb 2017 14:12:59 -0800 (PST)
In-Reply-To: <82576a21b491938531cbbba58160459b91ec6960.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<82576a21b491938531cbbba58160459b91ec6960.1487774787.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Feb 2017 22:12:59 +0000
Message-ID: <CAJTo0LYeRPDGFjL2113ciF7sN9F2o1iap8e5Z_m8b4LPpL3GbQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/24] libiconv: remove recipe
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
X-List-Received-Date: Thu, 23 Feb 2017 22:13:20 -0000
Content-Type: multipart/alternative; boundary=94eb2c060056b5e92a054939ebe5

--94eb2c060056b5e92a054939ebe5
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 14:51, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> It was in use only when uclibc was used, and so serves no purpose anymore.
> Both glibc and musl provide their own implementation.
>
Either this isn't entirely accurate or we need more RPROVIDES set:

ERROR: Nothing PROVIDES 'virtual/nativesdk-libiconv' (but
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-extras/build/meta/recipes-core/gettext/
gettext_0.19.8.1.bb DEPENDS on or otherwise requires it)

Ross

--94eb2c060056b5e92a054939ebe5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 14:51, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D"gmail-:492" class=3D"gmail-a3s gmail-aXjCH gmail-m15a6651412be1fd7">It =
was in use only when uclibc was used, and so serves no purpose anymore.<br>
Both glibc and musl provide their own implementation.<br></div></blockquote=
></div>Either this isn&#39;t entirely accurate or we need more RPROVIDES se=
t:<br><br>ERROR: Nothing PROVIDES &#39;virtual/nativesdk-libiconv&#39; (but=
 virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-q=
a-extras/build/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1=
.bb">gettext_0.19.8.1.bb</a> DEPENDS on or otherwise requires it)<br><br>Ro=
ss</div></div>

--94eb2c060056b5e92a054939ebe5--
