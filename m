Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sq7bJ-0004GJ-Ou
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 21:01:57 +0200
Received: by qabg1 with SMTP id g1so952083qab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IvZx86BWSmP8X+ezIciJ37C/Ahu/sXAgvwMtgHr3BgA=;
	b=aIvkapsi8Gt2MaxzvrQ6gCbVDlEavnX3U/0RiDPL0IZEm/S9HG7EcZytrBFWCIBTZU
	Jeo/meEm5krP21Ue043KeVOIWYQI5HIWvU0/9c867ApU1zAIXPXoa+oRBZtA8VF8itMM
	VKwu0BFeWn9ts1mUHhln5oAqtUWCUibd0lbTcdQvj460j2FouTQEvx4K+RnsJUn5xJ6D
	zRamzW3+88CSsV6zmMjPidqHiCfrHK9ninErrUejcogZhZGneLGObkMcovOpEPfaO8pg
	iVm3Z7EesfE4oeZM1m8dMv6sKSd50NqSdMKvc4rgHtcnIrOdwoNenh4NUa5t5XvCIAnD
	m+VQ==
MIME-Version: 1.0
Received: by 10.224.45.8 with SMTP id c8mr11402462qaf.29.1342291840997; Sat,
	14 Jul 2012 11:50:40 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 14 Jul 2012 11:50:40 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207140756410.8123@oneiric>
References: <alpine.DEB.2.02.1207140756410.8123@oneiric>
Date: Sat, 14 Jul 2012 14:50:40 -0400
Message-ID: <CADkTA4PV2BJr+NhO9HNuAZoLQuhCVO1WBKOGMwdDMN=B-4PzDQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: should linux-yocto_3.4.bb have a "bareclone=1" parameter?
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
X-List-Received-Date: Sat, 14 Jul 2012 19:01:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 14, 2012 at 8:00 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   building for qemuarm and noticed that the log.do_kernel_checkout
> file warned me about SRC_URI not including "bareclone=1", which is
> true -- unlike all of the rest of the kernel recipe files, it
> includes "nocheckout=1" instead.  any reason for this?  should i
> submit a patch to change that to bareclone?

It's like that on purpose, I updated the checkout code to deal with non-bare
clones, so I've left it as-is to see if anyone digs up any checkout problems :)

Cheers,

Bruce

>
> rday
>
> p.s.  under meta-skeleton, linux-yocto-custom.bb also includes
> nocheckout instead of bareclone.  just an observation.
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


