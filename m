Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpLfr-0000lP-90
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 17:51:27 +0200
Received: by eeit10 with SMTP id t10so211355eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 08:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=wnKnsgguvUaF+clIVFgXZ01MVD+OeBlITrAtywwDW9I=;
	b=oxRtCm4cP14fov0WykVyJyqCcKHrRq982x3w9BBfFMXFeAjjLEeoGGDut0HVlBGdEF
	cHXK3N18PruMuZHLa7bFIQUamJfuaN2UMTZPkWT95OZgDQBDpOHauuqPApa9wsg3WB47
	RDt1RSYO6C5mTaQgHwmELNuBx+Q8vE1hHcC8Oj2X+cFD70j+RBHgqGaV5TooAzDNcu7/
	9G3AtqpoNjcVMxKOcROuSUjzpOh9rna4TT5R2WagHd36KO5qCocDpEcUlMpSP3BFM0NL
	+z2W1/N0LHvkeZ6mZsHNY6XRyedBkqMGMgdCJhCkZRT1jkecMlf4El3me4CYTIWQGO4J
	OCjA==
Received: by 10.14.27.201 with SMTP id e49mr12746454eea.230.1342107614150;
	Thu, 12 Jul 2012 08:40:14 -0700 (PDT)
Received: from [192.168.2.9] ([188.207.89.201])
	by mx.google.com with ESMTPS id e48sm16692874eea.12.2012.07.12.08.40.11
	(version=SSLv3 cipher=OTHER); Thu, 12 Jul 2012 08:40:12 -0700 (PDT)
References: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
In-Reply-To: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
X-Mailer: iPhone Mail (9B206)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Jul 2012 17:40:11 +0200
To: Andrei Gherzan <andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkz6wvgmPwUBqaHUnnTsxz52tbrD1VTDvK1XHRkTvrvovRmz7Pa/pPjwzfp/++iaBY4+JbP
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Results for xz compression with different -T and and -e
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 15:51:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan <andrei@gherzan.ro> het volgen=
de geschreven:

> Hello,
>=20
> Koen suggested to add -T to xz commands. We have this option implemented i=
n our current version .1alpha.=20
>=20
> -T threads, --threads=3Dthreads                                           =
                                                                            =
                                                                            =
     =20
>               Specify the number of worker threads to use.  Setting thread=
s to                                                                        =
                                                                            =
         =20
>               a special value 0 makes xz use as many threads as there are =
 CPU                                                                        =
                                                                            =
         =20
>               cores  on  the system.  The actual number of threads can be l=
ess                                                                         =
                                                                            =
         =20
>               than threads if the input file is not big enough  for  threa=
ding                                                                        =
                                                                            =
          =20
>               with  the  given  settings or if using more threads would ex=
ceed                                                                        =
                                                                            =
         =20
>               the memory usage limit.
>=20
> -------------------
>=20
> Memory: 7.8 GiB
> Processor:: Intel=C2=AE Core=E2=84=A2 i5-2540M CPU @ 2.60GHz =C3=97 4
>=20
> File to compress: 1.9G
>=20
> xz -f -k -e -9 --check=3Dcrc32 (current configuration)
> Memory: 673Mb
> real    6m37.170s
> user    6m35.389s
> sys     0m0.884s
> Compressed file size: 3.4Mb
>=20
> xz -f -k -e -9 -T 4 --check=3Dcrc32
> Memory: Cannot allocate memory
>=20
> xz -f -k -e -8 -T 4 --check=3Dcrc32
> Memory: 1.8G
> real    3m24.462s
> user    12m8.502s
> sys     0m2.180s
> Compressed file size: 3.4Mb
>=20
> xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
> Memory: 471Mb
> real    1m9.265s
> user    4m8.972s
> sys     0m0.944s
> Compressed file size: 3.4Mb
>=20
> So my conclusion would be to use the default -e -6 with -T 4.=20

Out of curiousity, what does -T0 give you?

regards,

koen


>=20
> @g


