Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.5384.1588596981171348640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 05:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rMbHKOUT;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id r7so13392129edo.11
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CBiCCgbkPcFRFbyPflgXawx246njBKvf7HSWvuumRjc=;
        b=rMbHKOUT/MaVg1Epi8cI+4h5GpGYpAh+UJS1njG9VAKKx9EwNvHKMVOR4N8X0w4xef
         ZVw0uPG4HcIPzPvypEoo08GDo4elYhWcUnt7Vj7Ko3QbioGb0ySJcELf7ns7t0H0vxmB
         zAu8iYILS2m7NTdUUVkYuvEMvLcJh2/RT1oIfqFYdD5h0CBmTkZzJ9ZpHiAmp68akGDO
         OBTaTjwuRXQx1pdefKTnMtC1eZCRR+q7CjrVZMzeCUG6htaMCiwjnMsoohWKX/ABgzB9
         7Z0M1xUoWTIjEibqZL0CGLzjaW1pkgTD5ptFiwVqRt6tGDl22bovux80zcfgQNdLBArp
         /zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CBiCCgbkPcFRFbyPflgXawx246njBKvf7HSWvuumRjc=;
        b=EWWTb18UxvuUvj67rQn6vJkaTLwrT41ROJ4O3gXQwVgwvddfTDcOlBlToCPhKc/vOF
         dA/LkX8B8qwDJEsUGPrx9de6zo/iF+FxivG1KCykmYVy5r5KzWveq0Z0wZju+dt6zkl2
         yYZBd/azrtD+TwHyW/rPyHxe6OFNXsT8J8vJm1/kF/95rfGFpKEbdK4L8W0A30rzARek
         JIUaLgMUIoAixC12n0gQ1WZ9GCgqXDcvGHVsUz78B4YXQ+Xd33EaiSJ35Q1ceSJw1420
         JyfyaU0OftPDeTaVP4kInUtnerNzsd/Vm6DTxmHImBdhKuXEFDOdIYD2IZpyDzQuaJN8
         KPkg==
X-Gm-Message-State: AGi0PuZ4JqbXBSB5iPLOZiCJ5UQUtnA5WiBbjFjSlHcs2FRID3wug/KZ
	U593/WJ6yTefWGUmUJCc9tXFN4xLUNutgkge5Sw=
X-Google-Smtp-Source: APiQypIeXz6VIqQP8Fc3qJvLt3ttkqL7w/YDXWMVS77NW68vzwdol7AaWHEfqdgiLAAUYvJPqNXBkzC7MOOogOiWVIk=
X-Received: by 2002:aa7:c3cb:: with SMTP id l11mr13972433edr.129.1588596979656;
 Mon, 04 May 2020 05:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588520452.git.bruce.ashfield@gmail.com> <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
In-Reply-To: <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 4 May 2020 08:56:08 -0400
Message-ID: <CADkTA4MOHDYo-AeqwMnjpGmRGZ-7=2Yr+D1=7S1MgL84MaE=Bw@mail.gmail.com>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2020 at 4:31 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Hi all,
> >
> > Here are the -stable updates I've collected since m3 of dunfell. I
> > ran things through the autobuilder, and no new kernel issues were
> > picked up.
> >
> > The -dev bump is good for master, while all of the 5.4-stable bumps
> > are good for both master and dunfell.
>
> I pulled these into master-next and saw reproducibility issues. I
> wondered why your test build didn't show it, turns out it also did:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/1024
>
> 2020-05-04 05:18:46,863 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproducible.Reprodu=
cibleTests.test_reproducible_builds (subunit.RemotedTestCase)
> 2020-05-04 05:18:46,863 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testresult.real.=
_StringException:
>
> AssertionError: The following deb packages are missing or different: /hom=
e/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducib=
leB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standar=
d_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
> The following ipk packages are missing or different: /home/pokybuild/yoct=
o-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/deploy/i=
pk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+git0+f4=
05543442_6cb5b11e83-r0_qemux86_64.ipk
>

I don't see any changes in the kernels that would have triggered it,
but they never are obvious.

I unfortunately have no idea how to run reproducibility tests on the
kernels locally and my build server at home is brutally underpowered
for more than one core-image build per arch a day (hence the
autobuilder runs).

Is there a cut and paste se of instructions about the tests that I
could follow ?

Bruce

> master-next was:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/900
>
> and friends.
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
