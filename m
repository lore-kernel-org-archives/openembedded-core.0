Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 82A3660ADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:45:46 +0000 (UTC)
Received: by pabru16 with SMTP id ru16so1369113pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=R/9xrKIEKZ3xo0VT63YKediprwQkQrXZwY81duoHWdI=;
	b=ZISGKzMDUHZdEuMj8DY9CGN0dEyLYo6TXmNix+f00sIE7yHSvhyJu2bU/OiT9ZvfaA
	jwkkhjARsZ0rm4fWPKS9wYdIJmmvqjdBLQ0mz9I+z575Jb8c+vQAdSHDe+14EpNDP/no
	Wy6Y1A0m6H7ZoV+vfgblJMGYtPfwYI/g97UfqtbuIImSL3VWx8lx5jk1iGHRXVLiokNY
	CmYyb920ARp1uYGG20MscbmeLrukrPcn2ZFb0bA1NTG45LmdpsvTpCPELOgUiD3eeNW9
	U4u69Ds7uFQrXYYlzcv1jQy4K/aewh9BxOOaHINRCvDJGx/89r5d+AbzPrOUSi4J596c
	JA+g==
X-Received: by 10.66.242.138 with SMTP id wq10mr49402607pac.143.1431999947672; 
	Mon, 18 May 2015 18:45:47 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d1bd:ca93:84da:dce8?
	([2601:9:3580:84c:d1bd:ca93:84da:dce8])
	by mx.google.com with ESMTPSA id
	dv3sm11230473pbb.91.2015.05.18.18.45.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 18:45:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKp0AL6Lf0_+dyC2UUuXNuNQnhi-h5WfAw=i5jyK4KVV3w@mail.gmail.com>
Date: Mon, 18 May 2015 18:45:41 -0700
Message-Id: <DC98E333-F523-4FD6-AC3F-71CDB54F3739@gmail.com>
References: <1431343607-2820-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0Lb8ZD_X-X5mxF9XQ5TROUJh1hYQYQV5xwn1WuZmzTSwMg@mail.gmail.com>
	<CAP9ODKp0AL6Lf0_+dyC2UUuXNuNQnhi-h5WfAw=i5jyK4KVV3w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.2098)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Move EGL requirement for Wayland
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
X-List-Received-Date: Tue, 19 May 2015 01:45:54 -0000
X-Groupsio-MsgNum: 65691
Content-Type: multipart/signed;
	boundary="Apple-Mail=_253EE5D8-C2CF-44DF-B2D9-50E52D80216A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_253EE5D8-C2CF-44DF-B2D9-50E52D80216A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 14, 2015, at 6:29 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> On Thu, May 14, 2015 at 7:33 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>=20
>> On 11 May 2015 at 12:26, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>>>=20
>>> The EGL is used by the Wayland backend. When building using Software
>>> Rendering and without Wayland support the EGL backend is not =
available
>>> so we should not require EGL for GLES2 support.
>>=20
>> I think we should make the PACKAGECONFIG block be more explicit, and =
add a
>> separate [egl] that is required to be enabled if you also enable a =
feature
>> that depends on it (such as gles or wayland).
>=20
> I did this initially and ended with the patch I sent. The reason is
> because the EGL is Wayland specific so I see no reason to split it.

egl is not wayland specific, unless you are using it in different =
context


--Apple-Mail=_253EE5D8-C2CF-44DF-B2D9-50E52D80216A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlValcgACgkQuwUzVZGdMxQ5/QCcCBMX9+qVmWrw4WJ8BmxupcXc
eOkAnin/8JnaqCkmupjLnAuEPFh84msJ
=pSR3
-----END PGP SIGNATURE-----

--Apple-Mail=_253EE5D8-C2CF-44DF-B2D9-50E52D80216A--
