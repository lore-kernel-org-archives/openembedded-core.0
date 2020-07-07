Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.11593.1594107396217177343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 00:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WT9o0Gsq;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id s20so14618340vsq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 00:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L0c+zYn/ojbM0CUgNr76RpLKrEHRvIiLjGoxYVr4oT4=;
        b=WT9o0GsqZMugxB+KVeIHfKNXo5EDl3pt5fYF7K70MlsiRaiB8z2UY7ZFRBZTfHMqYk
         3E36049rCcGZD9JIR9z8JW3M7AjArYIsbtszBMDHMV9lEZBOwY6X+NTx7bIZRZYrBexk
         zz8H1EvMrrsoXu6quAIEJCm0pr8N8EJadT+2+HsFMvg1XrFeHk/NsLK+fReZx7AOubNI
         hpVC5dYkmIO5Ms1QNOkokn40ZPpCzTPnM7VwWWpXHwrS2uYMwxXpdmElsINRmvJTUY4M
         eQAQoklBpXY1AUJzFk0MDBksUQgDxCKR8eMHzlEcAnx+p50RzSsONQrc7DEA344UJ1ja
         cRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0c+zYn/ojbM0CUgNr76RpLKrEHRvIiLjGoxYVr4oT4=;
        b=MCn/zq7glYokymwVbYX42VT6Yi3YYVZfSlOjLhvOZamvBf/EPK198+JmiX5r0nodPh
         HXu7pKrXnXtHQ3pxBLcy2DB2zKl79oD1YtuZgof2qT8y1sj/BufXJM05U/MWMW0apCb3
         L+ZVzNtoT40KJP8a4Qs4m1orEQwBH2HZR86a9ZHG/OTirDwNzNIYZQbf/6vzduTdMpry
         Ed+T+YE02z18zZpE4c1dccd76WS7lQV/lNir9+STXhR5bkEvdoeAtfQ/N6Y9kyP6JRDN
         PZ3fL5cs+G/8MOZ/K3EfM90so/r3MGzsvzJCpp7ngko92BDrQOWNJCuZM2JSPerRNUTD
         V6jQ==
X-Gm-Message-State: AOAM530pIENBBJmh9UFxybq5UqcZxRqASe3vndzlIgCOrLbR0BHNK06j
	fGuTHRvt9NJ5+xUDCv8KFCFCu1T4w9ou5Lt7ECY=
X-Google-Smtp-Source: ABdhPJxLOznH9dJ6RnRDj3LoFaVQgHZaX0EIJDTBe+yinqkfMgOkXLX3xo/CAs4SQKcNwdL7mK09qANU75pniFqqghU=
X-Received: by 2002:a67:87cc:: with SMTP id j195mr21556418vsd.25.1594107395342;
 Tue, 07 Jul 2020 00:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200707025305.3408244-1-changqing.li@windriver.com>
In-Reply-To: <20200707025305.3408244-1-changqing.li@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 7 Jul 2020 09:36:22 +0200
Message-ID: <CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=+6c-tyCwBVY3rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dpkg: update SRC_URI
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000884ee05a9d50dc0"

--0000000000000884ee05a9d50dc0
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2020 at 04:55, Changqing Li <changqing.li@windriver.com>
wrote:

> -SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
> +SRC_URI = "
> http://snapshot.debian.org/archive/debian-debug/20200308T085219Z/pool/main/d/dpkg/${BPN}_${PV}.tar.xz
> \
>

This breaks both automated version checks, and automated version upgrades.
Can you change SRC_URI to take dpkg from git?
https://salsa.debian.org/dpkg-team/dpkg

Alex

--0000000000000884ee05a9d50dc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 7 Jul 2020 at 04:55, Changqing Li=
 &lt;<a href=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">-SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/d/${B=
PN}/${BPN}_${PV}.tar.xz \<br>
+SRC_URI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debian-deb=
ug/20200308T085219Z/pool/main/d/dpkg/$%7BBPN%7D_$%7BPV%7D.tar.xz" rel=3D"no=
referrer" target=3D"_blank">http://snapshot.debian.org/archive/debian-debug=
/20200308T085219Z/pool/main/d/dpkg/${BPN}_${PV}.tar.xz</a> \<br></blockquot=
e><div><br></div><div>This breaks both automated version checks, and automa=
ted version upgrades. Can you change SRC_URI to take dpkg from git?</div><d=
iv><a href=3D"https://salsa.debian.org/dpkg-team/dpkg">https://salsa.debian=
.org/dpkg-team/dpkg</a></div><div><br></div><div>Alex<br> </div></div></div=
>

--0000000000000884ee05a9d50dc0--
