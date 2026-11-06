Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4640.1793966687441808572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 04:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OSo3AjZV;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc0892f92cso157894137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 04:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793966686; cv=none;
        d=google.com; s=arc-20260327;
        b=NoZbg0qNFOkapvdCqxRUeVCj2uB+fbdtSRF3Nc5wW46XsXDT7R+Mwxt9yXINluwrIv
         Hgg4cEADvMqXiBaMw9BQJvXuxaXSDPFs5OSOzCcG34MsVzuyLUVzrCKgofCGcTKdCLvp
         LJ0ETwh/wcNKmyfmWIDzfBiF3NzBK3YNRiTxw248qxM7FB1xJHiZiSxqaXmYVSXWJyrc
         WQg9xDd17qG9EFZDDNxf5xaJ62cEPIUUDIGFsnhKL8ybyIZo6iXRLSeaMDpoVz1IFCAr
         OTEnYMtQ/vaV3M6mmT7n5bSV8JwNmMiarAoZTM+98qKJB5s+CiEmzsl+RO8/beIlOWeh
         Hiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o2KJRP7o9OEaBwenhmTGz6i9ltU1EFZgFtwstSUQcsM=;
        fh=IZgbv7R9sOY8kU1pJip7dFN9xpK7Ia3dlg0PQ/mRXGA=;
        b=RUODSmOXmtBYF6AgrR3qwdo3tGAP3YHt3FYPhESOfZ6uTMXx2MhuNXK7+/mIlspZ1t
         jEqDMqSO/eFW0UGQga+V9SpQJmxvMbqBgW7HcMcF1PlQweXciOw95RxbfOaGmGr9VrJq
         OX6JzcEMnYywm5EIcm4mTGRl5NJTiLsAQ3oJASjHSzGm8/BREO7W9M/CLbYIaecP0A9d
         OVoK0Vxl9J8kRGATsEPfugcvm/qoq6laGopA0xzOT/FJCFMAwKt9Hy8gmn+LiIYkzUQ0
         bX2hX1++8KHvl9LC2h9H8ZSG2m1J6xWVbNdHB6ojmwvD9N93h/D2s3WX3KCKHGDGNqGi
         phwA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966686; x=1794571486; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2KJRP7o9OEaBwenhmTGz6i9ltU1EFZgFtwstSUQcsM=;
        b=OSo3AjZVRiORnaI1G3zH6JDJs8uEiOzc53pVqX1sYS6darK1g7eiMUAS0VZPSm8glo
         AJoK7gNb69+TRrEBk19M63YISAc4H8QtiGs2cLZSb+ZTFMyZfVMTPjh0dpW9YtlL7VXW
         FhGyAHNw1314mxzED8sNNqI53Dx+TpFr4fBHs1ngb88ySx30pURfrO9w4V6T+/4NIbET
         V5aIr93iwdaxBy+PpsBknsJTIQpk1W2CkhWipyJtKVkiJhJwX9VrCeJXRvBQaJYUaSH4
         eZmb/XTObVPb7oGFd+3e0cgMTqdmA2kp8qeee/0Dh1xxE9wRMcUBKtukD5bxqOsicyPx
         lKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966686; x=1794571486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o2KJRP7o9OEaBwenhmTGz6i9ltU1EFZgFtwstSUQcsM=;
        b=lrDlBLuKCuoqGctMDxbacxESjBZUu2m2sBoy858Ed0CqX6OTfG5YhSWoDV/x5JFRF7
         Zu7NrPkoQijVei4YgwiyUP0RV8Ta7kyt81J8HwGNt5iv+mvH1OIof/n9k8+95c2J5oEj
         /ajQlv5QMFUx/JpS/2wuRCZtm+BbO3R8IGyhH0IQzYX1t8RCGkKG9aR268QIbWv7ZEo0
         FIH588Wdqqqdvnv9vZ4oPriSZ7r+Tcxtx9aNtTJZ3bWxeH4Alr2Wf4Iib/rtmaJAWy0k
         orCXCEZrsdmS0y/R01OiVtCcrn3paTbkbuFW8NfQucLmGBEWYQbqakd19Bxycg/hdjoa
         XeSA==
X-Gm-Message-State: APuU4Z/GQ+kzPlu4fh2Nn3Gpad5G8gY7sHKSGrCr+gvusDlrSrb4OT0R
	EEu+IgOPAbrN6N57nh+TnsYEaf1Z7nSQ926Zjemt1iai5KXqtg9OjqNzKyfBmRayjzC+K2jivTU
	tevNFG8Z5b0jbfImlXEkQqqErvqaY5eM=
