Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 153D86074F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 18:26:08 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v13so538514ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X4vYMtPlv3SWrzJ3sVxdlYWv2zKdexVW8W7dy0WIhHw=;
	b=QkgYazJ+JcdZsYOV+MrD6u0RHXu+YmguPkMvEHbDlZ+4fg8AXmIQyhTSvIXaI28qDJ
	DhBx2aqvAa758Hu5jkNPlgdPV0COPueJXVovCLYPvSpi9vr2Civa/VEP5bZf5aqcBZZq
	mVudRbTiF1aAgF/2i8RBmWB/NGxC/eaAlhKns6XV7+skbUeF4zc8cBKJXagS71z/KXQq
	SzPIux9HQoiLcK6gr1Vq4N6Fom0LwSHmddSuC3jTcS0/GpYw4w6c5wgvAGNMAYIrEZtR
	VRoGaeUGraUoXO2l7TW1Zj/b5N63s323L307gxPAv9JJarxTOFHlz2PXZfeS6e5nKBjp
	NgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X4vYMtPlv3SWrzJ3sVxdlYWv2zKdexVW8W7dy0WIhHw=;
	b=Dczrt6PYD6ucrTH37IAslWV2/Vx9SXWCe4Zj7YeU4n7E3v/x2oPVa78vcE5sS+wCUx
	GyOLrVGNCaS1/3m7z98F+je5n9zGbHrhkJ3Wy6unn39IyUS3UJoAlL/tNsl3ijRRQCM5
	Uvc94kpYyYg5kE2H3PVL6oUQi7M9i8HMw3oHWXIGTHZSeGLIaLTXjPXDov+jDIZp/U5C
	QetTsKCA4rTO6JfgICiJNf/sVK0rSxdIekeshG5v8qeZwX5jG9dHYFZOwypXPOA9wnvK
	iZuLN8vu5sTPGvSsa1RmjRhl5/33jNbjTHN29SRHRu5YDupRbN2Vczk2aQVFzh3OocnB
	Fkow==
X-Gm-Message-State: APjAAAWZFVDpYoD9LFQFbjQYYHmWIGboWRkyvixVtXpaqOsP5m9IJG30
	tkLujOqSP/z4PooTkEfvqZM9HL1mqjsD2dzpAYw=
X-Google-Smtp-Source: APXvYqz4RPk8POXD3Yuyw8Kjc0dquawXZ3FfhmmIv99rHd+iC23M1BeWXfO0YMmHimwQ+ylCpx45cQ2meIVVb4lAQaI=
X-Received: by 2002:a2e:300b:: with SMTP id w11mr3534565ljw.197.1556216769587; 
	Thu, 25 Apr 2019 11:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190424001333.14948-1-alistair.francis@wdc.com>
	<a824b9bf98abc6545575514aa58e97e5f6347ada.camel@linuxfoundation.org>
	<bccaa968-1653-f9b1-4b75-8e72337dcd7c@gmail.com>
In-Reply-To: <bccaa968-1653-f9b1-4b75-8e72337dcd7c@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 Apr 2019 11:24:19 -0700
Message-ID: <CAKmqyKOyQ82yYZzuqDBgM_+-6=czN4Xg8npAWxkXvNkch0JXpQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade from 3.1.0 to 4.0.0
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
X-List-Received-Date: Thu, 25 Apr 2019 18:26:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 25, 2019 at 7:27 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 4/25/19 6:49 AM, Richard Purdie wrote:
> > On Wed, 2019-04-24 at 00:15 +0000, Alistair Francis wrote:
> >> This commit upgrade QEMU to the latest 4.0.0 release.
> >>
> >>  - The COPYING.LIB file has changed SHA to:
> >>     "Synchronize the LGPL 2.1 with the version from gnu.org"
> >>  - SDL 1.2 has been removed, along with the --with-sdlabi command
> >> line
> >>     arg
> >>  - The backported patches have been removed
> >>  - Al the other patches have been refreshed and the numbering has
> >> been
> >>     updated
> > I put this in for testing but it failed as nativesdk-qemu doesn't build
> > due to unpackaged files:
>
> Bug opened: 13308
>
> Thanks,
>
> Your neighborhood swat team.
>
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/535/steps/7/logs/step1b

I have updated the patch here:
https://github.com/alistair23/openembedded-core/tree/alistair/qemu-4.0.0

Alistair

> >
> > Cheers,
> >
> > Richard
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

