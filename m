Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF9660F6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 14:13:57 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i11so16798135ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 06:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=65B5vsqAZTOvPZcgijeEdU0T7CTVtBFjABTQcpPkmhU=;
	b=eFVwy8MxNm+Gr5zGbQG98yJ3kCIBA8SZQbVpbal/IqTvJtd7J/O3TlaDtOQ9HVgn4d
	KXovJ5KQ6Mb3WZnCcmMJQ0rDlIkczxUZUQy6V4D9xREgIEA29tapSVMANPB5U25mJSFl
	9lhnqwVDjxEfLIJZC2KnC+jwHhMrTldgRg5PZ4syjOT1+0zwHzDOkKtWht8U0/k8oM7C
	Gdmp/cf4C/ffVoX4AJtiPyzob0M14lxXTQEOn+SJifAxPHW+iNWd5P8M4UuBHDevKagZ
	RywQaVnEf975zmXGWvfmSXNYQDiY5WPDyMLY4kpx16dsqAedYneNq7UNu4ua7L7JpvdS
	H3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=65B5vsqAZTOvPZcgijeEdU0T7CTVtBFjABTQcpPkmhU=;
	b=DQpc5e10EhTRx6hlvZoplp3/R2t3W3RDngTYpmhoL4tZ2FiaBGfYkxXL8HEOCFq91L
	/7T1lxoNIogl5UgVKGcRk5FF/cYiFFORrS9VBUZGLVHTsLsEDctb7mRdl3uS+dHzyyve
	OcxOPu4BrsorlhU89U0T4Cdsj/DZ7+asYpRLGjMn3GabiWbvjVp2OclnNFCqRVuB0sZC
	CWzyqI+KF84Z2Lbvw5/ObdHeakXqRJzYDvEqMXGCA18TW1OIXHReFQYtIoDnz43n5IC/
	CuRu9x84NWx6hcUV9hV59chIZu9X2aUDsgBfK4Mj5SeTVNXbJwlTFCP1V8VZ/WYO9KsG
	x14A==
X-Gm-Message-State: APjAAAUl+/WOBLSQIwShG61nDYkbNPFTBw2L5jV9ndADPYjkDi7hjqIj
	g3u5Y352QV4kZfwXSQP/5gnuM54K3BBCJycgIc2yM8KV8fM=
X-Google-Smtp-Source: APXvYqxXmmeVgAY5t+y6d2R737diowTgK/njMlSB5Sas6qBVTl+trpSjBb2nnajs8G6cyFa5ILwUJdtP55ioSvQ5tnw=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr20279925ioa.102.1580739238252;
	Mon, 03 Feb 2020 06:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20200127231306.46105-1-alex.kiernan@gmail.com>
	<b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
In-Reply-To: <b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2020 14:13:47 +0000
Message-ID: <CAO5Uq5SGEmZCDvfMN=d=q_m40OohtLozOHBmRji8snYj4MZEeg@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Feb 2020 14:13:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 10:26 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-01-27 at 23:13 +0000, Alex Kiernan wrote:
> > Update to latest on the 243 stable branch. This includes (amongst other
> > fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.
> >
> >   systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at src/basic/time-util.c:55, function now(). Aborting.
> >
> > Rebase 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> >
> > Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
> > fixed in 5c0224c7bf3c ("Handle d_type == DT_UNKNOWN correctly").
> >
> > Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
> > fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >= 0").
>
> Unfortunately something in this causes:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/412
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/413
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1545
>

That's disappointing...

> I've been blaming Trevor's patches until now but its this one (sorry
> Trevor!).
>

I'll start bisecting it out, though this looks like a likely candidate:

commit 53d8feeb2334c396dcfa7106c78ce1791fb5d0c4
Author: Michal Suchanek <msuchanek@suse.de>
Date:   Mon Nov 4 21:23:15 2019 +0100

    libblkid: open device in nonblock mode.

    When autoclose is set (kernel default but many distributions reverse the
    setting) opening a CD-rom device causes the tray to close.

    The function of blkid is to report the current state of the device and
    not to change it. Hence it should use O_NONBLOCK when opening the
    device to avoid closing a CD-rom tray.

    blkid is used liberally in scripts so it can potentially interfere with
    the user operating the CD-rom hardware.

-- 
Alex Kiernan

