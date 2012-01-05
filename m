Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Rip6G-0003rJ-Py
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 16:19:29 +0100
Received: by pbcc11 with SMTP id c11so307722pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 07:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pM1VZS8Nx6/JH/o3jn/LfiluavunIn3bYG1sG/TL2t4=;
	b=BEI2+W8rGKmlPo8ijN6xKAEbMg7pn28knja5HB80Oj9fWkr/J7UMXXVpjyyW2pL1ec
	aD0sbi4xug5YX2pOdyDG5oJAFY2BaNLAgjNyMLUEsInzMAqztiXJPWnNkd3rVbtex4+0
	01tIkpVL2piacE6yr3LPdOhK11YxJC5vTC9k0=
MIME-Version: 1.0
Received: by 10.68.72.39 with SMTP id a7mr6093863pbv.96.1325776325078; Thu, 05
	Jan 2012 07:12:05 -0800 (PST)
Received: by 10.143.30.20 with HTTP; Thu, 5 Jan 2012 07:12:05 -0800 (PST)
In-Reply-To: <1325775933.20759.70.camel@ted>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<1325763002.20759.62.camel@ted>
	<CADkTA4P9mPQXzXQq3-=t8ynv5U3so8Cc1+Wit4HC0JwU0d9ysA@mail.gmail.com>
	<1325775933.20759.70.camel@ted>
Date: Thu, 5 Jan 2012 10:12:05 -0500
Message-ID: <CADkTA4MJcqUYzMHwrkhPZZo8qcbWs7tqn5psg82yK=m+-cXtgw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Thu, 05 Jan 2012 15:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 10:05 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-01-05 at 09:10 -0500, Bruce Ashfield wrote:
>> On Thu, Jan 5, 2012 at 6:30 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2012-01-04 at 22:30 -0800, Saul Wold wrote:
>> >> Richard,
>> >>
>> >> This is a set of changes that have been built and booted for
>> >> sato. This address the failure we have seen on the Autobuilder,
>> >> please check the master_under_test build currenly building.
>> >>
>> >> We have another kernel update from Bruce, with the sanity checks
>> >> from Scott G. along with other change from the community.
>> >> The matchbox changes make sense based on a better explaination
>> >> from Edwin.
>> >>
>> >> Please review overall, but I am positive about this change set.
>> >>
>> >> Sau!
>> >>
>> >> The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8=
422c61:
>> >>
>> >> =A0 valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)
>> >>
>> >> are available in the git repository at:
>> >> =A0 git://git.openembedded.org/openembedded-core-contrib sgw/stage
>> >> =A0 http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/l=
og/?h=3Dsgw/stage
>> >>
>> >> Bruce Ashfield (3):
>> >> =A0 kern-tools: import flexible branching support
>> >> =A0 linux-yocto: bump kernel version to v3.0.14
>> >> =A0 linux-yocto: use src_patches for out of tree kernel feature suppo=
rt
>> >
>> > These look related to the failures on the autobuilder so I didn't take
>> > them.
>>
>> The first one should fix errors with the the intel BSPs, I checked the
>> autobuilder
>> status, but didn't see the linux-yocto failures. Does someone have a lin=
k ?
>>
>> The second two shouldn't have impacted anything, but I'll have a look if=
 there's
>> a link to share.
>
> http://autobuilder.pokylinux.org:8010/builders/nightly-ppc/builds/210/ste=
ps/shell_67/logs/stdio
> http://autobuilder.pokylinux.org:8010/builders/nightly-arm/builds/247/ste=
ps/shell_14/logs/stdio

Aha! Indeed. The strict patch checking kicked in and caught a latent missin=
g
cleanup.

I'll send a meta branch patch that fixes that shortly. The series will
be valid with that
stacked on top.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


