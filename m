Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93D7E611C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:26:45 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id r18so2459320vso.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=StSMu5cqh5v3AfCuAHyu7TnA4CyEi0yuF9jE5jgwwag=;
	b=QfJ/haZgoitZMiIboltl5OX9+vjtenKRoP263Ex55EaxVHQd+5d3FDbIeo9/Ewucxn
	AR3MUHDQ+gC9aqlhkauJ3rXNjjN6TmhmKHYDhBDyjkkVtFy0CoOysbveZCFVukRCnUQX
	EaMdJRv59N4QDNihsA/3dtR65JZpBFd1V+FYeRhesg55iyHlArap05hurz3UUewgvyE9
	b54BEdNBne4atJWRnUdxr4diNwi2o9bj2ia5zK0rCz27FifZIclUuHM+bV/VSUPwL+pN
	t+jTnUs1hpg/rp2AydwL4CdgG/NQFcmPvHnfUjZXH+112dQmnkahntfcVWjKEWgMgbtO
	PjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=StSMu5cqh5v3AfCuAHyu7TnA4CyEi0yuF9jE5jgwwag=;
	b=c7L1T+6tA/dYVSUNjoAzwUMRrDrIVva3GUBh4U2cdZb/hZHAiQUNb0FrMMpq+YNC9C
	Veu01+BCx+bhHe8BMkH97HOu8fIs3JGUc/sjZPx84rerhAGa5qXBSL6TVHjAGiCyjKM3
	ahy3SvyjMT+/7Uogm5a6rnAAIIXxEuzVJOl257FiJkgb9pA2JDIT9ysYVNYFZJqKc/Uw
	Y7ESL0AytJ9nG7oNtF6sk5kztGJUmVAJm8pomDtPnqGOFO0wvQGndNosD9a2D5eGpPuM
	nC9UObNr0Tvp9lS/RbMRPPVMszdzIa/anpEf49Ej9Uc+EhpfyFMTNh8vYexoYsZ/gDDk
	iUJg==
X-Gm-Message-State: ANhLgQ3ogRvGSzcffh7iJUaEU/+61qErdm6nrZ0Tk411Lk5JTULpuvf7
	NqC51L4xXqXkS8oxP4FyQnXCpW5f7aZQx36Xmto=
X-Google-Smtp-Source: ADFU+vsdIlv+NE1wCQhyavg0TQMoc16yeN6jxG7bJd4aaa+VrBZGmN/JSQHr4nvFpWv25kpkU9DWiq4anQxc/lpiXpw=
X-Received: by 2002:a67:2fd1:: with SMTP id v200mr3450560vsv.11.1583368006318; 
	Wed, 04 Mar 2020 16:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20200305000548.6357-1-jpuhlman@mvista.com>
	<CAJ86T=W1axCCm0+tSSJR-AGz3xReJoGveg3GT01-fmzSrzs5vA@mail.gmail.com>
	<d68e67bc-ca24-ea8a-7d8e-3535c2ea1af6@mvista.com>
In-Reply-To: <d68e67bc-ca24-ea8a-7d8e-3535c2ea1af6@mvista.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Mar 2020 16:26:35 -0800
Message-ID: <CAJ86T=Xjs3q3h4-hy4cnGRgZ9zu8do1zy4Yj2VQTpu2RBZ27FQ@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm-native: disable readline for the native package.
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
X-List-Received-Date: Thu, 05 Mar 2020 00:26:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 4:18 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> On 3/4/2020 4:16 PM, Andre McCurdy wrote:
> > On Wed, Mar 4, 2020 at 4:05 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> >> From: Jeremy Puhlman <jpuhlman@mvista.com>
> >>
> >> ---
> >>   meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >> index 5326184181..52e35c8c2e 100644
> >> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >> @@ -20,6 +20,8 @@ DEPENDS_class-native += "readline"
> >>   # Needed for dbm python module
> >>   EXTRA_OECONF = "-enable-libgdbm-compat"
> >>
> >> +EXTRA_OECONF_class-native = "--without-readline"
> > Assuming the target version is being built without readline support
> > (presumably that's true as the recipe doesn't indicate any dependency
> > on readline, but you should double check) then this configure option
> > should be passed in all cases, not just for native.
> There is not explicit dependency which is why we are here in the first
> place for native.

Right. The native issue can be fixed and the target case made clearer
by adding the explicit configure option.

Point is just that you shouldn't limit the explicit configure option
to native if it's applicable for target too.

> >
> >>   # Stop presence of dbm/nbdm on the host contaminating builds
> >>   CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
> >>
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Jeremy A. Puhlman
> jpuhlman@mvista.com
>

