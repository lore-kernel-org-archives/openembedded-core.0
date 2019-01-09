Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF6C57BDC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 18:36:55 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m62so13161699ith.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WO7IIhLH0RWSWMxxLpE+nO0ZM/fgUCfApAF4/q5K6eQ=;
	b=Ma/QJQKEVI2ftTyrofi3PF8PzsFMB6xtRvPB1KvpX9ISf4KJeusbzqwvmj7Qr61dOK
	pig65vGWsWh2RY3wTmkIA4ylQmPhJc32Znnm8SFuQscVyxU7xH/k05/Nbi3oZIGJAl0T
	K5SN5/PKVt7+u86fE3zlZSph1CBOlC2L/DqSHoZ12lz9WPxr2GfGOH3EBo4vZy+4EXi8
	NAxX08JobaBSS/k1yNKcAqoBjTpuZU1+t48G7O7HO27zbrtdZKSOBHnOKt084UNKj4Ab
	yDmQFrki6RoRQnuYJsowSm8nPTLt0jyPHVr3ERo3Nd0WpQKtQWC6XKSmQnTqKiA131N+
	lQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WO7IIhLH0RWSWMxxLpE+nO0ZM/fgUCfApAF4/q5K6eQ=;
	b=pFLvwGPVdRmxaZquMH4WUNc5x7mRWO6sLux4ioBi7+Y7ngjN8eJ0ZpOX06Se9wyXcV
	GVGy8Nd1Bjk/j7GaV+BVcur7v+OdWnZ6WJ89HK6XcMx+hdA+Uo7cpLz/FPDbydZ7VDDw
	m3yjHEsmJ1TI+woM4A+65YcKIcQjdD904VBAWrkYb19k2L7Dx0XLUZtaGbz4zTA0+vfy
	7Q2S2VM0pb7jv246O9Dsuwkg3F7Dro8YI7YZG9IvA7vg0a6ZCzr1+u/vDU9bUT9xVj5M
	W2op+/cipbd+mseLMG1Aq4frXcX2nBI80oVM59TaMAbfapnSR8HHeWxkcF9Sd0cNzK9H
	wCSw==
X-Gm-Message-State: AJcUukcXazwA1CITlaLuEMWi0QZ0wxOhLLxcl6iqfvqC4Q5u2tDpQS5y
	ROc5miZkaWcdCnDI+VKimAxGi7JuHyRaeZKOr4c=
X-Google-Smtp-Source: ALg8bN7GXoZZO9cuckhfS2SVIWryrxCa9HY5oatu6tXKxoj1VytMklytvr6gUxvf4l/xUrPJUeImSWCs2LN8+Ytp66Y=
X-Received: by 2002:a24:edc4:: with SMTP id r187mr5425076ith.158.1547059016922;
	Wed, 09 Jan 2019 10:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<14187e64d1ed43b392446fc2178e000f@XBOX04.axis.com>
In-Reply-To: <14187e64d1ed43b392446fc2178e000f@XBOX04.axis.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Wed, 9 Jan 2019 19:36:44 +0100
Message-ID: <CAPbeDC=0M=Ovc_CuV3LvKd-S0pvo8MoH-pwB5qb7N=N-8+Dy=g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Wed, 09 Jan 2019 18:36:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 9, 2019 at 12:20 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Jacob Kroon
> > Sent: den 6 januari 2019 19:14
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [RFC][PATCH 2/2] buildhistory: support generating
> > md5sum of files
> >
> > Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> > when doing reproducible builds.
> >
> > When enabled this will additionally create:
> >
> >   files-in-package-md5.txt
> >   files-in-image-md5.txt
> >   files-in-sdk-md5.txt
> >
> > containing the md5 checksums of regular files.
> >
> > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > ---
> >  meta/classes/buildhistory.bbclass | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/buildhistory.bbclass
> > b/meta/classes/buildhistory.bbclass
> > index 33eb1b00f6..00f0701dec 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -7,7 +7,8 @@
> >  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
> >  #
> >
> > -BUILDHISTORY_FEATURES ?= "image package sdk"
> > +BUILDHISTORY_FEATURES ?= "image package sdk \
> > +  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ""}"
>
> May I suggest using ' instead of " within the Python block to
> lessen confusion when quotes are used within another set of quotes.
> (Even if bitbake handles it fine, not all editor coloring modes do.)
>

Ok.

> >  BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
> >  BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
> >  BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
> > @@ -526,7 +527,12 @@ buildhistory_list_files() {
> >               eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
> >       else
> >               eval $find_cmd
> > -     fi | sort -k5 | sed 's/ * -> $//' > $2 )
> > +     fi | sort -k5 | sed 's/ * -> $//' > $2
> > +     if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '0', d)}" = "1" ] ; then
> > +             md5filename=$(echo $2 | sed 's/\.txt$/-md5.txt/')
> > +             find -type f | xargs -I{} -n1 md5sum {} | sort -k2 > $md5filename
> > +             [ -s $md5filename ] || rm $md5filename # remove result if empty
> > +     fi )
> >  }
> >
> >  buildhistory_list_pkg_files() {
> > --
> > 2.11.0
>
> Don't forget to update the documentation for BUILDHISTORY_FEATURES
> if this is added.
>

Oops, yeah I forgot that.

I'ill send a V2 with all comments addressed.

It does seem like once the equivalence work is ready and OE hashes its
outputs, much in buildhistory.bbclass can be replaced with already
prepared information. But for the cases where it is not used, and
considering how small the change is, maybe it makes sense to add it
anyway.

Thanks for the feedback,
Jacob

> //Peter
>

