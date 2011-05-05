Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QHxyW-0005qe-K6
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 14:48:13 +0200
Received: by gxk1 with SMTP id 1so779197gxk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=AacALBwdBqRJKGXi/6FMpR3/p65lfOHE0Z4qP+d4l0w=;
	b=XjZ1xgUX8cUBh44IWBwLw7ixT6O4eW6DmRBIDNcmzvPG2631jKEdYBV6pcZnWw5/Xv
	B3QEIao0ZU/nCYV0atJIitbrcuU2nXkel7JkPLDFCUhanTJV63GHDAUdTkiytsWbatzm
	Dx4dzDlpgHxwp+Fcd5Mw1BViRNEq8gpA4ll/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ODmO0ieOFrDmn/woxRj+v2tLxzE0cm+QMqtwX7Sq/6Jvyq2y418Xk9r+meIlbPG6MI
	zHHEtMJT+hlLyqHxREUF7BmhFqJPcPuv3PaOe2oojrEZYx+gx+8fYsnoFTdqfjKw9NLG
	K0Kzkla0i1WhuThJ48oA4TUu5gHi670cnS5wY=
MIME-Version: 1.0
Received: by 10.91.126.14 with SMTP id d14mr2221538agn.58.1304599530978; Thu,
	05 May 2011 05:45:30 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Thu, 5 May 2011 05:45:30 -0700 (PDT)
In-Reply-To: <1304595103.20791.21.camel@rex>
References: <cover.1304515719.git.ke.yu@intel.com>
	<BANLkTik0nb-ZsqLCnAoXzRr6BLKBUk3cew@mail.gmail.com>
	<1304595103.20791.21.camel@rex>
Date: Thu, 5 May 2011 08:45:30 -0400
Message-ID: <BANLkTi=ynrzVtJdvv_kwm0L0vvKMNACC-w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Thu, 05 May 2011 12:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2011 at 7:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-04 at 11:39 -0400, Bruce Ashfield wrote:
>> On Wed, May 4, 2011 at 10:05 AM, Yu Ke <ke.yu@intel.com> wrote:
>> > From: Yu Ke <ke.yu@intel.com>
>> >
>> > move the SRCREV from poky-default-revisions.inc to its corresponding r=
ecipe,
>> > in this case, those non poky distro can also use its SRCREV.
>> >
>> > Pull URL: git://git.pokylinux.org/poky-contrib.git
>> > =A0Branch: kyu3/srcrev-recipe
>> > =A0Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkyu=
3/srcrev-recipe
>> >
>> > Thanks,
>> > =A0 =A0Yu Ke <ke.yu@intel.com>
>> > ---
>> >
>> >
>> > Yu Ke (1):
>> > =A0poky-default-revisions: move the SRCREV to recipe file
>> >
>> > =A0meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb | =A0 =A01 +
>> > =A0.../recipes-graphics/clutter/table_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 +
>> > =A0meta-demoapps/recipes-graphics/clutter/tidy_git.bb | =A0 =A01 +
>>
>> <snip>
>>
>> > =A0meta/recipes-kernel/blktrace/blktrace_git.bb =A0 =A0 =A0 | =A0 =A02=
 +
>> > =A0meta/recipes-kernel/dtc/dtc_git.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +
>> > =A0.../kern-tools/kern-tools-native_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
>> > =A0.../linux-firmware/linux-firmware_git.bb =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
>> > =A0.../linux-libc-headers-yocto_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
>> > =A0.../recipes-kernel/linux/linux-yocto-stable_git.bb | =A0 12 ++
>> > =A0meta/recipes-kernel/linux/linux-yocto_git.bb =A0 =A0 =A0 | =A0 14 +=
+\
>>
>> Would it be possible to get direct cc on changes to the linux-yocto
>> recipes ? I didn't expect this and it is causing me a bit of pain at
>> the moment. A direct cc' would have helped, since I would have
>> preferred to stage the change in with my other items.
>
> Sorry about that. Hopefully everyone agrees the end result is worth it
> though as we're rid of that central file finally :)

Indeed! My minor issue about how it got done shouldn't be taken
as a criticism. This is great and something I was happy to use
on my last update. :)

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
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


