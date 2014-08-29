Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCB1711D6;
	Fri, 29 Aug 2014 00:42:00 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id tr6so1946440ieb.38
	for <multiple recipients>; Thu, 28 Aug 2014 17:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=19juPVEq+LL7m2sakrAvCRZcl88I5NVWteUPmFrtG2o=;
	b=B3j/fNTWBsI0kiTsc2QexEHur0h5MQAXTowsVuh6RQamPADPR4cej172FMueLKgL2t
	ta31Is5aWCuJ2w1TatX1iq5aV8ueqdmTUQGv9Olz/r9BKM1LfCurbR2DU0j6PVybuoFp
	QbO8Q1EyeY1J4ryAvQWYTdK/nrOR5n3StgAGps2pPiGtkvSgdqFjIAy4JVJrhokSWiUz
	He9pov8bRN9CcjhZqN/UsKUSDDuddM1bTcPJy50DX0cg11Img1VZLnXXRELlDa4NH8Tp
	r9XQQbc29DVWIgXF0LauKJ0YZawQM2XMjQfxjppeHSG7mIEjYjRSwpwDLNzdcq7Budlf
	Z3LQ==
X-Received: by 10.50.85.74 with SMTP id f10mr586910igz.4.1409272922233; Thu,
	28 Aug 2014 17:42:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Thu, 28 Aug 2014 17:41:32 -0700 (PDT)
In-Reply-To: <1409266291.29296.147.camel@ted>
References: <20140828064051.GA13139@haswell> <1409266291.29296.147.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2014 17:41:32 -0700
Message-ID: <CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Fri, 29 Aug 2014 00:42:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 28, 2014 at 3:51 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We're also seeing:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/15/steps/BuildImages_1/logs/stdio
>
> which turns out to be triggered by the libc change (I confirmed on a
> local build). I haven't looked into why. There is also a similar issue
> from the synaptics driver.
>

reproduced. will apprise as I have some fix.

