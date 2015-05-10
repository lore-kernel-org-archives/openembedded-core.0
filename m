Return-Path: <vm.rod25@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C810960043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 17:45:24 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so105627656ied.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 10:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7V/Uq3ufVLG4YjgRkNwCHZTKh5y8O7LI4nSMbTLgHoc=;
	b=YCz1bhrrfvH6D5KU3fTvVJpcqCNah2saJGbEOcv9/9cShU82FvnbRZ0H+PuPaa5xC5
	ug3Wm0iqo5mi+PH/4WDzRcTZQBC4rzOc5ECQJf7LY/174xVIWYbGcQonbscXyXngSzXV
	daJmHA4FZoo2cHGd7nQ7ypq+oFYy7/LzE9hKkjuAbpWbntJChwzMfUwsdqpCbBoBxLNg
	LN9UlyMF8/I/j3AUsfZGE9Qt3rHlu8YO4KoTjnNGyxAt9SzkwxFFpLWVTrMn3jRdlFtf
	7SEwDvnyM2MkELp0oaRkcBa6pNGGcPPpGqCqlFcuC+gM+XLwXwqNtpzUGEtBmxx499L3
	gbWA==
MIME-Version: 1.0
X-Received: by 10.50.27.67 with SMTP id r3mr8756809igg.15.1431279925562; Sun,
	10 May 2015 10:45:25 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Sun, 10 May 2015 10:45:25 -0700 (PDT)
Date: Sun, 10 May 2015 12:45:25 -0500
Message-ID: <CAK5mtezaxuFqxY+3eRinmydRgntZSKoyo_v8ih-rwkVu1L+HcQ@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: MPICH not producing mpirun
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
X-List-Received-Date: Sun, 10 May 2015 17:45:27 -0000
Content-Type: text/plain; charset=UTF-8

HI team

I am building core-image-minimal but it is not generating the binaries
as expected.

The mpich bin rpm should be something like:

/usr/bin/hydra_nameserver
/usr/bin/hydra_persist
/usr/bin/hydra_pmi_proxy
/usr/bin/mpic++
/usr/bin/mpicc
/usr/bin/mpichversion
/usr/bin/mpicxx
/usr/bin/mpiexec
/usr/bin/mpiexec.hydra
/usr/bin/mpif77
/usr/bin/mpif90
/usr/bin/mpifort
/usr/bin/mpirun
/usr/bin/mpivars
/usr/bin/parkill

But instead is generating :

/usr
/usr/bin
/usr/bin/mpic++
/usr/bin/mpicc
/usr/bin/mpichversion
/usr/bin/mpicxx
/usr/bin/mpiexec
/usr/bin/mpivars
/usr/bin/parkill
/usr/lib
/usr/lib/libmpi.so.12
/usr/lib/libmpi.so.12.0.1
/usr/lib/libmpicxx.so.12
/usr/lib/libmpicxx.so.12.0.1
/usr/lib/libtvmpich.so.12
/usr/lib/libtvmpich.so.12.0.1

The problems seems to be on the extra oeconf:

EXTRA_OECONF = "--enable-debuginfo \
                 --enable-fast \
                 --with-pm=gforker  \
                 --disable-rpath \
                 --disable-fortran \
                 --enable-cxx"

It should not have anyone. But when I try to remove the disable
fortran it complains .The weird part is that in my host machine there
is no problem and the mpirun is generated.

Any clue why this is happening or how I can disable all the extra_oeconfigs ?

All help is more than welcome

Best regards

Victor Rodriguez

