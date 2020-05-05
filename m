Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web10.5987.1588679310994616350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 04:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NSbB9WCU;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id w68so399277vke.5;
        Tue, 05 May 2020 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oFpGGwEuJJOnB4i4zwGFZytWYcX8cDwYyS+0EEC3G+Y=;
        b=NSbB9WCUJ+IucPekvwuyEYVdJ5eXP2TkCgxCGqRPtITGSs4SlZn/+5r/md1WU4nIPB
         Q9c9mhjJJGFzsAbGX3Hg4YLinV4VzhivqctJOKkgHnLWGB2RP9HYdt+mSiXf+EDMZ82/
         BmZIS1Mru+QadDi42daL9zRpTeessVfIZJNDZz7pT2ZrhWkal2rTjo5w3++GoQWTYP4c
         Zgev1I3sllDQ4nxqL2zhVE367j77hqexgp2BR1GtlePjKN6Dl772UHi4KQ+P/PFfzbae
         rNkOcn1vlud2RguWNxTB3vAZ1cfotwwVTivqTzUsyaYJ5mJ5q/MIFBbagaWhYj90LdMZ
         u+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFpGGwEuJJOnB4i4zwGFZytWYcX8cDwYyS+0EEC3G+Y=;
        b=Vf81ULojsYLBSlekmAmeW+/72v9gDGF7ScEzkxX0RQSs/7qIzy5/4/rEHKTxkdcDGo
         u6vyV9VKUcp/WGJe2EGIlKIOWRR/Goi59ZC2F6PlIAlIEypFeyGtVSbzWvO03Odv4xtX
         37qg/GjkucXVWWVuxWW9T3/C5k5+8HlaOYPMS1B+hVYjl+9is2HXXOydEkLle943UmAy
         Rraj9R576QI3xAhRRXtbY4eBPkhMfAAw/Cnlw7zQVflnX8TUEpYj2yn9YejgsUwCrtZL
         Q0iHlqZ0Xcx10LOGx2oQucYG4yh32FPJroTIkD8Kjm6UBBgkr6Mc4y+nI8EFD8OllC69
         HioA==
X-Gm-Message-State: AGi0Pub/q3zk7dGKRYICLBCF3QDPJc025AwUJNQayB0nMk1Jk3LDbSWV
	b7xhuFYtiH8OUkKkfJ+kptMdFrATvo/hN2Rwn4McQA==
X-Google-Smtp-Source: APiQypIQFr7d1aLyu5gvbU6nAC4oBWAm3Q74G0ORj/KwMKLSvCnYDL74lTIINAxgsbAsaEmCzSyYwEAfCAM7ocn2xgQ=
X-Received: by 2002:ac5:c810:: with SMTP id y16mr1781292vkl.49.1588679309804;
 Tue, 05 May 2020 04:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_R3LO5nZs77j_2HBYQx44rf=9pMz=oABvXzDAxSvzBWQ@mail.gmail.com>
 <53530eac-ce1c-db1a-f489-1d5a4a910870@gmail.com>
In-Reply-To: <53530eac-ce1c-db1a-f489-1d5a4a910870@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 5 May 2020 13:48:18 +0200
Message-ID: <CANNYZj90z3JYhajCF9fEDeUXgsYJary9PKk0GbihAHp_FH3_cQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Proposal: community maintained recipes in oe-core
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec483b05a4e539ed"

--000000000000ec483b05a4e539ed
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2020 at 00:16, akuster <akuster808@gmail.com> wrote:

> the current maintenance model in openembedded-core is problematic due to
> lack of well-working process of finding maintainers, and replacing them
> when they're no longer able to contribute. This becomes especially
> frustrating when maintainers silently disappear, and perfectly fine patches
> produced by Auto Upgrade Helper and sent to them via private mail go wasted.
>
>
> Can you clarify what you mean by silently disappear.  By the time I have
> time to process an update, someone else has sent the patches.
>

That means: a) not sending any patches, despite AUH reminders, for months;
b) not otherwise active or visible on the lists. You wouldn't qualify, so
no worries.


>
> I'm proposing that some of the recipes in oe-core - those that are known
> to lack an active maintainer - would be transitioned to 'community
> maintenance'.
>
> Define active
>

The reverse of the above: sending patches OR otherwise active on the lists.


>
> Well that is one of the problems of putting tooling into the community's
> hands. It is made it easy to send updates to the list. Is not uncommon to
> accept "Update" as the only  information, do you expect the submmiter to
> deal with stable or the Package Maintainer?
>

We can certainly ask anyone who sends a patch to try and provide more
information about the update. The reason I'm not doing it is that I have
too many updates to handle; but someone with only a few recipes should be
better able to find time for it.


>
> I agree there should be a way to update maintainers e-main once we
> determine they are not longer willing to take part in that program or
> absent. I believe this an issue in general for OpenSource has had to
> address over the years.
>

My plan is to experiment with this for the python3* recipes in oe-core for
a start: they've been bouncing between various people over the past couple
of years, but no active maintainer has emerged.

Alex

--000000000000ec483b05a4e539ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 4 May 2020 at 00:16, akuster &lt;=
<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
 =20
   =20
 =20
  <div>the current maintenance model in openembedded-core is
          problematic due to lack of well-working process of finding
          maintainers, and replacing them when they&#39;re no longer able t=
o
          contribute. This becomes especially frustrating when
          maintainers silently disappear, and perfectly fine patches
          produced by Auto Upgrade Helper and sent to them via private
          mail go wasted.<blockquote type=3D"cite"><div dir=3D"ltr">
      </div>
    </blockquote>
    <br>
    Can you clarify what you mean by silently disappear.=C2=A0 By the time =
I
    have time to process an update, someone else has sent the patches.=C2=
=A0
    <br></div></blockquote><div><br></div><div>That means: a) not sending a=
ny patches, despite AUH reminders, for months; b) not otherwise active or v=
isible on the lists. You wouldn&#39;t qualify, so no worries.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>I&#39;m proposing that some of the recipes in oe-core - those
          that are known to lack an active maintainer - would be
          transitioned to &#39;community maintenance&#39;.</div>
      </div>
    </blockquote>
    Define active<br></div></blockquote><div><br></div><div>The reverse of =
the above: sending patches OR otherwise active on the lists.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <br>
    Well that is one of the problems of putting tooling into the
    community&#39;s hands. It is made it easy to send updates to the list.
    Is not uncommon to accept &quot;Update&quot; as the only=C2=A0 informat=
ion, do you
    expect the submmiter to deal with stable or the Package Maintainer?<br>=
</div></blockquote><div><br></div><div>We can certainly ask anyone who send=
s a patch to try and provide more information about the update. The reason =
I&#39;m not doing it is that I have too many updates to handle; but someone=
 with only a few recipes should be better able to find time for it.<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <br>
    I agree there should be a way to update maintainers e-main once we
    determine they are not longer willing to take part in that program
    or absent. I believe this an issue in general for OpenSource has had
    to address over the years.<br></div></blockquote><div><br></div><div>My=
 plan is to experiment with this for the python3* recipes in oe-core for a =
start: they&#39;ve been bouncing between various people over the past coupl=
e of years, but no active maintainer has emerged. <br></div><div><br></div>=
<div>Alex<br></div></div></div>

--000000000000ec483b05a4e539ed--
