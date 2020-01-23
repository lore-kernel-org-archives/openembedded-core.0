Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id B418B7FD64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:40:03 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id y125so69724vsb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SRXj/uU1PEQn1XxtWn5R4ssh0Q92+QG+hoMrXFiuRnY=;
	b=jMSpI8Ht/DcDjDYCFEOLzg3cXlOQcDdBAhOc3R/w+O4FkLoiYUc050/+hHdKI13KIx
	SQOIbcPmdb3MjrwSm/LUFBCC81Ic3EVx8Jg55I/JT9w0mj0+TvV7agIbesbkb1SQ3LzL
	ti/GCplH5VGYiZ8so+myH7f64aaYc5suumWtblGNlnYnILKt3zowvurdH4ZsJBZkKMoO
	BFu/BQ3zferzDqN47gy+X6cl+FMmQ/vF35meIZL2CM3cObq65eOFaYeOtGeH2OP+sh3E
	61VboI0xEDZ4RQ7NYHv3UPdTPn6HiZKpKnIVqfGDp6JBrbiDpRn+RrO978e2ciLenV/4
	WyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SRXj/uU1PEQn1XxtWn5R4ssh0Q92+QG+hoMrXFiuRnY=;
	b=CRWK46XLuvw1MgI26HWR/pYvAWvJeLFf+LGg/X6pzyeOiNuRih6/bBTWegJDDIlS7I
	lNomRQ98ksU6mbGrIUxZ5hgwLbur+jPBcIktELSNrEM/tXT2syvjp5ImSWs2Uv04SG8W
	tX0w4fQoQWA+TFT9pbFjpcX5SqsmJftO8Mr3ew7frq6DCKT+ZIOjVUuS8XKAobcpMrCL
	VN0JbmDrGVuqYmz0uyQ5u3befuQDEDOHO/Ggo3VXEM32szEs4gkgDbPnAMjLIKSb35Ud
	wJ/MEB/E43Eq7ahsb7BllEzaRoukjDIXtSsEr2ggLfwxvsJAxPBP2qkojc0IKMZqXip2
	wqJg==
X-Gm-Message-State: APjAAAXdyFUBGirsCDRyaRagRneXdHh/GreGnBWzAMoUdm8JKck98usS
	DOZD88x8o1qDmzi4O0xFEXEsDNbDOEc1CYlZqEY=
X-Google-Smtp-Source: APXvYqyGYnYjdBXxXaDPbviZRdy/hRZaU2zaBbs8scyy50AJJteCq4ttY/GsmGiPyLnyFOrpgKbVR83w+/YMLPmXhOc=
X-Received: by 2002:a67:f41a:: with SMTP id p26mr446061vsn.222.1579819204574; 
	Thu, 23 Jan 2020 14:40:04 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
In-Reply-To: <6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Jan 2020 14:39:52 -0800
Message-ID: <CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:40:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 2:17 PM Ross Burton <ross.burton@intel.com> wrote:
> On 23/01/2020 21:43, Bruce Ashfield wrote:
> > On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> >> To avoid duplicating efforts of adding very similar recipes to BSP layers,
> >> add an upstream reference implementation to openembedded-core, which can be
> >> customized by BSPs, if needed.
> >
> > Isn't this one of the things that Jon Mason is trying to
> > standardize/support in meta-arm ?
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> >
> > What's the delta between the two ?
>
> That was precisely my thought too.  meta-arm isn't exactly well known
> right now, but ideally it should be a central place for common pieces
> that are specific to ARM hardware (unlike anything that is needed for
> qemuarm itself).

Such as all the various cortex etc CPU tuning files?

