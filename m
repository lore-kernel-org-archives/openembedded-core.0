Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.33241.1607943393630707270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T5g2yF1g;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: outbackdingo@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id r24so29026236lfm.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 02:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+I0sGDtMp/5lkB56NF6xYG9zEsiO8A9XaDTH7CQvFM=;
        b=T5g2yF1g8ICa+hOkscelBF1o5VPe43q76aezWW5vSF2mSKecSBCZxtd0x946wy1mZ7
         1I5CDbQYSlEWkNiwqnP+qJL7gbjYAqNWwiojODn/anzRrUGXjYxdR7FBtZL9QbZs0NJY
         P/BdNHvIfZ2EwXVz1sSKdrmXly8qTcKS5PPhwSX8y2dIcrrh6SeI0VLLv1eK2ge84jMv
         if4vywTeVmUljCVLUGRDFHQT8hhxeNVgmQOWbvcRX2QySqFL9LTyv1Wy9EmAbONvfVzX
         81i/iQRZpU9VktBbebM4e7lwE9N33eTHnAbL0H9GjbkPKD68KGC7TVt8gAgVCUhWRSEf
         SGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+I0sGDtMp/5lkB56NF6xYG9zEsiO8A9XaDTH7CQvFM=;
        b=iyA7lALBdCLLYXBhd6cm8pUcL4jk6J9hPdySFosVX2LiMY9bBk5Ms2e6nhvlUl3Pf2
         ntWmZ78oeyteyYFHiCBtGnjX/r+E53176solg6sspDyX3aXwtBd50XWapL06T5sIr498
         XhVy3RX+4PmopE9Qj+I5qWVmkBvmaftazEzKh6Zku/TuvtvFr8KwCyLjp/PJCdJ74r/q
         HdXM4a9U58Bit0J1nGIZej7svR5fpkumQT7pe/my1XgFNj/218QHfpjfzoEk68W4xw33
         FewunukIEuctWzutEheKAh/h9rarpi4qMCawj2pkmaskr4p13Ulc6XmhRzmh/Aegnwi9
         F4kw==
X-Gm-Message-State: AOAM5320Wmw9WabiTOuxwpp0f8zGMCtuVu6CI66PJFANDEit5ZF3xvpN
	6qj6gD63CfS3hdtV4fbonklhrBQbiseZfkb3IO4=
X-Google-Smtp-Source: ABdhPJyGf8CGxepPdVLasJlzv8YIBvELscxyOZKVN3EXtb2U5qFv0rgcjwpwskWYFDHb70oFgE9QVfOM0FSJMnLEgvw=
X-Received: by 2002:a19:7911:: with SMTP id u17mr9344741lfc.466.1607943391823;
 Mon, 14 Dec 2020 02:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20201214103248.2227-1-outbackdingo@gmail.com> <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
In-Reply-To: <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
From: "Outback Dingo" <outbackdingo@gmail.com>
Date: Mon, 14 Dec 2020 17:55:55 +0700
Message-ID: <CAKYr3zyZ2N=VHuy+qDwHo4QkR7DNweusO3RrBj+A2zziBHKaDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file /etc/ethertypes conflicts between netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 5:39 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Sorry, but you need to explain why the file from from ebtables (an optional package from a 3rd party layer) takes precedence over file from netbase (which is a core item).

further to the previous note, it conflicts with ebtables in meta-oe
from what i can tell

commit c71a08cea8477f69ee3bc511f1f14d99e09c0a49
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Mon Dec 3 15:30:40 2012 +0000

    ebtables: add from OE-Classic, update and tidy up

    * Update to 2.0.10-4
    * Handle hardcoded paths in initscript
    * Add LIC_FILES_CHKSUM
    * Set SUMMARY (which sets DESCRIPTION)
    * Drop PRIORITY
    * Minor formatting/ordering tweaks

    Based on a patch by Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

    Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>


>
> Alex
>
> On Mon, 14 Dec 2020 at 11:33, Outback Dingo <outbackdingo@gmail.com> wrote:
>>
>> ---
>>  meta/recipes-core/netbase/netbase_6.2.bb | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.2.bb
>> index a54d2e7764..262b2cf1bc 100644
>> --- a/meta/recipes-core/netbase/netbase_6.2.bb
>> +++ b/meta/recipes-core/netbase/netbase_6.2.bb
>> @@ -19,5 +19,4 @@ do_install () {
>>         install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
>>         install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
>>         install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
>> -       install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
>>  }
>> --
>> 2.20.1
>>
>>
>> 
>>
