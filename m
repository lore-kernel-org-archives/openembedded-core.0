Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.6147.1621505195234199745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 03:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5voHpQk;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id z13so23651344lft.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uhhXKCSwv1rjgUKSWd/NIBtHI70WyLqffluJob/7RAE=;
        b=Z5voHpQk9Jn8vNuSLMnxFIzVltAxFAXt87ZiA7/VZTPWrRS4sCIeQsxyjAfWn8E+c9
         G9hAX/7Kp5QWajnySbHUuHu5RqTbl+Z2Vr/OA9EtuPJMEfkyQVIrVHo//Ozu8YtsSe+5
         769sk69aAwpbUXtSdaZ3TLd2cl9LRAuGmAyolv3tCZUWpitsTIW9+9iTDDjGRCphhe9H
         xkOgzNF6b8oFvzjvTskaZxkJiNiM41CJi0RSncx4r4hXeV+EDu8m9yyJ8vfLFf7BOPTt
         Rmm4+CcfsHJjKgzEo9Ux+DRDlfmVAC0LzgFlFbzo+SjgGC68PYNPNFykwaG3g0yfyT0Z
         PzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uhhXKCSwv1rjgUKSWd/NIBtHI70WyLqffluJob/7RAE=;
        b=rFjg3G7LRJgPDYFHbT+hEfeOSrnKiQOxgl3Ltaocgj+wiyyQi+ftKXBXtPwnXvDhgR
         AMI1Z2mbASbU1jbwXuUy5Y/ftSHyQWD4jtmZGDF1VKb3Wd6iOa6cWgYZettl3cFe+Pra
         aWyjSMcHnEUyIiKbzFRoIs7irR35cHf42ec9Acd+r8hwZa/2wyye0mD4zwcErO6nyG/i
         MRS0w98KN12gJkQ7vOmL6h806/XkbZb8gbdy5YerZUKhqTW1qjlwUqmsODxnleIToGIH
         phgklRdwXmcLxoYuTbOxXuKz4lcCU8wH8PaRT+J8apcHcaDM1JQUdhMhUGLZm1/XIKDl
         eg6w==
X-Gm-Message-State: AOAM5307FOy2jVvnmgv/FUaOjqQhTy4Ebo+g2P687GuycZKEf/LOFwT8
	BsiQU2a0QEigx3aoelxspd/cBogmHK4T0K3bZqs=
X-Google-Smtp-Source: ABdhPJwalvXpvdUOfHgpaVMs485TsfxO6ZiRiSAOP3liJBDvUc5dOFhlQ/02npiGiEiDfE95gdlNXzgjSQSEvilhFDM=
X-Received: by 2002:ac2:5a1b:: with SMTP id q27mr2981686lfn.8.1621505193034;
 Thu, 20 May 2021 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
 <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
 <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
 <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com> <167FE427910432AF.29970@lists.openembedded.org>
In-Reply-To: <167FE427910432AF.29970@lists.openembedded.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 20 May 2021 15:36:21 +0530
Message-ID: <CANUMPcWrQtocibdLawMmt30eQkYiC5NLAj+MhnfUs8ozgoHOMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Tried your suggestions to copy and run in rust.py without any issue as bel=
ow.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
builddir =3D get_bb_var("B", "rust-testsuite")
ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"root", tim=
eout=3D600)
ssh.copy_to(builddir + "/" +
"build/x86_64-unknown-linux-gnu/stage2-tools-bin/remote-test-server","~/")
t_thread =3D threading.Thread(target=3Dssh.run,
args=3D("~/remote-test-server -v remote",))
t_thread.start()
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

If we set "TEST_DEVICE_ADDR" in rust.py through "runCmd" as shown
below,  the remote-test-client does not connect  to the image.
So a lot of tests fail.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
"cmd  =3D "export TEST_DEVICE_ADDR=3D%s:12345;" % qemu.ip"
runCmd(cmd)
bitbake("{} -c check".format(recipe))
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Also, I tried to move do_check content to rust.py without any success.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
cmd =3D "export PATH=3D%s/../recipe-sysroot-native/usr/lib/rustlib/:" % bu=
ilddir
cmd=3D cmd + "%s/../recipe-sysroot-native/usr/bin:$PATH;" % builddir
cmd =3D cmd + "export
RUST_TARGET_PATH=3D%s/../recipe-sysroot-native/usr/lib/rustlib/;" %
builddir
cmd =3D cmd + "cd " + builddir + ";"
cmd  =3D "export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qemu.ip
cmd =3D cmd + "python3 src/bootstrap/bootstrap.py -j 40 --verbose test
--no-fail-fast --bless --target aarch64-poky-linux > summary.txt 2>&1"

