Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzY1L-0005yC-0S
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 18:26:59 +0100
Received: by fxm19 with SMTP id 19so781007fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xRjH0hZPDUON7Q/BF4VXsjEFTxU0T2XqU88lNonGewA=;
	b=NrVe7TMMXaykwF9K6VUqXPDl8o9ZtJO+tW9iX1nV/MoJ4Y/rgJ7jidWdLbKO/Ihek0
	+I5lWsWYJBS66brxZxXxKSVzL+q61x49TFmftQwHVWPbeMGNDqZRoSip5ElmSpcMbSFV
	yu5jFxa5W7Gp+TfFr0u1dE1OnvHUb6MBs7LHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=QYn04P2XWyZxC/sQ8H3ocOuM9NXk6Qw/avfS/UuuVd5Dp9wWH3er5fHdpiTpcoV+1L
	TheyngniYlrtrzFFnWnk1aXBk7s0Qa3cLuyYeVDvyW1QiQCZ8udiUdYZALXO2iw9mJiW
	jS2JO4dYSwm9DZdcFQkwcbyvb1sXpVQoxfZOU=
Received: by 10.223.15.141 with SMTP id k13mr3949748faa.30.1300209916917; Tue,
	15 Mar 2011 10:25:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Tue, 15 Mar 2011 10:24:01 -0700 (PDT)
In-Reply-To: <4D7F9CC2.2030002@linux.intel.com>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
	<4D7F9CC2.2030002@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2011 10:24:01 -0700
Message-ID: <AANLkTikC7yWvzTzf1Od2WLiBhQjz1iactGCaPCN+aAmR@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>, Koen Kooi <koen@beagleboard.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Tue, 15 Mar 2011 17:27:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 15, 2011 at 10:07 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>
> What are the ownership and perms on those?
>
> I suppose we could avoid the .pc directory - but it's going to require
> something more than cp or some additional scripting. Something like tar's
> exclude functionality might be needed - but I hate to add the intermediate
> step as the kernel recipes are already so slow.


hmmm I wonder why those are marked non readable in .pc directory  that
seems wrong to me


