Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7E3751CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:00:27 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id z16-v6so11267382uaz.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4nUtuWVP4MWGshjm/Rpy+hLdwxki4lhmuWWa0EEBL2o=;
	b=R/5j7weFjPWuP4HoDWpHaGRMTGai/o7OK4mibStzDS1x6iAJZaxt5kJuXWMNaJlqoO
	QrpID/X7Pa8haYWVyaA2z4ypkSD15vFwi3F+J0HLp346uYoaQwrudJoAaD8Iasf1D4oB
	wbZ6lWIbifj2aBUlSFpS8tJ7p4ArSNYDaHYDgU9/4vM1Z1WmISodEcPBeLf3Mx9Hu93Z
	K7YmI2PhfRk7nM5bGCyhCDnEoUZDppY8B27JRsLBy1yb6Ggv9g+i1ajXBNxdQ3yZKZ1m
	IbWFpjOLOEe21TPpOKYp2jDUWZ3QBfaARjaMIxnYWRPyX1l+5TIitkhBKD81kUKsot8Q
	lwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4nUtuWVP4MWGshjm/Rpy+hLdwxki4lhmuWWa0EEBL2o=;
	b=LUyYTxKKqSTVliHtTyYe2OKW2YyljlIoUIsUZAecdkN1+LhUDIOozbveBgHWEiKUDd
	Ix1KCXkZcyICfKs/uvt0pDDHsq+7COQVg7Op+SmacD23V0h3alYHo/N6UGxT/SNIc8Od
	HzpZk1k1G7D+1QEHb2hFL91VfHad3rRuftKxDKH3ijD64HvbF7b5GfcZiie2POxaldEc
	/mGsoecWjhIeONy6ZCUwcTJWEhM1IcHxluzRFzXFz9CG6evHhiGp6p7cQxZaZf7uaXnO
	+zKMbR3+fdiTIlK5YsRE1DMPbOMSJ4EWPYpgqfYDyJwwFKNuDDqYIvZnFW4PmldsUP9T
	rfoA==
X-Gm-Message-State: APt69E1mFrKEnP2QR8EMKy/NCuWLWLAsXUstxuosCDl15bY1zpRbEGP2
	aofPJfeFIIANQnXgeAMh0tBJvU+Z3DZpzU82xN0=
X-Google-Smtp-Source: ADUXVKIKpUC4S2Iece8seQwhRkFBqtiJ7HG/ueU+bAPuYz5aW+XTpQ1E/ckLGk2ayzSVgCaoi4XSAwk51UFKSnGbBsU=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr8513041uac.38.1529344828292; 
	Mon, 18 Jun 2018 11:00:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 18 Jun 2018 11:00:27 -0700 (PDT)
In-Reply-To: <CAMKF1soHE7ADdihFtuf3j0-8kTHeVH4nUOzwdg44dN79E1YJpQ@mail.gmail.com>
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
	<CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
	<CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
	<CAMKF1srWE9vVhv7MjcVh32mK+_FPt4OgYU7j9nWhW5fdd_hQ8Q@mail.gmail.com>
	<547a3ea5-f66a-54fb-163e-0fe31998d59a@windriver.com>
	<CAJ86T=VbRuByAyGFaf+tRFtyrKMo5K9uZKSsm5mPc9yvMdS+2g@mail.gmail.com>
	<CAMKF1soHE7ADdihFtuf3j0-8kTHeVH4nUOzwdg44dN79E1YJpQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Jun 2018 11:00:27 -0700
Message-ID: <CAJ86T=WDp3BJEXC9WxtQhi6YZr7xpHwG_=XS3jXFb8YdZTuqxQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 18 Jun 2018 18:00:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 10:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 18, 2018 at 10:52 AM Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>>
>> On Mon, Jun 18, 2018 at 9:20 AM, Mark Hatle <mark.hatle@windriver.com> w=
rote:
>> > On 6/15/18 7:23 PM, Khem Raj wrote:
>> >> On Fri, Jun 15, 2018 at 3:48 PM Andre McCurdy <armccurdy@gmail.com
>> >> <mailto:armccurdy@gmail.com>> wrote:
>> >>     On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj <raj.khem@gmail.com
>> >>     <mailto:raj.khem@gmail.com>> wrote:
>> >>     > On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windrive=
r.com
>> >>     <mailto:mark.hatle@windriver.com>> wrote:
>> >>     >>
>> >>     >> On 6/15/18 3:16 PM, Andre McCurdy wrote:
>> >>     >> > From: Andr=C3=A9 Draszik <andre.draszik@jci.com <mailto:andr=
e.draszik@jci.com>>
>> >>     >> >
>> >>     >> > Some projects are starting to use it.
>> >>     >> >   https://spdx.org/licenses//BSD-1-Clause.html
>> >>     >> >
>> >>     >> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com
>> >>     <mailto:andre.draszik@jci.com>>
>> >>     >> > Signed-off-by: Ross Burton <ross.burton@intel.com
>> >>     <mailto:ross.burton@intel.com>>
>> >>     >> > (cherry picked from commit 77f692ecb39d880b2cb420850a3153486=
0eb2cc5)
>> >>     >> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com
>> >>     <mailto:armccurdy@gmail.com>>
>> >>     >> > ---
>> >>     >> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
>> >>     >> >  1 file changed, 9 insertions(+)
>> >>     >> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
>> >>     >> >
>> >>     >> > diff --git a/meta/files/common-licenses/BSD-1-Clause
>> >>     b/meta/files/common-licenses/BSD-1-Clause
>> >>     >> > new file mode 100644
>> >>     >> > index 0000000..ded8897
>> >>     >> > --- /dev/null
>> >>     >> > +++ b/meta/files/common-licenses/BSD-1-Clause
>> >>     >> > @@ -0,0 +1,9 @@
>> >>     >> > +
>> >>     >> > +Copyright (c) <YEAR>, <OWNER>
>> >>     >> > +All rights reserved.
>> >>     >> > +
>> >>     >> > +Redistribution and use in source and binary forms, with or =
without
>> >>     modification, are permitted provided that the following condition=
s are met:
>> >>     >> > +
>> >>     >> > +Redistributions of source code must retain the above copyri=
ght notice,
>> >>     this list of conditions and the following disclaimer.
>> >>     >> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc.=
 "AS IS"
>> >>     AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED=
 TO, THE
>> >>     >>
>> >>     >> Hate to nitpick, but isn't BSDi defunct?  I don't think it mak=
es sense to
>> >>     list
>> >>     >> BSDI, since as far as I know they never had a '1-Clause' licen=
se.
>> >>     >>
>> >>     >> Maybe a <Organization Here> would be more appropriate.
>> >>     >>
>> >>     >
>> >>     > I think we should sync the files we carry with SPDX e.g.
>> >>     > https://github.com/spdx/license-list-data/tree/master/text
>> >>
>> >>     It doesn't look like that will fix the inconsistencies... those
>> >>     versions are inconsistent too:
>> >>
>> >> We should report that to spdx folks since they
>> >> Work on licenses and might be interested in addressing this
>> >
>> > Agreed.  I think we need to get the SPDX to fix their examples, and th=
en use
>> > them once they are fixed.
>> >
>> > As for our version of the code, I'd suggest the "<COPYRIGHT HOLDER>" (=
as in the
>> > BSD-4-clause example) in all cases.
>>
>> Agreed. So while Mark and Khem fix up master, is it OK for Armin to
>> backport the current version to rocko? Or should master and sumo be
>> updated first?
>
> It should get into master for sure before it hits release branches.

The current version of the BSD-1 license text has been in master since
January. It's already been released in sumo.

