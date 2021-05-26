Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.3246.1622061808256727082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 13:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pfgKkz6D;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j6so4531157lfr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 13:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/K1YkB+2hmMhlXNepk2MKY4LFQEBo/ZQm9y3y597Ug=;
        b=pfgKkz6DJxcBWUivi893LSFwxL3jk13daA8dUu1sdDabw6Yd+heZ2d8tK+igKQlPVy
         tjQ7/xb97wrboliJI1ZuHQ3acnZna7aPHwhZdKQr7bzpv/5I0/cwV0g4fO8MAOP5w9vo
         8UqoXK4HmoqqsDRjhjc0rQGH9gYo4ABjQ9KShXC5u1/k+mfpetfgpCql1i0oODjX7KpJ
         VbgzEK8FZPDFnAffMQEVhdN93Ul07o02eLuAeGUmz/4Zfxv8TvueeU08waIhUrE9dLr9
         wOhFxWvdcBP4o4uteA4iDR7OyyueIWfBc5q4J8OuQImZgy553TyhHKCgUDgYRYvAEj5r
         WKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/K1YkB+2hmMhlXNepk2MKY4LFQEBo/ZQm9y3y597Ug=;
        b=ZkIssPusgE25v7NndQ6cdj+XGoIiBX2Xv/p64JeZ6eB9M8/YE6cJDjrWpH/sJSKcHx
         Am48qsVYr6aGHc/Zgh/y4fV+PFqRHjVwXWFYJSa/8vgmMc6/MxbuwFZxXZtr9TjcS4if
         i+vnKZj93fhYgDH5E5BjRlqME80u5cpptdQevuNFbool3jjOa4W7V1WAqx+PiQAhjBvG
         VpMABO3mTLh2y7K/4Pqw7CsBywK1J+WaAXbh9PPKaaScvtLLTIfkMQBiWSfdyiE0L/cF
         TCm85PYyYJ79P5M4CmmwYZfnkW+C1+hvqCRcIpLj6zwyVce279lhQw4aHpWFaJrTooe+
         BaCA==
X-Gm-Message-State: AOAM533wW9eFMp17ceW55/2vgPCr48P+A2F4LBZ8OPfnnuTMEau/NExM
	iGML1di9OqWY5tE7eDD5RtvQhIz7zoDiyQ3x1+A=
X-Google-Smtp-Source: ABdhPJwQGQ4+qFJ5U0i1WawvjeB5H6uuJH72AePNDMb8gVOxTikIMhkfO7AzXcmUbnYTsP7Uy+ILOdiPK8L44FkNm0I=
X-Received: by 2002:ac2:5183:: with SMTP id u3mr3230763lfi.137.1622061806335;
 Wed, 26 May 2021 13:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
 <20210524171559.190239-1-vinay.m.engg@gmail.com> <20210524171559.190239-4-vinay.m.engg@gmail.com>
 <CANNYZj-ibLe4twMKMfwKTmOH5R0jtK1531fHv9=WWSTv9VSaRw@mail.gmail.com>
In-Reply-To: <CANNYZj-ibLe4twMKMfwKTmOH5R0jtK1531fHv9=WWSTv9VSaRw@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 27 May 2021 02:13:14 +0530
Message-ID: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

>> Hardcoding the ip port this way is problematic and prone to conflicts. What is -monitor used for?
When we were testing outside oe-selftest framework ( booting image
manually and trigger testing),
the "remote-test-server" used to give connection issues. However,
right now without this option the testing is working without any
issue. So removed from qemuboot.

>> What does -j 40 do? Keep in mind that qemu has only 4 virtual cpu cores.
This one passed to speed up the testing while using the "do_check"
method. So I removed parallel builds.

>> What happens if the test executed via runCmd fails? Specifically, will the failure be properly reported?
While executing testing, if there any testcase failures testing gets
terminated with below message,
"command did not execute successfully:"

So we are passing "--no-fail-fast" as a test argument, which wont exit
the shell and the testing continues even if there are failures.

>> I'm wondering because the output of the test is redirected to summary.txt (which is then left unused), and stderr is discarded altogether.
This is because I only capture the test results as much as possible.
Now modified to consider stderr also.

>> Will t_thread be stopped if runCmd fails?
Now changed the implementation to discard thread usage. Even in case
of any failure the test used to end after timeout set in "SShcontrol"
if the timeout is less (60 seconds) then some of the tests used to get missed.

So instead of using copy_to and run from sshcontrol.py, I tried
copying the remote-test-server to the image and  executing in the
background as below,

#Copy remote-test-server through scp and execute through background ssh
sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
-o LogLevel=ERROR'
cmd = "scp %s %s/build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server
root@%s:~/ ;" % (sshargs, builddir, qemu.ip)
testcommand = '~/remote-test-server -v remote'
cmd = cmd + "ssh %s -f root@%s \"%s\";" % (sshargs, qemu.ip, testcommand)

And kill "remote-test-server" through ssh once testing is complete
killcommand = "kill -9 \$(ps | grep remote-test-server |  grep -v
\"grep\" | awk '{print \$1}')"
cmd = cmd + "ssh %s root@%s \"%s\";" % (sshargs, qemu.ip, killcommand)

Testing in progress will send the v5 version patches.

Regards,
Vinay

On Tue, May 25, 2021 at 1:29 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 24 May 2021 at 19:16, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Build remote-test-server copy to image and execute
>> remotely through background ssh.
>
>
> Thanks, I do not have any further comments about the overall structure, the below are more specific concerns.
>
>>
>> +               with runqemu("core-image-minimal", runqemuparams = "nographic", qemuparams= " -monitor \
>> +                        telnet:127.0.0.1:1234,server,nowait -serial mon:stdio -serial null") as qemu:
>
>
> Hardcoding the ip port this way is problematic and prone to conflicts. What is -monitor used for?
>
>>
>> +                       cmd = cmd + " cd %s;  python3 src/bootstrap/bootstrap.py -j 40 --verbose test %s --target %s > summary.txt 2> /dev/null " % (builddir, testargs, targetsys)
>
>
> What does -j 40 do? Keep in mind that qemu has only 4 virtual cpu cores.
>
>>
>> +                       runCmd(cmd)
>
>
> What happens if the test executed via runCmd fails? Specifically, will the failure be properly reported?
>
> I'm wondering because the output of the test is redirected to summary.txt (which is then left unused), and stderr is discarded altogether.
>
>>
>> +                       # Stop ssh background execution
>> +                       t_thread.stop()
>
>
> Will t_thread be stopped if runCmd fails?
>
> Alex
