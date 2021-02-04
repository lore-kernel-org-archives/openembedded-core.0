Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web08.8824.1612450054313153868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 06:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KK8Dvj9t;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id d6so2789634ilo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 06:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=//2b7nBuX98qLAxjwKRhkIoHq6pG85W3h6n34s0EaTQ=;
        b=KK8Dvj9tlN6LrLgEaCWbso6fJd7spY7EgawORqqNfufJSETapprSuBU+f95uvdn+RE
         SL68HzYpd6Ua7nYqNHbXVYTN86kO6jFvXKtvmInYBUZfU0X9X4dX2xnNCRhzubRjNSTG
         w1ovCAVZXJTVfo73xw+khQ4QqL04tVex5hMAASk0odRuCJpVN16xCMJuoS5edvNfNqLR
         kOKugYWwEMxnQLS69ttXmJ0cngbmf2eBjtGXKaNNnaIAojGAkMxrz4NqBQSzA54aO8PA
         sV5j2xGUNDnD07Bl+TrCjAohCFBqANq9Y/8trnWuScGocxuXrEeNManZt8QutSl5A1fW
         XOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//2b7nBuX98qLAxjwKRhkIoHq6pG85W3h6n34s0EaTQ=;
        b=ezkWulop0rRa7iEL6GjLsqckJ4oeDLdWb/IjZ0XJC9rwf0ktRbIQ5O5OOISV8kRc0O
         XvspTme+Of2KqHudcGP0BXc+ATq6GVhkYG2o6lJFEIkkmPzumojnp1J6PSXMPmj/6GvZ
         +ulE+uEINZ3XtTNxfChscws7iqhB9gTZzjlHXz9VoA58Fg7CxAcOPN7ovlikWPhUN3aI
         7K613L2/sqeZNYwVfL7nWqV1c+Z8JimVOwQm2Qe/v/q6gcBW1ev/WY0I3iWZrLudKNOj
         iPhW1in9Hd0N177lDYTPGGSv2og9lBOCyJwB7mS+Dn7+0gOw/iaf/z9+K4K0ZPr7b320
         4vEQ==
X-Gm-Message-State: AOAM531DBWykorhSxSsJ5PnHh/gZDRQDuWMzAZvsWybjJ1oNHyog2KTa
	ojthshBFeGzmQA+EvYjKMt4Itq7BA3KpnRJzIf0=
X-Google-Smtp-Source: ABdhPJzETqrNUhLoXy7XfRSxNIoE834emlCwbC0VMKeaD9M72ML9ni69XV8Fkjss3PXlTXwSPEUK+d8W/GjouJJaZE4=
X-Received: by 2002:a05:6e02:5c3:: with SMTP id l3mr6792630ils.292.1612450053850;
 Thu, 04 Feb 2021 06:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com> <CADkTA4NU2ykdZ7QNmsR0oZE8JaYXonyQ0acghSfs7V6+A3T9kw@mail.gmail.com>
In-Reply-To: <CADkTA4NU2ykdZ7QNmsR0oZE8JaYXonyQ0acghSfs7V6+A3T9kw@mail.gmail.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 4 Feb 2021 15:48:54 +0100
Message-ID: <CAJkqNs1O9vAjM1v2Ur2cjCkanEdopzHJwaMe2ELrWNLZZ+CWhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ad8a9405ba83c82b"

--000000000000ad8a9405ba83c82b
Content-Type: text/plain; charset="UTF-8"

>I didn't see anything on the docs mailing list, but we should also
>have a matching update to the docs for the new variable (unless it is
>already in the docs, I didn't check for that).

Thanks, please check now:
https://lists.yoctoproject.org/g/docs/message/860

Best regards,
Tomasz Dziendzielski

--000000000000ad8a9405ba83c82b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;I didn&#39;t see anything on the docs mailing lis=
t, but we should also<br>&gt;have a matching update to the docs for the new=
 variable (unless it is<br>&gt;already in the docs, I didn&#39;t check for =
that).</div><div><br></div><div>Thanks, please check now:<br></div><div><a =
href=3D"https://lists.yoctoproject.org/g/docs/message/860">https://lists.yo=
ctoproject.org/g/docs/message/860</a></div><div><br></div><div>Best regards=
,</div><div>Tomasz Dziendzielski<br></div></div>

--000000000000ad8a9405ba83c82b--
