Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.14365.1611076593899690262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ves-solutions.com header.s=google header.b=HDXir4OY;
 spf=pass (domain: ves.solutions, ip: 209.85.160.176, mailfrom: alan.kozlay@ves.solutions)
Received: by mail-qt1-f176.google.com with SMTP id e17so5100862qto.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ves-solutions.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=aKFUJrBjvMiAY3Nd104+w7D2I6RaOFov0T+BkB/+fJ8=;
        b=HDXir4OYoU4H1VUkSPfPm3Wt9P9gXcL+4jXHTy3hyi8PMXeQbftCmDD+TkqUfj8onV
         FX2wXGf8fp8Q01d13jqe7UO+raksdhdkvX29SWI0DTdY/YpeS7vaq/oZ++hSnrG5X5KU
         5ixrJ23ZXNRe98w9gYXfgX1EpJhf0eo0shFBkujZWLtl7z2zy0AfjxatJVLIdCAiOsif
         WIUhKEZdSJT0gfbHo82A4yNLIrtKy+CO5Sa6cVQtyVY6ila4JvvW+WRYhP29Kg+so3au
         7J7/2PpVoFOhPEYPlm3e9kbaH9+HAn/WdWXtD6rXefBW7V2nc/Zu2jd9d+2bj8TXOlxo
         VglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aKFUJrBjvMiAY3Nd104+w7D2I6RaOFov0T+BkB/+fJ8=;
        b=AJzbcIlRb4UWr41xNUGWQaupJozbB85ixqaEOZ3bvJ2Bv2ud+w7B0AxSens6Glct8G
         7Dj26aLRQdWMl4eqrJT8f622K8Q0jfkExIno6mP5V18BPPf5h87ssrMj+CteqZgAsJqH
         SiEABsX/k8PEdS0rSg/AsDgQjx0zvqA2xdf8dXUtntcVW2+xOOnvwF5mj4zPkulgVGpN
         Y3cfPypvVnNJI468SF3UORW0/thYfVAAEoRb0kufAj0aOVAs6R+Og9O9cVdKSX1Q0UZI
         bdpIPGIRY6shYGnwo7Mw8H9pk5FMoEosgfN6jQBEa4h27tlF7LXjQOfh+LNRvvEoq9Ug
         br0g==
X-Gm-Message-State: AOAM533CFa9rhesa87CjQpZfDUm7SBsrvbTnVt3TxTPBMhdmM/z1EvL0
	2juN4OFWjn/+V3f4qszVTcGVmVgKpoS5WjOWb5L4nVAYL5mOZcnDuPDwcZyagp6HMphUoNbZ3XU
	P+PG6GyHiF0T0ultuOxa/bns/Svp0TChKxaTpnWy+wY2jHI3D15o8WGdYRg==
X-Google-Smtp-Source: ABdhPJz9ZRkoPBBnpVnmCkjs1uHtbVY33pBBdVwe2EWD2szQSjw6brtSkJQWXmjM0SN7bMzsa18kznrjaq0S9DM+Kao=
X-Received: by 2002:aed:3064:: with SMTP id 91mr5115993qte.151.1611076592769;
 Tue, 19 Jan 2021 09:16:32 -0800 (PST)
MIME-Version: 1.0
From: "Alan Kozlay" <alan.kozlay@ves.solutions>
Date: Tue, 19 Jan 2021 12:15:56 -0500
Message-ID: <CAJE9sGmu6VUQGBtxpDHh6RH9B44DRfeuSNrMrB4Ea5N1GWLFhw@mail.gmail.com>
Subject: uninative limitation: UNINATIVE_MAXGLIBCVERSION
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000004b08905b9440007"

--00000000000004b08905b9440007
Content-Type: text/plain; charset="UTF-8"

All,

Why does uninative.bbclass (around line 86) revert to my hosts glibc if
that version is above the uninative version but our sstate-cache is only
local (not hosted/shared)?

I want to know in general terms (what could go wrong), but in case you're
wondering, my specific environment is:

Building with "zeus" release but can't update, at this time.  The "zeus"
release provides glibc *2.31* uninative glibc.

My build machine is running Fedora 33 (glibc *2.32*) and I'm leveraging
the x86_64-buildtools-extended-nativesdk-standalone-3.1 tool.  Yes, I know
that "zeus" is 3.0 but the "extended" version (also provides a compatible
native gcc) wasn't introduced until the 3.1 version of the standalone
tools.  But 3.1 seems to work after back porting some 3.1 fixes into some
bbappend files I made.

But, again, my question is about the general case and not specifically my
environment.

Anyone?
-Alan

-- 
NOTICE: This communication (including any attachments) may contain 
information that is proprietary, confidential or exempt from disclosure. If 
you are not the intended recipient, please note that further dissemination, 
distribution, use or copying of this communication is strictly prohibited. 
Anyone who received this message in error should notify the sender 
immediately by telephone or by return email and delete it from his or her 
computer.

--00000000000004b08905b9440007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All,<div><br></div><div>Why does uninative.bbclass (around=
 line 86) revert to my hosts glibc if that version is above the uninative v=
ersion but our sstate-cache is only local (not hosted/shared)?</div><div><b=
r></div><div>I want to know in general terms (what could go wrong), but in =
case you&#39;re wondering, my specific environment is:</div><div><br></div>=
<div>Building with &quot;zeus&quot; release but can&#39;t update, at this t=
ime.=C2=A0 The &quot;zeus&quot; release provides glibc <b>2.31</b> uninativ=
e glibc.</div><div><br></div><div>My build machine is running Fedora 33 (gl=
ibc <b>2.32</b>) and I&#39;m leveraging the=C2=A0x86_64-buildtools-extended=
-nativesdk-standalone-3.1 tool.=C2=A0 Yes, I know that &quot;zeus&quot; is =
3.0 but the &quot;extended&quot; version (also provides a compatible native=
 gcc) wasn&#39;t introduced until the 3.1 version of the standalone tools.=
=C2=A0 But 3.1 seems to work after back porting some 3.1 fixes into some bb=
append files I made.</div><div><br></div><div>But, again, my question is ab=
out the general case and not specifically my environment.</div><div><br></d=
iv><div>Anyone?</div><div>-Alan<input name=3D"virtru-metadata" type=3D"hidd=
en" value=3D"{&quot;email-policy&quot;:{&quot;state&quot;:&quot;closed&quot=
;,&quot;expirationUnit&quot;:&quot;days&quot;,&quot;disableCopyPaste&quot;:=
false,&quot;disablePrint&quot;:false,&quot;disableForwarding&quot;:false,&q=
uot;enableNoauth&quot;:false,&quot;persistentProtection&quot;:false,&quot;e=
xpandedWatermarking&quot;:false,&quot;expires&quot;:false,&quot;isManaged&q=
uot;:false},&quot;attachments&quot;:{},&quot;compose-id&quot;:&quot;1&quot;=
,&quot;compose-window&quot;:{&quot;secure&quot;:false}}"></div></div>

<br>
<span style=3D"color:rgb(128,128,128);background-color:rgb(255,255,255)"><f=
ont size=3D"2">NOTICE: This communication (including any attachments) may c=
ontain information that is proprietary, confidential or exempt from disclos=
ure. If you are not the intended recipient, please note that further dissem=
ination, distribution, use or copying of this communication is strictly pro=
hibited. Anyone who received this message in error should notify the sender=
 immediately by telephone or by return email and delete it from his or her =
computer.</font></span>

--00000000000004b08905b9440007--
