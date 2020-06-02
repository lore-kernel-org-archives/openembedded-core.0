Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web10.5554.1591082418987835701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 00:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KD+U93Go;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id r11so1466020vsj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GSLW5oFySbnRgd44r1HnNeuNzNWDe0JjKvC5uC+gHjg=;
        b=KD+U93GoLHALDFtye8xjVNZo0FKboe+MWYp28XbOz8JaYx0UhSazZW2FbtGEqVNM4u
         oLCDCHZ4jBi4K+90ZZ+RX4VFduNCRDjRKd7r25SxHHlS2CQDopBhFk8NQ31XOBGNvC/M
         PXagpIgKQAvAfDCa0DOzIcAJbAw9IJrj0mKwmLCN1Ry3Kkuq2hZpPnJ5bA+gOL7EO4hs
         GgMBXoKxFm5EA24CTd3oHd0hhNIqNE6VJxYwv68rllV5FSyhZkEWWJLOM4fX1RSfliln
         qgbUub67cMXAtW43OsNY0biGwr8RXT81auPrP/xJx5PpefrftDXcSsi4odNG29vao/G1
         hCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GSLW5oFySbnRgd44r1HnNeuNzNWDe0JjKvC5uC+gHjg=;
        b=ACyKs2iw9Bn8qpkRASfdWNb4PxW1SN9cgoJ3AL5eR8TxeFbTwbXIpTc0ZtCkUCIsha
         kzxUuLcDYWLUGebmDrjuYpNtVwZbc5WpWiEhdk8Pl0r66+o30iYQ/VQ8CK2518Btwyrl
         5q8Yr2Yha0FGaDRjNkt9isf7aeen7sWvEBXJDf0RytbZ22GyQbP0lHOXRf6RSRWIVBCP
         NgLZpcDccNO9H6qaKjbtEVGbeT4sCZnn7K/eHPASoTwulHkbuToc5q4frq0CFU+sz2YA
         wept3TwARQcQgDULdtuWHUv+B9ddnFqrlr2vO122jOAsA/dvzOgANHgMrglkhuczGA1E
         FIkQ==
X-Gm-Message-State: AOAM532CZ2XvMMf2BRwhGbwBX3gLvFdecsRYutfimlU9sevkbTeLFIHS
	DbNd1PebTqxAjj1U+mdCy9C2nDtW3ylqU2O3GTDi0aG+
X-Google-Smtp-Source: ABdhPJxWhh4jKy8kvdGKvGQzyTFP7Fpmisnotob1Tj0yN45+GWVGVemLzO/3OmS1vYcTp1yCc5zjoTOUH3kfAEa1Vis=
X-Received: by 2002:a67:d098:: with SMTP id s24mr16864650vsi.25.1591082418223;
 Tue, 02 Jun 2020 00:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-25-alex.kanavin@gmail.com> <CAMKF1soXy1fbdSiN0+MCawu3yttoVzarN3jk6bh8he70g3BGSw@mail.gmail.com>
In-Reply-To: <CAMKF1soXy1fbdSiN0+MCawu3yttoVzarN3jk6bh8he70g3BGSw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 09:20:05 +0200
Message-ID: <CANNYZj9ApWq5+9UOkurNEPoCAnTzZRU1iFM=EkYRoGwtmOpV0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/70] stress-ng: mark as incompatible with musl
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000058be4f05a714beda"

--00000000000058be4f05a714beda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Jun 2020 at 05:39, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
>
>> Newer versions make use of ustat() which is absent in musl.
>>
>
> https://www.man7.org/linux/man-pages/man2/ustat.2.html
>
> Says it=E2=80=99s removed from glibc 2.28 as well and yes musl never ship=
ped
> ustat.h so I wonder how it still
> Works on glibc
>

I think stress-ng pokes into members of struct ustat (daddr_t in
particular), which works on glibc, but doesn't work on musl.

Alex

--00000000000058be4f05a714beda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 2 Jun 2020 at 05:39, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Newer versions make use of ustat() which is absent in musl.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"=
https://www.man7.org/linux/man-pages/man2/ustat.2.html" target=3D"_blank">h=
ttps://www.man7.org/linux/man-pages/man2/ustat.2.html</a></div><br></div><d=
iv dir=3D"auto">Says it=E2=80=99s removed from glibc 2.28 as well and yes m=
usl never shipped ustat.h so I wonder how it still</div><div dir=3D"auto">W=
orks on glibc </div></div></div></blockquote><div><br></div><div>I think st=
ress-ng pokes into members of struct ustat (daddr_t in particular), which w=
orks on glibc, but doesn&#39;t work on musl.</div><div><br></div><div>Alex<=
br></div></div></div>

--00000000000058be4f05a714beda--
