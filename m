Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web09.28807.1623017193485950769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pUrDBlnu;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id p9so519743uar.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBcrIz81TtI22WNzpk163iv0oV1NhhzL3tEgBjm6MmM=;
        b=pUrDBlnu92nTmpM0PQ9eNGlyiAOVklX/3zlD9dJbZ/NO9VHR0RI2ifMu/caIhcujKk
         PZk2CAMUBeQnocvu8lXRZzi6EzHLyPH6nkvs0A5gbkuvz0M50MfgYGSq1H0PZrV8OZq4
         0nwPC47292LibJKl+IsPiY9rauxnvFB76kt3nnxTit1N3soHRI4Hw5g5+ntQqm66vX/E
         gKwKG5X2pK7e8k+oFQuUhCAiVcr7mI8zHBwFURdWmTqnAsJpLkLoNGZSsqYz+k8cGmkY
         QtvhdoJEnFRTlJ+qt4ogsjSypegUWPsZGt/7kWGDF/YiM8M4wArZDR97U6KLTv5I+N7E
         z7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBcrIz81TtI22WNzpk163iv0oV1NhhzL3tEgBjm6MmM=;
        b=qsM6T8FyZvnkVwWsJWzjzMBys2imdrNU6/oO3xo4ju20OT28ENIUL9e/ex42E4D0j8
         Qtw8hB4XbHCSd/nW4+Suy7jkI7jrtU1PwscBwh5BqNtmqUVUw2wKR4Nh7BQ0LusGG5jM
         z12Jbl2TNGNeWx6xZpTKVgH8+q2oA8uZmQZzN+pHV7+TtVWMosjAzOsCLpLD4Z4cxpno
         tGZexBF8zEHKZmF9k3iQ48p13RewbXGMNe9NWaABtvkETmgc3iabhgJqOmeZx/IiavXs
         26b4Nbgoqzr0m2rgLJ1VK2zw26wDHiV4fMokGahrvimmFC6qJiHLduLF5rN030//nPae
         PKtw==
X-Gm-Message-State: AOAM531OUMKxd8AUvgia5201W5SVvHPr1ohpIAA2c93fhNi55zDW1nzH
	lPx3yJhVpN7IC9Sw6bGqueOpofoFw37Dm+umTO8=
X-Google-Smtp-Source: ABdhPJx7eF25S/1aNDCuE9RGarOtdThPwCvEgX3vYokXCJ0myf81Kcr0Nlx3JfPQ9dnJRK7dpPYyZ1x3wjXFvtYUAAQ=
X-Received: by 2002:a1f:1d4a:: with SMTP id d71mr6826856vkd.0.1623017192667;
 Sun, 06 Jun 2021 15:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com> <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
In-Reply-To: <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 7 Jun 2021 00:06:21 +0200
Message-ID: <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003bbc4d05c42023a5"

--0000000000003bbc4d05c42023a5
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Jun 2021 at 23:51, Khem Raj <raj.khem@gmail.com> wrote:

>
> Good sleuthing.  Can you find out if libseccomp is in play ? if so
> what version of libseccomp is being used by cmake if it is libseccomp
> < 2.4.2 then time64 syscall support won't be there unless
> its backported to the older version.
>

From what i could tell cmake does not use libseccomp, but centos8 could
have some kind of syscall filtering in place. It would be good to try with
a few older centos8 kernels.

Alex

--0000000000003bbc4d05c42023a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 6 Jun 2021 at 23:51, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
Good sleuthing.=C2=A0 Can you find out if libseccomp is in play ? if so<br>
what version of libseccomp is being used by cmake if it is libseccomp<br>
&lt; 2.4.2 then time64 syscall support won&#39;t be there unless<br>
its backported to the older version.<br></blockquote><div><br></div><div>Fr=
om what i could tell cmake does not use libseccomp, but centos8 could have =
some kind of syscall filtering in place. It would be good to try with a few=
 older centos8 kernels.<br></div><div><br></div><div>Alex<br></div></div></=
div>

--0000000000003bbc4d05c42023a5--
