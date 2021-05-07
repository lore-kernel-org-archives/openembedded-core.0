Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.12921.1620404619660530652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 09:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EZXT8XPC;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id y26so10900432eds.4
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5gXCiFllwCnhCGiyGcpcAHRctHxC+brgTlb9d2W+IBU=;
        b=EZXT8XPCj5+2GpUgb5RY3PvXZU5GXUnG6XSCRlMPy+L+RaTdgyjJDxR/vW8raha6Eh
         +I9NdqaD4Ea4keJ1JnaJKFJbMWIDUEGK3X4nBCmBWfz1SuheoV5lekyem6ul1o5kiNG+
         nZ2U1P92u7S9SMzYTXi6LC8PDvu4sjbwDqHjcSwg5Z5bz5PuYAzENi8xRKNk+8zwbqPv
         F24lf27VjhxXyGTodxWfDHTit+hhJrbF/Uwajw6qPOZCGQnqFXxjeOVs/RdG85xQhgSs
         Gv3nNZozRBz00yGCA2d4l6EduvykRzaE38onh81lUkPzlUVnWgGCOmOfhELHpxQ+9pwY
         9fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5gXCiFllwCnhCGiyGcpcAHRctHxC+brgTlb9d2W+IBU=;
        b=DNtWWjYs2AEMro9v2nrpLJa6ecMBESAJPWQSvj8xA4UcvaYNW6aI/LiTJRZLbV4fiY
         VFbAeL2IBcAAFLe0gaDht5MkIo4u0ToYUe7/rFOhJZ9UdVkQCqxMYYhQQ2ftWvXAgmkw
         pBrWg06zYC10KBtHx1YCqGV+st4BHq1UhVZjFj1n9om8RW/0bq8W/fT4UsIVsDUnP9qh
         Rgts5byNgI0IYbNZnqDLZ7RDYpeORunR1ckw05CycjZI8x9g5Sj1fijIC4EjOdSUNLlz
         lh6ykbhH2uq+IKdC3oDzCFD5xDWq0fly+5sC19yqOWkiCR62LM1jjqY4WODubWMQeJN1
         zqUA==
X-Gm-Message-State: AOAM530/9Cxk6dAbtKZ+5CuZ08nx2qdxtY/pK2+AjByFOTJa1NgoJ3zo
	fol2s0dii85obOcGTRyGBXOhMmmNZI99B2IxCzg=
X-Google-Smtp-Source: ABdhPJxreKhFCf0diRlfHy4eDZYl1jCuuTw7pqhuo9JxGuV2lBBYRZlE+UtmfcHMmMFyLw8y1dTMRa3gRCONUTfAP/o=
X-Received: by 2002:a05:6402:268c:: with SMTP id w12mr12843222edd.234.1620404618098;
 Fri, 07 May 2021 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210506125721.27515-1-bruce.ashfield@gmail.com>
 <CAOSpxda+ArVQ78hweJm6ckd7ga=aXhzssMGVPv9317b_e++hEQ@mail.gmail.com> <52a724c1ec9c0184f7153c4b9359b4681f915ea1.camel@linuxfoundation.org>
In-Reply-To: <52a724c1ec9c0184f7153c4b9359b4681f915ea1.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 7 May 2021 12:23:27 -0400
Message-ID: <CADkTA4PE+ay-rftL=K24XgF8O7jmC6HqgNBE6jhi_EiDWE-GYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 7, 2021 at 11:52 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-05-07 at 05:18 -1000, Steve Sakoman wrote:
> > Would it make sense to do a version of this patch for 5.4?
> >
> > Though much less frequent on dunfell, we do see it on occasion.
>
> The change is a simple removal of a defconfig option so should be relatively
> simple/safe...
>

I did the cherry-pick to the 5.4 meta-data and just send the patch.

Bruce

> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
