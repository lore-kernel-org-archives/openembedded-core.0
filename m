Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web09.3137.1604002386187605790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iaQ+ilhG;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id w9so1905897qvj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UVaaGzte7cb6jQc8rliR4VMCvWJh8kZM2wmbeEWmDSc=;
        b=iaQ+ilhGfl3C7PDNq47g9sZjJRtknwObrcqfwr8ROkLiNc6teuETmYdDK2I485vhTt
         hH7AgDTwgSg09lGq2tP1wHm0irVjVDZ5CjxABCCSbGkxz8x8zw46iafYFhLq2B5CixGf
         QQeT54WLgf4gp4SIw9BjZ9uwm6t1FeL5HFrorzQpXeDqSBTnUlhjmuVdkUc+6WeZsNVk
         r2IrfngKa8HuKv5lNWlVBab26hJbVjBBkvwT3kAhZqj559HvYQfD5Cn3oeYVL75FvfT9
         a9//xfYWtR/l/gcUyyAaZNS+GID8+sHecYs4upMLPh+ThOCpDMdX5nFqhGBgUtyN4A6U
         PBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UVaaGzte7cb6jQc8rliR4VMCvWJh8kZM2wmbeEWmDSc=;
        b=n8pj7PuBlnt0reXYdLXxCljKWBR0vTmwz+XhuRnitUqjGjVehmf8R7/Q8omffrFdMU
         NDYRGBIg4ypbWQ2v3Wa9Fq+oq8xRnUPFTNYguZqNjnbiEfxTKfiIwoS250uh18FzhoWR
         VJwwueVB8qleyIVGkK1K/42ZkFUDbAdHflx3HLqMzlPuLyzmsmNE3VpPaBbgL6Jm+2HN
         OgvfOeTPoJkqsINYjSZ9l9aehhyPeu94ck+FKbEi/pCK8rZQUTXyII//ewQVyKi8WZea
         K86vNlJrilAJ0YMP0l1caHKMs8/oiAeBvwZcRbTWpcj/0il1/UHmTgT3hsCLiBCpIb/s
         QtTg==
X-Gm-Message-State: AOAM532PVezcRDsUQi6xhX+rpkuQZXgL7npq10ykfy/UXoQ6Ck1ca4vA
	78m602pltoFeY3AIHwzx1ri+UMLLs14CCpAONkE=
X-Google-Smtp-Source: ABdhPJx+9LzZV7Euuus1u9OqIaqCl/fi7nZMzvtw8jHScliEqHLA6YN8VwcwQsAjXJx3K1NRiK47frqGHHXNBWdQJno=
X-Received: by 2002:a05:6214:16d0:: with SMTP id d16mr5957676qvz.38.1604002385282;
 Thu, 29 Oct 2020 13:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
 <20201028210558.21070-4-alex.kanavin@gmail.com> <CAMKF1sr1mHEyzgDaYGYK8Hk56ALN0HMqoPWu3KhKibe6UVAYuw@mail.gmail.com>
 <CANNYZj8DC9qQde+jwanJhMYyurmFh4ft0SQFWs9v=tGdjEj+zg@mail.gmail.com>
In-Reply-To: <CANNYZj8DC9qQde+jwanJhMYyurmFh4ft0SQFWs9v=tGdjEj+zg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Oct 2020 13:12:39 -0700
Message-ID: <CAMKF1sqJFBi09-c2S6r-UZfzWdfYTNurh3PpVN82KyS_SO1cnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/33] python3-pygobject: upgrade 3.36.1 -> 3.38.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 2:49 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Upstream has changed the meson option type from boolean (true/false) to feature (enabled/disabled/auto) in the new release.
>

ok thanks, I think having this mentioned in commit log would help users.

> Alex
>
> On Wed, 28 Oct 2020 at 22:57, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  ...thon3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} | 5 ++---
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >  rename meta/recipes-devtools/python/{python3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} (78%)
>> >
>> > diff --git a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
>> > similarity index 78%
>> > rename from meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
>> > rename to meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
>> > index 0a34d4373f..b4427050f5 100644
>> > --- a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
>> > +++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
>> > @@ -14,8 +14,7 @@ SRC_URI = " \
>> >      http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
>> >      file://0001-Do-not-build-tests.patch \
>> >  "
>> > -SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
>> > -SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
>> > +SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
>> >
>> >  UNKNOWN_CONFIGURE_WHITELIST = "introspection"
>> >
>> > @@ -27,7 +26,7 @@ RDEPENDS_${PN} += "python3-pkgutil"
>> >
>> >  # python3-pycairo is checked on configuration -> DEPENDS
>> >  # we don't link against python3-pycairo -> RDEPENDS
>> > -PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
>> > +PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo python3-pycairo, python3-pycairo"
>> >
>>
>> is this a bug fix ? or a new change
>>
>> >  BBCLASSEXTEND = "native"
>> >  PACKAGECONFIG_class-native = ""
>> > --
>> > 2.29.0
>> >
>> >
>> > 
>> >
