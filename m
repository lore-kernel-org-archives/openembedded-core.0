Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.1297.1616443233118632136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 13:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6Vxt4Om;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id q29so23074258lfb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 13:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TwKeBa4a4QPUAnLxUQRM2VUfsMk2QuuLF64l1FPBMs=;
        b=u6Vxt4Omnsh+IWWLBMuCdu/2hhmf4SeCxI+lyIZo1VHiN9ReeVR7BK4jZOJgzuMPJl
         o19f7jDRbYDvUwJ9RiZ3TYAbhlfVQ8tuU2hZVY+GDFQ7Op2QR8APREPV138+vvSt1oB4
         vuQ2FD21PJBB5gRi3VJS/SgnAzoCh+I+ppoMYPftV1JUzEQEVz76/unBlNXZCuXe09ZZ
         l0/VoqbWkDrA9u5D8ltekxConlY2BXoelQIbof2+oxc6Ky7kY2NsbP13qGYlGoZVOl+P
         zG+Png/1Z2r0KHMknBs4c72HimfM620JTlguQVTFyUNyDMV0RuajVpwEhyd63Dax9F3N
         tmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TwKeBa4a4QPUAnLxUQRM2VUfsMk2QuuLF64l1FPBMs=;
        b=Eh95WuwrB81gYkMwYXbzvHTFD+7JiWtK1CqBAZcpep1ZakZ2kmZGBiVcSF+YjFWZWO
         vzFZS71AKQeGGggJwvLnSZv9fKirKe/i9rHTx9YxiiHwvnqnk24SXWBAdgWb3MtrqzMM
         BTXNdi5rQcVSV/8XfOUy0XLpYP/MnJBu+S++zyWrVBlGtPplkWZHCFn65hRqSRBymLp+
         H4feTb9Qdd4OGvGv59xPXLdCESXmc6KBCk3FlxW+3s2agBU+UhlfxLcHbz1jZ2ebUVjH
         v0UXLfShELcvKAO6dFipiVDtKQC5OmCphXGBRBTGc7B61KIMtThkuj51sReIy/av73ha
         ldrg==
X-Gm-Message-State: AOAM532yl/DkAryzPxo1KXbNYfehSaOzovuMpbpRrc+ZAan6J+Vp0UCy
	jDsqtCJiQ45BVvbD6Dv2oYfGGxs0OLjShoUafkY=
X-Google-Smtp-Source: ABdhPJwn3eJyvJdGzbx6bd/2ZLYUQvP7ncHYaugGGdZvIQguIVhMJvKCauqplT8DXd3pYz4bd7LmEZKUWzTTzYC4Rss=
X-Received: by 2002:ac2:4474:: with SMTP id y20mr598748lfl.230.1616443231021;
 Mon, 22 Mar 2021 13:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <ef94c962-16fd-8341-70c2-e531af21b6@crashcourse.ca>
In-Reply-To: <ef94c962-16fd-8341-70c2-e531af21b6@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 22 Mar 2021 13:00:19 -0700
Message-ID: <CAJ86T=WgUfNaN23t4VLsGQcgufqT4Hv-ccxcreELgcmz3KCn5A@mail.gmail.com>
Subject: Re: [OE-core] the weirdness of bbappend'ing to stock OE images
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 12:50 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   more a style issue than anything else, but one of the other oddities
> in this layer i've been handed is the bbappending to standard OE
> images, so that recipes-core/images/ contains recipe files like:
>
>   core-image-minimal.bbappend
>   core-image-minimal-dev.bbappend
>
> and so on. that just creeps me out -- my plan is to forcefully advise
> people to leave the stock images alone, and create clearly internal,
> proprietary ones, like:
>
>   acme-core-image-minimal.bb

A clearly internal proprietary image would remove the reference to
oe-core from the image name, so "acme-image-minimal.bb" rather than
"acme-core-image-minimal.bb".

> that inherit or include, then do the adjusting.
>
>   or is that approach considered acceptable? (it just makes me cringe,
> personally.)

I don't know. Adding to the core images doesn't seem like the worst
thing someone could do. After all, it's normal to add to or modify the
package groups which go into the core images (either directly or
indirectly by changing distro features).

Creating your own dedicated images is cleaner and clearer though.

> rday
>
> 
>