X-Gm-Gg: AYBFou2vtclYBrLYGCjY+zj+DVWn2a7YxfhhxD9pT57cUa7JJnYUnBD3ph1MvcV05MG
	kye9orKCqrWeVjaQvGS70SlU1AIXRoKM13tcWoK/hoEShZV/c9JxFEDJYhhImpirpNSKLDc9CxE
	yMV0oqJdbufgBWxM8/SNdLMf2ZsLJxRzt7LZs+z47mSjDE3eW2Q/SH6YzP8b6RAP9PkqfQrxVrO
	HYTm3If2JRrU/xSes4gtRDvAyKNIQBe3tutvy/tTjLBVhBDg7n0dqezVYHY1+2mNWwZh4IgJXkO
	LoqJKUSZDo+fkwCAxDB/eyK/xWeRaIEPceSrqtroB2g3kEeDiRB8U5EzhOqKYPJsUJTZBfpAR4T
	kBlLdsE2J/qqO8uEymlOpnllVcxizGVCe/jUJmOW+QcCwbw7G94iyNZ6U1EHC4lCZDaw6ZFg=
X-Received: by 2002:a05:6102:f14:b0:7b3:7653:5487 with SMTP id
 ada2fe7eead31-7d2a16b4f28mr1126157137.32.1793966686139; Fri, 06 Nov 2026
 04:04:46 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj9=G4+jmRx7UJMYbsp2xwDxwSmm+Gv2HxcPJtOen_9LUA@mail.gmail.com>
 <20261105210554.1648512-1-stondo@gmail.com>
In-Reply-To: <20261105210554.1648512-1-stondo@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Nov 2026 13:04:34 +0100
X-Gm-Features: AclHuK9H7LVGnDfflIrbOAITin1kQ1OP5mbFYaoatTsO8Ed8ifaFjpU6IXRxSBU
Message-ID: <CANNYZj9-JNh8uRFWFMZRwnsNy1_dN+_OEDLA2NN3Z8smAKBRdg@mail.gmail.com>
Subject: Re: [RFC] spdx30: name, version and purl for dependency downloads
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	bitbake-devel@lists.openembedded.org, Joshua Watt <JPEWhacker@gmail.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, 
	Peter Marko <peter.marko@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>, 
	Patrick Wicki <patrick.wicki@siemens.com>, stefano.tondo.ext@siemens.com
Content-Type: multipart/alternative; boundary="00000000000010f910065f9a6b45"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249637

--00000000000010f910065f9a6b45
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 22:05, Stefano Tondo <stondo@gmail.com> wrote:

> Yocto already knows all of this at fetch time; the RFC is only about
> writing it into the SPDX it already produces, without changing how
> anything is fetched. I hope that makes the context clearer, and I am
> happy to go into more detail on any of it.
>

Hello Stefano,

thanks for the detailed response. I need to look at code to give specific
guidance, but I want to make a couple general points:

- do not make fetchers any more complex than they already are. The reason
is that few people understand or have an interest in that code, even fewer
are able to meaningfully review contributions to it. And still fewer
actually show up to patch review meetings where patches are looked at.
Rather try to do as much as possible in oe-core through a clear API.

- gitsm and npmsw are historical mistakes, however 'convenient' they may
be. Doing internal magic just resulted in a ton of corner cases,
maintenance headaches and (in case of npm) bitrot and lack of integrity
protection that caused the whole thing to be disabled until that disabling
forced someone to fix the issues. I would want to replace them with flat,
explicit implementations.

Alex

--00000000000010f910065f9a6b45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 5 Nov 2026 at 22:05, Stefano Tond=
o &lt;<a href=3D"mailto:stondo@gmail.com">stondo@gmail.com</a>&gt; wrote:</=
div><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Yocto already knows all of this at fetch time; the RFC is only about<br>
writing it into the SPDX it already produces, without changing how<br>
anything is fetched. I hope that makes the context clearer, and I am<br>
happy to go into more detail on any of it.<br></blockquote><br></div><div c=
lass=3D"gmail_quote gmail_quote_container">Hello Stefano,</div><div class=
=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quote =
gmail_quote_container">thanks for the detailed response. I need to look at =
code to give specific guidance, but I want to make a couple general points:=
</div><div class=3D"gmail_quote gmail_quote_container"><br></div><div class=
=3D"gmail_quote gmail_quote_container">- do not make fetchers any more comp=
lex than they already are. The reason is that few people understand or have=
 an interest in that code, even fewer are able to meaningfully review contr=
ibutions to it. And still fewer actually show up to patch review meetings w=
here patches are looked at. Rather try to do as much as possible in oe-core=
 through a clear API.</div><div class=3D"gmail_quote gmail_quote_container"=
><br></div><div class=3D"gmail_quote gmail_quote_container">- gitsm and npm=
sw are historical mistakes, however &#39;convenient&#39; they may be. Doing=
 internal magic just resulted in a ton of corner cases, maintenance headach=
es and (in case of npm) bitrot and lack of integrity protection that caused=
 the whole thing to be disabled until that disabling forced someone to fix =
the issues. I would want to replace them with flat, explicit implementation=
s.</div><div class=3D"gmail_quote gmail_quote_container"><br></div><div cla=
ss=3D"gmail_quote gmail_quote_container">Alex</div></div>

--00000000000010f910065f9a6b45--
