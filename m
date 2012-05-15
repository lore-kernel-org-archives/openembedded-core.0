Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUOwV-0007VA-BT
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 23:06:09 +0200
Received: by eaal1 with SMTP id l1so5125eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jN0V57Fd9qrs5QA5H7t5kjYY2hFKYLcXwe1ITvVYDe8=;
	b=NQNBZ8O9Ahw8nOQMDzPfW/8r7OxbOT012bC14R58AbC6FM//Dm2c05Y0VExuMGpHp+
	gWM21Iy8cyhTn09eWV00wcvysUQdUQPBgecQYPSxUMdXGXKykzsFETtjTUQNc5z9AsYb
	0ub2gCo7nr04WfDOCrWFTPykcTfuMlG4ScD50qDwD2zQg0vCpyPS50fN3gSYxHWdR30T
	kjQUB4EIXdzMlujsvBgMrfWUldQTvKRJNybZrT+tWXHP/zGd6ljyjb5Z9e4IlAJrRvcJ
	Mk/VI5uZYxi7uxWyvwe2BbCe6JoPhYWVgp869HpMVjIKvwYQP49PFJGiIoos0JfF8LY/
	QBVg==
Received: by 10.213.20.200 with SMTP id g8mr852447ebb.103.1337115363077; Tue,
	15 May 2012 13:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 15 May 2012 13:55:32 -0700 (PDT)
In-Reply-To: <1337104514.2711.45.camel@ted>
References: <cover.1337003246.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
	<FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
	<CAP9ODKqS16XxB0pSXdf7RONbRCagQL=9B=ia44vjDDFwneOY4w@mail.gmail.com>
	<1337104514.2711.45.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 May 2012 13:55:32 -0700
Message-ID: <CAMKF1spONAWa-N3=OK9fF9-+yuvKizoxfWEO_xQwZVZUUvZ17Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Tue, 15 May 2012 21:06:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 15, 2012 at 10:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I've heard requests from people that / be bootable with /usr being
> mounted later. For something like kmod, there is therefore a case for
> putting the library in base_libdir, not libdir. Not doing so sounds like
> a bit of a cop-out from the maintainers.

I think this should not be made so mandatory in OE-Core IMO since none of modern
systems would do something like that.


