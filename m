Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.1733.1607022753567880233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E0PQG8HK;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id q5so1898642vsg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ZKwEW1KUk+r6q/UZ6HaUmZ7cWaqiTLF+C6wzhLr/Dg=;
        b=E0PQG8HKgP+eZeDkmUbOhjZpkh99VY/lOHeO2OsQn3ZGobbuWAE/aO9r3sgXg1+pAu
         LcuABOrEKZ/boSqagA/Yo6yvfnPvW82OkVtUiDUi54TCz4GGZYmj80M7r4W2Z44Ok6lK
         8/fjybVSRw0PVn5dphtRJOxS7uKibFufUvcGLvXwfmtNFUL1R8mC1bw6nIAxLMAvGHXw
         rrtbpwey/yjirsUQVh+VrVuMwggrb7KC+qHo+wKzh+SWw9gVi22c0DtS9y9/0608NVTa
         NKubRoVoerCg0CaWfNdBcF4/iVQ94oFemUKD6ql/s0/7Pe3HtkGcJUHCAjG2qPML+vyK
         6Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ZKwEW1KUk+r6q/UZ6HaUmZ7cWaqiTLF+C6wzhLr/Dg=;
        b=UByF3OP7KYlhNtQ9QaTe5MWXUMpAxwD99TzXvS88T84s8i9LkSKh3lc3gUo0hbVwdV
         q/5Cq3JzwY9i10sXzMLS4XQhEztUGxZkczpuhrAcYPP77ymiavEZSBoUGIM4aGEA3Wp/
         qM2TXcDFGFO3rZpMUc4lmICiNmK73igYBwEPCeAUaqCao9ccRsrWcfBUwabGfMlh3v+k
         wd0rBtM4RkljARBAstCCU+W8aaDShwFeG1QjEElPU10skpmXUjIAeTBesZY7/d1WOaYg
         Kvkno6Tb2mQmW5g9A/AkpWCu97xLcDNEQo75IVbwWC4SwegcAlW0MNCxHn9bYC9T7i3o
         vbxQ==
X-Gm-Message-State: AOAM531ks9qZSkGnSCssH/dENfFzRvMVgsnal+PCBkFNBpuSwRPCaXRU
	YC40Z54gsKBOOtg+rlVyLPztdiQpIi8Wlv1sKCc=
X-Google-Smtp-Source: ABdhPJz7F6TB4LWRPfW4gKvtZ4e4r5FTKxgN04zGRlhbSyZxJag5iJ/RwIHFpCFY/SbSXh4iU4kb5lQar8RO8WyCI38=
X-Received: by 2002:a67:7902:: with SMTP id u2mr270384vsc.41.1607022752715;
 Thu, 03 Dec 2020 11:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-2-alex.kanavin@gmail.com> <CAMKF1spavgHqm9YuCqo3mr-=kRGzW-J60T4gTQ5=uoBn98Hb9Q@mail.gmail.com>
In-Reply-To: <CAMKF1spavgHqm9YuCqo3mr-=kRGzW-J60T4gTQ5=uoBn98Hb9Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Dec 2020 20:12:21 +0100
Message-ID: <CANNYZj_FvTGSUtBoEi_Nc=jA4szr1WrPNQSwjRuuawuJ7H6-rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] kea: fix reproducibility
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000052571905b5942476"

--00000000000052571905b5942476
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Dec 2020 at 20:07, Khem Raj <raj.khem@gmail.com> wrote:

>
> does this test then work or do we also need to ensure that
> KEA_LOCKFILE_DIR is set to somewhere in /run dir
> via Compiler flags or some such
>

As we are not executing the test, it does not matter, and it would not have
worked on target anyway as it hardcodes the build path. If someone wants to
work on the tests, they can look into it properly.

Alex

--00000000000052571905b5942476
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 3 Dec 2020 at 20:07, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
does this test then work or do we also need to ensure that<br>
KEA_LOCKFILE_DIR is set to somewhere in /run dir<br>
via Compiler flags or some such<br></blockquote><div><br></div><div>As we a=
re not executing the test, it does not matter, and it would not have worked=
 on target anyway as it hardcodes the build path. If someone wants to work =
on the tests, they can look into it properly.</div><div><br></div><div>Alex=
<br></div></div></div>

--00000000000052571905b5942476--
