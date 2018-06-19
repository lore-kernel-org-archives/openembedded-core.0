Return-Path: <nirbheek.chauhan@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 928547604F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:24:56 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id l19-v6so1426035ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UkEqhbvL+RmpxGPnWxEyDcJrSwt/ntaukYY9hb3C7Yc=;
	b=Gis5GqDdQSxmzuKb7g4iazwXctOz/YQErQTB3bmX7pwVG+d4JSre6O5qgyXAvtO3ms
	08+bgVOJoIDvKjR1JKgUUyGOYVyoDMZgF2AVOZc/tthQGOAK2/uOLJKOO5X/xi5v9mQm
	mrcGHSR3TP9wDnSLGZILG9GA2Pl7Ya7zihmhW/gF7gRmbPDVMjRytvZ85rJY8P9t8n1e
	h9T7jLtzNo4zhXPXfl8/BzMbL1A17/j90xzaxDhY3kMnyVbRt76v735fHcAeSrJZbNm3
	xIRhm4EnmPWBpftuSVmEWWf8T+6wiv8F1Wr/I5+T1qtAAGXNRNXzY2Cr3whUkQEKl2O7
	LR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UkEqhbvL+RmpxGPnWxEyDcJrSwt/ntaukYY9hb3C7Yc=;
	b=N3S7scJMnD4zM8GUdDWqDZ2Ue2+eiEcauvPV2gxT/IY2r0sXFP9ap/mdu0OliaQF0/
	ATD4RbY/DwqvJJFxUXVk48MWLrB1O+SE2aHgPs4iM8qh8adyEI1nJUgX75KjHo5adls1
	iLAfC/wroMFg9clakmF4Kg2CK1hHaiCAR/NueDkvjj/VGRP820G20xL4povUota6X2g4
	Ovg73abCd9pK1O5xWJIjOQJxAim2wMwajtfHX7TX8uHqFOAjdrQoOd5xEMoJlkTI1zb7
	7b181EzKz4O2RPHopUytCHoHSQwULoBOxprLcQ48pOG1Y7SoksMgqq/IVqkRx/zrdddn
	deDA==
X-Gm-Message-State: APt69E0zhz+gRf9hhjblsYyDznUsYkkMmmJN4OmojK/1pZKL7oE0Ywoc
	camXZkyQh3lmkTRcJOE/EKRpYmXg3i1/gqbEon8=
X-Google-Smtp-Source: ADUXVKJg29M2/JEpHEaxJHhJub0XWhb79zS8DpjG4lbEPddozuf1vdRMOFCWcIMsfOZOIIhmiFVtLuGgKUz8QYDMJEU=
X-Received: by 2002:a6b:6f0b:: with SMTP id
	k11-v6mr15579823ioc.62.1529439897480; 
	Tue, 19 Jun 2018 13:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
	<CANNYZj8M+88frU6ci4n-=ufcMts1764FPK2AdbYSkmboafsnfg@mail.gmail.com>
In-Reply-To: <CANNYZj8M+88frU6ci4n-=ufcMts1764FPK2AdbYSkmboafsnfg@mail.gmail.com>
From: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Wed, 20 Jun 2018 01:54:47 +0530
Message-ID: <CADqQcK7Q_eZBoRiE88_XY=FbZVfJSpkybHdTCPqFM9okVZqYcQ@mail.gmail.com>
To: alex.kanavin@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 20:24:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 20, 2018 at 1:39 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> FWIW, I did fix a similar (or maybe even same) issue with this patch:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
>
> It's possible that more rearranging needs to be done, or this patch no
> longer has the desired effect.
>

So far in this thread, I don't see any changes that would cause this
issue, and that patch shouldn't change things either. The bisection is
probably significant, but I am not sure what's going.

Also, in general please try to talk to us first before doing a change
like that (switching the order of cross_args) so we can investigate
and figure out what we should fix. The cross_args are at the end so
they can override existing arguments, such as -D flags or -W flags.

Another thing to try would be current git, which has significant
changes in how we do library resolution, de-duplication, and so on.
Specifically, instead of `-lfoo`, we now prefer full paths to the
library to use instead since this allows greater flexibility in
selecting whether to use shared or static libraries.

Cheers,
Nirbheek

