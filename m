Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.18998.1621833166570383475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 22:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NeX6cT13;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id e2so25568544ljk.4
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 22:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndZqoVYih47S2oGYBPDdaNK9Yraf2oIo7anWw9pybOQ=;
        b=NeX6cT13uAHEdrpKVBvg20vA1y+mP6JQG1mXbMTcopes6uJKRayZkjkxBh6WzMpASE
         R+yLnpGMPVph3oJbPquRlUZGzwzeTVwlgkmyR2Blwy8SoW45p8COuzTxSYvs1ffwjxCC
         uBUXnufkZbGac2yqJQf4DX45aYuoQ0J5em9ZG/UziP3ywnlmHZMD5ELGum9hcVXbp4/W
         dWWOS/naCchovLrbbFLJ6N+bWoGdepFBfKZctk1Ikijhbt2mVn2atxsJD0HX+88uU9dD
         EfYGJa8U7D74nL0EcT9ph9uvq+pDLZBdl3druMqDHKAZkUi2R6qiDx7wCDVQEARdBSou
         SuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndZqoVYih47S2oGYBPDdaNK9Yraf2oIo7anWw9pybOQ=;
        b=rbPrOgX/shqgEt5ywATWq700e+PVP8zoFoDVdq3nVWwiOC/vlNPQ7SwXKefN5yxf2f
         dtnmDotEMPNgclbvcGQ/h5SpMCNAm8d1Hk3/+eqTZxg0OSieUibin61tia4csbMGZmHi
         oxpXRiRx8zeH+10YmMyC2y+EsPCTwrmT436QDFoaoybyx+zB19BkZ+A6TciOLBbJ6rHK
         DUGMNxTJpACPiR5aXpOfl/8BBhKV9NIaKI6MnSygqzuJDWChJIifobJvugIN06BRohY7
         pbLMXz1QIf+JBW60dFG3erLMKkk1sbUORI71dQZO7OcZ2bzSayfk5eWXc+OmMYGoL6ul
         OGHg==
X-Gm-Message-State: AOAM533/lqbIRsAnjjCbrmwndBuUvgQPCC/61SjS4qKobSqQZElZ2EBk
	B1UIsV1Qh1kZpbRyTyk1Uv0z6QMpGeOuvwQj9k4=
X-Google-Smtp-Source: ABdhPJztFFIbSknQgnFsn74Lr53cNAyPhyYUBBWGjIa5GvKGby7r5L8+XeqQgTyIHs63fNXBIOI8Lz69dVJLFtkaMPU=
X-Received: by 2002:a2e:b550:: with SMTP id a16mr13322008ljn.323.1621833164495;
 Sun, 23 May 2021 22:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com> <20210521132914.140884-4-vinay.m.engg@gmail.com>
 <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
In-Reply-To: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 24 May 2021 10:42:33 +0530
Message-ID: <CANUMPcVp0bowz55=wahx+7PCpX+ES40+qYg5xOA+wEUvB9TJdQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

I made changes as you suggested, getting expected results.
Verifying with a fresh run. Will send the final patch for review.

Regards,
Vinay

On Sat, May 22, 2021 at 10:04 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 21 May 2021 at 15:29, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> +                       # Set TEST_DEVICE_ADDR to image ip
>> +                       cmd  = "export TEST_DEVICE_ADDR=%s:12345;" % qemu.ip
>> +                       runCmd(cmd)
>> +
>> +                        # Test execution
>> +                       bitbake("{} -c check".format(recipe))
>> +                       # Stop ssh background execution
>> +                       t_thread.stop()
>>
>
> TEST_DEVICE_ADDR set this way will not propagate into the task environment. The task itself consists only of:
>
> do_check () {
>
>     rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
> }
>
> so you can simply move that directly into selftest:
>
> runCmd("export TEST_DEVICE_ADDR=%s:12345 rust_runx test --no-fail-fast --bless --target "%s"" %(....))
>
> Alex
>
