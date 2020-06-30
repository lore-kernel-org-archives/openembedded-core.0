Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.9739.1593558937332082215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 16:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XxlJPgQ2;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id m25so12227296vsp.8
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 16:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Kb9K4ifqa7zQKQt6i+VpFAzdAtwFD85Qrdot88omXc=;
        b=XxlJPgQ2nE0nhnqaVXa/ObyPR5erz8PUVE3UIjrvrbc8qoBbPNTTLLAUlAxRXLtzlm
         RZH8ZRLqhq/eHr0KYBvk+xyIhB+j37R+GmJw5yc7AkGkfeRbtGTUCxtlEA6IhC8k9eiS
         bvcb7AjMwN3l+D0Zd7poQcTbqOKEJocPG990BSqQZ3pXTkGa4z0IVdSMqAOOo4uI02PK
         bg1ITfPSlkRRjNpqJLAMFVZIIKO9a7WfufY2KbdGIUHpNa9rxhFmB4F80512sKNQKBuG
         tsbwTkNzLZI4uuvY/osJPogE1l8keRnK17ozmjlQ9TTtygxipJmzDCBwken2ES9Z2xbB
         aR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Kb9K4ifqa7zQKQt6i+VpFAzdAtwFD85Qrdot88omXc=;
        b=UmQf/7p9cLOZIwv4BP0nYxTxEXFcSWoadmcbPZ2rsYBh+VEJVVpfbAWzXojTQWr6Pz
         8YXaEGig6xehKnpUIQ5MzQcQm5Pex9REnXzijpU8APDHgBs5JId1NP7nQcKB6HipGoSD
         LXeweGCoIqOu9qCoIGQWB83ChKLcdjDQvuBP0o8oA4RiILkh2pACnVAh9PiXjscTEkj4
         jvlX5IogTSnNU/lxBfaQtDZEgNolw1neCAFLDKxnpOZDHZ+XWx10geEnmVGe/BKhQcB5
         dAbDufZoob2Eojt2jOx9hL5nC6/uEREbON1SAKuPuNEDez4foc7CUkOAgmcK3MbEJwPs
         xBdg==
X-Gm-Message-State: AOAM532NqIKO4gwmldjFYSXY3ae9LLzlxDzuJd0+HJDAIqZ88hsQXsKz
	nFHuI/Ou7ftLw1GQvDrCYW4C7E1K3erodv2P/P8=
X-Google-Smtp-Source: ABdhPJyqqdiYDTXrcCt7V0djYTvDRRoIWd8bwKEy+ua1XsyORht9cFWbDAU4JVVb75FPVUYC6GJ/293WhPurkwdWPA8=
X-Received: by 2002:a67:2ed8:: with SMTP id u207mr7245537vsu.11.1593558936234;
 Tue, 30 Jun 2020 16:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101413.2783-1-fredrigu@axis.com> <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
 <1593543683295.70380@axis.com> <20200630215424.u77jq5frrnpwztfc@jama>
In-Reply-To: <20200630215424.u77jq5frrnpwztfc@jama>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 30 Jun 2020 16:15:30 -0700
Message-ID: <CAJ86T=VTNDHK0OCdWiSTwyv97rvkGTa9euc+OhtMd07dxwbaSw@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, Ross Burton <ross@burtonini.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 30, 2020 at 2:54 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> On Tue, Jun 30, 2020 at 07:01:23PM +0000, Fredrik Gustafsson wrote:
> > Hi Ross,
> > those 5 seconds will increase to minutes for my use case and we build a lot
> > hence I hope this will save us a lot of computer power and engineering time.
> > For example I've sent numbers on building a bigger image (core-image-sato-sdk-ptest)
> > to Alex and Alex:
> > out.apk.1: 1:13.35
> > out.apk.2: 1:13.51
> > out.apk.3: 1:13.23
> > out.apk.4: 1:14.07
> > out.apk.5: 1:13.00
> > out.deb.1: 3:49.37
> > out.deb.2: 3:50.77
> > out.deb.3: 3:51.39
> > out.deb.4: 3:53.40
> > out.deb.5: 3:53.99
> > out.ipk.1: 2:38.99
> > out.ipk.2: 2:39.07
> > out.ipk.3: 2:35.34
> > out.ipk.4: 2:36.15
> > out.ipk.5: 2:34.55
> > out.rpm.1: 1:58.61
> > out.rpm.2: 1:59.42
> > out.rpm.3: 1:59.70
> > out.rpm.4: 1:58.96
> > out.rpm.5: 1:58.11
> >
> > Also consider that if we've a target without python with limited space, rpm is out
> > of the question. So the real comparison would be between ipk and apk. Let's
> > say we can save 80 seconds in each build. Now multiply that with the number of
> > builds, and we do a lot (I guess we might approach 100 000 builds/week in the
> > next year). Then this will save 92.5 days build time each week.
>
> This is impressive.

Indeed. 10 builds per minute, 24hrs a day. But not as impressive as
the scale of the development team able to create enough changes to
trigger so many builds and the scale of the test infrastructure able
to consume them!

Assume one developer makes 10 changes a day and each change gets built
for 10 different targets... 100,000 builds per week implies a team of
over 140 developers.
