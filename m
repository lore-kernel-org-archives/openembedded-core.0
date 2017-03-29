Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5755B605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 16:01:08 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id f11so16863948qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gW9INmdl+p7x8Xu6p5kUWO88g2UeCeqtTWG7tZdxFG4=;
	b=Ld0zAsJ5ICzJh4ymX1ZuyfBLlByKZ2brPgX6mSpviYA9D1fq6/unViTAahDJoc9qkd
	4FGXIvPngFQFy87g+gWmOzxb79Kikt/ezvKwfE/mwbmD1q3infoONIXt2ENq8tAAj1l9
	a3z4l8TNaLI1FiizVj5qjARMr8ZIatW9Puoya6Ub4C2omQfHjvZefjNCHaeMjWKZQVij
	haBpril5Mh2q4zlXTJS3St6eZt5xNBzS4X3gTWwEP0+VBg0ucklGcz2dWRTYZbu+H6tg
	1Xk9lke4pxYklbC/JGJQb6Y4WE5IOvBZ6pcxLmzT+0/ulsPXPZDFWTKMA2RiVgGx8JnW
	rS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gW9INmdl+p7x8Xu6p5kUWO88g2UeCeqtTWG7tZdxFG4=;
	b=FvMZ8jJ6w+L5EmMqIC9z7v8ZwGgtZC1IX7s4FTsT0mggcq+1V2aQjz3Jt1APvZsdmE
	22+N09+5ftGJ+bR3RQTiach1zJfYyW0gUp6F2PYs0lBXCJBSobhk1nePw3S7Q2rv8Hw8
	iM3M5cnTY3n/E5DlLBOizXA1K+dUAJaxWBqNGiqPZ2CiipDCgLYkfUZcM6QCIy01Ih0F
	MuJULZweVCjxLE5YkgnfOkE63NkLEVUu08NDHh4aGXN3k24Df9dwgq+gsyQa51J+3BUG
	vDSMrVFJsK5Wtlx41iaoZOJR0mwuetMIA7kpC5vNUt55ls4YJ+nNZIVf5/+uxXLdtz0G
	+vSQ==
X-Gm-Message-State: AFeK/H2AOupBehaiTWgbQMQMAHdDFS7oRromK5NLUcC2OeqWqa5I5ONpaYnehcvN23ZpBbpSHs6S3rjVonvZ/ac0
X-Received: by 10.55.119.134 with SMTP id s128mr1238908qkc.244.1490803269789; 
	Wed, 29 Mar 2017 09:01:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 29 Mar 2017 09:00:49 -0700 (PDT)
In-Reply-To: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
References: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Mar 2017 17:00:49 +0100
Message-ID: <CAJTo0LaLhSaC3bx09=qc+gL7YsPKD0YEtukZafUXcxZdW37dwQ@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: check 'efi' in MACHINE_FEATURES
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
X-List-Received-Date: Wed, 29 Mar 2017 16:01:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c05cbd053865d054be0af5d

--94eb2c05cbd053865d054be0af5d
Content-Type: text/plain; charset=UTF-8

On 29 March 2017 at 10:26, Mikko Ylinen <mikko.ylinen@linux.intel.com>
wrote:

> The recipe checks 'efi' in DISTRO_FEATURES but it's a machine feature.
>
> Fix the check to use MACHINE_FEATURES to determine whether to
> enable/disable 'efi' PACKAGECONFIG.
>

This makes systemd a MACHINE-specific recipe, and as it contains libudev
causes rebuilds for everything linking to that.  What's the actual impact
of enabling/disabling EFI?

There is a whitelist for recipes which are machine-specific but should be
treated as tune, but the barrier to get on that list is high.

Ross

--94eb2c05cbd053865d054be0af5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 March 2017 at 10:26, Mikko Ylinen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mikko.ylinen@linux.intel.com" target=3D"_blank">mikko.ylinen@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
257" class=3D"a3s aXjCH m15b1964242b247fa">The recipe checks &#39;efi&#39; =
in DISTRO_FEATURES but it&#39;s a machine feature.<br>
<br>
Fix the check to use MACHINE_FEATURES to determine whether to<br>
enable/disable &#39;efi&#39; PACKAGECONFIG.<br></div></blockquote></div><br=
>This makes systemd a MACHINE-specific recipe, and as it contains libudev c=
auses rebuilds for everything linking to that.=C2=A0 What&#39;s the actual =
impact of enabling/disabling EFI?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">There is a whitelist for recipes which are mach=
ine-specific but should be treated as tune, but the barrier to get on that =
list is high.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--94eb2c05cbd053865d054be0af5d--
