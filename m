Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqA2Q-0002KK-JK
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 23:38:06 +0200
Received: by qabg1 with SMTP id g1so985000qab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 14:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1OFdOS3mgViuj8nKyxi98qKBldx//lgdkaXPxJU2bpU=;
	b=hy07zntdKEsE0EdrBHg+HffSrHTo6/m6C9Xq/GfAiyMfT1ZdsvKbQJVWm5c+v7abPj
	fRShq+fxg7VTDk4YznVpQ5DpOYwUOd8X9hwtFQJGT3vwxKs4wWZJK7Dmc3y394NGoEop
	qUY1LKTBgf6UXMlL4mRBV8CCU4/lg1Y/gTzLeobMwu7qovGpHhMflHQDbLy1nr/aquV0
	tStCOiJSebP6Q7OMzYhLdVLKTZD58+mvFfbTZ2aTF10xaWJFEH6hfi9zT4CanGojAdp9
	YniujDgiccSsChTK8fJN3+/ToIm6/QfWrxZ8Pj8eTX9KWrNrPpi6SJIBDICCjPVNJUIu
	aDxg==
MIME-Version: 1.0
Received: by 10.224.204.131 with SMTP id fm3mr11831445qab.75.1342301209831;
	Sat, 14 Jul 2012 14:26:49 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 14 Jul 2012 14:26:49 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207141456190.13961@oneiric>
References: <alpine.DEB.2.02.1207141456190.13961@oneiric>
Date: Sat, 14 Jul 2012 17:26:49 -0400
Message-ID: <CADkTA4Nah089oYXaHo3JDF_kmV-LQKz+hm8T6U9PBjtBvVDtxg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: is "LINUX_VERSION" actually needed for a kernel checkout?
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
X-List-Received-Date: Sat, 14 Jul 2012 21:38:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 14, 2012 at 3:07 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   pawing my way through the kernel recipe file and checkout code so i
> understand it once and for all, and i'm curious about the setting of:
>
> LINUX_VERSION ?= "3.4.4"
>
> in linux-yocto_3.4.bb.
>
>   for my example, i'm testing with straight oe-core and building for
> qemuarm, so i can see the following relevant lines from the kernel
> recipe file that will affect my kernel checkout:
>
> KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
> SRCREV_machine_qemuarm ?= "9aca8fec49787efbe44d0f137f31ee59edd94c49"
> SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
>
> SRC_URI =
> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> LINUX_VERSION ?= "3.4.4"
>
>   as i read the docs (and i could be totally off-base), the KBRANCH
> variable identifies the branch i want for my checkout, while the
> SRCREV_machine variable identifies the particular commit on that
> branch that i want (typically, it's a merge of standard/base into that
> branch).  and of course, SRCREV_meta is the state of the meta branch i
> want for further configuration.
>
>   but at no time did i need to know the tagged kernel version that my
> machine branch was based on, did i?  so for the purposes of what
> happened above, i didn't *require* the value of LINUX_VERSION, did i?
>
>   i can see that it will be handy in, say, creating meaningful
> directory names for building.  but beyond that, what else is it used
> for?  (i haven't got to the meta/ directory processing yet, so i have
> no idea whether it's suddenly necessary there.)

The kernel itself doesn't care .. but the rest of the system does,
since that is used
for setting PV.

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


