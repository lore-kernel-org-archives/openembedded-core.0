Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.3302.1588419348807767379
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 04:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=if3AXTts;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id r2so2878560uam.7;
        Sat, 02 May 2020 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=nue8UkFstTpNUOEySNV9K1UgtVZADmSIkYOdZAyXLyc=;
        b=if3AXTtsc1QFJ9A8OBSnyql74GHrRtlVm+4HJCDG73lHfiELE9e856ygle5uRRYfhy
         XhG8TGKjQ3GZy3j8jpmPhA6MkrGVHL2fIApBO18z3HPhqmbj7pLMOo/ASK4YtoUuqBG+
         RGqzvIQe5u0g5bYFGM4aAyvWeTUgriTFWI9ckdkQ1CxQ/wqJWrM5GKVG/xcB/EtcCLbY
         PnFoiEXoe7Q8ga1EeTh8RErhHhjf339Cn9Uy5vLl8lSDAOlvBU6NMA5cfbVwrofyWDqd
         hlABI2JkfN4HA0k1zR5o5p6hiJBfXe58rZedW4PI20MSHk+FJ7+6LF51MfFsCkukV5wf
         Hxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nue8UkFstTpNUOEySNV9K1UgtVZADmSIkYOdZAyXLyc=;
        b=quoIo2MQoGPo72ur+J1fAIs7KjA2+ZnnK4WS1FVGbrbZISJfNqakeMwIxJX79GUBI2
         fa6sgawoSgKOZNMH4AY4CUeqvHQ2DbKTgsUk+BkkAQvhGR1tRLc5CdxDO0q1Yzf2GbID
         1npBPbY7U7I9nFt5HpdWbM8D07nh1Qda2OfEFVzPf5teJi/5R7pH6N7h/sJJkNiO8S3O
         R+2rY5+4XG4NLktfjApWvEaXbR4TRgRN8v5mbxnF+UyxkeNwketXCqfKtL7V9+6rMzP4
         bao0sPcNb9NTpLoVs3pom7MeniaCgxS5TGVofKCrZZpJIDEKMvy7Wrdz9L6+u8mPI4UC
         fkHw==
X-Gm-Message-State: AGi0PuZoDzhUhKXCZ+h3wEPtMru01FIoC9s7smpSTra7MqmfDvnsdCaY
	rw507g5pqqQp02ZysXDLtXoHmdhPb/ZCAWNe7MmLEQ==
X-Google-Smtp-Source: APiQypImfiiJ+H3MtzppG0P61Err2IV+Jrc1BfCOCwndywJkfCinejwZOERRLGTfw+ArG4r/ciexZBn2blK29rr7eWQ=
X-Received: by 2002:ab0:6313:: with SMTP id a19mr401065uap.71.1588419347690;
 Sat, 02 May 2020 04:35:47 -0700 (PDT)
MIME-Version: 1.0
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 2 May 2020 13:35:36 +0200
Message-ID: <CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
Subject: Proposal: community maintained recipes in oe-core
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f9391a05a4a8b2bd"

--000000000000f9391a05a4a8b2bd
Content-Type: text/plain; charset="UTF-8"

Hello all,

the current maintenance model in openembedded-core is problematic due to
lack of well-working process of finding maintainers, and replacing them
when they're no longer able to contribute. This becomes especially
frustrating when maintainers silently disappear, and perfectly fine patches
produced by Auto Upgrade Helper and sent to them via private mail go wasted.

I'm proposing that some of the recipes in oe-core - those that are known to
lack an active maintainer - would be transitioned to 'community
maintenance'. What this means is that the maintainer's email becomes the
oe-core mailing list email, and accordingly monthly upgrade patches will be
sent to the list. Then anyone with an interest in those components can pick
up the patches, polish/test them as needed and send them to oe-core for
inclusion into master/release branches. This opens up an easy path for
people to become maintainers, and also highlights what recipes suffer from
lack of attention.

Let me know,
Alex

--000000000000f9391a05a4a8b2bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div><br></div><div>the current maint=
enance model in openembedded-core is problematic due to lack of well-workin=
g process of finding maintainers, and replacing them when they&#39;re no lo=
nger able to contribute. This becomes especially frustrating when maintaine=
rs silently disappear, and perfectly fine patches produced by Auto Upgrade =
Helper and sent to them via private mail go wasted.</div><div><br></div><di=
v>I&#39;m proposing that some of the recipes in oe-core - those that are kn=
own to lack an active maintainer - would be transitioned to &#39;community =
maintenance&#39;. What this means is that the maintainer&#39;s email become=
s the oe-core mailing list email, and accordingly monthly upgrade patches w=
ill be sent to the list. Then anyone with an interest in those components c=
an pick up the patches, polish/test them as needed and send them to oe-core=
 for inclusion into master/release branches. This opens up an easy path for=
 people to become maintainers, and also highlights what recipes suffer from=
 lack of attention.</div><div><br></div><div>Let me know,</div><div>Alex<br=
></div></div>

--000000000000f9391a05a4a8b2bd--
