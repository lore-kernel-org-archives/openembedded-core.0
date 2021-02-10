Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.9452.1612980005399182221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aheauIZZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id h8so2523871qkk.6
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DADgrWE9EfavOHamsrZYLZk7EgcNVRpCdtSHC22AI1s=;
        b=aheauIZZsJQlkikTUdQ8dqQoL/JZ5YJNyV0YlzQuqatJ0shA6ypYeGn46W//fy1vr9
         ODDgHTn/tQ74sL0CDjLbu4hneMTITeBuB36b0WXHlJJZida0RwcLiiKji6eQM9ukyaU1
         c4riuFvZJ6T0/lBZUm5JqFA8EO8tGHXLMZUhO5FoQYpWZJGsqMNui63RkeFFIgBCWKzj
         AbV2/5EzBOI5OO4WYr/tZuP95eKbxC/7NdTjS4OSD7WjT4uS4HR1ZctQKDXLOgpMfvW/
         RpMq2ks7E3cTqRbUMg/gVov24ja9iKldcyV0C6UErYnc4jpCLaTbNKOptVA+PlBRGqQ8
         MAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DADgrWE9EfavOHamsrZYLZk7EgcNVRpCdtSHC22AI1s=;
        b=T4Pff2zlk9LCQyDdXxfHrRlP8unZD2JqPByxhLSd/5x2nlbferWow6/7cbO0dDlYWb
         kMHGr8LhSYm2SA+1jlatsYkXbqsy7lf25ocKrhGTA2JoLgkm3UBMpD5kwBDZ0t55HlnI
         Qj2oFkymJnzTPczUjPRSOEBm9h17/P2nFUJ6ohBjNES4a9EMamSxeGmOdUgvw3Oh/t1F
         nVHiJrC08RkPPVUF7AsI7LAh1HaJfpR1Pj8iGUtgdsY9b/LnmYXJPDl9iTdkoQyx/2xU
         e7pUZALmIF5A4xwYTX+bMKL7SkvC0dOB2HLnZtpEeVWQy67dfOTjIVdLz7ZCr8zUk5oF
         6npg==
X-Gm-Message-State: AOAM530aweJ5DWr6H2KfE0Pf7oJes/YqOxsaYCQz2UuoglYpeL9kzvsc
	sAUU2SkPlpgOuJAw1cJ9R0ye4K/OYnKpm5Inj4E=
X-Google-Smtp-Source: ABdhPJyXbrFAXxjzioJ8fZRZOpb4H4b/5vb1oWPi5CRZ3ab/xovAUtsd/M7rv7heLADZELdbHxYHQwCKiWcSYX+EA4Y=
X-Received: by 2002:a37:7047:: with SMTP id l68mr4294811qkc.337.1612980004514;
 Wed, 10 Feb 2021 10:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20210209141616.24276-1-robert.rosengren@axis.com>
 <CAMKF1spisR5dPaN-1pPsk-kiBjW356znTP2JJt500zuU5CjN=w@mail.gmail.com> <483bd3e6-3366-d248-3c55-456aa8d966f1@axis.com>
In-Reply-To: <483bd3e6-3366-d248-3c55-456aa8d966f1@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Feb 2021 09:59:38 -0800
Message-ID: <CAMKF1soGsqKj5vwz+P68oWpq3J99t4ka7ap-uyTgyx-4T0aYSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mpg123: Add support for FPU-less targets
To: Robert Rosengren <robertr@axis.com>
Cc: Robert Rosengren <Robert.Rosengren@axis.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 2:54 AM Robert Rosengren <robertr@axis.com> wrote:
>
> Actually, I used a MIPS-based device lacking FPU and ran simple gstreamer=
/gst-play to test a mp3. A very non-scientific measurement on that device u=
sing nmon moved from roughly 100% CPU load and stuttering audio to a doable=
 ~15-20% CPU load with the fixed point configuration. (of course all such m=
easurements depends heavily on audio latency, queues and so on of a device =
hardware.)
>

OK thanks, this makes sense.

> On 2/9/21 8:10 PM, Khem Raj wrote:
> > is --with-cpu=3Dgeneric_nofpu applicable for all soft fpu machines or
> > just arm ? I wonder if it will improve or regress other nofpu
> > machines. Do you have any data
> >
