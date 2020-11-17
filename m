Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.15812.1605650943473407367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AG2TEodI;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id d28so22433086qka.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pK/cXizgfGuXnZuKsz3IaOENVWX32pH+VxXdBbgX3f8=;
        b=AG2TEodIKhs9e++C0N/y6t2iJtrZE+jeZDRKCc1YuURBAnYlKSZlz2HtQHGLUqfLDz
         UXNFVgObsXGnNxpWewIAYqZ+37b6CMui5ASb2z55PFf+cufGqyoT9n1OOg0qMh9zPpSb
         R/1TN7KByeoDAV8+PEjRXZgzaC1Z65Lde4t+DJwdHpglpGoaVqjoVwDkpUXpWlsX7o8f
         a2JEA709J33d+w1+NMaO43/PHxwlCnu+DErVQDhJjJyMhYOdIDpv1/hSeWKa6f01djyv
         QgUyunaV+kCVgNo3+3In9uwE8voLLo5JEFNLz5tBhqBKpB/+Dipsgst/e5csG3eVmisC
         lKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pK/cXizgfGuXnZuKsz3IaOENVWX32pH+VxXdBbgX3f8=;
        b=UgdalwDQFxkUaCQCjsSPEggP9per5lElFxWe8ZrNoBOuyp+2jHIsagcjfiY+mk05RT
         IX9ecVmcckR0T8CubcLY9ov21kxziXR1FYK3Y4u/6s9E45OzKUg0D6KUFAPIvcSqRHeT
         uKKgwE9isJMC/WTYfvwWzDLN/mQvlBaKEJaMN4MtSkI6dbxKiz8rsAnVZSYL50YLvNrm
         JEbng8VYBREFDR+P+jFlG365ZIx6d2+m4PRfbJpKQF5uh+0asr1pWcNvHWgmYBLaKSfg
         W72XVUJ14ePvMb7hvc0gNqtxC/os6GW3QQRImlMANuDVjU2H/ZxW08+9VYqwDnNQeNM0
         Q70A==
X-Gm-Message-State: AOAM531cGGRMsdOBi9uBPRgJGjjI8uNC4AIV6ji9dUV8mmrFX8K7AAOI
	nOZV3MOT81DV4EIURMPq6XB4MlsjT0U2PP5deKM=
X-Google-Smtp-Source: ABdhPJyoNsUMXq4xQ6durYsSUGe+ArH1otWr3Zr73NKEp2ED7zVVfIW/KTUlkMboxJ3pD/BezvZkPML8CjmVW1nMenE=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr1800992qke.337.1605650942600;
 Tue, 17 Nov 2020 14:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
 <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com>
 <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com>
 <CAMKF1sqzEw8sAhzsUvPz6rB1OR=i8Cg7-2WUtpjW8tmS3HGF_Q@mail.gmail.com>
 <CANNYZj_Eu38-cpsb767mdgqLn6SEXjdfiJKdQheRWuZv47FYAQ@mail.gmail.com>
 <CAMKF1sq77HcFtdxMODMk231BfW0=vqCV+BL4vOTpcKcAMVTBoA@mail.gmail.com> <CA+chaQdg9wcYFrOuU6zTMMib-Rp0hNYSn_AC3RjFvBwpXM-J4w@mail.gmail.com>
In-Reply-To: <CA+chaQdg9wcYFrOuU6zTMMib-Rp0hNYSn_AC3RjFvBwpXM-J4w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 14:08:34 -0800
Message-ID: <CAMKF1srSjP1rTXeaPan8yxEas2aVN6xdoP0snkabNd_X4DXAZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 12:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> And there are some cases where we need only native recipe and creating a target one just to BBCLASSEXTEND seems worse than the current state with native.bbclass.
>
> Or there are some cases where the native build is so significantly different from the target one, that using BBCLASSEXTEND just makes it more difficult to read without any benefit.
>
> So please don't remove the option to just inherit native if there aren't any technical reasons to do that.
>

I think we have a patch to address the fallout so we should be good here now.

> On Tue, Nov 17, 2020 at 7:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Nov 17, 2020 at 9:33 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Tue, 17 Nov 2020 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > Yes - and if python3-scons-native is the only such recipe we can find, I think it's better to merge the recipe with the target one.
>> >> >
>> >> python3-scons-native is just a manifestation of a larger problem which
>> >> is a regression and this suggestion compounds the problem by setting
>> >> an unequal rule where non-python packages can
>> >> have a native-recipe and recipe but python ones can not, therefore we
>> >> need to fix this properly in core classes instead.
>> >
>> >
>> > If non-python native-only recipes inherit something that DEPENDS on a target item, they will have the exact same problem. This is what needs fixing - but not by special-casing DEPENDS in every class where it happens, or might happen.
>> >
>>
>> keep this issue aside and think in a generic way about how recipes can
>> be written regardless of native or not. behavior has to be consistent
>>
>> > I'd rather convert all native-only recipes to target ones + BBCLASSEXTEND, so it works the same way everywhere, and minimizes surprises.
>> >
>>
>> that's wishful, there are a lot of layers that will have to also
>> change, and we have to change the semantics of native recipes where
>> BBCLASSEXTEND is the only way to do them.
>>
>>
>> > Alex
>> >
