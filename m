Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.2635.1601163555031650311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 16:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d4Y96ofx;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id gx22so3463293ejb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 16:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tEM/otgk7gKI0220YJENWSbXsfsoVofUALazcYnr/U8=;
        b=d4Y96ofxk1MCGDtOaTK7VRM+vo6XTG448zAwpzOeMMj3/+vFuzddrzNyafU5hDis9r
         cZw2Q73+022p4bsC8OGlEK2eF1ywG6mQkRuz5KG7quJCKoZTmYoSXRlpVY727Wr4dfyD
         +8aPGsCNyA6PKkaolfiFcb0zop3I4SzntyDmNyAwRrifx4Zo49QAn4wZ60HveUcFHDbz
         a0JcPY4Xf0WH64DVJ6wT66FNjjehpmmnGnzJ3JT72tHHah0SDlH2AFu1Ue21G3POIBTr
         KPIn9hd1uCWS0PE2f82q+i3vKV/RCvww63J9X4AOLrDBpwAblyVE+Co5uOL6wj9GFIfR
         E8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tEM/otgk7gKI0220YJENWSbXsfsoVofUALazcYnr/U8=;
        b=V5JhAiUhbtG1aCrQ+d8Y4vVMCFDujjNCxrkunZvEeQk6PDGTvfhwzGjjC6Tv+ztMsr
         IvK3QkDhDsp3k0u66INAHiD3XVNXtkj9MZattIYCjoF1vPRs3VNlpNRJdehCPARpuxy5
         +mENgQ2TBU+4o33ME22/8v4e+LliBwbbyC6FGxrC8BhCxpJwAdw+p98i1827KeEK+yFL
         kZ/8hIeaIEZSrueEvYdE5KXMQ5hnUz9b/CNvyKzjykE7c4VfYLfuooffPnz/OXqg8WRo
         21FMhkSL12JBjG/S9EBhWWaCJrfHeEcXJB/xOmtTs7WiTgAX4k2shqf2++V0mVQq4h0g
         sgDg==
X-Gm-Message-State: AOAM533xssCkqBE7az8n7ou5gf1PsUU+vUKOZf909SNdfk1RiR/8gpRp
	sRBcIpxno/V6box753n4C+HuJ5S3pz5cjRHScgK3yg==
X-Google-Smtp-Source: ABdhPJwEMs5+V0+ZY63QlEAoynPbZqUFjJuHZjP9GMsncJXmKc/B96zuGdNcbmRgUJzF4shlLY1t3F8jcFojTjRzMyU=
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr9451629ejb.225.1601163553379;
 Sat, 26 Sep 2020 16:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200829030901.488431-1-mgloff@emacinc.com> <27286.1601119672816825649@lists.openembedded.org>
 <414449f1-4bfc-87b2-a73f-952d362f54fb@windriver.com> <CALXw4G6POmK=MUP2xks+xTC+MitGf2gV+_K3dfPwv7kKxunHYQ@mail.gmail.com>
In-Reply-To: <CALXw4G6POmK=MUP2xks+xTC+MitGf2gV+_K3dfPwv7kKxunHYQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sat, 26 Sep 2020 13:39:02 -1000
Message-ID: <CAOSpxdY6r2th_3S7Broo24YcSLkRXi-=w=TXxij3sVk3WAaLRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo
To: Michael Gloff <mgloff@emacinc.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, mihai.lindner@gmail.com, 
	OE Core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 26, 2020 at 10:40 AM Michael Gloff <mgloff@emacinc.com> wrote:
>
> I was meaning to send the backport request as well. This is a long standing bug and rc hasn't changed in quite some time, so the patch should apply cleanly to dunfell.
> Should I send the patch for dunfell, or can c19c69ae8ddcb37ad5683b6962ec3def37ad4512 be cherry-picked?

No need to send a patch, I'll cherry-pick from master.

Thanks!

Steve

>
> On Sat, Sep 26, 2020 at 12:26 PM Randy MacLeod <randy.macleod@windriver.com> wrote:
>>
>> Add Steve, who maintains dunfell.
>>
>> On 2020-09-26 7:27 a.m., mihai.lindner@gmail.com wrote:
>> > Please backport this to dunfell.
>>
>> Hi Mihai,
>>
>> Steve might do that but it would be better if you
>> could cherry-pick it back, test it, and send a patch:
>>    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>
>> Thanks,
>>
>> ../Randy
>>
>> >
>> > Thanks,
>> > Mihai
>> >
>> > On Sat, Aug 29, 2020 at 06:09 AM, Michael Gloff wrote:
>> >
>> >>
>> >> psplash expects the fifo to be in /run or specified
>> >> by PSPLASH_FIFO_DIR. This patch allows psplash to
>> >> quit normally. Also, fix the work around of using
>> >> echo directly into the fifo and use psplash-write.
>> >>
>> >> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
>> >> ---
>> >>   meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------
>> >>   1 file changed, 3 insertions(+), 6 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc
>> >> b/meta/recipes-core/sysvinit/sysvinit/rc
>> >> index 7ca41ae1ae..fd1fdd26ba 100755
>> >> --- a/meta/recipes-core/sysvinit/sysvinit/rc
>> >> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
>> >> @@ -26,11 +26,8 @@ startup_progress() {
>> >>           progress=$progress_size
>> >>       fi
>> >>       #echo "PROGRESS is $progress $runlevel $first_step + ($step of
>> >> $num_steps) $step_change $progress_size"
>> >> -    #if type psplash-write >/dev/null 2>&1; then
>> >> -    #    TMPDIR=/mnt/.psplash psplash-write "PROGRESS $progress" || true
>> >> -    #fi
>> >> -    if [ -e /mnt/.psplash/psplash_fifo ]; then
>> >> -        echo "PROGRESS $progress" > /mnt/.psplash/psplash_fifo
>> >> +    if type psplash-write >/dev/null 2>&1; then
>> >> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "PROGRESS $progress" ||
>> >> true
>> >>       fi
>> >>   }
>> >>
>> >> @@ -176,7 +173,7 @@ startup() {
>> >>   #Uncomment to cause psplash to exit manually, otherwise it exits when it sees
>> >> a VC switch
>> >>   if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ];
>> >> then
>> >>       if type psplash-write >/dev/null 2>&1; then
>> >> -        TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
>> >> +        PSPLASH_FIFO_DIR=/mnt/.psplash psplash-write "QUIT" || true
>> >>              umount -l /mnt/.psplash
>> >>       fi
>> >>   fi
>> >> --
>> >> 2.28.0
>> >>
>> >>
>> >>
>> >>
>> >>
>> >>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>> 
>>
