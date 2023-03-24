Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37830C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 14:32:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.102627.1679668369849411689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 07:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmsfiJWT;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id l12so1977330wrm.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679668368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=91q21DhDBayG5HSDSqqH82O4rHwcUTHgA21dgS25xYg=;
        b=TmsfiJWTzDSWqIjrOIPf2FWCT39fT9UruikJpXah79v4jRX8Td4TMhiERy+xxgnTg7
         G9wdTayXMJOETToPPMbYERlZXZgJ42Nwol5zOQkhEFGbHqG5KBjrAmq1LmWfx06GCBXA
         RWZeuqLU1yKDxlNnvvbM9iYuJkAmtvkxQy5PcPXGiJpFKoha0Eo4CjJEaDwAzhzoAuyM
         8USzeG/lhVgCOh6P5GzwMsr1E6GXNdcls7Ir2fnnA6qYB5UHUbxab7Ndcm9F7uIOfT8U
         MmfVA4PdGrNDZCoNgeakvL972IvIh+1X0cRztFbrwVbknDlKLyVHe7FP4aPMGWfaVfH7
         oytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679668368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91q21DhDBayG5HSDSqqH82O4rHwcUTHgA21dgS25xYg=;
        b=Vo6u4IeNkdET6FRuJ7lStJA2NiEUwJPqErxPKSjRgHTuCcMNDHKr8z9xKoowwwfJsG
         QdBcTQzMKqJd2LNv1iWElXvLKYZGvGt9TLjEc+9awTrPQ5DBbGN6nhYPa1Rxaa09xrtr
         eKtgao7dTU5hQmLwkzbVhALAQyxjbbhAZ8ySXkOT0G7iWZGNGDeE6gos2fabOSBySo8Q
         yWwYL7zhPht7cjOdaqtdFfofFpQX514Clso45PgJaunxKx+mmW0f8RjrQmC6xFuN/c0z
         JYAmycAE71LEwDSCBXZ1WIkmbieScMohusb3kgfZcHVOu85SBeNnLuMa0aFU4/S+V4J8
         qmlQ==
X-Gm-Message-State: AAQBX9chAvE6E2HKo608x1+gVh92Kscp+BzZS/mwqalvJIpIRSJQag4s
	i66u14bA0ewBWT6bFkZ8UGfNXZ9qtvk2SXhOiRk=
X-Google-Smtp-Source: AKy350ZISdwM7Pb1G89YyQ5t1ALuoyXKIsveozBxpx42MStMn0JSGRzD80cavakpvwPYtE2Mx67CLcpdSx52dyAWaEo=
X-Received: by 2002:a05:6000:1d2:b0:2ce:a0c2:d9ee with SMTP id
 t18-20020a05600001d200b002cea0c2d9eemr546260wrx.1.1679668368259; Fri, 24 Mar
 2023 07:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230314180004.203287-1-raj.khem@gmail.com>
In-Reply-To: <20230314180004.203287-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Mar 2023 15:32:33 +0100
Message-ID: <CA+chaQdmy9rg02AFg+TCtaEZaN9Ghs7ws5sXUrJ3AVjqr1kiAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemtap: Disable dangling-pointer warning
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e3efb05f7a644a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 14:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179038

--0000000000006e3efb05f7a644a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 7:00=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> This is to fix build in RISCV64
>
> | In constructor
> 'symresolution_info::symresolution_info(systemtap_session&, bool)',
> |     inlined from 'int semantic_pass_symbols(systemtap_session&)' at
> ../git/elaborate.cxx:1884:28:
> | ../git/elaborate.cxx:2601:21: error: storing the address of local
> variable 'sym' in '*s.systemtap_session::symbol_resolver'
> [-Werror=3Ddangling-pointer=3D]
> |  2601 |   s.symbol_resolver =3D this; // save resolver for early PR2584=
1
> function resolution
> |       |   ~~~~~~~~~~~~~~~~~~^~~~~~
> | ../git/elaborate.cxx: In function 'int
> semantic_pass_symbols(systemtap_session&)':
> | ../git/elaborate.cxx:1884:22: note: 'sym' declared here
> |  1884 |   symresolution_info sym (s);
> |       |                      ^~~
> | ../git/elaborate.cxx:1884:22: note: 's' declared here
>

