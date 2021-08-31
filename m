Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.9807.1630433910750211880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 11:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ouJbnSus;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id r7so12212008edd.6
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 11:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DqnMyNR9sp7BPWbg62lBJQa16lS3M89zuo6EflD5a1o=;
        b=ouJbnSusol41gbSRm9wMjjoqZC12cJyqKH//foMTpMeSNnHom6ZZmqir+lBtAcYqjA
         lX17O5q8MPSwEIhlezVpNDSb9c3HP2uxe9WHfbeXhGLdGRARHzv3jQgEvdrYlCOYXXaz
         LHsIEM9YvSwPMwi+8FaaETbbKmOJqRj52V0YYvC+PcXYOxstI13HXboA/GwDyOA76yc/
         uWcbG/r080zhbOlDep0UAeCox33p2YeQA7M253TV0A6p+i/XYcZXPG/Xb0jHE97XSXIm
         Nr/gcpPlspIN/l9bqsp8Uqg/USqIXqh/gXt5/Qrmu7QxvP7VesiiC+v8ybEV3yFeF0K4
         Gf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DqnMyNR9sp7BPWbg62lBJQa16lS3M89zuo6EflD5a1o=;
        b=qWSpDTbsBMbr86VX6aDJFZ7ZnBmspNUhc9QZtyoluasSaCwP/VMecBjALyqGZWMkAQ
         CFKbTAynDGhXdfRys195rZmOBI3wt37CuQZQ3itjFcKRLSmYIDUpeZyyPjM3oK6Wa85e
         AuLU+vQ4c09FkQwH7HU9dGEMnzTRwWcekbMzodnvv0p4alnFpArjb1+/tc9LnQCMKGz1
         LJyhOZ4GijEP2JLc/xAkq4TiMBMAN/vHPIKEeEkCS50sJkeQTgkYghOzJv2vPB/FOg1S
         5Ti+Ps3yIKy6H4zOkld8KAbelLlMd7gCBt2Y9uSDxj1+nCT6TJfPc9Z6mVNreKAPjdqB
         Gyxg==
X-Gm-Message-State: AOAM530tGIsGQd9ALOyWD/mCaonWpxzot+rg0cUd5XHHLl4Nquypouxr
	O4ffkECkoYa2N3NNOaJllY8yZq9RaLQY9M2JqDA=
X-Google-Smtp-Source: ABdhPJxgEZFpgDZMHHjFr6Pgy3vPpdutjRvjLyQw7r/PKPDYh0ELsEyTqZUn8bEUbB6iDyNHbRlaZGPVb6YUK6OriCA=
X-Received: by 2002:a05:6402:c9:: with SMTP id i9mr30217897edu.76.1630433909259;
 Tue, 31 Aug 2021 11:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <169FF34664D4ACC1.22970@lists.openembedded.org>
 <169FF42BF9440142.22970@lists.openembedded.org> <f1f1ee17-1f81-8791-b87e-3692a0cafe2a@windriver.com>
 <5dee0c30-b658-b730-44ee-a9c2159d21e7@gmail.com>
In-Reply-To: <5dee0c30-b658-b730-44ee-a9c2159d21e7@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 31 Aug 2021 20:18:18 +0200
Message-ID: <CA+chaQehkDRb1PDX9nVq_XCYiqEw2vb-a2T0vNBri3x_T82zdQ@mail.gmail.com>
Subject: Re: [OE-core] Upgrade uninative to fix multiple native build failures in old unprivileged docker
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: hongxu <hongxu.jia@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000fdbf6105cadef99c"

--000000000000fdbf6105cadef99c
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 31, 2021 at 7:58 PM Robert Berger <oecore.mailinglist@gmail.com>
wrote:

> Hi,
>
> I just experienced this problem in Docker version 19.03.13, build
> 4484c46d9d
>
>  > $ bitbake pkgconfig-native
>  > | configure: error: I can't find the libraries for the thread
>  > implementation
>  > ...
>
> Can you please tell me what patches I need to apply to get this to work?
>

https://lists.openembedded.org/g/openembedded-core/message/155465

and rebuild new uninative tarball with this applied.


> How will this be handled upstream?
>

Hopefully v20.10.9 docker will be released soon with:
https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594

--000000000000fdbf6105cadef99c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Aug 31, 2021 at 7:58 PM Robert Be=
rger &lt;<a href=3D"mailto:oecore.mailinglist@gmail.com">oecore.mailinglist=
@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I just experienced this problem in Docker version 19.03.13, build 4484c46d9=
d<br>
<br>
=C2=A0&gt; $ bitbake pkgconfig-native<br>
=C2=A0&gt; | configure: error: I can&#39;t find the libraries for the threa=
d<br>
=C2=A0&gt; implementation<br>
=C2=A0&gt; ...<br>
<br>
Can you please tell me what patches I need to apply to get this to work?<br=
></blockquote><div><br></div><div><a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/155465">https://lists.openembedded.org/g/opene=
mbedded-core/message/155465</a></div><div><br></div><div>and rebuild new un=
inative tarball with this applied.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
How will this be handled upstream?<br></blockquote><div><br></div><div>Hope=
fully v20.10.9 docker will be released soon with:</div><div><a href=3D"http=
s://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594">h=
ttps://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594=
</a></div></div></div>

--000000000000fdbf6105cadef99c--
