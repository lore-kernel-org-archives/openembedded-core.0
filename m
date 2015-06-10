Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2A53B734D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:54:22 +0000 (UTC)
Received: by ykfr66 with SMTP id r66so16108196ykf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 17:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n7SirTva1qe4yoyWj+7uIgLOCc6ReQLlbGRaVArh8d4=;
	b=GjBUiQpeXO5hRko5h2ZoLGLnaTnyDq0PGaZPFVLSAdpdL9IDObVmzlhAC6bxzhDAFH
	xXWZu5ObXUeBGWu88oQj9GaQeZQlbXqcJGKOiFG+1FBC3iD+H1zEREeQ/HHiuOfNHVY1
	xHKQO41gJMOacdK/aFCoXV60Jd1+k5FlOkPMrbdmxEY41rAAn7Cj6whT7xFJ2HrFHZK0
	FJfZ63zCz5wrpl2qEPMYJQZdfkAv+LPTr4+046ExIit7LT5+4DMuFtxqe2UOU85s6f9I
	ACyg+BZgWLIVEJMadJ+A1QFlmYrMXZqiPC0EOZKsoLI1nzZo7oSlCOoxwJMBEsGTIko4
	pXDQ==
MIME-Version: 1.0
X-Received: by 10.13.232.71 with SMTP id r68mr636926ywe.16.1433897663390; Tue,
	09 Jun 2015 17:54:23 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Tue, 9 Jun 2015 17:54:23 -0700 (PDT)
In-Reply-To: <CAFD1m3HTYXqNtyO4xs6dphqGHVyBLR0d9VyDRMhFfFS4j09PhQ@mail.gmail.com>
References: <CAFD1m3HTYXqNtyO4xs6dphqGHVyBLR0d9VyDRMhFfFS4j09PhQ@mail.gmail.com>
Date: Tue, 9 Jun 2015 20:54:23 -0400
Message-ID: <CADkTA4PygPL1__KvV0h0NnvtCtjLMO8S7t9zP6-OWvF_=fPW+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: John Carter <john.carter@taitradio.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto: Any known issues blocking 4.1 kernel?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jun 2015 00:54:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 9, 2015 at 6:23 PM, John Carter <john.carter@taitradio.com> wrote:
> So apparently the driver support for the TI wl18xx I need is on the 4.1
> kernel.....
>
> http://e2e.ti.com/support/wireless_connectivity/f/307/p/429401/1534799#1534799
>
> Are there any known or expected showstoppers in terms of (in my own layer)
> just bumping the version numbers in linux-yocto recipe on the fido branch to
> 4.1?

Just use linux-yocto-dev, it is already on 4.1-rc7 and will work on master/fido.
To bump the versioned linux-yocto recipe, you'd need to actually merge
content (since it doesn't have 4.1 commits), and that is something I'll do once
4.1 releases.

Cheers,

Bruce

>
> Anybody done this?
>
> Thanks!
>
> --
> John Carter
> Phone : (64)(3) 358 6639
> Tait Electronics
> PO Box 1645 Christchurch
> New Zealand
>
>
> ________________________________
> This email, including any attachments, is only for the intended recipient.
> It is subject to copyright, is confidential and may be the subject of legal
> or other privilege, none of which is waived or lost by reason of this
> transmission.
> If you are not an intended recipient, you may not use, disseminate,
> distribute or reproduce such email, any attachments, or any part thereof. If
> you have received a message in error, please notify the sender immediately
> and erase all copies of the message and any attachments.
> Unfortunately, we cannot warrant that the email has not been altered or
> corrupted during transmission nor can we guarantee that any email or any
> attachments are free from computer viruses or other conditions which may
> damage or interfere with recipient data, hardware or software. The recipient
> relies upon its own procedures and assumes all risk of use and of opening
> any attachments.
> ________________________________
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

