Return-Path: <goledhruva@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5228BC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 06:18:54 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web09.57629.1638166721360569755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 22:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e30kIj9x;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: goledhruva@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id x32so39088163ybi.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 22:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=u3AqSrtgjpqzSr9inSivzOZyzaqQxPVOBDLbiPYb6IM=;
        b=e30kIj9xNk66fm1wqfQPIxQgh9a1oCgVKVBVqvf6IEiJ6bKgVd/e0ZEIBsHj1TFXgc
         sm5riMxnNsEvIlGh1I6zu1bPbb2VjOgBfgHEBfhvNLyIFB1RiNT/SLhxFcrUDP27Sq9T
         qi0AX8O2/KamforrEgC+ka9IBbn16VI8bESuwWWNPeNZiL47giKgTBT55jGy5ilixhgz
         cGG9z1Q0g9icI9dkOMH3GDX3GXiVS55hxehDqQpZzwxwgfdxg3I05oO/YHCZVvmmAi9P
         IRHfBKtuy8ETQbLWAqhDI3YuhDSZGGVB9E8GIuc6RW3XtgKx4p1zv5jwzE4sTSRWLwsg
         DsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=u3AqSrtgjpqzSr9inSivzOZyzaqQxPVOBDLbiPYb6IM=;
        b=miimuj/LkUU1WZcLyFzDvI6ui3HOilplafT2tZNHI9ZQ1NRQxRLI3pN10exn1skFR0
         NnRuSzWC7Sau8sBEl6KcixIK1IHfDzA2GE0OCOPEqJgHu90v0FASnHWnCtxKZ3Nu1wAF
         OKaulTbuxP9RfF7kjZcJjjlrzI1IviEZKjj33A/NY1fmKormOBEliTBtAnykmoeGSG24
         cdE0orl0he6xn5RDzJxGH3BWjDqNxxY81xoWz5aIwP3yO+66Gs8KyrN7hPwpGS88uhzw
         wbPiQCjX+tg9Fkm4CJDCnRtS3rwRM97LzZiKWYWQcq7ixIkqQhgcZxcNVbTOrVBZ9Q5M
         W0nQ==
X-Gm-Message-State: AOAM533mzDHF/Z1DHwroPL4iLJqrLXnqVBlMEMYy8HipWh00RYj94EO9
	1T2pMTmWUTDJ7hx44uQSOmYanDrEKlpLbrVr63i5/5/gAzh7bw==
X-Google-Smtp-Source: 
 ABdhPJxiY2qX8Tnm/fuO3F/sMIAwZtBih8uJndW8lIDeREwlNx86GhQrX50+X8Qbo7GvQMx/q/v9+NrMmD0gsPrWaY0=
X-Received: by 2002:a25:69c3:: with SMTP id
 e186mr31442602ybc.249.1638166720356;
 Sun, 28 Nov 2021 22:18:40 -0800 (PST)
MIME-Version: 1.0
From: Dhruva gole <goledhruva@gmail.com>
Date: Mon, 29 Nov 2021 11:48:29 +0530
Message-ID: 
 <CALQfBwyaboT35pkQHjhXVDrFy9+VbX6c19vcfZdQaz4TR_-NKg@mail.gmail.com>
Subject: bug#11131: Email Address Check
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000073269a05d1e76985"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 06:18:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158927

--00000000000073269a05d1e76985
Content-Type: text/plain; charset="UTF-8"

I am currently writing a patch to address the bug, in which I have so far
done the maintainer and patch strings check in READMe.
However I had doubts on how the community would like me to implement the
email address checker.
One way is:
I referred to this:
https://stackoverflow.com/questions/8022530/how-to-check-for-valid-email-address/28982264#28982264
and found the following code could be useful:

from validate_email import validate_email
is_valid = validate_email(email_address='example@example.com', \
    check_regex=True, check_mx=True, \
    from_address='my@from.addr.ess', helo_host='my.host.name', \
    smtp_timeout=10, dns_timeout=10, use_blacklist=True)

Other way: (simple check)
is to just use the python re library as given here:
https://www.geeksforgeeks.org/check-if-email-address-valid-or-not-in-python/


Please let me know which approach would be preferred.

--00000000000073269a05d1e76985
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am currently writing a patch to address the bug, in=
 which I have so far done the maintainer and patch strings check in READMe.=
