Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.16726.1589558749691527269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 09:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=i3fe2osW;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: daniel.diaz@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id l19so2800134lje.10
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uPAUg1hqRcRY5R6N+giZ/EdWLpEifRyjheSZH9bmjT8=;
        b=i3fe2osWMy51Q58EjaC3CSaoBXxXn3+wH3c4jhJcdFbb0EQAjYibVs4CnCn0X0gSjj
         COBQjig99lPsI6hSL82K+VpCvxnVmqd4AmYNTsS4A2iWYFYXUaiaGyN2Pk9RtDMikoP8
         ZZfMT2bn1S8vW/mPQkmMLdH6KYKN+QJ0bA+K5IOJJmLn2FlMqV5oiQ66MmlIX/51WrL9
         m73zrRiAKY1w+skmlGkTfR9LrHGgBKJnbO66RU2H5j3leVeR2+CoeX4PJcpa9UhCnaRk
         tVIs6B1wkyaI2P35ZeDsFgbz/rO5z5gHo/Crc37xBdjqgySb1yUhH3jvwnCyxCrbDkJo
         DYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uPAUg1hqRcRY5R6N+giZ/EdWLpEifRyjheSZH9bmjT8=;
        b=AkspCjuKhsz5UNhTJp8nmF0Es5Mfi+S0NEd3B129Y+R4yN9T701f79Jgv4U2BO5m50
         2xtYVIijELeJ/d94h3qKdvq6djN3kXeZFOwfe1XB3YS35Cz1BozwgcdXdjESMZaDuhVZ
         8+s4OYGyvA9ugryyDVZMBfqQ2vCOjRANlACe7sMe1SJx9k0VqxqZiamMuZfH1PzaSjaU
         T/n/tHZdUqE/YYhzbzmgXqwbw38d8LDak+Duv9rpR5x6x5TMoE4JOkR9eRjkTN1oRZb1
         XqgHF2czcA+eQNeHpdXF7ioIcjTnJQxZWJecW+oDzbwthFBAZ+vlvXwdu1Q7f2veHMFr
         MXrg==
X-Gm-Message-State: AOAM531FagiDswS6pZdGtLIbrf7y8ErwFN//PlU/Tf3bZC32kQf4ZhO9
	jDGbzpZXl8ckhTLdLgRB+Fqq6hExsrTExBxmT/Ifog==
X-Google-Smtp-Source: ABdhPJyCFW8wuyPVAAtPpR6XFyr23wRHYDs/NEkcGl4iJ5cn6VgAH9xG0UuRa6EGtMD6wCEtCtrxq0klLp4e2dX2lkk=
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr2656036ljc.48.1589558747511;
 Fri, 15 May 2020 09:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <f756b087-c3e3-3a47-171e-bc72421ff48a@balister.org>
In-Reply-To: <f756b087-c3e3-3a47-171e-bc72421ff48a@balister.org>
From: "Daniel D?az" <daniel.diaz@linaro.org>
Date: Fri, 15 May 2020 11:05:36 -0500
Message-ID: <CAEUSe783rDYWD6we-OLpU2=eM1HTJ0=zars+RJOBYW0c8NFveQ@mail.gmail.com>
Subject: Re: [OE-core] OpenEmbedded Happy Hour
To: Philip Balister <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-members@lists.openembedded.org" <openembedded-members@lists.openembedded.org>, 
	Yocto Project <yocto@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, 15 May 2020 at 10:56, Philip Balister <philip@balister.org> wrote:
> I've made a wiki page to track these:
> https://www.openembedded.org/wiki/Happy_Hours
> Then next one is scheduled for 2100 UTC on May 27.

Ah, just in time to watch live SpaceX's launch:
https://blogs.nasa.gov/commercialcrew/

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
