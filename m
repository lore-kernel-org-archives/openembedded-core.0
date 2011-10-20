Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGvQf-00031W-B7
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 18:25:13 +0200
Received: by qam2 with SMTP id 2so2391457qam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=h1b/wCTt8rd73YVKDfRt/SM9nCNEclU/4KkqZlAtFf0=;
	b=DTU+1L+NTieWkrkYFBd8GkdsoH2wHjVutM76pVHsSOKJ2EUJ+He3p/39v5PYTLbgmE
	oD7BAPLHccrBoMWJIu+2AhGXXoEJwSBxbqBSguPgY/fSV0jyWMV2BWUC4lJ37CZvM9/n
	KYXlOqVhwuxhyP9vWmRHvToVJqPO3T1kIyq1I=
Received: by 10.68.20.226 with SMTP id q2mr20825021pbe.115.1319127560074; Thu,
	20 Oct 2011 09:19:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 09:18:50 -0700 (PDT)
In-Reply-To: <1319120752.2410.34.camel@ted>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
	<E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop> <4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
	<CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
	<4E9F5E5A.6040002@intel.com> <1319120752.2410.34.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 09:18:50 -0700
Message-ID: <CAMKF1sr6G=BOY_if067hdvVNwt=O9yrMiaqzV10piRUh5kR8JQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Thu, 20 Oct 2011 16:25:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 20, 2011 at 7:25 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> a) Keep the data where it is
> b) Merge the data into the recipes

We once had maintainers and then backed out of it
this would reintroduce that and bitbake might have
to eat more memory to parse this information.

> c) Move the data out of OE-Core

For now this would be a better solution IMO

>
> Since a lot of that data is fairly Yocto process specific, it may make
> sense to move it over to meta-yocto...
>

Yes it seems to be apt.


