Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.10659.1605798264013516889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 07:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JN42WUZt;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id m16so6178050edr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=85P2at0i6mFj6gDHVWU1Y39Y/r9wXZ0KynMrGYTgZZg=;
        b=JN42WUZtW8xa+aRWwsKEHPxo5KM994ysx431o+4PrEuUlf5iwyo5rM8qRB7AHS1QuY
         0q0GOQtOWpIxGT1lYtd7O4Q67/Z9bWsmdjXhg+xnQ6rX3TSccdCX9b0daZghrQvSzSlb
         QM27132C2KDtOmwXLWF0qQBPR4XgpB7DTlQjbDt6Qy6ht+TT5YEBleHebx5vY+iC/S+q
         Iq4NaheAl3o8CDHepKkIeYROcgHOCpbVj164YJuJ5P+AukcV8mS+k2hghhzQ1lvNuPTy
         6lVUhYFWHEZnUZ7/IWpxQVCBdu9pWP2MxxNuC0mDvwkQh0gYOKSS+4XuJzlF5NNj/AOh
         nh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=85P2at0i6mFj6gDHVWU1Y39Y/r9wXZ0KynMrGYTgZZg=;
        b=Bz4Lz4IUYBAKMb70lO9IBCz7xjNEZZPTpjbDsfs74cuMHKkAiRyqEo/OEWUaam88HT
         6xKerZvZyquUMp090TVT6Wl1fg3Z7eFNNoM72SWTIsRdglMruwpV4VN+/hnQ++NSe6xO
         hvMiBb6zW8vpzY/cFEnLo393ZxUeCLfCqWfPomgZQ2NL04h4qRFAN7UEUj7/6T0DJzqw
         duLMSFdefZ258EwMOpPF5LN5P7pYogZVhzsn+vI40rbo7xeDv0VqO51J5Xp0DjnQ6Wd1
         Imen3wx7ORhxdTDE2WE4PJHP/Rc/WmbjFJN5SEW/W9HeSRm4Q5iKY97FbaT4khUhdqQs
         A+zQ==
X-Gm-Message-State: AOAM532J7LfhNVXB/bi+m4HhEV5CGLHbHmP1w7pQYMwvgF3p0BQTKY3F
	zLwK1MUtzhw0+5XYHeNFWBq0Dd35Ci4WUOS9boUrxQ==
X-Google-Smtp-Source: ABdhPJy1fazimbbfFXiD7MigiONuujhZJQotdiOo+s9qIEWVleUwNHoSLrwF8vUFvKcofLu2Bq9lggkV6X7FuBUytqk=
X-Received: by 2002:a50:951e:: with SMTP id u30mr32810766eda.197.1605798262549;
 Thu, 19 Nov 2020 07:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20201119103813.2726273-1-ross.burton@arm.com> <20201119103813.2726273-3-ross.burton@arm.com>
In-Reply-To: <20201119103813.2726273-3-ross.burton@arm.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 19 Nov 2020 05:04:11 -1000
Message-ID: <CAOSpxdYRu4t85FLHB4W-_BFvP8amE2fkcgJ9taqTrvZ=8tRziQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] sqlite3: add CVE-2015-3717 to whitelist
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this also suitable for dunfell?

Steve

On Thu, Nov 19, 2020 at 12:38 AM Ross Burton <ross@burtonini.com> wrote:
>
> As per https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA this issue
> is believed to be either iOS specific, or fixed in 3.8.9.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/sqlite/sqlite3_3.33.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> index 611a1bd923a..33f041a161d 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> @@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d695
>
>  # -19242 is only an issue in specific development branch commits
>  CVE_CHECK_WHITELIST += "CVE-2019-19242"
> +# This is believed to be iOS specific (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
> +CVE_CHECK_WHITELIST += "CVE-2015-3717"
> --
> 2.25.1
>
>
> 
>
