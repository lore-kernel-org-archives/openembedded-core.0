Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1REmVV-0005dK-K9; Fri, 14 Oct 2011 20:29:21 +0200
Received: by pzk33 with SMTP id 33so1963865pzk.2
	for <multiple recipients>; Fri, 14 Oct 2011 11:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hqUOdQQD/EQJudmcjMdoEGnAYyR3B5A5qwvWTMoxSGY=;
	b=oPFTYMhdDgPbCk950QaadRf/dCz4ff3Jvf/YzCUF59wNvl7+JWQyH963a8OMu43uAq
	Z//HEOnRTlMxsJit/FnpbHcKboiHMret43G47qdA3Z+I7C9d3sC88Yl5HW5KQWsyvRho
	qHO4Cw6SsOAm5uXuoqinJyTMVYy18T1svSJn8=
Received: by 10.68.32.162 with SMTP id k2mr18147731pbi.132.1318616614140; Fri,
	14 Oct 2011 11:23:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 14 Oct 2011 11:23:03 -0700 (PDT)
In-Reply-To: <201110121648.29478.paul.eggleton@linux.intel.com>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<CAMKF1srHT5uh5a=z=mt0kOpF2YO9YyKkEdkRK9ZT8=LaGY6JSA@mail.gmail.com>
	<6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
	<201110121648.29478.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2011 11:23:03 -0700
Message-ID: <CAMKF1srD_yEst84JpmvVPmKr3uB+F4+Jw+t35VcsV_cmV2WdLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] git server move
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
X-List-Received-Date: Fri, 14 Oct 2011 18:29:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2011 at 8:48 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> I think you may find it's the "/cgit.cgi" part of the URL that's causing
> problems. It used to work, now it doesn't - if you remove it then you get a
> working interface.
>
> FWIW I'd be in favour of fixing it however; all of the links to cgit on my
> layer index page are now broken for example.
>

A bit of update on cgit.
The url redirect of openembedded-commit malining list links is not
working (thanks Tom Rini for his help)
/cgit.cgi is also rewritten to point to correct link so existing links
should work as usual. Please report any
issues you find with the cgit interface to the mailing list.

Thanks for you patience and support

-Khem


