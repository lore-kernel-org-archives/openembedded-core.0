Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QwKaF-0003tC-KN
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 23:01:59 +0200
Received: by yia28 with SMTP id 28so1156281yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=5Q3YetfI0Lo2XVcY1AIsrxA+HtCUi8A5hMEuYFqivKg=;
	b=gsAeJ5N561EYg7HwmwUttYol84YsEVGzEUhDl0JuJmTXqAf6J6F2aFRRXY5Q2AfRqQ
	Br66YHDInC92NpH07axmxQOhFUwEKazV2tEGGg4/Jb35qmo6Hg/LChct++LiUO2YT0o8
	k4GP/CHRj/MhJx0lVV+KDAG9USaAguhRABTRw=
MIME-Version: 1.0
Received: by 10.100.193.20 with SMTP id q20mr5219250anf.91.1314219431528; Wed,
	24 Aug 2011 13:57:11 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Wed, 24 Aug 2011 13:57:11 -0700 (PDT)
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
Date: Wed, 24 Aug 2011 16:57:11 -0400
Message-ID: <CADkTA4NXGzreDU4DYq9Ywf=DcXROEpQcBqYwT0JM6V=x6W7JrA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: dvhart@linux.intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] linux-yocto: consolidated kernel pull request
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
X-List-Received-Date: Wed, 24 Aug 2011 21:01:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 4:50 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Here's a consolidated kernel pull request that fixes a series
> of bugs that have been around for a while and fixes some of the
> remaining issues from the -rt work that completed last week.
>
> Darren: I also updated the -rt source revs and recipe with some
> streamlining that builds on top of changse that merged last week.
>
> The patches have the details of the bugs and fixes.
>
> cc: Darren Hart <dvhart@linux.intel.com>
>
> The following changes since commit f852199ff598069bbecad4146f13377753df16=
48:
>
> =A0linux-yocto: update meta SRCREVs for beagleboard config changes (2011-=
08-24 16:29:22 -0400)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib kernel-oe
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-oe
>
> Bruce Ashfield (4):
> =A0kern-tools: allow flexible branch points
> =A0linux-yocto-rt: update qemuppc support and streamline variables

This patch doesn't seem to have looped around ... If it hasn't arrived
by tonight, I can
resend.

Cheers,

Bruce

> =A0linux-yocto: update machines and default configuration
> =A0linux-yocto/2.6.37: apmd + get time of day fixes
>
> =A0.../kern-tools/kern-tools-native_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb =A0 =A0| =A0 11 ++++--=
-----
> =A0meta/recipes-kernel/linux/linux-yocto_2.6.37.bb =A0 =A0| =A0 12 ++++++=
------
> =A0meta/recipes-kernel/linux/linux-yocto_3.0.bb =A0 =A0 =A0 | =A0 14 ++++=
+++-------
> =A04 files changed, 18 insertions(+), 21 deletions(-)
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


