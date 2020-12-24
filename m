Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.6597.1608781437571861676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 19:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0FqGsSO;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id w1so1756912ejf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MsfoT96NPTw5VfCXpewz46Q1EXlaV1L62KJ0bDCGqN0=;
        b=b0FqGsSOnIXIKqImo1dNJ+n4nl8O4kEnhzjyFLMV5kR9Qtfu6g+riUl2SewE7rPUem
         NDuYtlKD9VU+FFygGPxlkO4FutkBiB8/pJ7lgxR5K9RpkpkCoQu+2hiwvKVKwp7o3/8N
         3xO9qKF9WzL0E45RLVfadmMgNj0U5EGtKTakDE5GI3G47EIwoWa+W/AUInQJAJwojyla
         82opiYpCkkOwuCGV+L387eAPBDL7nJ+JPTrYFY3Rc8pEMNsayrGx8jr4CD58eJGw0Lk1
         BbjAC3bdnj6qYvxTxWl2tyhqVbywPuf4Y0dk7mnD/PK38fr7Deep1/Aj63srX2BO7D7K
         kFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MsfoT96NPTw5VfCXpewz46Q1EXlaV1L62KJ0bDCGqN0=;
        b=V17jipNy6fpQLEokgmcday6iClTjKNlVPXEL8OSyxM6DAVTr7CCg1dvQGUfPSQCnjg
         IGt9CqnkwZp0VgvvXa5k0eJyxs4C5JE8WulRtZjskXgCUCBxWuCiRJsQ4w19rTXwneuM
         rkT8Bla6xKm//ArmpkjD46zErJX45RhLH4IAg8jgg10sdsdTWdq9WtuqsRzMycOyhSXw
         h8kXM+yNVwDujM/T+R+XAw9ALoVp5cDpEcMxzEKb4pWowdjTOmxPOlqpCN+RoSi++6SY
         h1YtYXgSeOUwNT/18cF+E+RBZVFhCFHcGzLZjxRwZagXltFMKecIUgIfaCNnh+zK+w22
         CJYw==
X-Gm-Message-State: AOAM533B80FlI2WIKTm2HYawZJDFx/WvKjIAPyl20mf6qzZBLM0cBtdo
	saHdxDkl0A9osYbSGPyI6y9qUzTO/7qHeyL23pY=
X-Google-Smtp-Source: ABdhPJyRtkfIcF2a3kHxZzRJQAoMlXqevZ+opBOj+QH+gJuPUGhjd8nghaxe2Hu2TDSydLl8UJvpyDo2pV9nrPpUrLo=
X-Received: by 2002:a17:906:5e0f:: with SMTP id n15mr20032238eju.459.1608781436187;
 Wed, 23 Dec 2020 19:43:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
 <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
 <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
 <AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0@AM4PR0802MB2162.eurprd08.prod.outlook.com>
 <16538A0D49119031.25471@lists.openembedded.org>
In-Reply-To: <16538A0D49119031.25471@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 23 Dec 2020 22:43:45 -0500
Message-ID: <CADkTA4MRNQ2ucJ8Ckr3y2CRgx7J2KacEbuU8uV+=MpPv-0f+Aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/9] kernel: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Jon Mason <Jon.Mason@arm.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 10:41 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Dec 23, 2020 at 6:03 PM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > > I'll tweak the v5.4 meta data and send it as a separate patch.
> >
> > Will that tweak the metadata sufficiently to fix the problem?  That wa=
s the Juno machine failing, and that just uses defconfig.
> >
>
> Should be.
>
> It's explicitly setting the option, which comes after the default
> mode. The final .config is compared to the last option, so it will
> match.

And I should add, if it isn't, the fix is on me. So I started to clone
the appropriate layers and will do a local build to check.

Bruce

>
> Bruce
>
> >
> >
> > KBUILD_DEFCONFIG_juno =3D "defconfig"
> >
> > KCONFIG_MODE_juno =3D "--alldefconfig"
> >
> >
> >
> > Cheers,
> >
> > Ross
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
