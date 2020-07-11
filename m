Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.5340.1594453385632563311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2020 00:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UJNnhayy;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id q15so4175512vso.9
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2020 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UH9C5HlYSV9e69KxVyTCXOeQ5vHjydu8kgZ83UTxukI=;
        b=UJNnhayybYvV+MZ/zLFT3z2ICi/ZhKcbR2ow3xLKQKb8ZyabrHi/BTf0BvKKVji8te
         H1GERxD6F9XClopbDBIWf8XbA4vGO/jVtdP3AwvlUX+mN8lVVBeuzlipbWwG2Tin3KSQ
         atVdQCqcB3ShZiU4AnPFT/oDNQ3xX94iCUtiE2JzS3dDflHAwV9pVQesirLAr7eN0xpU
         NzE5wvLV/bzOeQHoV++ozbwICC2aLTRSTV90TmyinOZ5rOqujtivkql6jJQOdk6QBDl3
         1ehnJ+Vmq9EevU/zvIvn23oRlrg08B2In2uQlBBwIyjMZuCS8JLQEfPaii+po/D8Mf/G
         oGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UH9C5HlYSV9e69KxVyTCXOeQ5vHjydu8kgZ83UTxukI=;
        b=cFZ65Lfnl2wLz0D24kgXegUMlvT2ujnIhUKsD/Ccbf7gXJwfgXeLv/QK98E59Kj0Gi
         FbgVkAiDC25/YVGBmuzn6x913S2cuxOyYYOXfXCagZJp9SIWhA16/fvOShZzoWlXBkLi
         4iOSEZRqnIbLlOqXD7OboLpRd0rBQCb9jpgJxFhfZ1tyOPKZurycFrlEqffFm012g8C5
         1VkrqI+5wZV/nmaeAFUDw1kUuzBz07psh1tbacpvjLUBVqMj3/OihOxwt25yhDSQkBwI
         bmTNkHIBn7beyJZ2k6CqwymX882UdcCuAtWES+bweTLuhk1XSxmvQapB+KmxoSl1Jc6A
         YhZQ==
X-Gm-Message-State: AOAM533txhmi3CRFrWgZlUunBYHjlhaPboOoe/l/wcn30tGaTOiQ8Xfj
	qXgwVomWAmsL4SmdcIWtVtUDHx7FjsaF1mblQx0=
X-Google-Smtp-Source: ABdhPJxlMzref4Tu1ka8LMaNEPLJT5HIWhX6i+wlIa4DBFM3lwHVWDFNElLU5QaAKZ+bw80wRk8hRw4UF7SWpyu2YJI=
X-Received: by 2002:a67:2e49:: with SMTP id u70mr23387465vsu.83.1594453384753;
 Sat, 11 Jul 2020 00:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200710190810.1967868-1-takondra@cisco.com> <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
 <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
 <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com> <ebe4c112aa8fcd03e5b6a5bea8b33b0e6c5dc5c8.camel@cisco.com>
In-Reply-To: <ebe4c112aa8fcd03e5b6a5bea8b33b0e6c5dc5c8.camel@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 11 Jul 2020 09:42:51 +0200
Message-ID: <CANNYZj-7w-JCgXmtmPVc0RhO6vcfGDHAY=qV6sQv1dkU3dpB5w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="0000000000009bf84c05aa259b3c"

--0000000000009bf84c05aa259b3c
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Jul 2020 at 02:58, Taras Kondratiuk (takondra) <
takondra@cisco.com> wrote:

> Oh, thanks. Now it makes a bit more sense. I didn't realize that
> python3native class uses target-specific configuration and target
> sysroot. Shouldn't it be called something like python3cross then?
>

Nope - the purpose of python3native itself is to provide native python to
recipes for which host python may not be good enough (for example when they
need 3rd party modules, or exact version supplied by oe-core).

If they also poke into target configuration, then that is provided by
adding a DEPENDS on *target* python3, and having this patch that makes
native python load the target sysconfigdata:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch

I understand it is not intuitive, but this is one of those legacy oe-core
things that nobody has time to clean up. You are welcome to do so. I didn't
invent this approach, I just replicated it when I rewrote the python3
recipe from scratch, throwing away all the other baggage that nobody
remembered the purpose of, so that python3 could be upgraded again without
going insane :)

Alex

--0000000000009bf84c05aa259b3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 11 Jul 2020 at 02:58, Taras Kondr=
atiuk (takondra) &lt;<a href=3D"mailto:takondra@cisco.com">takondra@cisco.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Oh, thanks. Now it makes a bit more sense. I d=
idn&#39;t realize that<br>
python3native class uses target-specific configuration and target<br>
sysroot. Shouldn&#39;t it be called something like python3cross then?<br></=
blockquote><div><br></div><div>Nope - the purpose of python3native itself i=
s to provide native python to recipes for which host python may not be good=
 enough (for example when they need 3rd party modules, or exact version sup=
plied by oe-core).</div><div><br></div><div>If they also poke into target c=
onfiguration, then that is provided by adding a DEPENDS on *target* python3=
, and having this patch that makes native python load the target sysconfigd=
ata:</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tr=
ee/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STA=
GING_LIBDIR-python-sys.patch">http://git.yoctoproject.org/cgit/cgit.cgi/pok=
y/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append=
-STAGING_LIBDIR-python-sys.patch</a></div><div><br></div><div>I understand =
it is not intuitive, but this is one of those legacy oe-core things that no=
body has time to clean up. You are welcome to do so. I didn&#39;t invent th=
is approach, I just replicated it when I rewrote the python3 recipe from sc=
ratch, throwing away all the other baggage that nobody remembered the purpo=
se of, so that python3 could be upgraded again without going insane :)<br><=
/div><div><br></div><div>Alex<br></div></div></div>

--0000000000009bf84c05aa259b3c--
