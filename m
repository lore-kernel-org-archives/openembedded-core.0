Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B7102754B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 09:02:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6I92c3h021243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 18 Jul 2018 10:02:39 +0100
Message-ID: <ed9efd62e275c8632d0983951cc44abf8ea6b592.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2018 10:02:38 +0100
In-Reply-To: <CAJ86T=VZtnKx4HuQt=czPQ4Qfy9DY93xYjmduOh694rEDedBWQ@mail.gmail.com>
References: <CAJ86T=VZtnKx4HuQt=czPQ4Qfy9DY93xYjmduOh694rEDedBWQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: Why don't uninative tarfile filenames include a version?
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
X-List-Received-Date: Wed, 18 Jul 2018 09:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-17 at 18:37 -0700, Andre McCurdy wrote:
> If fetching the correct uninative tar file fails, it looks like the
> fallback is to fetch a random version from MIRRORS ? (OK, it's
> probably not random, but it's not the one I wanted!).
> 
>  | --2018-07-17 16:32:53--  (try: 2)
> http://downloads.yoctoproject.org/mirror/sources/x86_64-nativesdk-lib
> c.tar.bz2
>  | Connecting to downloads.yoctoproject.org
> (downloads.yoctoproject.org)|198.145.29.63|:80... connected.
>  | HTTP request sent, awaiting response... 200 OK
>  | Length: 2516573 (2.4M) [application/octet-stream]
>  | Saving to:
> .../setup/build/downloads/uninative/ed033c868b87852b07957a4400f3b744c
> 00aef5d6470346ea1a59b6d3e03075e/x86_64-nativesdk-libc.tar.bz2

This looks like a badly setup mirror, that file should not be there.
There was a good reason the filename doesn't have a version in it and
we use directories instead. What that was I don't remember offhand.

We should get that file removed from the mirror though, it should never
be fetched to there...

Cheers,

Richard