Error:
File "/ala-lpggp31/vinay/review-2/poky-contrib/meta/lib/oeqa/utils/command=
s.py",
line 210, in runCmd
raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'export
TEST_DEVICE_ADDR=3D"192.168.7.2:12345";python3
src/bootstrap/bootstrap.py -j 40 --verbose test --no-fail-fast --bless
--target aarch64-poky-linux > summary.txt 2>&1' returned non-zero exit
status 2:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

So in rust.py only copy and execution of "remote-test-server" is taken car=
e of.
And the test execution is by  do_check of rust-testsuite.inc as below,
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
do_check () {
    export TEST_DEVICE_ADDR=3D"192.168.7.2:12345"
    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
summary.txt 2> /dev/null
}

Let me know if this ok. will send patches with changes for review.

Regards,
Vinay

On Mon, May 17, 2021 at 8:57 PM Vinay Kumar via lists.openembedded.org
<vinay.m.engg=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Alex,
>
> Tried testing outside oe-selftest framework, it works fine without any e=
rrors,
>
> export TEST_DEVICE_ADDR=3D"192.168.7.4:12345"
> rust_runx test --no-fail-fast --bless --target "aarch64-poky-linux" >
> summary.txt 2> /dev/null
>
> Also, log (summary.txt) shows "remote-test-client" is connecting to
> the image without any issue.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> running: "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/r=
ust-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/sta=
ge0-tools-bin/remote-test-client"
> "spawn-emulator" "aarch64-poky-linux"
> "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-tests=
uite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0-tools=
-bin/remote-test-server"
> "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-tests=
uite/1.46.0-r0/rustc-1.46.0-src/build/tmp"
> Connecting to remote device 192.168.7.4:12345 ...
>
> Will integrate these changes in oe-selftest and let you know.
>
> Regards,
> Vinay
>
> On Mon, May 17, 2021 at 8:11 PM Vinay Kumar <vinay.m.engg@gmail.com> wro=
te:
> >
> > Checking suggestions, the booted image with tap seems to be working by
> > passing "-monitor  telnet:127.0.0.1:1234,server,nowait"
> > so I will execute testing and update you.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > root@qemuarm64:~# ifconfig
> > eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:02
> >           inet addr:192.168.7.4  Bcast:192.168.7.255  Mask:255.255.255=
.0
> >           inet6 addr: fe80::5054:ff:fe12:3402/64 Scope:Link
> >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> >           RX packets:116 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:98 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:1000
> >           RX bytes:945121 (922.9 KiB)  TX bytes:9529 (9.3 KiB)
> >
> > root@qemuarm64:~# ./remote-test-server -v remote
> > starting test server
> > listening on 0.0.0.0:12345!
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> > Regards,
> > Vinay
> >
> > On Mon, May 17, 2021 at 8:02 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Thanks, can you please look into the error? The line where it happen=
s and the way to get a backtrace is right there :)
> > > There's no reason it shouldn't work.
> > >
> > > Alex
> > >
> > > On Mon, 17 May 2021 at 15:21, Vinay Kumar <vinay.m.engg@gmail.com> w=
rote:
> > >>
> > >> Hi Alex,
> > >>
> > >> Error on qemu  image (ex. Aarch64) booted with tap interface.
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > >> root@qemuarm64:~# ./remote-test-server
> > >> starting test server
> > >> thread 'main' panicked at 'TcpListener::bind(bind_addr) failed with
> > >> Cannot assign requested address (os error 99)',
> > >> src/tools/remote-test-server/src/main.rs:90:20
> > >> note: run with `RUST_BACKTRACE=3D1` environment variable to display=
 a backtrace
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > >>
> > >> On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
> > >> <alex.kanavin@gmail.com> wrote:
> > >> >
> > >> > On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com=
> wrote:
> > >> >>
> > >> >> "remote-test-server" on qemu-image with a tap interface throws a=
n error.
> > >> >> The emulators for rust testing are with tcp port forwarding so u=
sed
> > >> >> slirp method with added rust port.
> > >> >
> > >> >
> > >> > I'm not sure I understand - what kind of error? In both cases the=
 server starts listening on a port, so in slirp scenario the address is 127=
.0.0.1:12345 (prone to breakage if something else on the build host took th=
at port btw, including another instance of the same test), in tap it would =
be 192.168.7.2:12345. For the client you simply supply that via TEST_DEVICE=
_ADDR. No?
> > >> >
> > >> > Alex
>
>=20
>
