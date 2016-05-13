Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id EB9B86FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 14:05:39 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id qe5so8483701igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EqAsl/Oc2qh0KOZPZHrufiyUohCMFuBnw+O49Qb/rLI=;
	b=mnTRMHMdT65XtkSUz1O0jYY8hO//I/M4gnHoaYvCkfH0XHkrmBhjr9KuUkEE+bcb12
	Xv4OV8gft+BETPiYqSoQd9As4GTCjaoBvJEVsqC8QWo5EuxAk+cHBHQ7D0pTV398wmKN
	XzlqYE9Ve0oUVjqjeOmcvrOauYcochzH6xTueexnxaOFubv44dlHipnd9Ih6jJWozMfB
	X9AefyU/okPngnBJ+LanTv0VqV3osYgmeyA6y66YSuv3BsVl2kwnRZvkepLQ+XOFOZWC
	Z/GEyQ2Y2LJihf1BsbldEn9sjNWOVvPNR04Hi73HMU7zwas3vOXbbAqW5vx12PcbpAta
	LXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EqAsl/Oc2qh0KOZPZHrufiyUohCMFuBnw+O49Qb/rLI=;
	b=AGIr6SWdsKQpR3AURx8JyaQCZOye4VjzsfX6AUh1Xs273vQmpIrPl0+34yqfex9UzA
	M/+51BAeQ6mJcMrWKLwVP54S4nzmj0ivaSeEoTLjHp2/TZdIsyRWyZhHAUgO5olU2BHw
	00WCcjUJb7Y0zHwBSoI9UfMvjsWeGMZ0Xc0B2XnrngEaQzaZzd2ZAX107U5wNNcY/qgE
	dN6+0u6a/I5UYkKSBpp9RceIzA1M6vqhCLMIobY/sg50dFWfsD2GlbDK/xkF6ETcG/HT
	0nr1cfEsw02H5bdAJtiV12j4gik4ygR5lmMHniH654RBpLdkmuE3Qzc4SMCuRpeBUsC9
	H/3A==
X-Gm-Message-State: AOPr4FXo6MI/u/tXHjVGUADZ2F4DRr39xlzfW2608C3CT/ekxl6swQMxdzOYfUJM9xE8Snu9skDVWF7TMNc1lz3N
X-Received: by 10.50.62.20 with SMTP id u20mr2343922igr.52.1463148340238; Fri,
	13 May 2016 07:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 13 May 2016 07:05:20 -0700 (PDT)
In-Reply-To: <CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
References: <573578BA.80207@windriver.com>
	<CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 May 2016 15:05:20 +0100
Message-ID: <CAJTo0LYBV31Mp5h2fCSAw+AnAfMNOD2kQ2D60M2JLiA1nhV6+A@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: krogoth's core-image-minimal is much bigger than jethro's
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
X-List-Received-Date: Fri, 13 May 2016 14:05:40 -0000
Content-Type: multipart/alternative; boundary=047d7bdca60612f4820532b9c576

--047d7bdca60612f4820532b9c576
Content-Type: text/plain; charset=UTF-8

On 13 May 2016 at 08:07, Andrea Adami <andrea.adami@gmail.com> wrote:

> IMHO for embedded devices it would be better to disable by default and
> let the distro/machine add a specific RRECOMMEND.
>

Patches welcome :)

Ross

--047d7bdca60612f4820532b9c576
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 May 2016 at 08:07, Andrea Adami <span dir=3D"ltr">&lt;<a href=3D"mail=
to:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1oo" class=3D"=
a3s aXjCH">IMHO for embedded devices it would be better to disable by defau=
lt and<br>
let the distro/machine add a specific RRECOMMEND.<br></div></blockquote></d=
iv><br>Patches welcome :)</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--047d7bdca60612f4820532b9c576--
