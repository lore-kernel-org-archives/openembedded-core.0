Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.18640.1621257673173971008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 06:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bics9Pgu;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id w15so7196126ljo.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lQw8Fsz7W95ZsUNQZugH/eZ8YdiVgA53O8aFuobVDe0=;
        b=bics9Pgun0jcw7F10LkZqnZDJQQvihml9Vf9vrbqjhza94DSOoA9qaC7TmtU0glh3u
         Q/CXVZtZe9PdDCH43aATLq9bvUUgGRgQvf7m2P6ROf3/paWd/Fv2h2CabOSoxbyX7BwB
         XNlLlRudGXgU0Cw1nLZ78+UdcfBRVwHe3mP2rqYKm1vefmvkvoeClSulDRA5j5VQ9mgG
         1+cXlTXgoX0urpdGq3FsISSag7xmwvivdTQfZKkCfdrnFvFU+bEtYp0q5QbqTLEhYV0O
         FiNNxD69otnbAiE7EoRXfr4/aj92RYk0YeQ7Fyv8lVUefejS5Iww8PcCxFaxPllXXvRi
         NChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lQw8Fsz7W95ZsUNQZugH/eZ8YdiVgA53O8aFuobVDe0=;
        b=NGdibesAIM+W8KVnn0ahn1PUqiElIGrjQu9+HcAFvxPQbP9sVGOgiRGdyVLgVUicuC
         KRXEyNu1nfa932ZUCRZp8x1ZPKRfEp2uFtm/hVLstbEAFl/2/ppq0KxolmMbwuu5dO2f
         vXGQGRSUKWuaJN0arG+rpZ6osBKpfTYhIGykvxpbcfzePu2/sKrMDIJJud72q7yrgipg
         tX9Gga0PDnl4w1LhLLA7ZnPYqFOjjITcEjnFxiDHPEuMa6gpezs+m4cjXNpLrbKogYfR
         GbSHG8rWS8CuOOHd1H8YEGOLEt320ZkkGk7Yffo3goDKWb+8N2Md01snqDxbPohv0uA+
         aJxg==
X-Gm-Message-State: AOAM530fffXrG1Zt6qxQv0uzALSEwc0kDjj3/t7kUSymizcrnftIDCmJ
	CWjco04zaimaWdBfSYrpiyVniCYyiOISsTYIegY=
X-Google-Smtp-Source: ABdhPJz9/o7qiBHYMURdJ2VC1caH6qKjHIDclcfy23vNpUKXPEHGJ5GXc1r3C0wbQem/A5lUCGx5yD6VFzxIwE5Lw9Q=
X-Received: by 2002:a2e:9006:: with SMTP id h6mr23102667ljg.323.1621257671246;
 Mon, 17 May 2021 06:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com>
 <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com> <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
In-Reply-To: <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 18:50:59 +0530
Message-ID: <CANUMPcVaW7vKKwW5cfvu2ETgcrWb70qdAFpCuiD8J8KNoAjjNQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Error on qemu  image (ex. Aarch64) booted with tap interface.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
root@qemuarm64:~# ./remote-test-server
starting test server
thread 'main' panicked at 'TcpListener::bind(bind_addr) failed with
Cannot assign requested address (os error 99)',
src/tools/remote-test-server/src/main.rs:90:20
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

On Mon, May 17, 2021 at 5:16 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> "remote-test-server" on qemu-image with a tap interface throws an error.
>> The emulators for rust testing are with tcp port forwarding so used
>> slirp method with added rust port.
>
>
> I'm not sure I understand - what kind of error? In both cases the server =
starts listening on a port, so in slirp scenario the address is 127.0.0.1:1=
2345 (prone to breakage if something else on the build host took that port =
btw, including another instance of the same test), in tap it would be 192.1=
68.7.2:12345. For the client you simply supply that via TEST_DEVICE_ADDR. N=
o?
>
> Alex
