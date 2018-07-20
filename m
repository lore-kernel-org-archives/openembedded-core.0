Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id A1401745A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 03:40:45 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id o82-v6so3600458vko.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NLv2asyZoHwqzg1d3U6U1jYkQXLD/O6YeLPtjg1lI5k=;
	b=FKViXSQ5NHkUgZ9dkBDGVuwX+2uHE+5z6J/ikwGwbqGux5HrerUXYgLzdBnKeH7Sp8
	OyC0ZFBePqGDuAUOEGe0CCkGt74Sno/e18WF+cMLvkIIbJSdvT2rJV5yyFHYuOmWMtaD
	HCzfegNspkjK/J4jFbwuveFFM5B3Eli0P9LGivVVu1d8tpmGwyQzjtWBACEM1YoqlICD
	KClfIGVWRRtaGHlN2M1bps3HC9sbfC3AcxmQnHp8CZ0tpN5uB5D1vWoyXWXIFUx9h9oT
	nP5XOCZRa5vMvnbD62IamjFy932p2/HGjIpy6Q8gOJjKiFtlgFd5jC72QnWG6HWeN10z
	0vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NLv2asyZoHwqzg1d3U6U1jYkQXLD/O6YeLPtjg1lI5k=;
	b=iB2D6gi5scW/EXtm1LmTPfGpAz6LAY4UZmSs7yk6me1RBZ1FRW22/sX43PnKin4mfB
	hIpGjVZ0ZsCHNsYoSY6Xi3YoxfUK1exdAIoIC+vFHAXOWp6rrIX6expPQQ9UTNS4uhpJ
	sKi91vmYizzRQ2Vgm0vHSja4nWPew+bq7BQP6ZKWw4OvM95zEjZeIfOsAG6+ySX+hyBz
	X5YxMFJ27uerMv7yOEDgVlHiGFrJNvXX1hocaTv4pRfEXnX+r957/DKZ0vQh9OkrmlJT
	cRH46lCF5yZRDdfj0aYvbqkrpiZ8LHhn2/V7LfIIoCJtCOY7RVeXVhWQyN7rHFRQOttY
	XsgQ==
X-Gm-Message-State: AOUpUlEDwgedA/lzDeOaCoyIDBfsNCXysj3MNj76+k7nDR7zQ7NIeM4h
	6+2YNb5kxl6TlPzQ1z4MuNo/sfXXL0pn0xDuhzc=
X-Google-Smtp-Source: AAOMgpcZRtmWeNEOF/0V1Yc6DwoVRYxcYkLpFEwqIl5SvcpF4/WkrL5KrW6lfWrcEJAGr2dAtlwyepICIJQEGtHLioc=
X-Received: by 2002:a1f:ba81:: with SMTP id
	k123-v6mr159602vkf.167.1532058046512; 
	Thu, 19 Jul 2018 20:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <1532020379-32243-1-git-send-email-alex.kiernan@gmail.com>
	<096e8a04-c49b-88ae-df8e-444cf4c33c94@gmail.com>
	<CAO5Uq5SBCQes7uM9sg=Zy847nKWUzB43zqJ8VRQRxj7qfzS8-Q@mail.gmail.com>
	<CAMKF1spcSe1bvUpK4fw=Fnd6veiyDU6VrPa8_kdQHkhuVwnWKA@mail.gmail.com>
In-Reply-To: <CAMKF1spcSe1bvUpK4fw=Fnd6veiyDU6VrPa8_kdQHkhuVwnWKA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 20 Jul 2018 04:40:35 +0100
Message-ID: <CAO5Uq5RhoRfWJDkX0YHqb4H2rprGX61AWF8T1KOPJ_0VvUN+tg@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Fri, 20 Jul 2018 03:40:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 7:20 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Thu, Jul 19, 2018 at 10:26 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > On Thu, Jul 19, 2018 at 6:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > >
> > >
> > > On 7/19/18 10:12 AM, Alex Kiernan wrote:
> > > > To handle the case where ${COREBASE} isn't the git directory, but
> > > > ${COREBASE}/meta might be (since that's the layer that sets up the COREBASE
> > > > variable), use the timestamp from there. If that fails use the timestamp
> > > > from conf/bitbake.conf.
> > >
> > > whats the chance that ${COREBASE}/meta might also not be a directory
> > > under git when compared to ${COREBASE} ?
> > >
> >
> > About the same I expect, but if it's not then git will climb up to
> > ${COREBASE} so I think we're better off.
> >
> > And if it doesn't find one then it falls back to the timestamp on
> > bitbake.conf - I've just been testing a snapshot of the layers as a
> > tarball and building successfully inside that when there's no git
> > directories for it to find at all.
> >
>
> OK lets stay with adding bitbake.conf as fallback.
>

I've just re-read Richard's advice from before:

  I'd suggest the code checks for ${COREBASE}/.git and if that doesn't
  exist, fall back to the timestamp of the
  ${COREBASE}/meta/conf/bitbake.conf file.

Which it'd been my intention to follow; I'll swap it back to
${COREBASE}/.git and post V2.



> > > >
> > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > ---
> > > >
> > > >   meta/classes/image.bbclass | 5 ++++-
> > > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > > index adc50c9..0afebff 100644
> > > > --- a/meta/classes/image.bbclass
> > > > +++ b/meta/classes/image.bbclass
> > > > @@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
> > > >   reproducible_final_image_task () {
> > > >       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> > > >           if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> > > > -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
> > > > +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta" log -1 --pretty=%ct 2>/dev/null` || true
> > > > +            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
> > > > +                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> > > > +            fi
> > > >           fi
> > > >           # Set mtime of all files to a reproducible value
> > > >           bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> > > >
> >
> >
> >
> > --
> > Alex Kiernan



--
Alex Kiernan

