Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Tswl0-0002Nk-Ti
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:36:04 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so981973pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to; bh=xKPsJHfclZViXVAWxjtHIjq2+QX139+SAjV8RtpuZYo=;
	b=fVo7wn1CFSJD9Rk8FSnLAHTNUYBkgKiYs02DuYDEtJhjkRCvHK9wRFOVexfXHMLJoN
	4GyGnHFicGPwErD9OGcYFMX9YO1sQBz5z7BR5JHzTNWDdwakjMz3ba63FwrDl2qOgiu7
	19MdrMk15nfcPMlHJGwnZwBdE3I7nCWvayAH6AX0D3vlN6blNkh8zUw07tzydUGpP8nw
	fSMNdUIUU2kEg2nmTM5yBqI3sWGbTzwzmz8clsrw5FLkLX2sR+Eczumq4PsGUho0UObW
	dofdJvzWY4prS5Rr9QmRMwznbWw1etEeB1ngVupYUx6S5vUlSAdTlO6MRu3xgnw+RU0M
	ETyw==
X-Received: by 10.66.82.162 with SMTP id j2mr190154758pay.13.1357741242236;
	Wed, 09 Jan 2013 06:20:42 -0800 (PST)
Received: from ?IPv6:2002:5ecd:6a04::4069:57d5:28b7:a6c7?
	([2002:5ecd:6a04:0:4069:57d5:28b7:a6c7])
	by mx.google.com with ESMTPS id oi2sm41702269pbb.62.2013.01.09.06.20.38
	(version=SSLv3 cipher=OTHER); Wed, 09 Jan 2013 06:20:40 -0800 (PST)
References: <alpine.DEB.2.02.1301090752510.25391@oneiric>
Mime-Version: 1.0 (1.0)
In-Reply-To: <alpine.DEB.2.02.1301090752510.25391@oneiric>
Message-Id: <7E75003D-F6FC-4B4B-9FB8-A84DB5CCEDC8@gmail.com>
X-Mailer: iPad Mail (10A523)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Wed, 9 Jan 2013 18:20:36 +0400
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: for a quad-core machine, shouldn't parallelism be set to 8?
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
X-List-Received-Date: Wed, 09 Jan 2013 14:36:04 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Robert,
On my i7 quad core machine, I've set both values to 6. Setting it to 6 app=
ears to be nearly the same as setting it to 8, I dare say a marginally fast=
er by a minute. I can build core image console in around 22 minutes.

Elvis
On Jan 9, 2013, at 4:55 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> wro=
te:

>=20
>  just noticed this in local.conf.sample:
>=20
> # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D =
"-j 4" would
> # be appropriate for example.
>=20
>  i thought the general rule was that parallelism should be *twice*
> the number of cores.  that's certainly what's suggested in the yocto
> QS guide:
>=20
> "Another couple of variables of interest are the BB_NUMBER_THREADS and
> the PARALLEL_MAKE variables. By default, these variables are commented
> out. However, if you have a multi-core CPU you might want to uncomment
> the lines and set both variables equal to twice the number of your
> host's processor cores. "
>=20
>  thoughts?
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


