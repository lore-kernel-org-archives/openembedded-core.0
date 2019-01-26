Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id C98806BA9C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 10:51:56 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id x124so6927122itd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 02:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oq+ENtog3TtdWdvfQjqWR+gDKKU+q2CwIis2XuLUUFg=;
	b=Al0hSThgM4d0C53E1xdn8aqKctxpX1r14ol54RxJOuStYD/iBLuvbSH1OUjmYLtvJr
	TTgQ8jQ33cTPvkcI1ZcVud72YFeAkvDf4s8PBUHty9cswNKLl6XeREJap3rI9q1PQYC3
	OAotArdSy2QFwNXGvDp8hV8TIqzZ4q5+rb9MgYOlqLw0f/xqdyjIF329OGtrNrirCPwP
	9Ho6SySFV9kiqlsVzeGscwt0ouCpI2odDw5gseExZNtEyyz1+XruRhMnCJ0MJKoPKosV
	BcxRSFBhSP0C3ZAKwccsFOrdSuB4MSxQC5PlQ6Nx913HUzhxvQKLgtqXuADpcz5y/Qi2
	yy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oq+ENtog3TtdWdvfQjqWR+gDKKU+q2CwIis2XuLUUFg=;
	b=MyukE1hOP5MDQO2ZizJ6GekUv+2p/uhJT0sW5xCUDWlYVzLRl3Q0MZUyDn3aS8VtES
	4pL/X4zReX8BCJx+OYZLMqGAy7Td1TDemnkBuCLWrWGBtTP7ceJsD5Bt9/cpwECvtLFz
	xP6VEEPLp8gmz5SGOwe5Ll7QkoLjhP51hKbmRREAq+8KQT9u/WvbGxEnxxa35yfrQuon
	E6Og/SFUhjvMZnLAqi0PsJ0a6va2nn4owwRHpIgaxB4yKZ76Xp30erbrUckjnDi6EWaN
	SC6Dk1ahpxyghFqJh8hO2D/Ef3i5OXpZDVs/gP0i70m3VVrb/xU6iNeABDn8zoV35oeB
	B0Pw==
X-Gm-Message-State: AJcUukcsAqqMzppj9PrbbcZ/qFMB9fO+gNu2uQDSFMpahsMF+KlejxDU
	b0XNbwPqBz8q1Vh76xGmHREdMnSV7Ywd41oJdqI=
X-Google-Smtp-Source: AHgI3IbC74mQB0emxlcT+JOt4jEPe92tlfFAqOtGKX8Deut6lYHM6/SNWXt5TH9BWTk8g/uFxrNmpY4zYKTHf5PE+ks=
X-Received: by 2002:a24:2e94:: with SMTP id i142mr6932966ita.157.1548499917489;
	Sat, 26 Jan 2019 02:51:57 -0800 (PST)
MIME-Version: 1.0
References: <CAJkqNs36diCh3qUHA8+ssmi_BGKjgY_xd_bs1sDAFvWwwGp6ew@mail.gmail.com>
	<cc81145d8a0f3fd9771dca0d67d2652f3fe8ad11.camel@linuxfoundation.org>
In-Reply-To: <cc81145d8a0f3fd9771dca0d67d2652f3fe8ad11.camel@linuxfoundation.org>
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sat, 26 Jan 2019 11:47:39 +0100
Message-ID: <CAJkqNs1W-rwt44Mbyst0rs=V_4ye5RfdAT0kW6ccAODbzQ_4JQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lib/oe/patch.py: Fix applying a directory as a patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Jan 2019 10:51:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sob., 26 sty 2019 o 11:34 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Fri, 2019-01-25 at 20:55 +0100, Tomasz Dziendzielski wrote:
> > If a SRC_URI content ends with '.patch' bitbake is
> > trying to apply it as it's a patch file.
> >
> > It causes that if we use git repository for 'patch' package
> > the bare clone is extracted to a directory
> > (i.e. build/downloads/git2/git.mirror.org.patch/) which is considered
> > to be a patch file, so patch.py tries to apply that directory as a
> > patch
> > which ends up with a failure.
> >
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > ---
> >  meta/lib/oe/patch.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index 07a40fc50e..3d0b7d7289 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > @@ -793,6 +793,8 @@ def patch_path(url, fetch, workdir, expand=3DTrue):
> >      """Return the local path of a patch, or None if this isn't a
> > patch"""
> >
> >      local =3D fetch.localpath(url)
> > +    if os.path.isdir(local):
> > +        return
>
> This doesn't match the comment above, "None if this isn't a patch"?
> Does the rest of the function use "return" or "return None"? It won't
> matter in practise to python but we should be consistent and fix the
> value or the comment.
>
> Cheers,
>
> Richard
>

The rest of the function use "return". You prefer me to change the
comment in a second commit to keep the changes separated or just do it
within this one?

Best regards,
Tomasz Dziendzielski

