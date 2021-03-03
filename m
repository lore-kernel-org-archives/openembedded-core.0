Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.9327.1614789290045487502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 08:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c4EoMUH1;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id h7so5045327qvm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ATIqhaHoFQoYfvY6QpHti16vkXjp/Lqp2OXive11Z0Q=;
        b=c4EoMUH1hRtA3idRb/cmpc+3qzGfdj4P1Q1qx8hVY/D/yJeNscVzZ+YvbeHMfbth+G
         psY7op0kcRm1hwb4Ho6UUvQdGGH3GDcAgcGdabgMDiZwiFJ65zRKB7rgKPUcUy2wmMai
         stxhFYdXqR6bPgV9ju/zU5bt6M6R6gORt7VIaTeRepTQa3tG5Tb7BgfYT8Ex7Aa6dOJU
         luUXy+aCUaR7RKfLIjydmb9kVTRrWvsOqvap3hTx5d/dnfLLS42+XoRTS/xosNHAQLf9
         W4dHrjm60bz5MTI2uPPvmm6Vu5V+sCB8thb6iq8WzADilpJPFvJQDGQnW0oVlurzuuCo
         1tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ATIqhaHoFQoYfvY6QpHti16vkXjp/Lqp2OXive11Z0Q=;
        b=duQka+PvXCP3YDVpebpHldMrezLS0FfsNlpX7765dwoDQAvjNXwoTWYwinc0baHCW9
         xI3cua+3sRyMcltyLSYLtwJlFcv1dslj1WKczBf8o+z0SiCiJGXvQ6Apy6C3dXwtaIAw
         n2HFHHYCsJ3EoZe87nBvOPi0rRR1Ry0qENNoHakxxl/H/omdJjYPR8dKMLctaxAblj1j
         cIRB5JuD5zoJjDad2vbSlF40KgHrZMM/SuHsAWFSmEmPqfuhEWg0HzWWXBOPXz8TcG+q
         bDmOOpUyuVtDWOB95OxW2HoxzMn43InzKBqbrF3eMsNeTeeD10zZKTomtnKDdLu0IRpq
         YfSg==
X-Gm-Message-State: AOAM5327IMzDKbx/ghhFmALR1DPcW+nI1R4FEjvc+wHRhR6GVQodo1dy
	nhk+ww9k10em2Ggvv+kO40ELOsXjQE0G4ZeZga8=
X-Google-Smtp-Source: ABdhPJzCtX79cM7YOxoITu9o4HitrM61JXCM3F26ey7cK2bH/lkd4j/eDVteswNc9xRQEkd8sdDmkyQUDHQtmGMGQcU=
X-Received: by 2002:a05:6214:1c47:: with SMTP id if7mr3508864qvb.50.1614789289153;
 Wed, 03 Mar 2021 08:34:49 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org> <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
 <CA+chaQfg4EKGfTu1d-ZXrfeE=eKwD=YYJFt7ydLP3ANZ7eWStw@mail.gmail.com>
In-Reply-To: <CA+chaQfg4EKGfTu1d-ZXrfeE=eKwD=YYJFt7ydLP3ANZ7eWStw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Mar 2021 08:34:23 -0800
Message-ID: <CAMKF1soua2c_EkEXDgPOiCaqH0W4+_UKVYjUtu9iXZGMs1pHVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Colin Finck <c.finck@enlyze.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 3, 2021 at 8:16 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Steve, Colin:
>
> keep in mind that this version also introduces some new restrictions, e.g. rpi-sdimg IMAGE_FSTYPE in meta-raspberrypi is now failing with:
>
> mkfs.vfat: Label can be no longer than 11 characters
>
> not sure how common this will be in other BSPs, but people might be surprised with such failures in LTS (like they were from the need to update oe-core/dunfell checkout to get python3targetconfig.bbclass recently when other layers started to require it).

thanks for this info Martin, 4.1 was released in 2017, so 4.2 is not a
bugfix only release by any means. It should be out of policy for LTS
backport. since we have different tools and techniques to partition
storage media
this tool plays a vital role and we should be very careful making
changes to it, especially in releases.

>
> On Tue, Mar 2, 2021 at 2:43 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> On Tue, 2 Mar 2021 at 14:26, Colin Finck <c.finck@enlyze.com> wrote:
>>>
>>> On Mon, Mar  1, 2021 at 05:58 PM, Alexander Kanavin wrote:
>>> > Can you send a followup patch please, on top of master-next?
>>>
>>> Here we go: https://lists.openembedded.org/g/openembedded-core/topic/patch_dosfstools_build/81024606
>>>
>>> Who decides about backporting or not backporting dosfstools 4.2 to Dunfell?
>>> I can only stress again that a large number of devices in the wild are currently running on FAT boot partitions, and come with a dosfschk version that likes to destroy these boot partitions.
>>
>>
>> That would be Steve. It's best if you cherry-pick the needed patches into current dunfell tip, and send them here with [dunfell] prefix, adding the rationale to the commit messages.
>>
>> Alex
>>
>>
>>
>
> 
>
