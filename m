Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 77E5362252;
	Fri, 29 Aug 2014 01:46:45 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id r2so1892065igi.0
	for <multiple recipients>; Thu, 28 Aug 2014 18:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vGUyq8WefDtz8xvgDQWoFckQ3Jn8a49F9MKp48AQVcQ=;
	b=GG3nwqtASivr+6i/WCDxsbeYj7sI5lmdsB8MoL8CxXVvDxW5i/KTP+EUBE9KpdK4C7
	W0LKd3JpyKrhlwFKirGoAFhSQy7Ns9Jz4LTN4+cQlt9FgtXoLQPjumRH74WPMVYF+Jrt
	ZtBAZKagUCZdlB6S/bdD8C04QU7fXUQRnMxVEZEy3Wkc1+sxJw/x8kYpsz+NWFpNeZ43
	vQOQE2Y52xp7AHm4XHGgkpZ45+tfu2Dh4um8g4FTECfsA0GERj0QIjHF5HZYcrSbO+0i
	J0J7TkdcEGLm9UBFhBQSEBs0L/hIyXufXN3Z5Z2fe8O07Hz0Sk3iM5vWTrWASwFCp5Zc
	Bc3g==
X-Received: by 10.50.21.3 with SMTP id r3mr712676ige.13.1409276806648; Thu, 28
	Aug 2014 18:46:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Thu, 28 Aug 2014 18:46:16 -0700 (PDT)
In-Reply-To: <CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
References: <20140828064051.GA13139@haswell> <1409266291.29296.147.camel@ted>
	<CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2014 18:46:16 -0700
Message-ID: <CAMKF1spj67i2i_50m=oTUpS3x2J=de0UxGf70zLhn-a7c4M3QA@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Aug 2014 01:46:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 28, 2014 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> reproduced. will apprise as I have some fix.

OK pushed another patch to the contrib tree that should take care of both
xf86-input-synaptics xf86-input-vmmouse

