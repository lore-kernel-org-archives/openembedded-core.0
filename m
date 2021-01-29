Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.224.1611954895830745946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 13:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sA/iNzum;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id u25so14390572lfc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6+3W1SgfF5qFwYdYb6KozkTSJOqDjDEv7iLI/hXYeiE=;
        b=sA/iNzumuq8T+r+JB8UIV7xobBPr5zLT0s5N++joNXw2pj0GSONe++resmdklRPwsY
         V/mmIg3GACZflimE1F1YFaQZa9zalfZ0IgNrLqcBuk/nZPTAHs/wohUqtMrQq69vdG8N
         mwm2qwTQoiYp0OGkq3nwsAiYehfdYHauSNfFVC2N07R8OHXpMQobp31++MwEwA8JlXqG
         nakrbil1oBFnTlTpu3bAn31/l1dvWxLFqrCMMz42NkIS3qopmXrOCUAMLsrpEOPWN2TD
         KX7zB3Z++zihmNnZXr2szA94u8dpdd42Oa74VTAZV0tMMKhRhD4I6xQ9psGhkKdPT7JO
         ag1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6+3W1SgfF5qFwYdYb6KozkTSJOqDjDEv7iLI/hXYeiE=;
        b=YyqaitT6PQkkZchFzn3bAlArapsHrRb9E/e357H/OJyB6Q1R8G6NZln6gpEO3e95pa
         6+Ryh957wINnQsL2BiKsqYysALHXS8AH+n1jnBiXXQNV58+c2P+NTMXnYryVICM0T1eX
         fC4gB+YcktCIOtYLk97UoO1vtGcWzzvS4sSzM+Bc4pZRiO6ZsAV57oQ7YPGJbB61MhJb
         6T6CgTI3/j24LvcPs/Fqu55HTggckfBiBGjqUcYLxfVolZ8bIvd4PzcPlKYJz+sElku/
         J/DsQzeGUzyXkKV6ksDJ8FYJaLtcIsuU0ydrm3ev412VmVTtioY+KIqjO5XrcUtqwNG5
         8Oxg==
X-Gm-Message-State: AOAM533TfIaI06oW6raGlWwPFaB/CLOLgBqZK+jo/ThnPTa1ehwMWLJO
	xGoewRNt080J2n8fnLVQn8amhm8yzKm6GjhnCPo=
X-Google-Smtp-Source: ABdhPJwE9H7g6RX0cvWgtkxLT6KXVRXtyj9Hw493xithHToa8UVdJVg2bOhiGz0pJ5VQC1rZcUTsfOkli3nMsHsin5k=
X-Received: by 2002:ac2:5d6c:: with SMTP id h12mr2936063lft.482.1611954893867;
 Fri, 29 Jan 2021 13:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20210128213504.3821-1-tom.hochstein@nxp.com> <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
 <DB6PR0102MB263003ABFF3E2D9FEE5E378988B99@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAJ86T=X=GTOM5X4vgZ4ox4_q1Dy-Y4p0Nthy047GrJBdYJ_qcg@mail.gmail.com> <CAP9ODKrVvkYGiJrzjEr9CgzGsGm_Wdk_8+uU=CzX6FUm1OnRHw@mail.gmail.com>
In-Reply-To: <CAP9ODKrVvkYGiJrzjEr9CgzGsGm_Wdk_8+uU=CzX6FUm1OnRHw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 29 Jan 2021 13:14:42 -0800
Message-ID: <CAJ86T=VvPonLRKnERV=Y2xtrhK3edzd+3amPfGf-gHXB8H4++Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Diego Santa Cruz <diego.santacruz@spinetix.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	Tom Hochstein <tom.hochstein@nxp.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 12:45 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em sex., 29 de jan. de 2021 =C3=A0s 17:39, Andre McCurdy
> <armccurdy@gmail.com> escreveu:
> >
> > If a distro or BSP layer wants to enable cryptodev-linux support in
> > openssl they can already do so by creating a .bbappend for openssl
> > which adds the PACKAGECONFIG. ie if we decide that the option should
> > be left disabled by default but controllable by the distro or BSP
> > layer then no further changes are required - we already have a fully
> > functional mechanism to do that.
>
> DISTRO yes, BSP is harder. If we enable it, it becomes MACHNE_ARCH as
> well as all packages which depends on it.

That's a concern if you're trying to create a package feed. But in
that case you should already be taking care that BSP layers don't
change the way recipes in common layers are built. ie this is
something you would be controlling from a distro layer anyway.

If you don't care about maintaining a package feed (which I guess is
the majority of us?) then BSP layers which contain .bbappend files for
recipes in common layers works just fine.

> > Going back to the original question of whether cryptodev-linux should
> > be enabled by default, I would say no. It's very much the legacy
> > approach and in the absence of benchmarks to prove otherwise I doubt
> > it gives any advantage in performance on modern platforms (especially
> > CPUs with dedicated crypto instructions).
>
>
> Tom, this is indeed the most important aspect to discuss. We need to
> check if latest openssl with new Linux kernels still require
> cryptodev-linux to use the acceleration.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
