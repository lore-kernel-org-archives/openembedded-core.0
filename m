Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 67A4065C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 20:06:26 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so62297972pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=tnI+9UQEAtT9tWiWrDFtUuxF5G9Bg1FpjvjC5/T23MA=;
	b=DzBj7ea6NSfvhKOfsuY6ItnJ2NjL9NqqYCjoKJQ0N+U40ROYc9UA6iByGvM2pL7ezc
	vHIW+VTwAociLoBuQIgv89jeK4Z9peOZuHxPbGR6s8zVvAw9rjasJ6Tk4RK8h4ShTX7j
	xc8Px7or/1Vh96rGEO+IN/EmoP+3dzuu0BlCTcotCQzczXZcXPTR50qZnoPLAUQEDBCX
	lacWbCep0B79sRJEUyFlBEBbV5BwSsKR5nVMxA4PtiEy1rOQI4KGxVDWD2AAJ5M5EMsG
	qE0M7f24XNAkL/UrNVZMbRgudtH0ogbnxYEYSdTY6e2WLg0nYExlnKgTkpy+rJcm+neP
	69Cg==
MIME-Version: 1.0
X-Received: by 10.66.139.135 with SMTP id qy7mr48807268pab.144.1429128387989; 
	Wed, 15 Apr 2015 13:06:27 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Wed, 15 Apr 2015 13:06:27 -0700 (PDT)
In-Reply-To: <CAJTo0LZ5mBADZOmotHiiKc2SKrB3q+odn2ayEzXF814aEoBUCw@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
	<552E2FBF.9030701@windriver.com>
	<CAJTo0LY=ZiJUSD+gTJqqvok8+RyskJKR0BjvJb0pjR97ZSfrcw@mail.gmail.com>
	<CALbNGRQXPWs8TEYpveP7ugcXGuCU0pJfg_1fLZ+aTQc-ZNd7Ng@mail.gmail.com>
	<CAJTo0LZ5mBADZOmotHiiKc2SKrB3q+odn2ayEzXF814aEoBUCw@mail.gmail.com>
Date: Wed, 15 Apr 2015 22:06:27 +0200
Message-ID: <CALbNGRQZvAPFdd+iJFOWvthT-3aOuD0SZi9+Lhp9DgQ6jOFt0g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 20:06:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2015 at 9:08 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 15 April 2015 at 18:27, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
> wrote:
>>
>> Patch [1]: util-macros no more required in DEPENDS
>
>
> What's the point of this?  util-macros adds functionality and doesn't dep=
end
> on X in any way, it's just some m4 macros.
reduces DEPENDENCIES slightly - but is not mandatory. I have added it
because there is only a mac specific option the macros are used for.
>
>>
>> Patch [2]: allow build for x-less environments
>
>
> I'm glad this demonstrates that simply disabling GLX works but FWIW I
> wouldn't accept this into oe-core as it's not deterministic.
I didn't do that for limited time and had no problem because I never
change DISTRO features for one builddir. To fix configure.ac needs an
additional configure option disabling xorg even if it was build.
>
>>
>> I don't have time to prepare patches, but maybe somebody wants to take a
>> look.
>>
>> Ahh before I forget: libepoxy should inherit pythonnative - all source
>> file creation is done by pythonscripts.
>
>
> Isn't pythonnative only required if the Python needs to use modules that
> were previously built natively?  Bitbake is Python so if it's just "run t=
his
> bit of basic python code" then the host Python is sufficient.
>
Might be but as far as I can remember - this was added due to
configure failures for builds from scratch - but it is long ago...

Andreas

