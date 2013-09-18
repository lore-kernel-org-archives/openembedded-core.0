Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 73F9F60664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 15:54:19 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id z5so6968891lbh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YxF1QD5zoS6iCL/wAlVTwTM4g7cfwrk57KHL/eqmR0c=;
	b=NosnMKvO0+ziiD6EOEdJsUjgWJCPgDq0QB75lp7eIl8b3YRH/Mxmyb2yIXxtSbtVVt
	S2jNH3OvIbP0ZEJM3QEIpvMpOtXPgOCQZUJ8TsPg5KwPIVxl//gcvgVTtAZEiWQFfbaZ
	D4TKXaoQU6T0i3d7OI0A+zZQ1AzCG5MdTszUlokpJ1HDJ0/IetUhrSO9oKiEuKYEbR70
	5iZEi+ZAWwXvozt6LVqG/W+4Xrutb1S6FgOxDKhZawZ6ge/T3as5LN9CsJjZmkx4VeO7
	Ks8x+4foOj/As4zgfdEg3wAOz3ONxCiIsBOjPyOLn+N5wj47wcq0xbKTKAtHQftif7xP
	I/cA==
MIME-Version: 1.0
X-Received: by 10.112.128.166 with SMTP id np6mr35514617lbb.7.1379519660742;
	Wed, 18 Sep 2013 08:54:20 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 18 Sep 2013 08:54:20 -0700 (PDT)
In-Reply-To: <lyli2ut9r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	<lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
	<lyli2ut9r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 18 Sep 2013 11:54:20 -0400
Message-ID: <CADkTA4PEPFjA5Adi_NJm8gXof4HNcr6AC5XqvJHhWBY5js5tVw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 15:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 11:44 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Otavio Salvador <otavio@ossystems.com.br> writes:
>
>> I don't agree on this. perf is tied to kernel and part of its code so
>> I think same exception rule apply for it as well.
>
> perf ships with the kernel but is a pure userspace program.  It does not
> require any special setup ('make configure'), it links against complex
> userspace gui frameworks and uses userspace headers.

yes, we realize this .. we have a long a complicated history with perf and the
related build issues.

We are stating our general policy, interfere with it's build as little
as possible.
Use extension variables, not clobber variables, etc.

Otherwise, we end up creating our own issues, and have the bugs to prove it :)

Bruce

>
>
> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

