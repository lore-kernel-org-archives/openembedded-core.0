Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.9482.1621604782421939680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 06:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CU9swKiN;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id c15so24007183ljr.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bOIreUNVhoCUxNNDqDNZ242EeOs+dChlzHVC5aC2DXY=;
        b=CU9swKiN9KT2CYp0oeP+zt9pdiN+Rt+bjcqMp9aAeLrxPkRdo0AiMuEAFFGBtJCvzG
         4MjfqhxS7ITMWOmwaGv4gTQIY4dX+28kS7BxyrdUoR25KneMdoKfCGiFik5V6P/p+SzD
         yG4LvQ+ywY0qnxhnEeAh1fldp46Y3ojmEaDecwZRNJKw3uo4ayd6mf1ULF+vGtBLQMUI
         Re/jVYo/fdPpXyoMy6G6+kwJ53HjX/ptzgoKVZnCNGmGOi9BRKty0WuyXKTYI+xxBWwy
         Jh//Dcd6NcI3zmLzcC+KbRT1iYQNiNt7dK8S1z9W9cONf8z0630GV8zM9zBbTHiZC9GC
         avnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bOIreUNVhoCUxNNDqDNZ242EeOs+dChlzHVC5aC2DXY=;
        b=FxRXfGbGSqpYRvnkYPZAo6crcwoI0pOimtv7B/zyqm2+AU/9eb5v56X2U1Jlk+vaLl
         UUNCbfHURhhcK3EkD0IdNclBvqX4BTbqBH5vnlsLx9PSAzVRXFLE7klkl+Bk2VcqEmqq
         YseOrK50eNBkZDffL6I3+yzss5WQhHN6OWGzYa1z0eZqYBsjfm+C4E9eT3Dq2MYcnJlk
         pjc89ov47X1YxFohZvdXSgOX6p3B5uPslRJA05NIXpW2FczAkXR59dJtR5hoGC4X/7/b
         vWMCP93mm/un4OsWbYFRZmwC9tRzQh4f/7GyKsQyNgkrkdwXWm7mvVmc2HbgMu7+v93G
         GsmQ==
X-Gm-Message-State: AOAM532J8YYyLk0WkrjhPWcaws+KyFWXuXWr7yO65oZwWYi/Wnltp67I
	JKrVqN3ZQHIAFbshQwsD6vtt2+5sMxSxUN7i3bM=
X-Google-Smtp-Source: ABdhPJwdg24i4C9y1+kDNS0lHufPEoicgqoVcy9GoX/o42ZpEEfv4aopcgDO1o7T2RaqyHKphlnnlEMs4YhCG2iPG/g=
X-Received: by 2002:a2e:9544:: with SMTP id t4mr7070091ljh.474.1621604780386;
 Fri, 21 May 2021 06:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
 <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
 <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
 <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com>
 <167FE427910432AF.29970@lists.openembedded.org> <CANUMPcWrQtocibdLawMmt30eQkYiC5NLAj+MhnfUs8ozgoHOMA@mail.gmail.com>
 <CANNYZj88moczJGrTH_s3DAvR5P21aGui-yPfPst3mgySEcDj3A@mail.gmail.com> <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
In-Reply-To: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Fri, 21 May 2021 19:16:08 +0530
Message-ID: <CANUMPcX6W7F8qxyiN8trxH7Grdc3JCUrUxYtNQqvTxtwLpxqoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

As we are developing patches on the branch:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleod/r=
ust-wip-2021-02-02

Sent my patches v3 on top of this.
https://lists.openembedded.org/g/openembedded-core/message/152121

Below changes in rust.py does not make connection with the
"remote-test-server" running on qemu image.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
"cmd  =3D "export TEST_DEVICE_ADDR=3D%s:12345;" % qemu.ip"
runCmd(cmd)
bitbake("{} -c check".format(recipe))

Expected below line in generated summary.txt in
b1/tmp/work/cortexa57-poky-linux/rust-testsuite/1.46.0-r0/rustc-1.46.0-src
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
running: "/ala-lpggp31/vinay/review-3/b1/tmp/work/cortexa57-poky-linux/rus=
t-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage=
0-too
ls-bin/remote-test-client" "spawn-emulator" "aarch64-poky-linux"
"/ala-lpggp31/vinay/review-3/b1/tmp/work/cortexa57-poky-linux/rust-testsui=
te/1.46.0-r0/ru
stc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0-tools-bin/remote-test=
-server"
"/ala-lpggp31/vinay/review-3/b1/tmp/work/cortexa57-poky-linux/rust-test
suite/1.46.0-r0/rustc-1.46.0-src/build/tmp"
Connecting to remote device 192.168.7.2:12345 ...

