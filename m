Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E38475265
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:54:44 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id a5-v6so11247273uao.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eHd9zpSw4uqIORxnDPvxYZgd4EgAUp1qOBcZ/fh5U6w=;
	b=eg9lGLNv2pYIwa2XWrH9/33/84SvoXQh9W1wVHv/IJkmjjeigd6RWp8hfdS6pce2on
	0419eQEpQASL6mgzry3lZDU722qCSnR257Vfjic1vwiwig8Wiu/IgCyxzwj2DcJCOYaE
	Rpgtb/dxjfNhHnW8bLrWuPcjZvKcj80zjuXowl69ykNJyCq5P4EDtbFx2H67UtTIuxtb
	ouqe7/UOo9zrN7cRC/wx7ycKcGZOyNrIBEARv4XdLAfCM2bcuqAflvoQ6ULokVxH/htS
	lG56JXqlPk4Rv0FLgywbNbf4EW2NGxeQ/C2tGWY4ZdErFySKb8r9HlpQIBVtorTS16wE
	ZKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eHd9zpSw4uqIORxnDPvxYZgd4EgAUp1qOBcZ/fh5U6w=;
	b=GOu24De8bN5zoNqgWjDcOYxfFD53G3RgKK6ProX7t+hbIXjuxQvqtvS/9SkcK4ZIus
	FCTJIAdeVmb1XFAOuAsQdvGZ/IhPRyUcdKegykBo1SOTO41WF9c8e8stn1JV51d4VLsV
	OHzntg2PN4gZXp9X6arQRrTHHRwBW0rN4uInD7Byw7sgjgKXsyuh7T+XkEUepejf3lMW
	UsYABWCGOvrlmdaNtri8CRZmPZwqaGyJWb1E33N3edBmkVIAja8qG1s+WLhTUl/ehhXQ
	/Sqr8K3z2yXvrEu13cJNLjjH/9RL/W1GuliFJ0rN1q4hjFJVgqKMIrxcR08JUw2QoUQL
	k3xg==
X-Gm-Message-State: APt69E0poJuFBfYdoP7aPTip6lUvgBvgDSuCVIIjB22hSdDMtkCP16cb
	PQcM2C1MXIm2M37g7nJZTCdqyR4CaZ4qLRCi1i4=
X-Google-Smtp-Source: ADUXVKKn0md5oNZhCDZi+5YLRlne/cC+tYL3l1+wkIjj8bPNWuA4BFKnadyLSjFr/zIQ7BdhPiSrzaTxLlTRE5Plxr4=
X-Received: by 2002:a9f:21b8:: with SMTP id
	53-v6mr8464482uac.184.1529344485036; 
	Mon, 18 Jun 2018 10:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
	<CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
	<CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
	<CAMKF1srWE9vVhv7MjcVh32mK+_FPt4OgYU7j9nWhW5fdd_hQ8Q@mail.gmail.com>
	<547a3ea5-f66a-54fb-163e-0fe31998d59a@windriver.com>
	<CAJ86T=VbRuByAyGFaf+tRFtyrKMo5K9uZKSsm5mPc9yvMdS+2g@mail.gmail.com>
In-Reply-To: <CAJ86T=VbRuByAyGFaf+tRFtyrKMo5K9uZKSsm5mPc9yvMdS+2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 10:54:28 -0700
Message-ID: <CAMKF1soHE7ADdihFtuf3j0-8kTHeVH4nUOzwdg44dN79E1YJpQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Mon, 18 Jun 2018 17:54:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 10:52 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Mon, Jun 18, 2018 at 9:20 AM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
> > On 6/15/18 7:23 PM, Khem Raj wrote:
> >> On Fri, Jun 15, 2018 at 3:48 PM Andre McCurdy <armccurdy@gmail.com
> >> <mailto:armccurdy@gmail.com>> wrote:
> >>     On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj <raj.khem@gmail.com
> >>     <mailto:raj.khem@gmail.com>> wrote:
> >>     > On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windriver=
.com
> >>     <mailto:mark.hatle@windriver.com>> wrote:
> >>     >>
> >>     >> On 6/15/18 3:16 PM, Andre McCurdy wrote:
> >>     >> > From: Andr=C3=A9 Draszik <andre.draszik@jci.com <mailto:andre=
.draszik@jci.com>>
> >>     >> >
> >>     >> > Some projects are starting to use it.
> >>     >> >   https://spdx.org/licenses//BSD-1-Clause.html
> >>     >> >
> >>     >> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com
> >>     <mailto:andre.draszik@jci.com>>
> >>     >> > Signed-off-by: Ross Burton <ross.burton@intel.com
> >>     <mailto:ross.burton@intel.com>>
> >>     >> > (cherry picked from commit 77f692ecb39d880b2cb420850a31534860=
eb2cc5)
> >>     >> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com
> >>     <mailto:armccurdy@gmail.com>>
> >>     >> > ---
> >>     >> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
> >>     >> >  1 file changed, 9 insertions(+)
> >>     >> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
> >>     >> >
> >>     >> > diff --git a/meta/files/common-licenses/BSD-1-Clause
> >>     b/meta/files/common-licenses/BSD-1-Clause
> >>     >> > new file mode 100644
> >>     >> > index 0000000..ded8897
> >>     >> > --- /dev/null
> >>     >> > +++ b/meta/files/common-licenses/BSD-1-Clause
> >>     >> > @@ -0,0 +1,9 @@
> >>     >> > +
> >>     >> > +Copyright (c) <YEAR>, <OWNER>
> >>     >> > +All rights reserved.
> >>     >> > +
> >>     >> > +Redistribution and use in source and binary forms, with or w=
ithout
> >>     modification, are permitted provided that the following conditions=
 are met:
> >>     >> > +
> >>     >> > +Redistributions of source code must retain the above copyrig=
ht notice,
> >>     this list of conditions and the following disclaimer.
> >>     >> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. =
"AS IS"
> >>     AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED =
TO, THE
> >>     >>
> >>     >> Hate to nitpick, but isn't BSDi defunct?  I don't think it make=
s sense to
> >>     list
> >>     >> BSDI, since as far as I know they never had a '1-Clause' licens=
e.
> >>     >>
> >>     >> Maybe a <Organization Here> would be more appropriate.
> >>     >>
> >>     >
> >>     > I think we should sync the files we carry with SPDX e.g.
> >>     > https://github.com/spdx/license-list-data/tree/master/text
> >>
> >>     It doesn't look like that will fix the inconsistencies... those
> >>     versions are inconsistent too:
> >>
> >> We should report that to spdx folks since they
> >> Work on licenses and might be interested in addressing this
> >
> > Agreed.  I think we need to get the SPDX to fix their examples, and the=
n use
> > them once they are fixed.
> >
> > As for our version of the code, I'd suggest the "<COPYRIGHT HOLDER>" (a=
s in the
> > BSD-4-clause example) in all cases.
>
> Agreed. So while Mark and Khem fix up master, is it OK for Armin to
> backport the current version to rocko? Or should master and sumo be
> updated first?

It should get into master for sure before it hits release branches.

