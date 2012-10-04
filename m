Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJosL-0007MW-0y
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 19:06:17 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so556435eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2NgKz1Z8EibriJcdEtcpoBvctvDvhaIwwBhblQrtsg8=;
	b=Nv9W0Bo7sz8EFySr1wMV/a2BMnwta0C/ceaNCIzlLyTvdjQkmnA4yevEGy5NmOOz75
	x83KqCE56lWLz2WQkmEu7Fq44EXYjv1vT4Cggku46KXdp8WjdhNYrDC0+1RwE9t451+F
	q2mzxeL5kkJJL1W3hJuN34Uw+5l2eCjBNkxZhJ4WI4HWiq4E4Nk8dRE+pcw2tw38jLC7
	YM2Nv+H8eVTxA9hSQppT1ikRK0jZGhOvNgN1R6GFt7P5PjP+q4z9v4fbFnHU82hpuWlx
	hRYRoWmup60hI0RVwqk5MIDVpGAvcuTNxVKeaiSB6nxdCFI3m/oaBNM7aYSUzHQ6Gw6X
	dWJA==
Received: by 10.14.211.3 with SMTP id v3mr9027173eeo.43.1349369595895; Thu, 04
	Oct 2012 09:53:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 4 Oct 2012 09:52:45 -0700 (PDT)
In-Reply-To: <20121004122716.GE3005@jama.jama.net>
References: <1349352468.32611.164.camel@phil-desktop>
	<20121004122716.GE3005@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2012 09:52:45 -0700
Message-ID: <CAMKF1spHjobcVYF=0kNgfUooo7nwQveKRZ6OLGaZ3HmcVMjxPg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: Only one copy of bitbake should be run against a build directory
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
X-List-Received-Date: Thu, 04 Oct 2012 17:06:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 4, 2012 at 5:27 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Oct 04, 2012 at 01:07:46PM +0100, Phil Blundell wrote:
>> Since updating my copy of bitbake to one which does this extra locking,
>> I've come to realise that the constraint of having only one copy of
>> bitbake running is a bit of a nuisance when making use of devshells.  I
>> used to quite often have one or two long-running devshells for packages
>> that I was actively working on, and then in parallel with that would use
>> bitbake to recompile other things.  With the new locking mechanism, as
>> soon as I have a single devshell open I am now prohibited from using
>> bitbake for anything else in that same build directory.
>>
>> Would it be reasonable to exempt devshells from that locking or is there
>> some compelling reason why they need to be serialised?
>
> The same does apply to bitbake-diffsigs now after IIRC this patch
> http://git.openembedded.org/bitbake/commit/?id=cc70181659c07e04c205e17832846acf1ff31d28
> before that I could use bitbake-diffsigs from any directory (not only
> TOPDIR) and also when build in the same directory was still running.
>

and also to use runqemu

> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


