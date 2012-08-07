Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SyjQB-00009Y-OT
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 15:02:03 +0200
Received: by qaat11 with SMTP id t11so1911653qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 05:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CASDhrJyafOhB4ZEjJMGFL+zw2k0mSSiuPczmSsmQZM=;
	b=D76ZQh8lIcRhcb1FY0UBk8F5CQHseX9SuuFKGrcnF1fhMoGD0bVBxtrO2/foveAJqy
	Q30WxpoYIBp2vnxfE7xTE0jjHjcbFnmg7XG+4cDPdEXnIZ0mhCozBWUhL+XtNgrPf3gk
	sXS4CJ/WGtQEai3YXY8iIWMy3FMzDCm6hyOxR751Ob5dFHf5m4b6n5qhJT+G9OX3MkPC
	ZUdDQlSy9HUzc57I1+IqJspffi5wZvAzUc63tqhHSFmijg4Zw//DU3IGD87D+qrqQgXi
	cMdcFtUpszt8m655lllOMRIgAWpJBIpHQKZbLGbwDFB3r1c0C6PNeu2aSG8WSuNQgglL
	uDFg==
MIME-Version: 1.0
Received: by 10.224.180.146 with SMTP id bu18mr23901035qab.10.1344343817501;
	Tue, 07 Aug 2012 05:50:17 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 7 Aug 2012 05:50:17 -0700 (PDT)
In-Reply-To: <5020BDDF.8090900@intel.com>
References: <5020BDDF.8090900@intel.com>
Date: Tue, 7 Aug 2012 08:50:17 -0400
Message-ID: <CADkTA4OXS8D_pr_2Ufd1O4UcQb7+p9n2DtKr52iOX00=D9s-aQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ocf-linux package
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
X-List-Received-Date: Tue, 07 Aug 2012 13:02:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 3:03 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> Do we need ocf-linux for something other than headers? The current recipe
> looks like all it's doing is to install the headers. However, the README
> file from the package talks about some kernel modules it provides and
> patching the kernel for embedded systems. I don't have any experience with
> this package, so, if somebody does, some additional info about how we use it
> (or planning to use it) would be greatly appreciated.

There are a series of kernel patches, I've been carrying them in various trees
since 2.6.27. I do have a set of OCF patches that have been tested against
the 3.4 kernel, so if there's interest, it's easy enough for me to make them
available.

The test steps for OCF can be found within the kernel patches, which
is basically
exercising /dev/cryptodev via a test application, and using it with
openssl/ssh for
acceleration. That being said, it is coupled to the BSP such that you
need appropriate
hardware, and kernel options enabled for any acceleration to happen.

I've also seen everything from SMP to module loading kernel traps in
the past, so it
is definitely something that needs to be done in coordination with a
use case, and
a particular board.

If we don't have a use case, or a board in mind, I'd suggest that it
stay latent for
now, or I could enable the base plumbing in the kernel and it remain
"buyer beware".

Cheers,

Bruce

>
> Thanks,
> Radu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


