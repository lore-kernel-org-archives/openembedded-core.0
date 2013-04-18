Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1UStMF-0005t3-Qi
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 20:15:00 +0200
Received: by mail-da0-f54.google.com with SMTP id p1so1508994dad.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=JzrP4IkvvZre1y0AaHsEUk/2mq5XZNKDW/2gs4OdBmk=;
	b=R8EYZukK/AbVn4pJqWnQPnkINcftxIfD6FC8h9f8/ocNwcHm/Wg8F/c11QnciyQ60z
	QNswmUtUWNA7Wm6fLVktd/HnBc3ix5xuHJQctgqqFLPrGc7JaDENrJFf9ITwFjYNoq5K
	+Kx7GHV5TBSH0FSJDF35z9B8MzsafV05uFkplzqhc82xR+LVk0yX7swdy9tbcXABPFwk
	xC42zSFzIBvVKj9pHeJXiSf5+Gd11/FPip7040fR+YSQQaDUNhgTLkX/AvbSyI79GITf
	8WohuSH2n1y7C9A7lPomoUP2t0DEb5fDNFRgIOLu8JNmr3x/bBJS9yrijIm/XduIHBxU
	5BHw==
X-Received: by 10.66.49.202 with SMTP id w10mr14211177pan.174.1366307841460;
	Thu, 18 Apr 2013 10:57:21 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.101])
	by mx.google.com with ESMTPS id
	ba10sm10599885pbd.21.2013.04.18.10.57.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 10:57:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <alpine.DEB.2.02.1304181250070.20260@oneiric>
Date: Thu, 18 Apr 2013 21:57:16 +0400
Message-Id: <41F644AD-691F-443B-A267-8562E5DDC3BC@gmail.com>
References: <alpine.DEB.2.02.1304181219550.8010@oneiric>
	<lyfvynyecr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<alpine.DEB.2.02.1304181250070.20260@oneiric>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1503)
Subject: Re: [PATCH] local.conf.sample: Have comments ready to go for quad-core (4 -> 8).
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 18:15:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 18, 2013, at 8:51 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> =
wrote:

> On Thu, 18 Apr 2013, Enrico Scholz wrote:
>=20
>> "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
>> writes:
>>=20
>>> Have default, commented values for parallelism reflect quad-core
>>> hosts.
>>=20
>> fwiw, I use
>>=20
>> PARALLEL_MAKE =3D "\
>>  -j ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 2} =
\
>>  -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * =
150/100} \
>> "
>>=20
>> BB_NUMBER_THREADS ?=3D "\
>>  ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * =
150/100}"
>>=20
>>=20
>> which adjusts parallelism automatically.
>=20
>  i'd be perfectly fine with that, too, if someone wants to put that
> in instead.

I've noticed that on a quad-core machine (i7) the best setting is to =
leave it at 6 for=20
BB_NUMBER_THREADS and PARALLEL_MAKE.

8, 16, etc don't have any discernable impact, perhaps save 30 to 40 =
seconds off
a build. The 3.5Ghz standard CPU frequency can be over-clocked to as =
high
as 4.5GHz, but I tested it out at 4.2Ghz and 3.8Ghz, and the difference =
was
only 2 to 3 minutes between 3.8GHz and 4.2GHz over-clocked, so I =
currently
leave it at 3.8GHz over-clocked.

I'm using two SSDs in a RAID 0 striped configuration, and build times is=20=

around 22 minutes for a Zynq-7-ZC702 build for core-image-minimal.

Elvis Dowson=


