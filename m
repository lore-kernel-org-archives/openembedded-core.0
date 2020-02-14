Return-Path: <andrew@avilution.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 94A0960FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 00:49:35 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d11so7619001qko.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=avilution-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=QkIaZR7Fr0tGnta7G9yHKqw786qqM6KgknUnnKYYOCs=;
	b=sLmHCFASTJ6Jwjft6JRfTmpHxcFurupeqapHBX6Lx8FM/DeZYF5MsxIVuAKXzOkGe3
	vwnD7ePK0ZMmntcz/zA2mQttnf0UDXhEdQNx0ZHHDIYDfJoiEp28m4aBNx1TfzQ0zwDY
	iRhWM3gQ4rSpXdNTMdqER5YSp8NsfobJPwlmgMZh7CUbJOgbO2ushSz++SXxGDe5hh0L
	+Ct8fI0OTGC6BqL6SHqbnNOPYxwXRGLD6a/LykVGrKF8y8xcB0RM++o1s1enRzEKT1Lf
	xAN5SbqiGvlVMn7VRo+37QAcmNNGVX6Rn4fElCroXgk5ljBuyXjBWHG+oo7aXx/XMyiy
	ueCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QkIaZR7Fr0tGnta7G9yHKqw786qqM6KgknUnnKYYOCs=;
	b=sir+rvzvSOyC+sEXlKCEhE61v1E1TpLgXy6EzGFRw9DColyc9APhcPwkTAdx/LX33P
	ZUA8IicDj4U17gws49a78U03PN9G3jGQroX/39T7CUJTHxPMqf0EZi9ljJpmQgVEA+/s
	JrJKf+YIXplXVmzbPNj5/vVDU2WnwBfZcFpaQkOwDhbzqGHw//PV19rf0aUx231A2lT8
	lJJLFXbIpM8mzdGCLPsp1bK7vxjhSFKnMpmly1a6MqknrKBtPigWivz3JSAaAV52zx4B
	iZsIr1ZFI/DpuicPr/Spqy90E2SYQYxXyK4+kHNmcbNC/lbWsJPQPKZ9acfhwYDpiGLh
	kZvA==
X-Gm-Message-State: APjAAAWGs1x2M6LtYCFkOyo/IC36q41v784xpLstHzmsx7+e2FHiYd4A
	jl3drgMr763JvOr0S54tlKSbIq+kgPLx5a16OxsPt395zs4=
X-Google-Smtp-Source: APXvYqwNeOEs7BN1oY2MXnC1wgeoM9qggVXIQ5YPPvFPTqyqZyJEigc7G+dJ8tFppatNlcSzrNs4Myi7L44nKdAnA5M=
X-Received: by 2002:a37:9ac6:: with SMTP id c189mr315321qke.40.1581641376210; 
	Thu, 13 Feb 2020 16:49:36 -0800 (PST)
MIME-Version: 1.0
From: Andrew Boos <andrew@avilution.com>
Date: Thu, 13 Feb 2020 18:49:23 -0600
Message-ID: <CAGgh2e88CwQZjrosOkZ4Jdd4nK2V=YC3+e65eRmLrqdUSPC73Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Unknown Postinstall Scriptlet Failing to Defer Boot
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
X-List-Received-Date: Fri, 14 Feb 2020 00:49:35 -0000
Content-Type: multipart/alternative; boundary="000000000000643468059e7e94df"

--000000000000643468059e7e94df
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working on a bitbake build and I am running into an issue where a
postinst scriptlet is failing via "exit 1" to defer to first boot and I
cannot figure out which recipe is causing the issue. Does anybody have any
tips on identifying which recipe is actually exiting with a failure? The
error log says that it is in imagemagick but the recipe does not have any
postinst scripts defined. Also, there are no imagemagick .bbappend files in
my layers. (
https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
)

Thanks,
Andrew

--000000000000643468059e7e94df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I am working on a bitbake build and I am running into an is=
sue where a postinst scriptlet is failing via &quot;exit 1&quot; to defer t=
o first boot and I cannot figure out which recipe is causing the issue. Doe=
s anybody have any tips on identifying which recipe is actually exiting wit=
h a failure? The error log says that it is in imagemagick but the recipe do=
es not have any postinst scripts defined. Also, there are no imagemagick .b=
bappend files in my layers. (<a href=3D"https://github.com/openembedded/met=
a-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.=
0.7.bb">https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe=
/recipes-support/imagemagick/imagemagick_7.0.7.bb</a>)</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Andrew</div><=
/div>

--000000000000643468059e7e94df--
