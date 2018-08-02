Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id E2D5578BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:49:05 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id q12-v6so1048561ual.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+qZsxu/0zLJyKi+MLOnCZB/DrUq93IHGLcFiwdnn6cE=;
	b=Ax+/Jelq278WF+QEUbdwfrszIbRNgABAmENg8jGAp79kvtjs5iUvqHic5Okhq4SA46
	Iedst3/n5Kiq6gL/pq2s/2kxqufOVdSPmAvOCP5rCdffJxfVAOWD2tBqJhXHMVX/fUnj
	aJjoCc6PlL0EuSCAaM7EtoqtIMVKFTaj4kvGSs4/TpR5Rq0Sjdx+6wp3k3yRA1ppGLus
	HrlyjAGAV0LdLsS9ee+8Pp44SpORGu611OHHZBpyFw9eTwfbW1VfGh+U4vD9i60g3Rr8
	ndaRqKrZVKTZ0GAEIFwo5IXblgTHU8Bkg+GlU0n2QRihqgxCJKIsaz9s7DbD5YWgEAp/
	9f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+qZsxu/0zLJyKi+MLOnCZB/DrUq93IHGLcFiwdnn6cE=;
	b=BtuchhpOdVZXGXES+qd8Mn+8GJ9oV8X5y7of8sdpSqiYdKzwhC6kktDuF5lRouvxHE
	U8W+68EH7ryG18GNki6NswHC9sMrAOwEVJtc+rkbHXAtR+unXUcDk3DvV+hIfAlb7sBL
	WEbNNp0d+XhEgXml84ZDB8W4qKdjwKk0w1IM0fxTfYKlJM7rDTBxg0O25bfSf+l4w/Rb
	miHxuvvbF98MiYI3AHOnc9tLKakZep3rc+b3xRIpmorfalEpV9/MAX9ta/7YU92SnnYN
	6ZuocX/1n+yzxkC20gitTDar4O8WAqAiE9tYSyTJkWIYuznzSEXOVF2DBZ9eI8aSf4Fh
	DVmw==
X-Gm-Message-State: AOUpUlElcpvlumocoNm+uw5H+quQ+c1QJ5o5h6e7G5vW8KqQsMlNipDV
	EjLwduzeb9Ap0/lLY7Q4+cbOj5iWeae4fL2skmc=
X-Google-Smtp-Source: AAOMgpcs9Yhgjn4cGeMiaIlCZA0H4/DDklF0TtaxhAXqxnkOFwFmab0CiludGWQOCt2f3cadDaldN1GjOD85d0K2JkE=
X-Received: by 2002:ab0:664c:: with SMTP id
	b12-v6mr1457519uaq.193.1533203346629; 
	Thu, 02 Aug 2018 02:49:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 02:49:06 -0700 (PDT)
In-Reply-To: <CAMKF1sostF71Wms49UQzfN803+Tpw5QGy+PzEMj4UbKywq-6fg@mail.gmail.com>
References: <20180802071149.19272-1-raj.khem@gmail.com>
	<CAJ86T=U1A=NLC+oPZtB89Ckcjx9yMUrQfPHCo=Z4uBVc01zvYA@mail.gmail.com>
	<CAMKF1sostF71Wms49UQzfN803+Tpw5QGy+PzEMj4UbKywq-6fg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Aug 2018 02:49:06 -0700
Message-ID: <CAJ86T=W9smGsSHRinH0aQ=QpJMreagk9wXtzWRxSYv7dX-_EGA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Thu, 02 Aug 2018 09:49:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 2:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 2, 2018 at 12:47 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Aug 2, 2018 at 12:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > fix internal linux headers
>> >
>> > Full logs
>> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8
>>
>> From the musl commit which fixed the dirent struct alignment issues it
>> doesn't look like it was armv5te specific, so mentioning armv5te in
>> the commit message could be misleading.
>>
>>   https://git.musl-libc.org/cgit/musl/commit/?id=b3fa0f2b1b8c267c1cbe8c62464e484f3a174a4e
>>
>
> commit is in contextual to OE on a particular arch where it was
> observed, other arches either have
> ways to compensate for misaligned access in hardware or compiler does
> not use 8byte alignment
>  thats why subject says 'seen'

Great explanation. That's the kind of information which should go in
the commit message.

>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta/recipes-core/musl/musl_git.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>> > index b56870cb3f..e7d0e1a66b 100644
>> > --- a/meta/recipes-core/musl/musl_git.bb
>> > +++ b/meta/recipes-core/musl/musl_git.bb
>> > @@ -3,7 +3,7 @@
>> >
>> >  require musl.inc
>> >
>> > -SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
>> > +SRCREV = "f2c6dbe2442027ed8fe0fa869918e41f495534d8"
>> >
>> >  PV = "1.1.19+git${SRCPV}"
>> >
>> > --
>> > 2.18.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

