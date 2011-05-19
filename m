Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QN1z6-0000wF-En
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:05:44 +0200
Received: by gyf1 with SMTP id 1so927192gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=5Z4Q+dv7Az37gmkVkqj0mMy224+HG3jm4IeCN+/ri+0=;
	b=mrbPNSO4e1kOLGFm0bUsQIYhmVpNU+OEid8p+B2WduSmYHp+ZJdGSDKnPEZWPzit6R
	TORspgDMmX1dO0l7ucbYW+yag53Q3Wy/Flqds7s5exjTuzqiXKlxSjafPhNjXie7DUDD
	J/LQ3mZRM4CI5se9GCOf6AC+Pde+qNWrT2PW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Pu1Roq5V8M3X2FrBrmzuPcnjAQousWh35yU8LLAwG5PZKpG6QBIHOQ8ecR+XmDLaF9
	+kRMwbTGQnsifGCSQBAODMwewtJTG1F+aaE6ByvSeUXOhlOZDTwaO7ozs73rN7W9T4fj
	oxuyjoognhbtUSRojRAUipshCpqwOJ1RMTgcU=
MIME-Version: 1.0
Received: by 10.91.33.1 with SMTP id l1mr2437741agj.207.1305806567793; Thu, 19
	May 2011 05:02:47 -0700 (PDT)
Received: by 10.91.176.3 with HTTP; Thu, 19 May 2011 05:02:47 -0700 (PDT)
In-Reply-To: <1305804906.3424.480.camel@rex>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
	<1305804906.3424.480.camel@rex>
Date: Thu, 19 May 2011 14:02:47 +0200
Message-ID: <BANLkTinzLqz6ED+=WpT_wnXkta03OiC0Yw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 May 2011 12:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Thu, 2011-05-19 at 13:01 +0200, Frans Meulenbroeks wrote:
> > What should I do to either disable this for some recipes, or use a
> > different (private) server?
> > We do not wish to rely on an external server for proprietary recipes (or
> for
> > recipes for which we made a local change in an overlay).
> > How is this case handled?
>
> This could be handled by doing things like setting:
>
> PRSERV_HOST_pn-myprivaterecipe = "somelocalhost"
>
> or
>
> PRSERV_HOST_pn-myprivaterecipe = ""
>
> to disable it.
>
> One thing we lack is a good way to apply changes like this, only if code
> is within a given layer. Even in that case, it should be possible with
> anonymous python to look at the location of the current .bb file and
> then conditionally set these variables as appropriate to the right
> server.
>
> Certainly this needs to be thought about and documented but I think
> there are ways to do it.
>
> Pardon my ignorance, but I do not really understand the complete flow and
way of working.

Anyway if I do something like:
 PRSERV_HOST_pn-myprivaterecipe = ""
would I still be able to use PR in my recipe (like I do today)?

Also we do have the issue that it is desired to be able to rebuild without
network connectivity (e.g. while temporary offline while travelling). Would
that still be possible?

For layers, one solution could be to allow variable overriding on the
overlay level. I can imagine there are more uses for that (and I understand
this requires changes to the bitbake machinery).

Frans.

