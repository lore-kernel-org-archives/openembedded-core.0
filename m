Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6446B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:24:05 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id i14so3650380qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5jfqz5zYJx5qh4vjYaOofgZmBU90LzVYBjAO+FTnZus=;
	b=H+YJLK95tuBRbR61EHhnUxjonBSqfA5FCuSkhzfLFSG7tUwNRIB/hLiMzvbQ+53ffi
	bj+NOzGIyz9uDIK9u0r0CMztugGrIsRZK2+bCDbVSmqxYaY8CWAWZCP71fBSrTbx+hkI
	DcElzm6eXVPpfB5RvPQdVcUjLBYyrUlqJHUGRznAyCQl3r5aD5v/xUTJEblLC/l7WTHY
	Gma8s+0UiTlrNQLGkslicBEdFrQXWtqVJukMyjhO2Nfarwdg6tBJREe4Zr/Z6xIRAWMD
	jxaCAVo62UB8avEssogX1XQU8wuI3l8J/W/kHchk6LYmAWHLxgLD0UIXXe8IrbqO2J7A
	FoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5jfqz5zYJx5qh4vjYaOofgZmBU90LzVYBjAO+FTnZus=;
	b=lJiKEEE3hobeCuCv2BfczNTgJWgV4DgHWpSABI8l4gkHCghgWjRQchHdUGgNLoKAWF
	0HSthmbih5nCSMsAgLUiNU2EN8mdGrYYk7kFbtGngb2DfsG+5eX7qCGAtKOUK0CP2lyh
	FLhRm3JaCVQMKgjz0RFeDJZ9BG7lcQMkE6FEwVJFtAAHpRSdyw8Ii7sxkCyln8gEhQ20
	mxBPoSFcupeg3pI4w4ZfFD8IQM18XRuVHBzZA9YeYu5/U6+u9iqPNfCBBb8WSs/iUYqc
	EaHeZkRFev1OHK45c1kslrUD7p2OCngvbnK27R/LmUn/uYryD1mai15icyzrdWktR7Z2
	nl6Q==
X-Gm-Message-State: APjAAAWbg3VDEMAdpVIBIX0Y//Ivz04AQmSmKsPqhlc5e6+pweo4lSEn
	Iltmen2nXa8NJHEEZ0zXUc3Y0qbJoVvm9hA7PirMHw==
X-Google-Smtp-Source: APXvYqzOimc/Si5JxWT0rsdN+t3VivAAX4bJ2Q5lt6UuIQ3pAG81Jln21+xltzw3ACtw7AxqScyBwuDCTBDDHkJ26zA=
X-Received: by 2002:a0c:b645:: with SMTP id q5mr24460017qvf.194.1552278246770; 
	Sun, 10 Mar 2019 21:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
In-Reply-To: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Mar 2019 21:23:40 -0700
Message-ID: <CAMKF1souJ1e1GG6qHvSsSYi6v84FriBjwP3Fifp10e8Z2mK-_g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can't build product that uses DEFAULTTUNE="arm926ejs"
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
X-List-Received-Date: Mon, 11 Mar 2019 04:24:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 10, 2019 at 9:20 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> I'm trying to build with master of OE-core and one of our products now
> fails with:
>
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>     Either fix the cause of this error or at your own risk disable the checker
>     (see sanity.conf). Following is the list of potential problems / advisories:
>
>     Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t armv5
>     armv5t armv5e armv5te arm926ejste arm926ejse <BSP name withheld>) for
>     DEFAULTTUNE (arm926ejs) does not contain TUNE_PKGARCH (arm926ejst).
>
> I believe this is due to commit ac83d22e (arm-tunes: Remove -march option if
> mcpu is already added). If I build with Thud, TUNE_PKGARCH is "arm926ejste".
> The  lack of the "e" at the end when building with master seems to be due to
> the definition of ARMPKGSFX_DSP as
> "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}" and
> the fact that after commit ac83d22e, TUNE_FEATURES no longer contains 'armv5'.
>
right this should now check for armv5t
armv5 has been removed from upstream gcc as well. So we only support
armv5t viariants.
> //Peter
>

