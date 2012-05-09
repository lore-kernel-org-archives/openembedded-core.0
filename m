Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SS9CY-0002cD-Co
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:53:18 +0200
Received: by eekc1 with SMTP id c1so169862eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Y1W8tPCAxSPDAPgdrhmEHEMOAXjM3dmapf+NmJL6C2U=;
	b=BoeFFYs7rHd90KIQD2M6J0A9zDqzX5MSNxRZklG7w0ssv+4/wOIFsY3hhfF4lBbfXP
	j0mhihrWL7u+vTD9TBc6oS+RdEnMLEuHC0sC48M/qnS5+7xf3gZs4QptK9Yv2RVEAIz9
	zQ6IK7f3YXG1Sg82xyi8bzIhmYUAxSwxMWPcackratjyO2CDjsVLIi9knympPlYe099q
	YAAFcL515KfAuCHDXNI7vgcxx7GqMeZQUJzmZlWwqmbJYU1svpXvWgbH31sZ3JSZrQvC
	siwIWAj9Esaqv5otkdPnxG/cyU2Om9osVHOvFCvog4sBYxWsqEJNXiva3tOBzZOd1lqm
	siUw==
Received: by 10.213.121.130 with SMTP id h2mr697191ebr.122.1336578205525; Wed,
	09 May 2012 08:43:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 08:42:55 -0700 (PDT)
In-Reply-To: <20120509094220.GA12898@jama.jama.net>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
	<339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
	<73C72AB1-C5B4-40D1-BAA3-C349F4957C42@dominion.thruhere.net>
	<20120509094220.GA12898@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 08:42:55 -0700
Message-ID: <CAMKF1sqUUaG3ka7XKNAgFduBNTv2JtAa5imFSVpawJbdVPqAog@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] kmod: Update to .8 release
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
X-List-Received-Date: Wed, 09 May 2012 15:53:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 2:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, May 09, 2012 at 07:31:52AM +0200, Koen Kooi wrote:
>>
>> Op 9 mei 2012, om 00:53 heeft Khem Raj het volgende geschreven:
>>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > meta/recipes-kernel/kmod/kmod.inc | =C2=A0 =C2=A04 ++--
>> > 1 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/k=
mod/kmod.inc
>> > index 681e52b..70d376e 100644
>> > --- a/meta/recipes-kernel/kmod/kmod.inc
>> > +++ b/meta/recipes-kernel/kmod/kmod.inc
>> > @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
>> > LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
>> > LICENSE_libkmod =3D "LGPL-2.1+"
>> > SECTION =3D "base"
>> > -PV =3D "7+git${SRCREV}"
>> > +PV =3D "8+git${SRCREV}"
>>
>> Drop the +git$SRCREV, it's a release.

it does have 2 commits on top of .8 so  I have changed SRCREV to SRCPV
and updated the pull tree.

>
> Agreed, this should be
> 8+git${SRCPV}
> or no +git at all.
>
> But other than that, this patchset looks good:
> Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


