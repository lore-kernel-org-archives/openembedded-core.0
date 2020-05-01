Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.3008.1588298167035684176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 18:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FakR61uP;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: jupiter.hce@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id n17so6405322ejh.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=aYfIPFu/Pj7VgJyAjdhaR33SsSOkBqm9ztMX725tHeA=;
        b=FakR61uPykNKs84XdL+i+kQL7XjhtZJ2rywf2G4/KAWGxOfJRHzTbfB+mMyQ64HZkq
         rq+EJ0ec+YMjl8eeOXBr0P6Z4nsrmy7nntZNtLkud9aZzU8+v6QpV09+d+xwsLBmnMHV
         jrZOeW9V0jA0qcX2MDi4iG0+y/Uu/zDc35+DmCWjWJySXdSk+uFwNCU3nRSmffG2EBTP
         8iCXbYqmfGeM7FRB6ubOCMljGMukPmeaECl8oV9nMbxsMFwasIBXdEzblAwqiFBpENtD
         RA85ZBKH6+JZe2B71Hvq1Hy5YB3nXLZmei7lu3+doq6dh1eXNbOAkP9td0bR9rHCy967
         RwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=aYfIPFu/Pj7VgJyAjdhaR33SsSOkBqm9ztMX725tHeA=;
        b=mecqPi8wsm+71t7gNTTcgVNAufpJqEK9Rhx8m4tpg7nqfHaVsCCg6iq0zpC9n1eFYa
         PgcQikWjwxQ7uqIrJ9uhaGdgE5eIa0vubADgL6lyrVlW+KA1sksbrcl52/T8d1GDmEVq
         9PohlOWsoPwkxDIhkaXNIjovYaG0tv4zCZZMi7GxdJPsd4MxUlFCpZ8qSDpCTBRYDlHJ
         0uqdmWFjLxUmy4oJ+Q5kZsM5pNkphfms2qwNB1y+jRskEcX9xe6PHJoTEKH7AjbS45bA
         gUIQcdqpNnPp2W3y9w+/BQ6G8A3qMlN/dGJMM0qYAG94pByScjX4zpJVUx/YQFRBLkU6
         tHog==
X-Gm-Message-State: AGi0PuYhnOJxZgcmEk3SvtD9DK3KpNx/Iq/DP72iEVxQPeieb8HIeM7C
	geZUVxW8jk+DS2cloTfjRggOlGgQO9+Qe0ndVm1eLw==
X-Google-Smtp-Source: APiQypKTMulruoL8F6gPVv1Y8tHfFkvO5U4bU6gFZ/XUY0SCTv61CfjnWOzw/IxQ78TYBE0CHLjmz6SUX6XlwbWQdGI=
X-Received: by 2002:a17:906:4c8e:: with SMTP id q14mr1318098eju.208.1588298165311;
 Thu, 30 Apr 2020 18:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a881:0:0:0:0:0 with HTTP; Thu, 30 Apr 2020 18:56:04
 -0700 (PDT)
In-Reply-To: <2823ea3424755ef149b90d28c835f64fcb3afdc4.camel@delisys.ch>
References: <CAA=hcWSKre4hC8m=tdiavFSO1GbetceQy-jbWg0kzrMFK7QBSg@mail.gmail.com>
 <CA+4=imaKgPkYgm-ks8jh0LnTmqovRrMuesXV0RsEmtWs4fmPHQ@mail.gmail.com>
 <CAA=hcWSFY+hWiHQxx9q8eqcaaFZYJaQ1ZfzZx9cTfFjW2XO5fA@mail.gmail.com>
 <CAA=hcWSXzf7SOc4d3tg97O3aORLdFrrD3q1D4y=z2WtqPvfdCQ@mail.gmail.com> <2823ea3424755ef149b90d28c835f64fcb3afdc4.camel@delisys.ch>
From: "JH" <jupiter.hce@gmail.com>
Date: Fri, 1 May 2020 11:56:04 +1000
Message-ID: <CAA=hcWQhp-MRnsh7a-bAq31Yj4bcD_Z5d2cKxaaMdm9V6vDiTQ@mail.gmail.com>
Subject: Re: [yocto] Which recipe for Linux tools to run u-boot command inside Linux?
To: yocto@lists.yoctoproject.org
Cc: OE <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On 4/30/20, Nicolas Jeker <n.jeker@delisys.ch> wrote:

> on Zeus it's very likely _not_ libubootenv that you need, you should
> try to install u-boot-fw-utils. As Yann wrote, the tools are in
> libubootenv since Dunfell, which is newer than Zeus.

Thanks Nicolas, I have following error, what I could be missing here?

ERROR: Task (/build/oe-core/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.07.bb:do_compile)
failed with exit code '137'



-- 
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