If we set "export TEST_DEVICE_ADDR=3D192.168.7.2:12345;" in do_check of
rust-testsuite.inc connection establishes with image
and the test execution is as expected.

Also, please let me know if there in other way to share/publish the source=
.

Regards,
Vinay

On Fri, May 21, 2021 at 2:00 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> If you publish the code to a branch, and show exactly the errors you get=
, I could try to look at it.
>
> Alex
>
> On Thu, 20 May 2021 at 22:29, Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>
>> You cannot hardcode the ip address like that; it's set dynamically when=
 qemu starts, and you can only access it from selftest or runtime test.
>>
>> Alex
>>
>> On Thu, 20 May 2021 at 12:06, Vinay Kumar <vinay.m.engg@gmail.com> wrot=
e:
>>>
>>> Hi Alex,
>>>
>>> Tried your suggestions to copy and run in rust.py without any issue as=
 below.
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> builddir =3D get_bb_var("B", "rust-testsuite")
>>> ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"root",=
 timeout=3D600)
>>> ssh.copy_to(builddir + "/" +
>>> "build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server","=
~/")
>>> t_thread =3D threading.Thread(target=3Dssh.run,
>>> args=3D("~/remote-test-server -v remote",))
>>> t_thread.start()
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> If we set "TEST_DEVICE_ADDR" in rust.py through "runCmd" as shown
>>> below,  the remote-test-client does not connect  to the image.
>>> So a lot of tests fail.
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> "cmd  =3D "export TEST_DEVICE_ADDR=3D%s:12345;" % qemu.ip"
>>> runCmd(cmd)
>>> bitbake("{} -c check".format(recipe))
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Also, I tried to move do_check content to rust.py without any success.
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> cmd =3D "export PATH=3D%s/../recipe-sysroot-native/usr/lib/rustlib/:" =
% builddir
>>> cmd=3D cmd + "%s/../recipe-sysroot-native/usr/bin:$PATH;" % builddir
>>> cmd =3D cmd + "export
>>> RUST_TARGET_PATH=3D%s/../recipe-sysroot-native/usr/lib/rustlib/;" %
>>> builddir
>>> cmd =3D cmd + "cd " + builddir + ";"
>>> cmd  =3D "export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qemu.ip
>>> cmd =3D cmd + "python3 src/bootstrap/bootstrap.py -j 40 --verbose test
>>> --no-fail-fast --bless --target aarch64-poky-linux > summary.txt 2>&1"
>>>
>>> Error:
>>> File "/ala-lpggp31/vinay/review-2/poky-contrib/meta/lib/oeqa/utils/com=
mands.py",
>>> line 210, in runCmd
>>> raise AssertionError("Command '%s' returned non-zero exit status
>>> %d:\n%s" % (command, result.status, exc_output))
>>> AssertionError: Command 'export
>>> TEST_DEVICE_ADDR=3D"192.168.7.2:12345";python3
>>> src/bootstrap/bootstrap.py -j 40 --verbose test --no-fail-fast --bless
>>> --target aarch64-poky-linux > summary.txt 2>&1' returned non-zero exit
>>> status 2:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> So in rust.py only copy and execution of "remote-test-server" is taken=
 care of.
>>> And the test execution is by  do_check of rust-testsuite.inc as below,
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>> do_check () {
>>>     export TEST_DEVICE_ADDR=3D"192.168.7.2:12345"
>>>     rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
>>> summary.txt 2> /dev/null
>>> }
>>>
>>> Let me know if this ok. will send patches with changes for review.
>>>
>>> Regards,
>>> Vinay
>>>
>>> On Mon, May 17, 2021 at 8:57 PM Vinay Kumar via lists.openembedded.org
>>> <vinay.m.engg=3Dgmail.com@lists.openembedded.org> wrote:
>>> >
>>> > Hi Alex,
>>> >
>>> > Tried testing outside oe-selftest framework, it works fine without a=
ny errors,
>>> >
>>> > export TEST_DEVICE_ADDR=3D"192.168.7.4:12345"
>>> > rust_runx test --no-fail-fast --bless --target "aarch64-poky-linux" =
>
>>> > summary.txt 2> /dev/null
>>> >
>>> > Also, log (summary.txt) shows "remote-test-client" is connecting to
>>> > the image without any issue.
>>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> > running: "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-lin=
ux/rust-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu=
/stage0-tools-bin/remote-test-client"
>>> > "spawn-emulator" "aarch64-poky-linux"
>>> > "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-t=
estsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0-t=
ools-bin/remote-test-server"
>>> > "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-t=
estsuite/1.46.0-r0/rustc-1.46.0-src/build/tmp"
>>> > Connecting to remote device 192.168.7.4:12345 ...
>>> >
>>> > Will integrate these changes in oe-selftest and let you know.
>>> >
>>> > Regards,
>>> > Vinay
>>> >
>>> > On Mon, May 17, 2021 at 8:11 PM Vinay Kumar <vinay.m.engg@gmail.com>=
 wrote:
>>> > >
>>> > > Checking suggestions, the booted image with tap seems to be workin=
g by
>>> > > passing "-monitor  telnet:127.0.0.1:1234,server,nowait"
>>> > > so I will execute testing and update you.
>>> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D
>>> > > root@qemuarm64:~# ifconfig
>>> > > eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:02
>>> > >           inet addr:192.168.7.4  Bcast:192.168.7.255  Mask:255.255=
.255.0
>>> > >           inet6 addr: fe80::5054:ff:fe12:3402/64 Scope:Link
>>> > >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>>> > >           RX packets:116 errors:0 dropped:0 overruns:0 frame:0
>>> > >           TX packets:98 errors:0 dropped:0 overruns:0 carrier:0
>>> > >           collisions:0 txqueuelen:1000
>>> > >           RX bytes:945121 (922.9 KiB)  TX bytes:9529 (9.3 KiB)
>>> > >
>>> > > root@qemuarm64:~# ./remote-test-server -v remote
>>> > > starting test server
>>> > > listening on 0.0.0.0:12345!
>>> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D
>>> > >
>>> > > Regards,
>>> > > Vinay
>>> > >
>>> > > On Mon, May 17, 2021 at 8:02 PM Alexander Kanavin
>>> > > <alex.kanavin@gmail.com> wrote:
>>> > > >
>>> > > > Thanks, can you please look into the error? The line where it ha=
ppens and the way to get a backtrace is right there :)
>>> > > > There's no reason it shouldn't work.
>>> > > >
>>> > > > Alex
>>> > > >
>>> > > > On Mon, 17 May 2021 at 15:21, Vinay Kumar <vinay.m.engg@gmail.co=
m> wrote:
>>> > > >>
>>> > > >> Hi Alex,
>>> > > >>
>>> > > >> Error on qemu  image (ex. Aarch64) booted with tap interface.
>>> > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D
>>> > > >> root@qemuarm64:~# ./remote-test-server
>>> > > >> starting test server
>>> > > >> thread 'main' panicked at 'TcpListener::bind(bind_addr) failed =
with
>>> > > >> Cannot assign requested address (os error 99)',
>>> > > >> src/tools/remote-test-server/src/main.rs:90:20
>>> > > >> note: run with `RUST_BACKTRACE=3D1` environment variable to dis=
play a backtrace
>>> > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D
>>> > > >>
>>> > > >> On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
>>> > > >> <alex.kanavin@gmail.com> wrote:
>>> > > >> >
>>> > > >> > On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail=
.com> wrote:
>>> > > >> >>
>>> > > >> >> "remote-test-server" on qemu-image with a tap interface thro=
ws an error.
>>> > > >> >> The emulators for rust testing are with tcp port forwarding =
so used
>>> > > >> >> slirp method with added rust port.
>>> > > >> >
>>> > > >> >
>>> > > >> > I'm not sure I understand - what kind of error? In both cases=
 the server starts listening on a port, so in slirp scenario the address is=
 127.0.0.1:12345 (prone to breakage if something else on the build host too=
k that port btw, including another instance of the same test), in tap it wo=
uld be 192.168.7.2:12345. For the client you simply supply that via TEST_DE=
VICE_ADDR. No?
>>> > > >> >
>>> > > >> > Alex
>>> >
>>> >=20
>>> >
