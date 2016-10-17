Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BDAF26E5FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:37:53 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r16so13622228pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=H0q2RNrjCPNHjlRlqNmDjXRryCliqDu79Py/sXu9Cq0=;
	b=WmKPJO+ogLly8S6/Htzsku6pt6fZNr19GKX1kQfPF15zxlzpEDrbaJ3aNMdhnxJsxX
	vD0KeYDkgukX0ko9PE3WmQ5dKxdWMm+lQ0b14B9kWNRAAb8ED3IK7KEDvU1mncwhwxUg
	T1ehXmBs4oCJdn//qK6SfY24dSLUlKFGkmuhlFQ3l8NwDN2TOxZ35WUZZJYyki1rVCBc
	P/cJ9ykAWFKM7Q9zgyDhmVKyK+Z2M+WaqJHfr1aOd1n4tl+tK/R2Nz4lW2VspEFDrFhv
	3UGwulCz7hPwsYBMCHcpUnQX1V5levruJ3oVZZNLYNn5O8QCk+kTwdxHeCPOD9kHo17S
	yB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=H0q2RNrjCPNHjlRlqNmDjXRryCliqDu79Py/sXu9Cq0=;
	b=Cy6jyKDxvhJFe6X0vKSweUDJdxaJV/b5OtYAMKvjEPxLVt8vYISxbVYHg8LCkX3JGb
	2ECk73H2vwquTPo8soO5SwPqsvYp0Flr3CpFHFHlP1+rqtOekWafZqWeIEqesBmRSWAL
	H5qCDxuIvZYgXrTx5HRvQTh4lj70gsYoYbKWP5AbtSVwdYyZXr9XKfXRQL+LliACq3kZ
	psax4aAj/XqdEYindNaP2ZFEeMVLIC83BdIe6dQY++bnGyVl2zXh+C1zZgHxw0ArNYeK
	XA6OzSQBbnOt8WyOueSZifq+XBi1ThDys5aeBWXp61kdknbIns5CDymg6ePQjq6FOEJ8
	tGFw==
X-Gm-Message-State: AA6/9Rle3nfadBgXzLUumHeVSF847cjixzZqYypSLDFjYYTxnzEKZCbPGR2YvrYtfHAzlw==
X-Received: by 10.98.205.207 with SMTP id o198mr74922pfg.114.1476747475695;
	Mon, 17 Oct 2016 16:37:55 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ec00:906:f8cb:31c1?
	([2601:646:8882:b8c:ec00:906:f8cb:31c1])
	by smtp.gmail.com with ESMTPSA id
	bu9sm13693280pab.25.2016.10.17.16.37.54
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:37:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476204984-35157-1-git-send-email-juro.bystricky@intel.com>
Date: Mon, 17 Oct 2016 16:37:54 -0700
Message-Id: <A514EEE8-721D-425F-8DDF-CDE0624D698E@gmail.com>
References: <1476204984-35157-1-git-send-email-juro.bystricky@intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Additional "mips" and "mipsel" machine definitions
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
X-List-Received-Date: Mon, 17 Oct 2016 23:37:54 -0000
X-Groupsio-MsgNum: 88293
Content-Type: multipart/signed;
	boundary="Apple-Mail=_22B89742-141C-470C-BB2B-26D096334C29";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_22B89742-141C-470C-BB2B-26D096334C29
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 11, 2016, at 9:56 AM, Juro Bystricky <juro.bystricky@intel.com> =
wrote:
>=20
> Add "mips" and "mipsel" to "machdata" table.
> Although there is a way to add entries to the "machdata" table
> from a BSP without modifying the insane.bbclass directly, MIPS is
> already supported in poky and as such the relevant entries should be
> present in insane.bbclass.

perhaps say s/poky/openembedded-core/ here since thats where the patch
is going to go.

>=20
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
> meta/classes/insane.bbclass | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b347638..21c5cda 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -66,6 +66,8 @@ def package_qa_get_machine_dict(d):
>                         "i586" :      (3,      0,    0,          True, =
         32),
>                         "x86_64":     (62,     0,    0,          True, =
         64),
>                         "epiphany":   (4643,   0,    0,          True, =
         32),
> +                        "mips":       ( 8,     0,    0,          =
False,         32),
> +                        "mipsel":     ( 8,     0,    0,          =
True,          32),
>                       },
>             "linux" : {
>                         "aarch64" :   (183,    0,    0,          True, =
         64),
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_22B89742-141C-470C-BB2B-26D096334C29
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYNIACgkQuwUzVZGdMxTDyQCfTx0cvG1cio/TGEa6NzZx0CHL
eiYAn3cCNXw3HF8vmV/mpCnWyJnfALTc
=Z35W
-----END PGP SIGNATURE-----

--Apple-Mail=_22B89742-141C-470C-BB2B-26D096334C29--
