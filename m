Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwNku-0000Yq-HT
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 02:25:13 +0200
Received: by vwe42 with SMTP id 42so1621220vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Jx6I0NRyq9z0rUAuQd7Dxytt0zPzB+IrN1wMszfmiVw=;
	b=vlu+wcsQG1+U0ENaTaOHIcqHnAF718AYgpw2kc6jS5QvP2y17CtPujugm5R3gFvniC
	jG4vvolEURRDLhql5YbE2756f89WvYJq5YPVKhV0GcEUf0gUS2Pio4ho5WMLQAV8486k
	Nqf3o1KwERU5chRgJ+yOKGp2JwR7de1kB4y9Q=
Received: by 10.52.95.229 with SMTP id dn5mr5216914vdb.431.1314231625062; Wed,
	24 Aug 2011 17:20:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 17:20:05 -0700 (PDT)
In-Reply-To: <201108250116.08019.paul.eggleton@linux.intel.com>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<201108221401.15860.paul.eggleton@linux.intel.com>
	<CABcZANnHKrkmjODWStf3CyBEMBZRpkcVTZZ5dmVo-bkUn9Ybdw@mail.gmail.com>
	<201108250116.08019.paul.eggleton@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 24 Aug 2011 17:20:05 -0700
Message-ID: <CABcZANnGQBOwNVNRsgkH6akPrk9Sa_BoCsFtFBwTak9oRKfuPQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Thu, 25 Aug 2011 00:25:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 24, 2011 at 5:16 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 25 August 2011 00:16:40 Chris Larson wrote:
>> I strongly disagree with this. The fact is, we almost never go back
>> and "clean these up later", so crap accrues.
>
> We're talking about the difference between:
>
> if a = "":
>
> and
>
> if a:
>
> This is not crap, it's a triviality (for the case where the functional
> difference is not important anyway). If you care then by all means submit a
> patch to change it.

Yes, this example is trivial, but its just one of many instances of
this sort of code going in. I'd rather get the code clean to begin
with, rather than letting crap pile up and never do anything about it.
But I realize I care more about code quality than most of the people
in this project.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


