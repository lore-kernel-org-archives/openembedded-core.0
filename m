Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.33633.1613406220934365317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 08:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XdRLN1fT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id w4so6706790wmi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Np+OvdW28VZzfL3Wy3j2s+Xvi8csJw9gSljIuWskVKM=;
        b=XdRLN1fT20gLl61CwWguKxMalZ/asbJbxZiE431gS8h+apCN3P5JAW6JmixvAiG5dQ
         8YdrzqJu7WYALLBSttzI3W4FZuAiw7yMOXSrska9EhjIWEqZhrElHxLAsAaOLhyeO4/0
         82lKuJmcDcKktboQDDZYIDMzjZHVTF708KM4P/VDhae5Ii7G78qK959NQz0trCZw+HiP
         KpCX3/PzjWa1UO5JXnno/wqRHq0SVIp1lFCanuwKtLAb2dwrzVYcH0E8HmpD4ljQ+ANS
         h8qwu5WbT9NpeYebgydozm8sR33xAq+yVhz3P3YiqByMNmpLiqEhgV+1ZBH4W26pqfnC
         E79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Np+OvdW28VZzfL3Wy3j2s+Xvi8csJw9gSljIuWskVKM=;
        b=Xot9uGvNIgQYshatSCVjiTXjc/XPNrEi6rpZTuW70gzxqnNoLcdQnmKsMvw3jadvr6
         CYaFHePnwr6PYe0YrItIDkfk5DbrvFX++y9/zHnKTpGWKrYMk5CKQNTJ6gTS6HsyjQm6
         +lezgyaXRziBvkkikrLwGS62OE1x9Y2TB/SQVqnhMGVeLARmJV/DKYToa4buAOXp8ySn
         r3nOxMK0MIH6uIGe3akv4TGe2UIqabyqGXq4pOa7QFpbhoUuwELcFMkatZtEjW7+5TPP
         +Pqu1E1DXZdRJkoHfCTS/Lf5up9L6SAopzhDValU5UsjvgjdACWayBCD3MdHI12374AE
         HkOA==
X-Gm-Message-State: AOAM531t8EP0OB5UA+29DYEMc6u7+vZAsAeWtEPq+6rG8/WGwZ0R3cXS
	mvlwdeD7k2Qbs5YkIIJBvenxt44FmTLiH9RPO+k=
X-Google-Smtp-Source: ABdhPJzHzhQSs2rLIw+UT0auzoWgU7rfl7pYOkjbGHSweF25dHmIfYhLZvWINFQJxWnjcYe4BbmAaCcOukWjUMdqFXQ=
X-Received: by 2002:a05:600c:4857:: with SMTP id j23mr15003532wmo.31.1613406219407;
 Mon, 15 Feb 2021 08:23:39 -0800 (PST)
MIME-Version: 1.0
References: <80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
 <CAJdd5GZ4WyPb+Rc-s1n=mm-PQo3ENcjwdnLxsyH1FMC0YTGB-g@mail.gmail.com> <CANNYZj9cpxKMWbwXFaJay0C-yFk4_9B45T4V34a_vKS1PG38pQ@mail.gmail.com>
In-Reply-To: <CANNYZj9cpxKMWbwXFaJay0C-yFk4_9B45T4V34a_vKS1PG38pQ@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Mon, 15 Feb 2021 10:23:28 -0600
Message-ID: <CAJdd5GY+e_nv1Op928ENCbWzerz=61hH_w0FOO4YwBWBAAKstg@mail.gmail.com>
Subject: Re: Autobuilder reproducibility target changes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	swat <swat@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 12:21 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I=E2=80=99ve definitely seen diffoscope process take hours and hours and =
hours in local builds. Trying it with these vim packages locally should sti=
ll be done.

I forgot to mention that I did run diffoscope locally with the
offending vim packages and it took about 30 seconds (same as the AB
logs showed)

>
> Alex
>
> On Sun 14. Feb 2021 at 20.18, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> On Sun, Feb 14, 2021 at 6:19 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > Regular users of the autobuilder will note that I've split the
>> > reproducible builds test out of the main oe-selftest build and into it=
s
>> > own target build. This is because that test tends to run for a lot
>> > longer time period and it helps to see the result separately.
>> >
>> > I've only done this for master. If gatesgarth and dunfell want to
>> > follow, that should be straight forward with a change to the branch in
>> > autobuilder-helper. Obviously we should ensure this is working ok with
>> > master first but so far so good.
>> >
>> > It has already highlighted the difference between a successful run:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/2
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/2
>> > (took 3-4 hours)
>> >
>> > and failing two failing runs:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/2
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/2
>> > (took 9 hours)
>>
>> OK, I read through the code and unfortunately found a bug: when
>> attempting to make sure the "B" build doesn't use sstate, I misspelled
>> the SSTATE_MIRRORS, which means that the B build could have been
>> pulling from the sstate mirror when it was not supposed to. This has a
>> few implications:
>>
>>  1) It might explain why some of the reproducible results seem intermitt=
ent
>>  2) It might explain why there is such a time disparity between the test=
s
>>
>> Unfortunately, while it probably will help the intermittent results,
>> it probably means that the tests taking 9 hours is what is "supposed"
>> to happen, and they happen to be shorter sometimes because the B build
>> is pulling from sstate when it's not supposed to.
>>
>> >
>> > the time difference being the system trying to run diffoscope on vim-
>> > common :/.
>> >
>> > I'm aware I removed some recipes from the exclusions list after seeing
>> > multiple passing builds for all distros and we're now seeing test
>> > failures. My mistake was not waiting for the date to change and for
>> > builds to run on an autobuilder worker with a different umask.
>> >
>> > Meson is failing with a pyc file mismatch which diffoscope can't decod=
e
>> > and despite trying for 5 hours, diffoscope hasn't given any data on wh=
y
>> > vim-common differs. I should have fixes in for quilt, valgrind, kernel=
-
>> > devsrc and cwautomacros. The umask fix may fix other issues too. Alex
>> > has improved the reporting so we can spot cases where exclusion is now
>> > longer needed.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
