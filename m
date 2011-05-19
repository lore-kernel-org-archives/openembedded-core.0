Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QN1R4-0005SM-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:30:34 +0200
Received: by gyf1 with SMTP id 1so918712gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=K/E0XCUpV6IzLkJVrrum0KkKlUNil5+1a9JngJSxsNg=;
	b=LNgtoCjbfd6okKcDct0ComjkIdmuFPa70PJYV0EIyVACzieGEocZ8vb6dBnUoIGQ2n
	L0UkMKMnFDGKSkAhrmoO9Ws6AiaehUUk4eGuLMiAhPYqXc40g5LXCwmX6+PPprM25ejC
	fqLkTlERXHxVdI8sjbT5EgS2uqNnJGV7U3lH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pA5uQxkDbJ46NET9Je2GgTggUAsLlzpoPTo3NmVBJxHCVgSpxTGyt1E8T0hphvMivI
	tJBN/BphTq6Vppeu0cbHikUgCFB7x7C0iNHzK1rAOqaw8TKeFDozip48RmIYLO42cRxW
	D4euMsEH2S8+GEDT4391dCdxU3DTdi/xnx3mg=
MIME-Version: 1.0
Received: by 10.91.2.30 with SMTP id e30mr2428019agi.153.1305804456906; Thu,
	19 May 2011 04:27:36 -0700 (PDT)
Received: by 10.91.176.3 with HTTP; Thu, 19 May 2011 04:27:36 -0700 (PDT)
In-Reply-To: <BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
Date: Thu, 19 May 2011 13:27:36 +0200
Message-ID: <BANLkTim4Pru-2SG89mPJVwnpsp_855mypw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 11:30:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
>> What should I do to either disable this for some recipes, or use a
> different (private) server?
> We do not wish to rely on an external server for proprietary recipes (or
> for recipes for which we made a local change in an overlay).
> How is this case handled?
>
> Ok found some of the answers in the patches, but that has raised some more
questions for which I did not see the answer right away.

Would it be possible to have a PR_SERVER per layer?
And are the values cached locally? (e.g. what happens if the PR_SERVER is
not availalbe).

I guess it would also be helpful to have some usage documentation.
(actually I seem to recall that at some point in time within OE we had the
policy that if you introduced a new var you should also update the docs for
it; not sure if that was formalized somewhere, but definitely seems a good
plan).

Frans

