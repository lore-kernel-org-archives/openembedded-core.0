Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.19967.1621262486262693575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jJV7g/v9;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id w33so1206660lfu.7
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TJNlb6X2UEvUFXvenNqd3B7n9B89FgwM2ctqrzFs4XY=;
        b=jJV7g/v97L2JfbOzvB2r0SyzCVvgatm78iE1agraMfp5GUdHixj5f3AzPJlACH8tjS
         WFaOwqLNpHedRFww/bOXcUv+JME9YEN4m84DaWkXxeuJ0AMsJ15NCYy+8qmYcX4oKZAA
         Pc3QmsUqQnUcJ4N8Rc1RzoRuKMSTFbR6/4JKslAouEzBRx1+EGX8h4M2R4lOMMwkjDVj
         cKJdUNjzITD/X8AY7DjY7EMp4YOhLwIE7lPelQC85Z682sQ3a35rDq4fVvlvYtkGMVDm
         w2PR4Pbytlx6swUu429TlLIdZHI1o3nA4diUfO5PQrDDXDrMWeT1T5VP7stL16V+qj7o
         ahWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TJNlb6X2UEvUFXvenNqd3B7n9B89FgwM2ctqrzFs4XY=;
        b=Irk/yXdNlatFbaLaWNeXV28wsDZTVd/UE3FLl2UJzSviUUQf6VfapiXtwKFsdYZbtk
         WHpXS1lHB+zE1G/ab+utxiaW7Ug9HWIFSAg5UlgrBRZOs2K6gaoHhiJzslhxOgOhtc65
         pDjGcKdIV8mdFYb6SSIbG/hyoNDqmxAnxHeJpKwMU/igPdwTZZPqUR2jlk/C+KmPsDea
         SHyaUkHTZbfjjX395p4wClVvH+oVqE85DmasprdIS35wX662d3LNKMMAJ9HoIo8ixu+7
         m8IzmV2MsDX6F0BOvuXWrMA+4mIopGRoOyMbdnOKlSo3dYRnJwWuNsaTaNz4MNKVkrjb
         1LGA==
X-Gm-Message-State: AOAM532xnNTHK8EOUaTeem21dimQJVGZFEuTou04nrYDF8OdfRwEXVBG
	eHcETA+6C49jrN+tzIXPoaXZnkOZIBAuW+64zKs=
X-Google-Smtp-Source: ABdhPJxMQEJKKA9kgH8JscT32B5m2fBAqLfdXk5IRdcsj4M8gIeNQwvYVffRw47xLOYUBwVjGXiLRMPRokOdLYbG5JE=
X-Received: by 2002:a19:9102:: with SMTP id t2mr148370lfd.255.1621262484287;
 Mon, 17 May 2021 07:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
 <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
 <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com> <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
In-Reply-To: <CANNYZj9OeUc73=xf+F5qub-T4Fr6msvWTpshN=XubL-mL2j5UQ@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 20:11:12 +0530
Message-ID: <CANUMPcUs_sUnzH_9XPU_mKsUJrbx5cA2PXUug0Yusf+ze6cpAw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Checking suggestions, the booted image with tap seems to be working by
passing "-monitor  telnet:127.0.0.1:1234,server,nowait"
so I will execute testing and update you.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
root@qemuarm64:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:02
          inet addr:192.168.7.4  Bcast:192.168.7.255  Mask:255.255.255.0
          inet6 addr: fe80::5054:ff:fe12:3402/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:116 errors:0 dropped:0 overruns:0 frame:0
          TX packets:98 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:945121 (922.9 KiB)  TX bytes:9529 (9.3 KiB)

root@qemuarm64:~# ./remote-test-server -v remote
starting test server
listening on 0.0.0.0:12345!
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Regards,
Vinay

On Mon, May 17, 2021 at 8:02 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Thanks, can you please look into the error? The line where it happens and=
 the way to get a backtrace is right there :)
> There's no reason it shouldn't work.
>
> Alex
>
> On Mon, 17 May 2021 at 15:21, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> Hi Alex,
>>
>> Error on qemu  image (ex. Aarch64) booted with tap interface.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> root@qemuarm64:~# ./remote-test-server
>> starting test server
>> thread 'main' panicked at 'TcpListener::bind(bind_addr) failed with
>> Cannot assign requested address (os error 99)',
>> src/tools/remote-test-server/src/main.rs:90:20
>> note: run with `RUST_BACKTRACE=3D1` environment variable to display a ba=
cktrace
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>
>> On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com> wro=
te:
>> >>
>> >> "remote-test-server" on qemu-image with a tap interface throws an err=
or.
>> >> The emulators for rust testing are with tcp port forwarding so used
>> >> slirp method with added rust port.
>> >
>> >
>> > I'm not sure I understand - what kind of error? In both cases the serv=
er starts listening on a port, so in slirp scenario the address is 127.0.0.=
1:12345 (prone to breakage if something else on the build host took that po=
rt btw, including another instance of the same test), in tap it would be 19=
2.168.7.2:12345. For the client you simply supply that via TEST_DEVICE_ADDR=
. No?
>> >
>> > Alex
