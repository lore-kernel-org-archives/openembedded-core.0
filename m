Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.20917.1627916241936522684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 07:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=D2QzSoVA;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.44, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f44.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso4241901wmq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 07:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upcASiCrUpHSFi0EebbmTJQ5/JRkSRgENOXrhZF08Fw=;
        b=D2QzSoVAZ/HWF61fyRpy/hJ2ZL0A5zDZBRcrs+bdlWVklKFe0F/MQTGJX0lcCdVJg0
         qBR8mJ+VeneGNPre0FGyJ+2zg7K5fG1DC2pMFa0EbJD7c998Fqq/InHDIXCYiHQkzV/A
         IhvoesOKzOa1Ec2D3JF85k61uSVpPpuqTVcr3w3EvlbI7cSKEXw+pNxA7SeWXJ3YRNk5
         mSLVw3UlC6gAJwkjxpFBClKEBGbJxEpJ/gZz/jpGIMe96+VI/WOStX+aDsTOXOaex2o3
         zfsdHKQa234ePxQcjND5DP9GGDdf5CLphjRN5S0ehgRzYOn1JCGxsqQ0PFUXS5XJqQPd
         ADAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upcASiCrUpHSFi0EebbmTJQ5/JRkSRgENOXrhZF08Fw=;
        b=KxVvddsbTdR/zVWqVgWO/ua7c2RPe0zNnnF672R7Temsn9rRasgLMSv/wii4i1QxG5
         vpXMFRdFuwazq67BPROvd+M1/NQJ9w7mjAYeYBNFmtlywfBsu9ccyfVGYTU9LppTeEls
         5L9HC2I8oo4pXTxaeK5/HIahkn3dq8FWJ+ztfuEqa2pEWEPhZxHVFgGkN8YnYI1ORaKo
         r5vfHwlAC9qb3Q418jS9EPT/3fvO/VXtno7zrXPgFmAOsU+sqeH8x9TWgLTcT+nMTB+7
         tj3bfXrOtXCLwAIz2jh19BPMKwpqXU8B1Z1oGfWb35TbtZidYOFo4veTJ2cJG6fSIFv3
         6qDg==
X-Gm-Message-State: AOAM531v/Amrdok5nh9zy2b3tW/PGLr6S4zL44LR/E7zSpmtLtKPRmfV
	LxlzbHKIM/h5YtNSzNPft+xOt8CSq9nxsrwahFfTrA==
X-Google-Smtp-Source: ABdhPJxG97c5ZO6BpOWA4tQfjllj+RRous6FJuyKNcF/NztuOqlkDtKdEPuELdNvqxLT35Cd/XRv1FObRNppWIWIblk=
X-Received: by 2002:a7b:c011:: with SMTP id c17mr17523138wmb.4.1627916240372;
 Mon, 02 Aug 2021 07:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
 <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org> <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
In-Reply-To: <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 2 Aug 2021 04:57:08 -1000
Message-ID: <CAOSpxdaMyYkAnuM72SjwZYMegvRyPN3oAL+Qo1BjiFjC8R67Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Anuj Mittal <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 2, 2021 at 12:35 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> Richard, Steve, Anuj,
>
>
> On Fri, Jul 30, 2021 at 11:28 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Fri, 2021-07-30 at 11:08 +0200, Nicolas Dechesne wrote:
>> >
>> >
>> > On Fri, Jul 30, 2021 at 10:03 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> > > On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:
>> > > > It has been recentely mentioned to me by the YP TSC that a layer must
>> > > > not only pass the yocto-check-layer script, but also all its
>> > > > dependencies. These patches add support for testing dependencies
>> > > > automatically.
>> > > >
>> > > > Patch #1 and #3 are not much related, but improvements I made along
>> > > > the lines.
>> > > >
>> > > > Patch #2 split the internal function into 2 parts, so that we can get
>> > > > the list of dependencies from the main script.
>> > > >
>> > > > Patch #4 is where the processing of the dependencies is done. I chose
>> > > > to enable checking the dependencies by default, and use
>> > > > '--no-auto-dependency' to disable it, we could decide the other way
>> > > > around. For any dependency of the 'layers under test' we will simply
>> > > > add them to the list of layers to test unless they are already there.
>> > > >
>> > > > Here is a sample output with these changes:
>> > > >
>> > > > $ yocto-check-layer /work/oe/sources/meta-aws \
>> > > >                     --dependency /work/oe/sources/meta-openembedded/
>> > > >
>> > > > INFO: Summary of results:
>> > > > INFO:
>> > > > INFO: meta-aws ... PASS
>> > > > INFO: meta-python ... PASS
>> > > > INFO: meta-oe ... PASS
>> > > > INFO: meta-networking ... PASS
>> > >
>> > > We merged this but have started seeing:
>> > >
>> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/166
>> > >
>> > > which seems a little strange and is probably related to this series.
>> > >
>> >
>> >
>> > yes, it's related.
>> >
>> > ...
>> > INFO: Adding meta-poky to the list of layers to test, as a dependency
>> > ...
>> > INFO: meta-poky ... SKIPPED (Layer under test should not present in BBLAYERS)
>> >
>> > With these changes, we are now adding all dependencies and trying to test them too. But meta-poky seems to
>> > be in bblayers.conf, and yocto-check-layer won't work since it needs to compute all checksum *without* the
>> > layer in the config first.
>> >
>> > It is probably a good idea to make sure bblayers only has oe-core when we try to perform YP compat.
>> > Alternatively, as discussed, we use --no-auto-dependency on AB..
>>
>> Fair enough, I'll update the config to do that.
>
>
> These patches are now merged in master, and I believe they should be merged in dunfell and hardknott too. The 4 patches apply as-is in both branches. Let me know if you need anything from me!

Done.  I assume I also need a version of the autobuilder-helper patch:

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/commit/?id=fe72e222961d69dcd4d638e7e05b437a65e8f34c

It seems that dunfell is checking a much more limited set of layers
(only meta-intel for check-layer-nightly)  Should I expand this list?

Steve


>
>>
>>
>> Cheers,
>>
>> Richard
>>
>> >
>>
>>
>>
