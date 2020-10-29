Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web09.8142.1603975930610735077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBwfM1z/;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id g25so2092939edm.6
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YxwL7HPhjOULMuCg0Y3hnUafNTG1fMIU0vHsJ1XMGVo=;
        b=dBwfM1z/gh0/f8I05QNanl4JYXdB4cusnlQvbKp6x4Q3n09hPt1gRxTu5on+iTmfmL
         ssf9fpZmxoyzzkJk66EowxL0jpg3MYz/e3JY+ceCcxLmirMQ2NAHE7lED6Nmtsn3PDts
         GQQUscqhr7wj1ScdTseTCNQdrK46otFdQklhtHEtjx/wsxMowpJjXNC4V+WiCtTPbmCI
         JHPydqyUfggfckIQpN6hTy1i68RXa2sBjBxuE9oyt5QKp4+Yj1gypL6SkA2DXJnM8NsN
         txicjXhr1yV3BWBJAfrTGCsoj3buAMJ58kOb3EHVCoYyRmM8NPJDeFiTurYPrvoPUPyQ
         sAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YxwL7HPhjOULMuCg0Y3hnUafNTG1fMIU0vHsJ1XMGVo=;
        b=jXf0kWKoGhs2YdYrFW9XRaXohfxEaq0ru+YpU/5LzcWZzg6Vii8oz84KSZSjYL/8PN
         cykC/NGKpjTxrDd1elFjPrmqtBF5zgNZQpC7u3OuKMq0HteLG6R6tED4JobBkB2s+Z29
         49qg1tKwMf8eKv6cLeVevGgVqNAzSXEvYtHLloynFud9m7bb8lg5mP7TH21lFNcMrOpy
         w/hcxCwLrO9ZA6O3zB2/D8zpQStlCy7upU5UpDXgyiW7qQ+5VhGLkS8Mi+WUypOPNBSb
         ntcKvIDO9kEkv63Ho71BLqqKa9417NK8IomWtZWJg7KFOuiOG86F2vq/gJtovqDr7as1
         9TDw==
X-Gm-Message-State: AOAM533RPcSgkSRXDMV170MI7CzYpvxZkFAwoJa0a4YQKWWxa1IbmaTf
	3/alFaULgxK+R0Hv2k8sXvhzk8uVxRMrIK0WAtU=
X-Google-Smtp-Source: ABdhPJxws5NQS+PPdOwOS6MzWx2wQ6n7OIIScbBWqZoNt/SRzssm1Nch07tffpW14ndzVW8FdPfvDMg1ks+BB4DBr9A=
X-Received: by 2002:aa7:dc50:: with SMTP id g16mr3729271edu.95.1603975929149;
 Thu, 29 Oct 2020 05:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
 <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com> <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org>
In-Reply-To: <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 12:52:07 +0000
Message-ID: <CANPvuRk13xJMo=AoTc29=BwCTqcgB56bNsQ4DuSNC2SnhuGwAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ffmpeg is disabled because of LICENSE_FLAGS_WHITELIST in the build
configuration.
I think there are no issues with the removal of x11 from distro futures.
It is present on the autobuilder logs:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'ffmpeg' (but
/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer=
/gstreamer1.0-libav_1.18.0.bb
DEPENDS on or otherwise requires it)
ffmpeg was skipped: because it has a restricted license 'commercial'.
Which is not whitelisted in LICENSE_FLAGS_WHITELIST


Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 12:32:
>
> On Thu, 2020-10-29 at 13:20 +0100, Alexander Kanavin wrote:
> > Wait, ffmpeg has been available in oe-core for a long time:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multim=
edia/ffmpeg
> >
> > So the issue is not the absence of ffmpeg.
>
> Right, that shouldn't be the issue. I think its the disabling of X11
> that is breaking something somehow.
>
> You can see the configuration used at the start of:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629/st=
eps/8/logs/step1b
>
> the key component being:
>
> DISTRO_FEATURES_remove =3D 'x11'
>
> I think ffmpeg is being disabled due to x11 being removed but something
> which depends on ffmpeg is being left enabled accidentally.
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
