Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs5P9-0004iB-6g
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:33:16 +0100
Received: by lbol12 with SMTP id l12so390075lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 20:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UARGth6lru+iIgqSCWWKDW7kU4I8qJF5tC3MZqBXX5o=;
	b=wqTIQMRxY75tJP9+kk8kRccEj+Bi8j3fLg9hrCJ89ouywPFberWgOhMkgPvYovZdVL
	SUeP+8+Iwwe6O22YZHs+T4wzNAUAFZRHxElrU7bAkfOmsO1owRCOOvvECmTKNj5A+fFV
	G+5XSLbRo4V6IRwkeBJHDsjFMFrCl11u2Qhk0=
Received: by 10.112.101.34 with SMTP id fd2mr5153928lbb.16.1327983921238; Mon,
	30 Jan 2012 20:25:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 20:24:51 -0800 (PST)
In-Reply-To: <1327974653.1334.0.camel@localhost.localdomain>
References: <4F24F822.1010102@emagii.com>
	<1327974653.1334.0.camel@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 20:24:51 -0800
Message-ID: <CAMKF1soXjPuoroZR5kkvzD5vT+QXy-==peaSa+hV2Xore+E_VA@mail.gmail.com>
To: niqingliang@insigma.com.cn, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "ulf@emagii.com" <ulf@emagii.com>
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2012 04:33:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2012 at 5:50 PM, Ni Qingliang
<niqingliang@insigma.com.cn> wrote:
> it is replaced by kmod on archlinux
> http://www.archlinux.org/news/kmod-replaces-module-init-tools/
>

yes I have local recipes for kmod but untested

>
> On Sun, 2012-01-29 at 15:41 +0800, Ulf Samuelsson wrote:
>> Don't know why, but it is no longer available (used to be).
>>
>> "openembedded-core/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb"
>> is thus broken.
>>
>> Found it on a mirror.
>>
>> "http://ftp.tlk-l.net/pub/mirrors/kernel.org/linux/utils/kernel/module-init-tools/"
>>
>> but it would be nice if it was cached somewhere.
>> openembedded-core@lists.openembedded.org



>>
>> --
>> Best Regards
>> Ulf Samuelsson
>> eMagii
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


