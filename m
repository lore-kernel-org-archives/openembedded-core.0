Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.17410.1621251273279965992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eHH5fNqK;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id p20so6771694ljj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SwKp81Va23usjYWR0yav+DmpNs92wLjTazXW3A+x4s=;
        b=eHH5fNqKrXPvtt8v1IcvWUHKKKe+/EymM7J0ISoXJ5zzO8HNXaRIC4Ou+7zeo0MVGP
         28duuAersY58dlqXaM7s1RSjFQCFKXW7WBnQ3S/RMgkBrB8fn11Ja3d27iGDW7JIcxiN
         71M+o6cBZNlDd6iPZaMstsJIRmDVA1fyU17ULY7M+iOI74EtI12pAkszWe1Dtj9XKQCJ
         ME+7tv3Rb+BLdTKFB79x0mOzcsduOqQB1SKFy+hMV0n9EtYOQCJC46h5uxRLRM64qqhP
         /j+yPjZnCb+7sSvY5DCdQWWuxDz1PxiwyojHJtaJQXC/RXoQpXuIyUslcZfP9ixl1KEU
         M1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SwKp81Va23usjYWR0yav+DmpNs92wLjTazXW3A+x4s=;
        b=BXWXMWnGB6p+LtzFssQhsqFmup0VXajKyWBSs1H2RFBnxTdPB2dNnDiudhj8RygE7C
         1s+utZRkwNrbcGhD0E7qFgtdXwCfGyGqyPPtwKyUxX7lBbtTbnSXR+JfTeZZAFeolyuk
         JVUsZcbUX5MZIbZNTQ+5SyJIrHLvyEWe9znlrIlmDoXIE+7t5mXyBLXFd66CBZktJxqj
         B/yq8UEhY7cCcftRkaK8B2iNyl2jWWUYMz9oN9JL0fCYnVwJ0UmlzzY7I9bkdtHcam6n
         ra6XRncHYjGlLp/9dPw1FfWMMd9vTvMnHb0NKP41WUd/LKIJ5WAuAlHNEnmLVByqAybe
         tndw==
X-Gm-Message-State: AOAM530Mq/oBEmWDjKC8zz+FD2DwBzo5ukNa29VZV7Ti/y00DHC5nf0G
	mSQAChi7qyt6bu21YQ5/xvguU/RNnmZq2wTYAeM=
X-Google-Smtp-Source: ABdhPJyERG5ep4bRJ7627pHDjDy+5pbokMwgoLiqwCaZgEN7bZYPkOoiMsSLoN+QPbbW+qm3wJKPawfeA5YHpF3Vgrk=
X-Received: by 2002:a2e:8151:: with SMTP id t17mr48288972ljg.500.1621251271600;
 Mon, 17 May 2021 04:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
In-Reply-To: <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 17:04:20 +0530
Message-ID: <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

"remote-test-server" on qemu-image with a tap interface throws an error.
The emulators for rust testing are with tcp port forwarding so used
slirp method with added rust port.

References:
https://github.com/rust-lang/rust/issues/33114
https://github.com/rust-lang/rust/blob/master/src/tools/remote-test-client/src/main.rs

Regards,
Vinay


Regards,
Vinay

On Mon, May 17, 2021 at 4:30 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Is slirp really required? Is it possible to use the standard tap setup instead?
>
> Alex
>
> On Mon, 17 May 2021 at 12:35, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> The rust test involves qemuimage for testing, so
>> "run_check_emulated" involves building of "remote-test-server",
>> qemuimage and test execution.
>>
>> We are booting qemuimage in "nographic" and "slirp" mode along with
>> additional qemuparams,
>> '-monitor telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null'
>>
>> Note:
>> '-serial mon:stdio -serial' :  To fix below run-time errors while testing
>> "failed with Connection reset by peer"
>>
>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ---
>>  meta/lib/oeqa/selftest/cases/rust.py | 32 ++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
>> new file mode 100644
>> index 0000000000..4efbf9306f
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -0,0 +1,32 @@
>> +# SPDX-License-Identifier: MIT
>> +import os
>> +from oeqa.core.decorator import OETestTag
>> +from oeqa.core.case import OEPTestResultTestCase
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
>> +
>> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
>> +
>> +       def run_check_emulated(self, *args, **kwargs):
>> +               # build remote-test-server before image build
>> +               recipe = "rust-testsuite"
>> +               bitbake("{} -c compile".format(recipe))
>> +
>> +               # build core-image-minimal with required packages
>> +               default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
>> +               features = []
>> +               features.append('IMAGE_FEATURES += "ssh-server-openssh"')
>> +               features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
>> +               self.write_config("\n".join(features))
>> +               bitbake("core-image-minimal")
>> +               # wrap the execution with a qemu instance
>> +               with runqemu("core-image-minimal", runqemuparams = "nographic slirp", qemuparams= " -monitor \
>> +                        telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null") as qemu:
>> +                       recipe = "rust-testsuite"
>> +                       bitbake("{} -c check".format(recipe))
>> +
>> +
>> +@OETestTag("toolchain-system")
>> +class RustSelfTestSystemEmulated(RustSelfTestBase):
>> +       def test_rust(self):
>> +               self.run_check_emulated("rust")
>> --
>> 2.17.1
>>
