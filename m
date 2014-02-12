Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8CB6EA4B;
	Wed, 12 Feb 2014 17:14:19 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kx10so9473300pab.35
	for <multiple recipients>; Wed, 12 Feb 2014 09:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6xAa/eeH/s7YbzTu7Vgy08o3bXZdH9v/PwRMKwb1K5g=;
	b=OhsAbIYVRFJTOw6Osa4zrcMHqmmBZA7Mje4r22vFin5xdRfBHxmIJeR5FsvlLeabiz
	teETL5aa8IoSQanGJLvUFJORYqqH5+CaotrKUXsZ+w8EUJiKTKu3A7AcxqshYvCTsi9P
	vFYeSGJNhWNK1220VEijPXAV0mBmGPTKanWM6WH1ftOyRtQh7j/A8BCOnnrDNC35WRpr
	6PiucaWTkS2ebucCXpO7WN8ArHlvlBL+QRU+MoiWkvhKyiPs6oREhw72499Pkz47ptuE
	5NLYZTARwzMI+xl6CCZnX+9skmuUb0bRcT1hdPnpD+MDP195P1Df3vwNkMgxJ1AvWYxm
	oWog==
X-Received: by 10.68.242.68 with SMTP id wo4mr53260373pbc.32.1392225260182;
	Wed, 12 Feb 2014 09:14:20 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	eb5sm165695356pad.22.2014.02.12.09.14.17 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 09:14:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1392224030.14081.3.camel@ted>
Date: Wed, 12 Feb 2014 09:14:16 -0800
Message-Id: <11C15F6F-A819-4B43-B574-8D6B08214D4F@gmail.com>
References: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
	<1392219682.14081.1.camel@ted> <1392224030.14081.3.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] eglibc 2.19
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
X-List-Received-Date: Wed, 12 Feb 2014 17:14:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 12, 2014, at 8:53 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2014-02-12 at 15:41 +0000, Richard Purdie wrote:
>> On Sat, 2014-02-08 at 08:08 -0800, Khem Raj wrote:
>>> Hi all
>>>=20
>>> I have staged a branch with eglibc 2.19 upgraded recipes here
>>>=20
>>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/eglibc=
-2.19
>>>=20
>>> These are not final recipes there may be tweaks needed like =
adjusting SRC_URI
>>> later on.
>>>=20
>>> please help testing it out in your environments and machines
>>> I would be happy to help out with issues we find
>>=20
>> The autobuilder is still going but it found:
>>=20
>> =
http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/2=
5/steps/BuildImages/logs/stdio
>=20
> the valgrind configure check breaks too:
>=20
> =
http://autobuilder.yoctoproject.org/main/builders/minnow/builds/25/steps/B=
uildImages/logs/stdio

For this I pushed a fix to pull branch just now.

>=20
> Cheers,
>=20
> Richard


