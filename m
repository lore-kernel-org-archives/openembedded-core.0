Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id ACC72782A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 00:09:55 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id o9so258007itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qS9eXMQvtEtkMo2JhOKu8eKs++zrNOModphMzdQ2GiM=;
	b=o8XMGZSUh4RAUMRdWaULz0XPW3zNEI8iyq0xexv/82cFlT+wAaxe9cVtR1TRIcT++M
	rLZfGaSN7YndujTfdJpOdPCDPU6UJf6N7d+Gf5r4oOUVHnlHRyJsnWyseSXlK28BZ47h
	FtF0hsZc5wu+o4bqYXecAiSBS/nBun+hA5wl+pMEUT6Xq51uPjJkFxDqqIsOjI+p0NI5
	59Y5DgmSOT0uwKKkoNcdx8EEfF789LwZLblwvS6nizzyG//PArwZkoTnEKF3+rC83LQb
	5pzbNsRSxJ1V8GBI2tH79cc7CT8r37GzVEGwWIHF4g9XxUZHF/1eJML8Cy338BHPi3oZ
	LTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qS9eXMQvtEtkMo2JhOKu8eKs++zrNOModphMzdQ2GiM=;
	b=flAy9EwcsV+0NP0R31+0zKtwvovYVs5suVHR9gWARjkNyGXTLp7P6/Ra+lepY7D+d3
	1Emjuq6e4DozP6pa4AfnIVVQiOISJ77hIxfQbceDcWHJbE2IqKSA57cJXxs/YG8cId4U
	STDsqwVMosBymbpmBL4iKiS3U75EkjSnWzrB2rNUtguWE3ztyBnObQsUuk2rpvohH9W3
	OcSx90/li+cGAVtXOFP+GbILug2W7oUXMags/ryqqekSXrw9cvRMojQfBgvXKNYcY5tQ
	VcNZ4M6V/Eii2LtHJmRQTes2E8PTEwCJmjqsCft5dFfQeuwF5uT6/13H7nTYdN2JxiQY
	vwvg==
X-Gm-Message-State: APf1xPDjXQmFvisrpVC2HsronhOb0C2nmpBlQ9bCU0HAxiTEI3+h7zBA
	yzB1xC0ljH+398NLYXX5MOcX4ctdki7ji0S585HvOw==
X-Google-Smtp-Source: AH8x226sJpiiv4psyvjBA2uwwALKh5PlxbFBHLtTlbV31HqZ1529wq2xNnbB9F4xNz/TNY275jugSOdFtXX8bRVZkG8=
X-Received: by 10.36.66.195 with SMTP id i186mr1007019itb.45.1519171796722;
	Tue, 20 Feb 2018 16:09:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Tue, 20 Feb 2018 16:09:36 -0800 (PST)
In-Reply-To: <1519029438-11092-13-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-13-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 00:09:36 +0000
Message-ID: <CAJTo0LYjvxdw-cr9P9He_+KMsW0XdOK-D2ch3qzaAB6OsMmSEw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/27] kmod: define bashcompletiondir
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
X-List-Received-Date: Wed, 21 Feb 2018 00:09:55 -0000
Content-Type: multipart/alternative; boundary="001a113b88044bfe580565adbf8d"

--001a113b88044bfe580565adbf8d
Content-Type: text/plain; charset="UTF-8"

On 19 February 2018 at 08:37, Maxin B. John <maxin.john@intel.com> wrote:

> After moving to pkgconf, kmod package qa test fails without it.
>

Is this failing because pkgconf returns a full path
(/path/to/my/build/usr/share/bash-completion) instead of the path in the pc
(/usr/share/bash-completion)?  In the context of a target path in a
makefile, the latter is correct and the former is very wrong.

I really do think that the pkgconfig and pkgconf maintainers need to be
locked in a room and argue this out.  It's not a drop-in replacement if the
behaviour changes...

Ross

--001a113b88044bfe580565adbf8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 February 2018 at 08:37, Maxin B. John <span dir=3D"l=
tr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.joh=
n@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">After moving to pkgconf, km=
od package qa test fails without it.<br></blockquote><div><br></div><div>Is=
 this failing because pkgconf returns a full path (/path/to/my/build/usr/sh=
are/bash-completion) instead of the path in the pc (/usr/share/bash-complet=
ion)?=C2=A0 In the context of a target path in a makefile, the latter is co=
rrect and the former is very wrong.</div><div><br></div><div>I really do th=
ink that the pkgconfig and pkgconf maintainers need to be locked in a room =
and argue this out.=C2=A0 It&#39;s not a drop-in replacement if the behavio=
ur changes...</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113b88044bfe580565adbf8d--
