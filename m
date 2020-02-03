Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 46BFD60BA9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 19:55:18 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z16so13413519iod.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 11:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WUmcRjLsnkMb642U5mOuba8rulGZy4xcJIU5z7f2L4Q=;
	b=K5Q15y2ZL3yiQj0gIpU2YZcLzusOfH22fDgKtX74HnpF90Z8r8M0fFXXBqkN865nLk
	68xs36tB23TdCgzmkqQJKnl2cmEfrUmgOUc1x8Byvg33fWQMoKl32i+bEqXWkcYFlGOk
	Ya0KFl3SeOSQSj2vOTnUsO7SoesJwRRral8t+7NW+cE75LVygDEUwtWo4/cqb06Ic5i6
	mScqyz4xsLqd9zbqcQVnIhRtQLt9AGiVfPzjxFiGKnV+glwC/aQv0tljTDApqaIsiJrn
	M8j875jGovWg6lLvzWEQeAPyc5720jvyzgc1OhTIr/DwtzCBcPWgnPQDV6SrtU+jXtD9
	3Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUmcRjLsnkMb642U5mOuba8rulGZy4xcJIU5z7f2L4Q=;
	b=XnH2TmtRrPpuk4//qQtFfBXy3zfaZ+tZ5Mng8dzG8t0KnhWuO3+lslvcPC9gRbAeeu
	cGSozVnKHUydbdAbxZjSgKwelIQrs+YNm6RebGi/nCygHoQejYXE451krCaAb/RiUWt1
	0MA8aSm3gdAFzPz0HO8QH/vE5Ilhmqvp2dxhl2aGvyEWoaBa4RkoL0K7jGF7UGt2yS3N
	Wfa12SowrltMOWuBmOVAzlPcEtNueNowAvX5a9PXjm9A1TR3D0FL4565alaOzIjLq7Oh
	EGPK5bCdwKqPWxaCCtL4Q/xikeKaE1JXQ6z70jTwup5BIFYm8vDZirRf6pO739cNdqn6
	ykbQ==
X-Gm-Message-State: APjAAAXXkhsOM+pQ2zxjoqX6GLLdqPMsQZjLsoUQZ79SNoBP1Pba4vaf
	wxVBKkGvZ1fCQwrVzZB4CV/cDgDALCVhqTyZCMM=
X-Google-Smtp-Source: APXvYqxyeTLi6ugHSeilTqv7L/2r/McEHdm1PfSp0yJjPz4ARV4xoEetIhCY6dCUTHbc7Ftg5V2OfjEVRlEco3T9AjY=
X-Received: by 2002:a6b:f80a:: with SMTP id o10mr19697839ioh.144.1580759719265;
	Mon, 03 Feb 2020 11:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20200127231306.46105-1-alex.kiernan@gmail.com>
	<b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
	<CAO5Uq5SGEmZCDvfMN=d=q_m40OohtLozOHBmRji8snYj4MZEeg@mail.gmail.com>
In-Reply-To: <CAO5Uq5SGEmZCDvfMN=d=q_m40OohtLozOHBmRji8snYj4MZEeg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2020 19:55:08 +0000
Message-ID: <CAO5Uq5SG16CTCdNT1O7DgGc2Y4qUXrDU8VU1f9ox_WCL0a1kgg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 243.2 -> 243.4-latest
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
X-List-Received-Date: Mon, 03 Feb 2020 19:55:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, Feb 3, 2020 at 2:13 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Mon, Feb 3, 2020 at 10:26 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2020-01-27 at 23:13 +0000, Alex Kiernan wrote:
> > > Update to latest on the 243 stable branch. This includes (amongst other
> > > fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.
> > >
> > >   systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at src/basic/time-util.c:55, function now(). Aborting.
> > >
> > > Rebase 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> > >
> > > Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
> > > fixed in 5c0224c7bf3c ("Handle d_type == DT_UNKNOWN correctly").
> > >
> > > Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
> > > fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >= 0").
> >
> > Unfortunately something in this causes:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/412
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/413
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1545
> >
>
> That's disappointing...
>

I'm failing to reproduce this - am I right in thinking the error I
should be looking for is this one:

[ 3.997360] ide-cd: hdc: tray open
[ 3.999321] print_req_error: I/O error, dev hdc, sector 8388592 flags 80700

or some variation on it?

I've got testimage running across a number of the images I think are
the ones that are being run and I can't get any of them to fail.

I did notice that a couple of the failures were on CentOS, I'm running
on an Ubuntu box - I'm assuming that shouldn't make any difference?

--
Alex Kiernan