FWIW: this isn't specific to RISCV64, I had the same in my branch for a
while and I was seeing it on qemux86:

But it was introduced only in newer gcc-13 snapshots, from my commit
message:

    * since newer gcc-13 snapshot it detects dangling-pointer and fails due
to Werror
      git/elaborate.cxx:2601:21: error: storing the address of local
variable 'sym' in '*s.systemtap_session::symbol_resolver'
[-Werror=3Ddangling-pointer=3D]

    * the check was improved recently, probably in one of these:
        gcc $ git log --oneline
a1292514f898e3d3f34fd843b967f72b779aaa88..6aa1f40a3263741d964ef4716e85a0df5=
cec83b6
| grep -i dangling
        fdac2bea53b -Wdangling-pointer: don't mark SSA lhs sets as stores
        916ce577ad1 libstdc++: Implement P2255R2 dangling checks for
std::pair
        d482b20fd34 warn-access: wrong -Wdangling-pointer with labels
[PR106080]

--0000000000006e3efb05f7a644a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Mar 14, 2023 at 7:00=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">This is to fix build in RISCV64<br>
<br>
| In constructor &#39;symresolution_info::symresolution_info(systemtap_sess=
ion&amp;, bool)&#39;,<br>
|=C2=A0 =C2=A0 =C2=A0inlined from &#39;int semantic_pass_symbols(systemtap_=
session&amp;)&#39; at ../git/elaborate.cxx:1884:28:<br>
| ../git/elaborate.cxx:2601:21: error: storing the address of local variabl=
e &#39;sym&#39; in &#39;*s.systemtap_session::symbol_resolver&#39; [-Werror=
=3Ddangling-pointer=3D]<br>
|=C2=A0 2601 |=C2=A0 =C2=A0s.symbol_resolver =3D this; // save resolver for=
 early PR25841 function resolution<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~^~~~~~<br>
| ../git/elaborate.cxx: In function &#39;int semantic_pass_symbols(systemta=
p_session&amp;)&#39;:<br>
| ../git/elaborate.cxx:1884:22: note: &#39;sym&#39; declared here<br>
|=C2=A0 1884 |=C2=A0 =C2=A0symresolution_info sym (s);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~<br>
| ../git/elaborate.cxx:1884:22: note: &#39;s&#39; declared here<br></blockq=
uote><div><br></div><div>FWIW: this isn&#39;t specific to RISCV64, I had th=
e same in my branch for a while and I was seeing it on qemux86:</div><div><=
br></div><div>But it was introduced only in newer gcc-13 snapshots, from my=
 commit message:</div><div><br></div><div>=C2=A0 =C2=A0 * since newer gcc-1=
3 snapshot it detects dangling-pointer and fails due to Werror<br>=C2=A0 =
=C2=A0 =C2=A0 git/elaborate.cxx:2601:21: error: storing the address of loca=
l variable &#39;sym&#39; in &#39;*s.systemtap_session::symbol_resolver&#39;=
 [-Werror=3Ddangling-pointer=3D]<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 * the c=
heck was improved recently, probably in one of these:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gcc $ git log --oneline a1292514f898e3d3f34fd843b967f72b779aaa88=
..6aa1f40a3263741d964ef4716e85a0df5cec83b6 | grep -i dangling<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fdac2bea53b -Wdangling-pointer: don&#39;t mark SSA lhs se=
ts as stores<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 916ce577ad1 libstdc++: Implemen=
t P2255R2 dangling checks for std::pair<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 d482=
b20fd34 warn-access: wrong -Wdangling-pointer with labels [PR106080]<br></d=
iv></div></div>

--0000000000006e3efb05f7a644a8--

