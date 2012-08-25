Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T5HN4-0001jj-Im
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 16:29:54 +0200
Received: by wibhn17 with SMTP id hn17so1593533wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 07:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=IrVy3+P2HXSMwfrJldKHI60mG6cHtbt46DHqJjxz33k=;
	b=Dm3H7NjbIsIjPzKQlGPXVODl6KH9gOBVd4CVw8gfZ6+WTAGmz8KIJGcRJHAfJGgzA0
	27BAcGUQB9oCb2oisp4YD1UEUZT8oUXfd4Rd+WzTIF+cLKTWfrKw/mfatTk7AZ6UsMzv
	2+Mi/H3XVVhBzM1ek5P6S8g2to7tRrHdmHiKorrVIhfS5tXILADxB2YiaHH2BBHlbQar
	RTiLZlg6RAHxFpJZqCsr7/iRWGeWyRYdCeYXXnm6tgd+K3l+VmS2LjNewjbvMl7oglC5
	5VAYCG9YJvE4D3+VMNjfg4BXS2lUcj2if07ucR4AinMIkboRIxGSoK1AyqV+wWic1TpT
	Ippg==
Received: by 10.180.86.106 with SMTP id o10mr12697358wiz.22.1345904265695;
	Sat, 25 Aug 2012 07:17:45 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id l6sm3441117wiz.4.2012.08.25.07.17.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Aug 2012 07:17:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1345895796.14369.106.camel@ted>
Date: Sat, 25 Aug 2012 16:17:43 +0200
Message-Id: <1A25F2D9-E229-44B5-A7D4-AA363EB1EA57@dominion.thruhere.net>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
	<3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
	<1345895796.14369.106.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnmwgm8GPF8iPqeNh0byDzF7dSR2Aj+Bke4oKudsKHMPSNdgR36Ya6URcJWaXinQxQZAblR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2012 14:29:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 aug. 2012, om 13:56 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sat, 2012-08-25 at 09:45 +0200, Koen Kooi wrote:
>> Op 25 aug. 2012, om 06:34 heeft tom.zanussi@intel.com het volgende =
geschreven:
>>=20
>>> From: Tom Zanussi <tom.zanussi@intel.com>
>>>=20
>>> This is the ia32-base.inc moved over from meta-intel.  See =
meta-intel
>>> for the complete history of contributions to this file.
>>>=20
>>> Here's the initial commit text that explains the purpose of this =
file:
>>>=20
>>> The meta-intel BSPs currently have a number of machine settings =
common
>>> to all - factor these out into a common include file.
>>>=20
>>> Also add several new intel-specific XSERVER variables for building
>>> XSERVER variables in BSPs.
>>>=20
>>> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
>>> ---
>>> meta/conf/machine/include/ia32-base.inc | 58 =
+++++++++++++++++++++++++++++++++
>>>=20
>>> +# glibc-related variables
>>> +#
>>> +GLIBC_ADDONS ?=3D "nptl"
>>=20
>> That's a distro setting
>=20
> Yes and no. It makes sense for architectures to have sane defaults and =
I
> class nptl on ia32 as that. We want OE-Core to function distroless but
> allow distros to change things where it makes sense to them. So I'd
> argue this is reasonable.

So put it in default-distrovars, not in a machine 'tune' file.=


