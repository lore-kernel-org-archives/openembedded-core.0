Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7751C73218
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 20:14:15 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id k1so61860443vka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=FNhs+AkSDLZPOANGuOSIGUF05RNLZ/8n+6JwmhADDsI=;
	b=RvwlpN+8GE132gE/TkSoyKyw8zTVLVI9wrStPoqMfhxchAkY03NDf0dNfLatKmMuXF
	tKRZuWkuXNifaUv+z2s2ukzOYZrx0mAV+7vAizIcQzAtt4OV5+b4pH/CTJQbJnwC8hTA
	2iLTTFHKJBmwrjIyPKsjvldLYG0EGm7yP59mLB9dYz2fdwAFdaJKA2EmMFhc1dvbY7+f
	cF3nLVLcYbAZkMgy9dGovFO1kytqJFX6gINGT/MepUbOrblOlXHvdP0SQEXH+mekfqD2
	gCOFFjGRdd9XZLEJjS3CAmeHc5fcO1kPEY59sxb96BHxP/otnQiYEv2zWvYhypGbMP3v
	L0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=FNhs+AkSDLZPOANGuOSIGUF05RNLZ/8n+6JwmhADDsI=;
	b=GVeS3zgOj8u8aR7hOS2RRrNcxKgjZVLzFt6Vs3Rrwm+9yN8DaTrqkGJ/CZx5DB7hK1
	rFwyqTl3o/URW0jQNRALQg1qTXZY2zOVAsciitZNDoq/U9KLfs+JYM/TtnVKi8EMhJTe
	EWPucV9LKWbLfkXCnyhMfX6gW0s3W7uFfia4spcEOYBx30+JFEv2ld58AGqGxcBAH8Kw
	zXS3qqZonV0OrFvQeOFOvgBj2KF5x4fym5oaqFyaJByeNwhxCxV76FQiI0sl9U5ARPnH
	VkkGtS7paDUQ0c22B9vihK/fr/ofIpJuCP919Mzvg2z7QJ3pR1lQFvoJQi/LJP3QB0T5
	WUUg==
X-Gm-Message-State: ALyK8tIRhE9bphFO0WbeR5RWJrmPh92Y0j0ZrObPe4yURpCFUpvgEwvWahsvTR7LaYLa0Qu80ykY3qKDA0cPDg==
MIME-Version: 1.0
X-Received: by 10.31.15.14 with SMTP id 14mr6455216vkp.30.1464293655493; Thu,
	26 May 2016 13:14:15 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Thu, 26 May 2016 13:14:15 -0700 (PDT)
In-Reply-To: <86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
References: <cover.1463042237.git.pkj@axis.com>
	<c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
	<CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
	<86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
Date: Thu, 26 May 2016 22:14:15 +0200
Message-ID: <CALbNGRTiZicGG7u=YDPpc2k6OsqgDq8v6t7k1S7BXS+5HWMwoQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 26 May 2016 20:14:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2016 at 3:41 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: Andreas M=C3=BCller [mailto:schnitzeltony@googlemail.com]
>> Sent: den 26 maj 2016 14:00
>> To: Peter Kjellerstedt
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add
>> dirs to stage in sysroot
>>
>> On Thu, May 12, 2016 at 10:37 AM, Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>> > ---
>> >  meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 5 +----
>> >  1 file changed, 1 insertion(+), 4 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-
>> devtools/tcltk/tcl_8.6.4.bb
>> > index 8e92b3e..61be81d 100644
>> > --- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
>> > +++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
>> > @@ -68,10 +68,7 @@ do_install() {
>> >         done
>> >  }
>> >
>> > -SYSROOT_PREPROCESS_FUNCS +=3D "tcl_sysroot_preprocess"
>> > -tcl_sysroot_preprocess () {
>> > -       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR=
}${bindir_crossscripts}
>> > -}
>> > +SYSROOT_DIRS +=3D "${bindir_crossscripts}"
>> >
>> >  PACKAGES =3D+ "tcl-lib"
>> >  FILES_tcl-lib =3D "${libdir}/libtcl8.6.so.*"
>> > --
>> > 2.1.0
>> >
>> This one breaks meta-oe's postgresql.
>>
>> Andreas
>
> Breaks it how?
>
> //Peter
>
Yes I agree I cannot see what's wrong with this patch - together with
modifications of staging.bbclass it should do same as before. For test
I reverted this patch and postgresql builds fine again. Have no idea
what's causing postgresql failure

Some typo I don't see?

Andreas

