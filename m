Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2717D4DE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 09:36:15 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id g127so7719152vsd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mtreTOc4bEjPIVxDKwqk/iOjCghEYNRskv+XiPpapec=;
	b=S9eZhd0PE7jGIBiETFwlT/nrIyD0nT+4FdF1VWc/eVM7BZ8CdgX1+kIk3JNZvZUbHb
	PvMVXlljoly9aU4GxYKQ/rz9zbXE+glTWNXCCkTH6g21EKIQGvhQdUyINcABnSXX1GTM
	bLaroQCj0EZKwiMrsS9Qy+w0BCQ4qFxNWQhqHyA1piGc1Y8eTp7XIqLuvNa0QIcHJcq7
	kLZsARHb13f20qTKbnbpeACtP7pul3JLNOxB+lf/BUBI+DEkKyMuRycrOnzZMEjlCrWj
	ST3rqUK1yKqeKNgzJ29kGxczw+DQyb5MmeeY0nZn6iXEmYeNL1k1nu+zLbOgBDjXwXAX
	UHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mtreTOc4bEjPIVxDKwqk/iOjCghEYNRskv+XiPpapec=;
	b=nwXxJAbqj9DTSKfbDaI+iVQarImtv7qxbCibTunHDglSGEcL2UtmuXAuQ1fb9benYX
	uZ5On5NY8MbxC/Xq+nVM12mTvC9NHcvopLkkHB/vWVYRS8ZLPhSKZ6/9QN1Xn68Oaq2e
	G3lfGZDXr9rO8dRSdeSvmhIDtNPV4dPSIT5u81yBed6bNHUD7e83xc9xvDJsiapALzCd
	7GVcR+w+PSwj/Q+nkqbUUEfI1N/aTYxRbK7nx7nXxmC5qBKCzzZUCKcE/xJBuC1MsLp9
	P1I0a1iS2U9kxXH8KFBClSvt76EPpS+kYutcps/HOEzOwp75WjMtf/om18hJ+VNATLX/
	8dXA==
X-Gm-Message-State: APjAAAVwes88/kt8XwkE8o9fbS/TNSXHCSm0hdGWfdP8MyILQ24JLAh7
	ZiBKDzEliEMhOfVsFIwagy9+2lUBZGW4PklDjs+m6Q==
X-Google-Smtp-Source: APXvYqyvnK4HZw/FHbypqTzCS+yIOemxJOR50mVtxJJYmzd87gvLu7HHEDUUE9h8Znzdj9RrNOFbJ3/IBTV28ycGLAQ=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr9501678vsl.22.1557135375966; 
	Mon, 06 May 2019 02:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
	<3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
In-Reply-To: <3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 6 May 2019 10:36:04 +0100
Message-ID: <CAO5Uq5QL1i3gBmprySJBHBRQRiRVjWbKL11+-vn7qsmLqRD9Mw@mail.gmail.com>
To: Jonas Bonn <jonas@norrbonn.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Mon, 06 May 2019 09:36:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 6, 2019 at 5:54 AM Jonas Bonn <jonas@norrbonn.se> wrote:
>
> Hi Alex,
>
> The below is fine and looks good.  The one thing that bothers me about
> this is that "stateless" isn't really a property of the "distro", rather
> it's a property of the image/machine.

I agree it should be part of image, I'll respin it.

>  I suspect, in the same sense that
> we have readonly-rootfs, that we should probably have image features
> "stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).
>

That makes sense to me

> Furthermore, if you want to boot with 'ro' on the command-line, I really
> think you need to build your image with the "readonly-rootfs" feature
> set.  The default should be writable+persistent /etc as that's the
> configuration used 99% of the time (currently).  "readonly-rootfs" does
> a bit more than just creating machine-id but it's all relevant to the
> 'ro' case where /etc isn't writable.
>

I think there's (at least) two use cases for ro boot:

- systems which boot ro and stay that way
- systems which transition to rw during systemd-remount-fs

I'm in the second case as I have no initramfs and need the filesystem
readonly until it's fscked/remounted rw.

> Just for clarification:
>
> i)  volatile-rootfs:  means there's no point in prepopulating /var
> because it's on a tmpfs and needs to be populated at boot time
>
> ii)  stateless-rootfs:  means there's no point in prepopulating neither
> /etc nor /var because they are on a tmpfs and need to be populated at
> boot time
>
> iii)  readonly-rootfs:  means that /etc is really not writable so it's
> important that: the systemd first-boot stuff needs to be done at build
> time:  machine-id, unit files set up, all tmpfiles.d snippets that touch
> /etc and /var need to be done in advance.
>

I'm assuming definitions from here?

http://0pointer.net/blog/projects/stateless.html

Either way, those work for me...




--
Alex Kiernan

