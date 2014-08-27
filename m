Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB99B6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 15:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7RFp0ie007480; Wed, 27 Aug 2014 16:51:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c1lAc4Uyk8J3; Wed, 27 Aug 2014 16:51:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7RFot0s007475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 27 Aug 2014 16:50:57 +0100
Message-ID: <1409154657.29296.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Aug 2014 16:50:57 +0100
In-Reply-To: <CAMKF1spTdX1Mom+X5LOt5-pRpCMUuNmxTpvfQ+VOjVaasNrS=w@mail.gmail.com>
References: <1409151022.29296.7.camel@ted>
	<CAMKF1spTdX1Mom+X5LOt5-pRpCMUuNmxTpvfQ+VOjVaasNrS=w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patchelf: Add patchelf recipe
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
X-List-Received-Date: Wed, 27 Aug 2014 15:51:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-08-27 at 08:08 -0700, Khem Raj wrote:
> On Wed, Aug 27, 2014 at 7:50 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This is useful since it allows us to edit the RPATH and interpreter fields
> > in ELF binaries. This is potentially particularly useful in improving the way
> > we can use the SDK and also potentially making native binaries more relocatable.
> >
> 
> Long ago I had a patch series to replace chrpath with patchelf see
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/patchelf
> 
> can that be considered now ?

The issue is one of dependencies. We need chrpath/patchelf to relocate
things like {autoconf|automake|pkgconfig}-native. Native
patchelf/chrpath depend on those things to build so if we don't have it
in ASSUME_PROVIDED, we get circular dependencies.

chrpath is widely available in most distros. Unfortunately patchelf is
not. We therefore can't easily put patchelf-native into
ASSUME_PROVIDED :(

So the reason the above didn't merge hasn't really changed, much as I'd
also wish it had.

This does not stop us using patchelf for other things though (and I
believe we should).

Cheers,

Richard


