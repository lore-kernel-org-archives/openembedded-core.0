Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpMHN-0001Z6-Lz
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 18:30:14 +0200
Received: by wibhq4 with SMTP id hq4so5720955wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 09:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=LL82AZed5yHmqLRZX115Y3JaEUm9oU8dqEV+Ly9eN20=;
	b=Vxpoak2ocl2a3n4NiVwUQzJ4A1Yj5wX6dNOF3Urr/dUbRAYOTSw8qYks1NESP/Q1sn
	6mwP+3FZt/nmvR+OKMVJJdtsWnVmYKh354EeYJQfUmCggunQMlCvew5anPnXmy0Tf0nw
	5h7ILBzjZ2nX8tlf8sB4ElHIKzdlSHbxGzbhQ1jQKApzQThiALjdplX1spmQ/dwmvg//
	8XoOOfFz2cKCBCWTbT1PMFrY1/EjQBRyBlsNQtjIbZpY6BNfyRRl93jO4Cnm5PzDTkqy
	Hm5gnphPJhe6/pzPIlpw4avKf8r7txaDfM7jrwdWnMC88PtR8OWFgoDJeCTlfi1N/Bc1
	Zh0Q==
Received: by 10.180.82.39 with SMTP id f7mr24020008wiy.2.1342109940596;
	Thu, 12 Jul 2012 09:19:00 -0700 (PDT)
Received: from [192.168.2.8] ([188.207.89.201])
	by mx.google.com with ESMTPS id df4sm40684887wib.4.2012.07.12.09.18.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 09:18:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxHimz3FTZ9AuTF2ORz=JSgmU51ZAMgDk+2fwo4reA2GoQ@mail.gmail.com>
Date: Thu, 12 Jul 2012 18:19:02 +0200
Message-Id: <06E3CF4C-6484-43DA-94A5-6BA6EC8D51B4@dominion.thruhere.net>
References: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
	<A23DB6C9-DD03-4F4B-A113-AD718A57B086@dominion.thruhere.net>
	<CAK18fxHimz3FTZ9AuTF2ORz=JSgmU51ZAMgDk+2fwo4reA2GoQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQn7G6wL+aVAiAhFKTy64YYdEIMRKrwDT+YRfIoO9L1gA3qNCIWi7OcOdbZteZiypZ14ocJ3
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
X-List-Received-Date: Thu, 12 Jul 2012 16:30:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 12 jul. 2012, om 17:51 heeft Andrei Gherzan het volgende geschreven:

> On Thu, Jul 12, 2012 at 6:40 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>=20
>=20
> Op 12 jul. 2012 om 17:29 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:
>=20
> > Hello,
> >
> > Koen suggested to add -T to xz commands. We have this option =
implemented in our current version .1alpha.
> >
> > -T threads, --threads=3Dthreads
> >               Specify the number of worker threads to use.  Setting =
threads to
> >               a special value 0 makes xz use as many threads as =
there are  CPU
> >               cores  on  the system.  The actual number of threads =
can be less
> >               than threads if the input file is not big enough  for  =
threading
> >               with  the  given  settings or if using more threads =
would exceed
> >               the memory usage limit.
> >
> > -------------------
> >
> > Memory: 7.8 GiB
> > Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
> >
> > File to compress: 1.9G
> >
> > xz -f -k -e -9 --check=3Dcrc32 (current configuration)
> > Memory: 673Mb
> > real    6m37.170s
> > user    6m35.389s
> > sys     0m0.884s
> > Compressed file size: 3.4Mb
> >
> > xz -f -k -e -9 -T 4 --check=3Dcrc32
> > Memory: Cannot allocate memory
> >
> > xz -f -k -e -8 -T 4 --check=3Dcrc32
> > Memory: 1.8G
> > real    3m24.462s
> > user    12m8.502s
> > sys     0m2.180s
> > Compressed file size: 3.4Mb
> >
> > xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
> > Memory: 471Mb
> > real    1m9.265s
> > user    4m8.972s
> > sys     0m0.944s
> > Compressed file size: 3.4Mb
> >
> > So my conclusion would be to use the default -e -6 with -T 4.
>=20
> Out of curiousity, what does -T0 give you?
>=20
> =20
> Exactly the same as -T 0.=20

I don't see that in the results above :)=


