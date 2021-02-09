Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.13229.1612889274785457592
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 08:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BwFIvFMz;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: rfried.dev@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id k25so20060457oik.13
        for <Openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dODtz1sHYBAEniYemNe0seZjThqthx8HCj/eWpxTECE=;
        b=BwFIvFMzyBqcQ48EF4j6GUZiqQZS33FGneaNq5dyEA/U2LW6Ubro8Ujl2gYyiOgACG
         7U6ppw7mjVa4Ef39Eh/tNPqCy99ifa0PbDTQM7/eTfoRCC6eiQFuvGgysjBY1UVeON8s
         FnDBulRtXCbtsWMfVKD8AvLGcLXy1VsMevJhShcbIUVOdoL5yJgNSojk4XiV59vNlBe2
         tc2p0jo5CFvbw7hJn+mZEsvZN5Ht/NUvANiXyCPkymdNgNwe10EDKdvB7dydqSFXCrBc
         0AlIU6USbGcLVI2s61EPX8/+NBZ/ABerm1c0msi0cuD7QnimC4pLds/rdYSApraq1/Dr
         dblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dODtz1sHYBAEniYemNe0seZjThqthx8HCj/eWpxTECE=;
        b=KuOGXFDla7UBx8AhlpS3poZwvve0UCFx35MGhBS+IefBebS83F81Zr4gfVR5HtwiIY
         h4wMpEPPaOY1SIb7kNcCy+YL7SH7deiY/ZfSckQaBJenTktOBRrN9mt/6GGncHrq48Oo
         djVdO8ET7y+2+9YJfUNdYFYRfkLFVxRCy1YZrt1oIcgW1ICb55rv/Pgr48RJF++3dz3Y
         JxZzdkUys1EmpbXLiwMJ+ZR6ZeNSawVAGQo2UZqGiswQ/eXxswKXBeOO7nlrkAn5nMfu
         r0Mvhssb5cvEYbkLCzW5WO7kyfArTScwa8x35TBzdJ+OgRlyiK9gw0u1K+f9DjPjbPu2
         1GBw==
X-Gm-Message-State: AOAM531zbwHMzTeJsGyWMKYreS2GI7YYU5XaDnTMXGYcFsrClIeezu/s
	whYoVfEwJ7bAAfeyYB35XpdkrG2+k9lSPUXL6EQ=
X-Google-Smtp-Source: ABdhPJwJvtf//7sCvANUdwsQ68Mz2xgJl4mfLPTdHmtQXVrmtgfRxb9Em9+JEyHOZAY06RWRBtvVpU9kXBPWpL8Oq5s=
X-Received: by 2002:aca:5d04:: with SMTP id r4mr3100688oib.43.1612889274247;
 Tue, 09 Feb 2021 08:47:54 -0800 (PST)
MIME-Version: 1.0
References: <CAGi-RUJUdQf4LtsYusmzDH-FSpuq=6ZvEpyPBJkj3=XojqR4kw@mail.gmail.com>
 <CADkTA4Pd=bHOz7yNsQPHPsxtps=A_HwWp4yN7k_n-9jeSY=t0Q@mail.gmail.com>
In-Reply-To: <CADkTA4Pd=bHOz7yNsQPHPsxtps=A_HwWp4yN7k_n-9jeSY=t0Q@mail.gmail.com>
From: "Ramon Fried" <rfried.dev@gmail.com>
Date: Tue, 9 Feb 2021 18:47:43 +0200
Message-ID: <CAGi-RUK2Q=d0GwqX7o3ARag8TFsxxR3kG=FX9ppv=wrxTzWD3g@mail.gmail.com>
Subject: Re: [OE-core] libsystemd is missing ?
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

> Did you try putting "systemd" in the DEPENDS of the recipe ?
Yes, that was the problem. thanks !.
Ramon.
