Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Rio8N-0003xz-ML
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 15:17:36 +0100
Received: by pbcc11 with SMTP id c11so277071pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=1D29LecaXwvI33jG+KzcZAViFG2GPRVDLEdFrZpH3UE=;
	b=nwp7tr511OY+olvsqZTivGdkgRA9uhIWbW5wPq57xK+9+NF8RIGVMvtH1toQdhVxpL
	J8xvQrYJIHRQP9j2+z5rarTR7zr9EnfuijKi0CaSJJd/s/clVTm4jxbJB654dpsNCGGn
	reFnvTHqWqBgpLZueLD7UBPBaeMEDY+WPfy64=
MIME-Version: 1.0
Received: by 10.68.75.136 with SMTP id c8mr5568881pbw.113.1325772611617; Thu,
	05 Jan 2012 06:10:11 -0800 (PST)
Received: by 10.143.30.20 with HTTP; Thu, 5 Jan 2012 06:10:11 -0800 (PST)
In-Reply-To: <1325763002.20759.62.camel@ted>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<1325763002.20759.62.camel@ted>
Date: Thu, 5 Jan 2012 09:10:11 -0500
Message-ID: <CADkTA4P9mPQXzXQq3-=t8ynv5U3so8Cc1+Wit4HC0JwU0d9ysA@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Jan 2012 14:17:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 6:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-01-04 at 22:30 -0800, Saul Wold wrote:
>> Richard,
>>
>> This is a set of changes that have been built and booted for
>> sato. This address the failure we have seen on the Autobuilder,
>> please check the master_under_test build currenly building.
>>
>> We have another kernel update from Bruce, with the sanity checks
>> from Scott G. along with other change from the community.
>> The matchbox changes make sense based on a better explaination
>> from Edwin.
>>
>> Please review overall, but I am positive about this change set.
>>
>> Sau!
>>
>> The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422=
c61:
>>
>> =A0 valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)
>>
>> are available in the git repository at:
>> =A0 git://git.openembedded.org/openembedded-core-contrib sgw/stage
>> =A0 http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Dsgw/stage
>>
>> Bruce Ashfield (3):
>> =A0 kern-tools: import flexible branching support
>> =A0 linux-yocto: bump kernel version to v3.0.14
>> =A0 linux-yocto: use src_patches for out of tree kernel feature support
>
> These look related to the failures on the autobuilder so I didn't take
> them.

The first one should fix errors with the the intel BSPs, I checked the
autobuilder
status, but didn't see the linux-yocto failures. Does someone have a link ?

The second two shouldn't have impacted anything, but I'll have a look if th=
ere's
a link to share.

Cheers,

Bruce

>
>> Christopher Larson (1):
>> =A0 opkg-utils: use /usr/bin/env python
>>
>> Derek Buitenhuis (2):
>> =A0 binutils-cross-canadian: Allow ld-is-gold
>
> I took these.
>
>> =A0 binutils: Allow plugins
>
> I'm sceptical about this. Does this really need to be a distro feature?
>
>> Gary Thomas (1):
>> =A0 xserver-kdrive: work around issues with -Werror=3Daddress
>
> I've taken this.
>
>> Joshua Lock (2):
>> =A0 alsa-state: add alsa-state from oe classic
>> =A0 task-base: add alsa-state to task-base-alsa
>
> I've held off this at this time, likely will take it next time around.
>
>> Otavio Salvador (3):
>> =A0 udev: use 'echo' instead of 'echo -n' in init script
>> =A0 udev: split utilities onto udev-utils
>> =A0 udev: remove commented code from init script (no code changes)
>>
>> Phil Blundell (1):
>> =A0 python-native: correct prefix handling for oe-core sysroot layout
>>
>> Saul Wold (6):
>> =A0 image_types: Fix rootfs size calcuation
>> =A0 glib-2.0: ensure dtrace is diabled for all distro options and fix
>> =A0 =A0 packaging
>> =A0 libxp: fix cast error
>> =A0 Patch Upstream-Status Update
>
> I took these.
>
>> =A0 util-linux: Update patch for non-GPLv3
>> =A0 gnutls: remove gettext patch for non-GPLv3
>
> These are one line commit descriptions which tell me very little. Please
> improve the patch descriptions.
>
>> Scott Garman (7):
>> =A0 ncurses: move libraries to base_libdir
>> =A0 libcap: move library to base_libdir
>> =A0 util-linux: move libraries to base_libdir
>> =A0 e2fsprogs: move libraries to base_libdir
>> =A0 libusb1: move libraries to base_libdir
>> =A0 libusb-compat: move libraries to base_libdir
>> =A0 insane.bbclass: add QA tests for unsafe references to exec_prefix
>>
>> Zhai Edwin (1):
>> =A0 matchbox-wm: Remove x-session-manager handling
>
> I took these.
>
>> Zhenhua Luo (1):
>> =A0 linux-dtb: add multi-dtb build support and keep dtb in deploy cache
>> =A0 =A0 package
>
> This looks like it should be done in do_deploy and doesn't fix the real
> problem just adding some races in.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


