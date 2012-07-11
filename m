Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sp4Lx-0006xO-KW
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 23:21:45 +0200
Received: by eekc50 with SMTP id c50so500851eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 14:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MnUlzmjNTUVDpOoey5Kdtwv80ga4pbr7YJjFlHjxvuQ=;
	b=Cq3rqSlZZQqZIHcv6FiQk91iIQEh0/Jv+ivIlFJiPoWSL9eYNuz11ulnPDqGKqYFjz
	JuzgxICr+vXavOu2P47d+SS1UQRh8SlVBLTKe7IynxdbEkYjBsXIqjWLQWu5fsKo/1SM
	k/e+cqTuRtTPt+OCBh78CoaUIhFL7lEfC76C1oW6PReoeGmGHfEbCDRshxkVUuYI2PxR
	mf3HQEaDJVPXDAKet3SCpl2BiPPMNp1VUrdBb502uJuqbuKwmLkicCw5UFXcvG1tJpEZ
	T4kWwv/Qe8Z9ZSFxjTZEhbI+5cirPw4V36YgYtCanA5XtLfS7NrEnFXHqWgJEKIsGd4G
	CkVA==
Received: by 10.14.185.137 with SMTP id u9mr12760140eem.220.1342041033354;
	Wed, 11 Jul 2012 14:10:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Wed, 11 Jul 2012 14:10:03 -0700 (PDT)
In-Reply-To: <1342032628.11939.37.camel@ted>
References: <4FFD0425.7040004@intel.com> <1342004414.7934.11.camel@ted>
	<CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
	<1625033.FUQGRG6suy@helios> <1342032628.11939.37.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jul 2012 14:10:03 -0700
Message-ID: <CAMKF1soEMe-oCSNc5_uaFsaupjW_jKDh38zRV1V68PprDw5fMg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 21:21:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 11, 2012 at 11:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Right, this would just be to allow edison to work on systems that have a
> native eglibc 2.16. I'm not convinced we have the patches worked out yet
> though. Target eglibc would remain with whatever is in edison (2.13?).

Well. The patches are sort of things you would get in a package using
gnulib when they update
to newer gnulib but I have been a bit conservative in them so only
undefine it if its defined, as far
as patches for native packages are concerned I think they are good and
can be taken in even before
we take eglibc 2.16 in. Since they are be indendent of libc version