</div><div>However I had doubts on how the community would like me to imple=
ment the email address checker.</div><div>One way is:</div>I referred to th=
is: <a href=3D"https://stackoverflow.com/questions/8022530/how-to-check-for=
-valid-email-address/28982264#28982264">https://stackoverflow.com/questions=
/8022530/how-to-check-for-valid-email-address/28982264#28982264</a> and fou=
nd the following code could be useful:<div><pre class=3D"gmail-lang-py gmai=
l-s-code-block" style=3D"margin-top:0px;padding:12px;border:0px;font-varian=
t-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;line=
-height:1.30769;font-size:13px;vertical-align:baseline;box-sizing:inherit;w=
idth:auto;max-height:600px;overflow:auto;border-radius:5px"><code class=3D"=
gmail-hljs gmail-language-python" style=3D"margin:0px;padding:0px;border:0p=
x;font-style:inherit;font-variant:inherit;font-weight:inherit;font-stretch:=
inherit;line-height:inherit;font-family:inherit;vertical-align:baseline;box=
-sizing:inherit;background-color:transparent;white-space:inherit"><span cla=
ss=3D"gmail-hljs-keyword" style=3D"margin:0px;padding:0px;border:0px;font-s=
tyle:inherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;=
line-height:inherit;font-family:inherit;vertical-align:baseline;box-sizing:=
inherit">from</span> validate_email <span class=3D"gmail-hljs-keyword" styl=
e=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inhe=
rit;font-weight:inherit;font-stretch:inherit;line-height:inherit;font-famil=
y:inherit;vertical-align:baseline;box-sizing:inherit">import</span> validat=
e_email
is_valid =3D validate_email(email_address=3D<span class=3D"gmail-hljs-strin=
g" style=3D"margin:0px;padding:0px;border:0px;font-style:inherit;font-varia=
nt:inherit;font-weight:inherit;font-stretch:inherit;line-height:inherit;fon=
t-family:inherit;vertical-align:baseline;box-sizing:inherit">&#39;<a href=
=3D"mailto:example@example.com">example@example.com</a>&#39;</span>, \
    check_regex=3D<span class=3D"gmail-hljs-literal" style=3D"margin:0px;pa=
dding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight:in=
herit;font-stretch:inherit;line-height:inherit;font-family:inherit;vertical=
-align:baseline;box-sizing:inherit">True</span>, check_mx=3D<span class=3D"=
gmail-hljs-literal" style=3D"margin:0px;padding:0px;border:0px;font-style:i=
nherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-h=
eight:inherit;font-family:inherit;vertical-align:baseline;box-sizing:inheri=
t">True</span>, \
    from_address=3D<span class=3D"gmail-hljs-string" style=3D"margin:0px;pa=
dding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight:in=
herit;font-stretch:inherit;line-height:inherit;font-family:inherit;vertical=
-align:baseline;box-sizing:inherit">&#39;my@from.addr.ess&#39;</span>, helo=
_host=3D<span class=3D"gmail-hljs-string" style=3D"margin:0px;padding:0px;b=
order:0px;font-style:inherit;font-variant:inherit;font-weight:inherit;font-=
stretch:inherit;line-height:inherit;font-family:inherit;vertical-align:base=
line;box-sizing:inherit">&#39;<a href=3D"http://my.host.name">my.host.name<=
/a>&#39;</span>, \=20
    smtp_timeout=3D<span class=3D"gmail-hljs-number" style=3D"margin:0px;pa=
dding:0px;border:0px;font-style:inherit;font-variant:inherit;font-weight:in=
herit;font-stretch:inherit;line-height:inherit;font-family:inherit;vertical=
-align:baseline;box-sizing:inherit">10</span>, dns_timeout=3D<span class=3D=
"gmail-hljs-number" style=3D"margin:0px;padding:0px;border:0px;font-style:i=
nherit;font-variant:inherit;font-weight:inherit;font-stretch:inherit;line-h=
eight:inherit;font-family:inherit;vertical-align:baseline;box-sizing:inheri=
t">10</span>, use_blacklist=3D<span class=3D"gmail-hljs-literal" style=3D"m=
argin:0px;padding:0px;border:0px;font-style:inherit;font-variant:inherit;fo=
nt-weight:inherit;font-stretch:inherit;line-height:inherit;font-family:inhe=
rit;vertical-align:baseline;box-sizing:inherit">True</span>)
</code></pre>Other way: (simple check)</div><div>is to just use the python =
re library as given here:=C2=A0<a href=3D"https://www.geeksforgeeks.org/che=
ck-if-email-address-valid-or-not-in-python/">https://www.geeksforgeeks.org/=
check-if-email-address-valid-or-not-in-python/</a>=C2=A0</div><div><br></di=
v><div>Please let me know which approach would be preferred.</div></div>

--00000000000073269a05d1e76985--

