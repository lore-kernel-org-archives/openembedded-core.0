Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.1919.1607023335764481824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hat0kYL4;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id v8so1905191vso.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9E4f5/oFgh18XCRM8jzmamEQCHNjEcbaOSqoeKzyG9Y=;
        b=hat0kYL49N9yRnm1ZsEzMLD/030SJfKSkbY8OtSFzWZw83xgeF4G4Overy4aqYG0Sq
         qvLDAPiciMsD8d5sDUgG2hSx3eODI9IrwDt/zhuGteOwpa6b35PUlML6FVSDf2HDtVeb
         XL6w6jGUWx7h1EltkOatbstyhFvsn1lrKOfZ4uCValp2lj/czF3EPFfzC5Z0gs4CXe1j
         K50g3mSPfMtxsqrPq5SZCQehAWVTZTxOOaw88dFM5lDaO6nNyzLDT0MAsccIxemudDcL
         51NDROoteEtVQejo4y361w+LTczr59WRBqlWy30cRvV7uNI0cbl/795npoW2W3LQHfDD
         k/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9E4f5/oFgh18XCRM8jzmamEQCHNjEcbaOSqoeKzyG9Y=;
        b=daNt/LAFNrlpupwl+TgY24eWheBqcHnZhp44/Suw8j2RIuF8EZSJHtuRFZ/EBbstAa
         yArhDkn2Hk4V0RiUvh9s0l2NhZpNEF9heDPVI+Y+Fqoeha1dbe4FGvtoc7pvGDI5iUjS
         PBzpZyuw4nf3S7bZMqbzw04/YdnSOROtG7/Hte0aXKKS9Rpb/IHix5cQrwRJ+mAdgG15
         rbaaMJqGwsmP4QoN3yeW22MNBFDDAPzYJ7Ly9qElOeE+kWqwlkHLYYUqFmpc4j541O/C
         NRptI8pICzXcVJk9W5FDjspkKH+16aG+21oo/chrO4sJ/Lbsu/fr/qZdmfPbSj3NXlEy
         A0dA==
X-Gm-Message-State: AOAM533ZCCG7ey4xbL3AgYLlkYYPlv0ZwkmwI+aZboLpnrMn6TWnqjfM
	4Wgbt+j54GKue3FhOorbtZdKjDSkLEY3mUUBvIY=
X-Google-Smtp-Source: ABdhPJxBlTa4hIaSZTdBO9M7L8nrHhuEH74cYi8+hVL89t68ooj+Cs1KLBUjsmp/1+SYWVYPHurvzwVxyheowSAhoLw=
X-Received: by 2002:a67:7902:: with SMTP id u2mr308218vsc.41.1607023334975;
 Thu, 03 Dec 2020 11:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-2-alex.kanavin@gmail.com> <CAMKF1spavgHqm9YuCqo3mr-=kRGzW-J60T4gTQ5=uoBn98Hb9Q@mail.gmail.com>
 <CANNYZj_FvTGSUtBoEi_Nc=jA4szr1WrPNQSwjRuuawuJ7H6-rg@mail.gmail.com> <CAMKF1sq0cnt27qB5qSnKpVA2F4Tnf-ha1Va+P7F8B3OjGh9R_Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq0cnt27qB5qSnKpVA2F4Tnf-ha1Va+P7F8B3OjGh9R_Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Dec 2020 20:22:02 +0100
Message-ID: <CANNYZj9yrOVHM44Cd2Sz+FVxE5QSO3p7abcixjuMVQNJ91p2oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] kea: fix reproducibility
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000006ebb805b59447ec"

--00000000000006ebb805b59447ec
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Dec 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:

>
> but say if you were. Would it make the problem more obscure than what
> it is now. So while here, perhaps defining KEA_LOCKFILE_DIR to point
> to /run would be a prudent thing to do if it's already not done.
>

Apologies, but no. I am not defining something that I have no way to test
the correctness of, and I am not going to bring up the kea tests on target
to achieve that.

Alex

--00000000000006ebb805b59447ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 3 Dec 2020 at 20:19, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
but say if you were. Would it make the problem more obscure than what<br>
it is now. So while here, perhaps defining KEA_LOCKFILE_DIR to point<br>
to /run would be a prudent thing to do if it&#39;s already not done.<br></b=
lockquote><div><br></div><div>Apologies, but no. I am not defining somethin=
g that I have no way to test the correctness of, and I am not going to brin=
g up the kea tests on target to achieve that.<br></div><div><br></div><div>=
Alex<br></div></div></div>

--00000000000006ebb805b59447ec--
