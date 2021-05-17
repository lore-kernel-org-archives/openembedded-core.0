Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.20617.1621265248886412812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 08:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bRug0TQX;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id a2so9386937lfc.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3/JFiDoejEL5VxLlVklzDMtL+EvATI/+xS0+oGhTmww=;
        b=bRug0TQX8Huh/HUUk35bTWgV/Ht0yAgkcBSPvY98fMUYgsCxY0R8B6f5Hp7r6rTjJm
         Dp7ww0uRzH3Rq6yqtvTj7JrLZ0WoLo5oMpZPY5BqZC1L459SsggP+AqtoWqzAjfFeSxv
         u0LxRAufPwr23Yva8LtCbwKyVMWrJCOBE7C+MMY0zLBdeidDy++u9QTcEneN2t0FB2Ra
         8SbEjxMDottbVGu+Ijql+y2B4WR98doNKo0ZRfWP2BUWtFDsiwKhOE90IAwhvbYpphGW
         KJGXooQ9lYl25swk5tdXrL4Ms2dgjQ5EIZ0Ugh91rPbqR18zeT9+qwqRvJvJ1mcV5J4u
         ggqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3/JFiDoejEL5VxLlVklzDMtL+EvATI/+xS0+oGhTmww=;
        b=XwOVHteZwcGUbbEMcrSUVkSfL31Lz57MvZlCu90afHUqT1xiKkc3nMLwLXw/c4L5eb
         MzcKW3m6MSIfywzcSuL62MIKu3h0tFFjKHLxZ8p61TaijxtyzIGIEJnh5/4bmPjDqSfF
         vJEuK+D+Jf13w8/moG9VdDloi7mToPYb6g86boCWJj5fBGtoJhvthiAsKlFQu1sz+KkC
         UBIpYWUuZKtJPTn7YGbOeD1P9vExEFUrZWqlDxfMlk5xH8faL4eox9eNQQ/oqAfcGyFy
         IK5tBxayar1WJW9H9nh2U13pTYjX4J4PpochYp0eTjWw2o8grzW7HMkScucFad965G8z
         ObwQ==
X-Gm-Message-State: AOAM5322IzESFX48FBbfxdtvKNrxsqMrRcng5D9s2QPh9etfDaEhLIbW
	v3jG4Ye5jdM+0DrfDhYJfQwYuG/prHQi/tKhIdI=
X-Google-Smtp-Source: ABdhPJxz2iTel6KHswaUWakSUCKj2hVKWIYSYhZ85WBtAX3VDqsNfMcKvwMQoAlTtjj82cOjAJ+Fo6rGAuEADy1az5M=
X-Received: by 2002:a19:9102:: with SMTP id t2mr290585lfd.255.1621265246945;
 Mon, 17 May 2021 08:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
 <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
 <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com> <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com>
In-Reply-To: <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 20:57:15 +0530
Message-ID: <CANUMPcU3jOZHW2kBLuo9WVNu-qRs7FGtAPUJJ__Y+6D=vuW_eQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Tried testing outside oe-selftest framework, it works fine without any erro=
rs,

export TEST_DEVICE_ADDR=3D"192.168.7.4:12345"
rust_runx test --no-fail-fast --bless --target "aarch64-poky-linux" >
summary.txt 2> /dev/null

Also, log (summary.txt) shows "remote-test-client" is connecting to
the image without any issue.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
running: "/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust=
-testsuite/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0=
-tools-bin/remote-test-client"
"spawn-emulator" "aarch64-poky-linux"
"/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-testsuit=
e/1.46.0-r0/rustc-1.46.0-src/build/x86_64-unknown-linux-gnu/stage0-tools-bi=
n/remote-test-server"
"/ala-lpggp31/vinay/review-2/b1/tmp/work/cortexa57-poky-linux/rust-testsuit=
e/1.46.0-r0/rustc-1.46.0-src/build/tmp"
Connecting to remote device 192.168.7.4:12345 ...

Will integrate these changes in oe-selftest and let you know.

Regards,
Vinay

On Mon, May 17, 2021 at 8:11 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> Checking suggestions, the booted image with tap seems to be working by
> passing "-monitor  telnet:127.0.0.1:1234,server,nowait"
> so I will execute testing and update you.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> root@qemuarm64:~# ifconfig
> eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:02
>           inet addr:192.168.7.4  Bcast:192.168.7.255  Mask:255.255.255.0
>           inet6 addr: fe80::5054:ff:fe12:3402/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:116 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:98 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:945121 (922.9 KiB)  TX bytes:9529 (9.3 KiB)
>
> root@qemuarm64:~# ./remote-test-server -v remote
> starting test server
> listening on 0.0.0.0:12345!
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> Regards,
> Vinay
>
> On Mon, May 17, 2021 at 8:02 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Thanks, can you please look into the error? The line where it happens a=
nd the way to get a backtrace is right there :)
> > There's no reason it shouldn't work.
> >
> > Alex
> >
> > On Mon, 17 May 2021 at 15:21, Vinay Kumar <vinay.m.engg@gmail.com> wrot=
e:
> >>
> >> Hi Alex,
> >>
> >> Error on qemu  image (ex. Aarch64) booted with tap interface.
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >> root@qemuarm64:~# ./remote-test-server
> >> starting test server
> >> thread 'main' panicked at 'TcpListener::bind(bind_addr) failed with
> >> Cannot assign requested address (os error 99)',
> >> src/tools/remote-test-server/src/main.rs:90:20
> >> note: run with `RUST_BACKTRACE=3D1` environment variable to display a =
backtrace
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >>
> >> On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com> w=
rote:
> >> >>
> >> >> "remote-test-server" on qemu-image with a tap interface throws an e=
rror.
> >> >> The emulators for rust testing are with tcp port forwarding so used
> >> >> slirp method with added rust port.
> >> >
> >> >
> >> > I'm not sure I understand - what kind of error? In both cases the se=
rver starts listening on a port, so in slirp scenario the address is 127.0.=
0.1:12345 (prone to breakage if something else on the build host took that =
port btw, including another instance of the same test), in tap it would be =
192.168.7.2:12345. For the client you simply supply that via TEST_DEVICE_AD=
DR. No?
> >> >
> >> > Alex
