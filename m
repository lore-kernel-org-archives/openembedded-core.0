Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 161886E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 14:03:15 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so12917355pab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 07:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=K3gNqWnSz71M9JKVtVw/pygMrJjNC3+Seo7UArfpRvE=;
	b=ARg7+gszF+IS8UvE5ohUpRFCKWVA3IXXSu+HV511N8YN58yGhHS5RChNcN9y/ff55e
	KNnrU3OfPXpYiTBwL56Tn2rEH0uOlCqI+2sfuJbjjQy1981TsIPmXrcyoZE8q4A9k+wK
	77/Wdqt/B6fze3wTR/Zdg43b8HpPnyQ1v238Eduz+Dpkg/NMyar7f9DNjSYeGH4+33XA
	TBYJxvF8hXI/wpnulgK0iWpW5XBWWGRnQiqpR8lG9S2UiPOLBC3zLXjcAR0VTwHipbUK
	HTubvnqlLKsVDdRQowlPvEmR7CH3SBlaossmMohkOWPqt/NcxgNcmjl2HGfvKy8Nsiip
	5dkg==
MIME-Version: 1.0
X-Received: by 10.68.172.3 with SMTP id ay3mr36849606pbc.94.1429020197040;
	Tue, 14 Apr 2015 07:03:17 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 14 Apr 2015 07:03:16 -0700 (PDT)
In-Reply-To: <CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
Date: Tue, 14 Apr 2015 16:03:16 +0200
Message-ID: <CALbNGRTj61Gh-D=+JcAvTc55RJnMboCBU2kLAi_KE=qmCCwNgg@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Apr 2015 14:03:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 14 April 2015 at 14:50, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
> wrote:
>>
>> from the error I would DEPEND on virtual/egl
>
>
> Agreed.  And there's no dependency on virtual/libx11 which the readme you
> quote suggests there should be.  Presumably that dependency - if it's
> actually required - can be made conditional on the x11 DISTRO_FEATURE?
>
> Ross
>
1. To look for dependencies configure.ac is first place - Readme is
often a place without love
2. In meta-qt5-extra I have libepoxy in for a while - kwin needs it
[1]. Problem with Xorg-Macros: These are build for x11 in distro
features only but there are BSPs around (e.g meta-fsl-arm) supporting
either x11 or wayland - not both together. So for a wayland only
distro epoxy would not build.

[1] https://github.com/schnitzeltony/meta-qt5-extra/tree/master/recipes-sup=
port/libepoxy

Andreas

