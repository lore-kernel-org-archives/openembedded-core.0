Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A35A06E650
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 03:51:54 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 189so43245932pfz.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=10gwJ3vi9jeFJUi7W8SoB0wW4yJd40kyXRPtBlFNefQ=;
	b=MBxJsx5LOsXo5HXEiErPf6+BLwL7SGS41q+bNApy3AF/ql3nzFHvv9iYvK+nCJN8WT
	W+ewfXJfvvWQ66e3rbrC5Ed+1RSvhSNibmxCLmR5Xaga3djN1DxIoIAMDpAUCwOuJB49
	LG2w/MqYq6vyN+Wl7GMepnshQQwRrrIv5WuYc/JqkkOzlYHr+JnUDSZXD+acf6tNc3GZ
	63KbwbZEohcvfTVxvj2EdaWDgje7lyxQG56xKmP0fj/OLVrixvjLeB09Y0HBAa2+yjD4
	bc4dx+FQchUq5Aw7Jir0QjzgJVeqYcGpFVPbR+bu/JNWjFNjf5R2D2sme9poTf4/2Ohf
	USOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=10gwJ3vi9jeFJUi7W8SoB0wW4yJd40kyXRPtBlFNefQ=;
	b=hhdIvZCDci01sQguzVt7KNXFke7mX7Z2PcRYcc7Mv70/KIBV0DODXRCU/Q5cMmQa7D
	KQPxepSo5TqCFIi67zcxWX3HaqgRiuhd0QTa/jcukKwstRV+bCSXzzTTMGFT+7KIgbfi
	Rb63bUb73aHPtOmmFnWjgrGLyyATIjiB+js41iJyhoOAD4F6mYMhCA5PGGGdNm8PLFQE
	mwba+Dx9xlsTHVcn3/Rmz74BTrSTGoTOazAcHpoZmPka7ZeJfEPHs/B3C2VM270kxAQp
	OkQw73fIlD0WKmar+KQNQKldIElGgXyIxcFMx7L4kUK/ChKhtK2jckCzTWuudgtnFvys
	xdXQ==
X-Gm-Message-State: AKaTC03mKWOwWRfB03PQUVGvm2MnUVfgEhLCs2WQYudDWWZlOBFlfiiZo8tKUfHOkxyWDw==
X-Received: by 10.98.72.129 with SMTP id q1mr36710648pfi.169.1480564315700;
	Wed, 30 Nov 2016 19:51:55 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a24sm89989005pfh.57.2016.11.30.19.51.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 19:51:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1611300625420.7224@ca624034.mitel.com>
Date: Wed, 30 Nov 2016 19:51:53 -0800
Message-Id: <7B9B81D0-0F48-46A2-95FC-639A2EE0D555@gmail.com>
References: <alpine.LFD.2.20.1611300625420.7224@ca624034.mitel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3251)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: purpose of variables like "base_bindir_native"?
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
X-List-Received-Date: Thu, 01 Dec 2016 03:51:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 30, 2016, at 3:34 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
>  i'm putting together a tutorial on the structure of the native
> sysroot and how it's built and variables involved, and was poking
> around in both bitbake.conf and native.bbclass, and i'm curious about
> one or two things.
>=20
>  i could be totally wrong but it *seems* like there's native-related
> content in bitbake.conf that could be moved over to native.bbclass to
> reduce a little of the clutter. i'm perusing bitbake.conf and it's
> hard to keep track of some of the variables just because there's both
> native- and target- related settings in there. but i'll admit i
> haven't finished my inspection.
>=20
>  on a more specific note, in the entire oe-core layer, there are two
> references to the variable "base_bindir_native" (formatted for
> aesthetics):
>=20
> $ grep -rw base_bindir_native *
> meta/conf/bitbake.conf:base_bindir_native =3D "/bin"
> meta/conf/bitbake.conf:PATH_prepend =3D
> "${COREBASE}/scripts:i
> ${STAGING_BINDIR_TOOLCHAIN}:
> ${STAGING_BINDIR_CROSS}:
> ${STAGING_DIR_NATIVE}${sbindir_native}:
> ${STAGING_BINDIR_NATIVE}:
> ${STAGING_DIR_NATIVE}${base_sbindir_native}:
> ${STAGING_DIR_NATIVE}${base_bindir_native}:"      <----- there
>=20
>  so, given that that variable is set in bitbake.conf, and is only
> referenced in that same file, what's the point of making it a
> variable? doesn't hurt, of course, but when i see a variable, i
> normally assume it's because it might be modified later somewhere, but
> i don't see that happening here. is there a reason for it? same thing
> could be said for "base_sbindir_native" as well.
>=20
>  thoughts?

you could modify it if you wished to then you just change one var in =
local
metadata

>=20
> rday
>=20
> --=20
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


