Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.1509.1620934452926585298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 12:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=seb/MdXq;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g14so32243853edy.6
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 12:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WjoRbYsuuWWLdw8lMELeM8jsb/PWVm+u/44O3jNTiGU=;
        b=seb/MdXqhGkd6EIm4bokO92cUqBcXwBvwvZI7W0nnkz89Z6vKeqG6p6cFFRYbggUUs
         zuncdY8ihAXVdXMz1BJ92a0PIegM2R9Q7rpFqyisDCtJkDiP4+j1ETpY4R7uzysXEJzy
         YaqIVD96S/HzHYitTt/bXa1eQ8UTYqV8Q2d1t72DeJ+BXVpApsWKyPLL5fewP2lG6m9D
         djlLLv69+g/yDcl/8RTV+z4J6GPDX2S5eork97kGhvrBT2NlrmjOii8ZPTKOSafoquSk
         C3siogQ6EYw4WJMkRRuycbx+acJu/S4ZWrT90WoRO9GQT64xJKY+M7hKQqvCDE+ORoru
         /iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WjoRbYsuuWWLdw8lMELeM8jsb/PWVm+u/44O3jNTiGU=;
        b=nS2VvuLXC8a1rhmoxo4QEaFApuJdZCvH2mFDQteB8/SFdXy0nGqFwBmE8YYIwo6zem
         sPZG6U6jRl7yK5p9898bj0j0/bBtL0hho6KcUF1IRG9CJnmMziSlOfB677ZkH1YomImT
         NMgm50sgkw5JRdc3f2MjyVnKqOTpjhin+KHSylk7U1c1Zn+M0N2JXTFQBEVI5HdFhJMX
         +v/p+i2vJo7KN8P8SIYlzXlghGjUtAYeVuaqeq0qFaJVDx7aBXXRhFXDUf6uzps7kN9u
         X7YviTfWG/jpgLS/+7VWxdg7dgCw0P1yfz83hTrU5YBKav/5SBY5AuJ5AjTgqExQ3r45
         UbbQ==
X-Gm-Message-State: AOAM5307aHGuI/XjAsfWaxlyeLXk2X3/tIIl5X4I0BfxQTsjDgv+qr6t
	vuiVViRHRM81qeoqQ2h6OLM0z1JDB8fWheQfEc8=
X-Google-Smtp-Source: ABdhPJy5LILlGi1ntZUSf4WUHjSzZDY1g/ztlLp0qn/SObZ6yTu2T3rN+mELy/vmoQ92uUTbyCUckEJ/SEfhzSDPz+c=
X-Received: by 2002:a05:6402:268c:: with SMTP id w12mr54040085edd.234.1620934451411;
 Thu, 13 May 2021 12:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4OMd12mW9N37WtfUUHYZ=zQ9hsNb8sYanXU1q8MvLKj3w@mail.gmail.com>
 <1305.1620933899472438737@lists.openembedded.org>
In-Reply-To: <1305.1620933899472438737@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 May 2021 15:34:00 -0400
Message-ID: <CADkTA4OA_GBH+YJGNoS0QS-hYp3c1zdnaMVoY=y3V-=3nuAXNw@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Benjamin Gilbert <bgilbert@backtick.net>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 3:25 PM Benjamin Gilbert <bgilbert@backtick.net> wr=
ote:
>
> On Thu, May 13, 2021 at 12:04 PM, Bruce Ashfield wrote:
>
> Deleting the branch penalizes existing developers, which projects might =
be willing to do. Git branch names don't usually have any effect on users.
>
> I'm not sure I see the distinction you are trying to draw.
>
> Deleting the branch normally affects people who are in the project's dev=
eloper community and pay attention to its announcements.  Those folks can t=
hen simply update their local checkouts and move on with their lives.  Ever=
yone else just clones the default branch and maybe checks out a particular =
tag or commit before building a package.  That workflow still works after t=
he default branch is renamed.  Bitbake's additional checks are unusual, and=
 impose a long-term compatibility constraint on upstream projects that they=
 didn't sign up for.

By "user",  I simply meant consumer. (I'm aware of what a developer is
and how they typically work).

We'll agree to disagree on the finer points, since arguing semantics
of good repository management/behaviour is not a good use of time.

Cheers,

Bruce

>
> --Benjamin Gilbert
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
