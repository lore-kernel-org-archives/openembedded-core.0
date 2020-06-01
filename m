Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.42064.1591030887081304696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 10:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NTvHW8C5;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id w90so8239726qtd.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X5dxXwBbGhO/n14b0WZLQdy2Ypa2U6TV9Nhp6wyXS90=;
        b=NTvHW8C5XZE/4jdpgCkMNDZIKZ39Oa/+eZrvVKqdlhg3gsatkkRtyrmivdC/Pwokbt
         95+/NIAKDtWHaEMCmmYElcgfypNmPt3RTIFLp5lftcSqiGB5JgQj6hq1P8Xtdhk0HsQF
         mA4aZkgJK+NeESk3sGeC2NllLP2/sRzCFTnThwKKKVrpSYR+aYN0sQqIO7ph9MAPrkm5
         xeY00fY9Hd+XQ1q386/a0bn/7MpuRiApNsE8uAp2Zgmmz4o4G+gJUiFZb4j2jMvEZ11B
         W34C8u0YjfJT2goTGqrkS2PhU0awblHifPiphEI4NT1wwO2bRXc6D16X26GDIygxG/cY
         Qx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5dxXwBbGhO/n14b0WZLQdy2Ypa2U6TV9Nhp6wyXS90=;
        b=D5Zip/4sTkztTgi4L3xM8w4X5f2tEZVPOo/z/yCT0374QTKUzKnIO01JDS7cewha4/
         fJaiQy/zDKXA6X/d+/6548M74r4tf8R3JJvKLnSp2PHRmhjMG9ojjyNvyoNIS5TTFDkn
         7vqEqOahynn/rPxQCa5E2eYbgQFwPxSrefjbjPXn1TjXJmFqpVd4KiAf0sVTlfnvcWWn
         PG9vE3Wy83f+Od0Kt4gmuF1X0JKlgUrD8TIjphljFOOzmy+waVrlbWCN2Q1rDMPtlmuF
         si8Yz47K30SNI1bCEMmnpiGyGS/lffJ87T6ArnoZz9JeQNV9wWSymhSlY5W7OyXsCBCr
         dAjw==
X-Gm-Message-State: AOAM530NKtbfKsDtkb3qlVzGNRLSq9DKEkrH24pA13ijDoW8V8TUDGzh
	tskaIwb4TwhQkfdROxllfSiV9RnqC88hmcwg4hU=
X-Google-Smtp-Source: ABdhPJyeXWaQYiC0IsEb8EJdVb7wwdg4MivDJyNXPVQHxNokbfGzyyo0nVPWXadYJZ5OLvIesQ0kbD2PnkHsek54U2Y=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr22839930qto.285.1591030886109;
 Mon, 01 Jun 2020 10:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-67-alex.kanavin@gmail.com> <c48af912b817bbb89b8dcae32a94562fd83efc66.camel@linuxfoundation.org>
In-Reply-To: <c48af912b817bbb89b8dcae32a94562fd83efc66.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 10:01:00 -0700
Message-ID: <CAMKF1soDNvrA=Nw_Vf+BZ1-6+8tNYoJPvT+gCAJB3VRS1YNLWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 67/70] apt: update to 1.8.2.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 1, 2020 at 12:21 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-05-31 at 17:52 +0200, Alexander Kanavin wrote:
> > I took the opportunity to rewrite the recipe from scratch; there was
> > just too much baggage in it.
>
> Test builds failed with a reproducibility problem in lz4:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13925
>
> This hasn't been seen until now since there is now a hard dependency on
> lz4 from apt in this patch.
>
> We could fix the symbol ordering or perhaps disable the static library
> as we don't use it as far as I know, not sure why it would be building
> one...
>

It also fails to build with clang
https://errors.yoctoproject.org/Errors/Details/414880/

it perhaps is missing the right qualifiers for printf

> Cheers,
>
> Richard
>
>
>
> 
