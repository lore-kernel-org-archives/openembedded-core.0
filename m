Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web12.13919.1611074576564040558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 08:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IRuP66YG;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id e22so17135667iog.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 08:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sE7NoeH9EfankzqmNUUXIJecy5my9GTgKLZnvtJVmQQ=;
        b=IRuP66YGes7S7MTQ0sAcYMAuA0sFgevB2Xl36fwC+R0Bi3ITm1oms9HZaVuT2iieoK
         oM9QTiczK8qgI7O9Rc55xkymygJzD5SuEXY7JTjim4SPkcXyZJxFUnekxDtR1uyxM1QR
         2j/U8r4fXg1gbtUvukbKrUP9k9CXaYY22dOyzX4gF4WrXDKv/8TqXgVOoUvfUHd+3FPt
         dlu/bf6/Jcun+ylMMULwx4ZhBUutUmDP172CSsRj0Pagu/YHlguAresxF4ZwIX+LDEuq
         EZFCjfetzewEKpQHL+FxbJ7Vgqyt8FYMoeygx/ldMFAQwqw132cGOp/8edvI0FF5oMcx
         2LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sE7NoeH9EfankzqmNUUXIJecy5my9GTgKLZnvtJVmQQ=;
        b=tfBq6KZcb81RAeGUsczmp5U6tvsj28rWYPf7iS4L0BzRDXLlfHC9fdKnGW7u2IW890
         QmbfMFSuZ2xfDHucIRU88z9GNd23f37CcSJHsuBBxbXsbCGB4jhOabC9TFtps2C1JpTe
         E0THdBH9cAQ8DSJ1/LUI1ZfvTuEIUl98NszlBriWJ1MpDLLoBB9fj4RltKEd7BdN5ddK
         uos3yB6bNNf+L5xrUD1ouMo6+kjhN2xGyIgAnsuMUXTo58M+a0cBdbNv4yrEzPWyNu41
         kB+keyT8qo9hI/S2diJHXika91RsZTIOhhn6v1HidgOcJcBMFM8u3wpzBXhzw2YD64TY
         GQgw==
X-Gm-Message-State: AOAM533stwJ/+KNdQ1nnvh1jrYCQIg7ysCFz1y08CyyftOx1btC4J1fR
	WrreRPEJf3ML3l09s/KRBADAsP3kOU+HfCfsQOY=
X-Google-Smtp-Source: ABdhPJwgqeXKAVhqxwtN+tUMKC2x+02Sd0/kTc7ihBm5q9EgaYvVd4zZwF8QjflotQGJn34S4Am6OaDQnZfrbf9e89I=
X-Received: by 2002:a5d:9418:: with SMTP id v24mr3545836ion.61.1611074575995;
 Tue, 19 Jan 2021 08:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com> <CAM9ZRVtdsL=v4mbUWT-tVqJyC5US4+cNK7Lfm=YAKLbz9ip3VA@mail.gmail.com>
In-Reply-To: <CAM9ZRVtdsL=v4mbUWT-tVqJyC5US4+cNK7Lfm=YAKLbz9ip3VA@mail.gmail.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 19 Jan 2021 17:44:02 +0100
Message-ID: <CAJkqNs2ztg6wwQqGfQkiDBkiUgrHG3-XDB9z+jOAFZCUQ0TD6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: Fix source extraction for gcc shared source
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf15b805b94387b8"

--000000000000cf15b805b94387b8
Content-Type: text/plain; charset="UTF-8"

>Have you tested whether the archiver class is still working after this
>change? If not it'd be helpful to run `oe-selftest -r archiver` to
>check.

Hi Paul,
I have just run that script and it passed with no errors:
oe-selftest - OK - All required tests passed (successes=13, skipped=0,
failures=0, errors=0)

Best regards,
Tomasz Dziendzielski

--000000000000cf15b805b94387b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>&gt;<span class=3D"=
gmail-im"></span>Have you tested whether the archiver class is still workin=
g after this<br>
&gt;change? If not it&#39;d be helpful to run `oe-selftest -r archiver` to<=
br>&gt;check.<font color=3D"#888888"><br></font><br>Hi Paul,</div><div>I ha=
ve just run that script and it passed with no errors:<br>oe-selftest - OK -=
 All required tests passed (successes=3D13, skipped=3D0, failures=3D0, erro=
rs=3D0)</div><div><br></div><div>Best regards,</div><div>Tomasz Dziendziels=
ki<br></div></div></div><br></div>

--000000000000cf15b805b94387b8--
