Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11052606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 00:39:45 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ez1so732795pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=1koZDL5hxtoWvUGy9JAIBZRRVnaBzbUf26fHdZRUFYk=;
	b=LvV7UiPn4mzOib+xi5L9Zno+VY0Vz7UZ3DgTmbiknGVlJpWtkOfBAgcX4Moqclly3S
	UOHHu3Sy3Bt3ROHO5KJVLsLBlzRF0ECLo2Bh4DSoYQlhyp5gjWN0GUHXRSY19+Tb2n68
	gtYUIMJwggYfWhA6zAe0Hoe0Su3uTm7fxUdfyU1loukDBMETeVzW21UUHZVyAtDLHd/R
	GzCigXole+VI6JIUTF8rn6VCIF53UfOPqzCvNIETLS4A8IxjbKTH4iNKPIFzP9Paeupv
	XplWOxv4DMcrNRkYzoGFbm932BgjyU573JtmfSi2RBSXrD8z81Rf32K27yn/saApCk2X
	e2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1koZDL5hxtoWvUGy9JAIBZRRVnaBzbUf26fHdZRUFYk=;
	b=Z2Bovl+a+kantTQLVKl/w0WUksGqAmoLDDAHEWrboey311FS19Q8XCNBeSa1w0mJSI
	IkUR6NJDBJWUjHnOaT+bFythRvM/qetTUcHoD+3N6DVWZHV7T1Rb6++rFr7c6cvEXoGM
	GS9VjJ1SfRxygZWz5Sk+m/Q7UH2ax5j33MXcpchc4AihxL4zp+OGuTskwumRid9A5MUM
	VpPSKg7zlKw5YRRwLOIBNAcMIJxBfrhvQvDV+dbXNC/m0FQaxlkyjKYn0M9K2hMhWnLG
	sZP9Cq5nyAITR3+isUA78JccXhNeXcFV5LGEoKIiK6RMe5x5SCwyZHlZaglxQPJhhv/9
	SOtg==
X-Gm-Message-State: AEkoous/rK+Y86PCYYoquhWn4FmnxBNQtYjtNFHuVcf8stUKMp9WxwhvgQoewRV9P5k2Pw==
X-Received: by 10.66.100.230 with SMTP id fb6mr21082652pab.107.1469579986241; 
	Tue, 26 Jul 2016 17:39:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:8149:9f5b:2ea:e939?
	([2601:646:8882:b8c:8149:9f5b:2ea:e939])
	by smtp.gmail.com with ESMTPSA id
	o80sm4072116pfa.67.2016.07.26.17.39.44
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 17:39:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469546790-24621-1-git-send-email-git@andred.net>
Date: Tue, 26 Jul 2016 17:39:38 -0700
Message-Id: <693116AE-6D96-4D56-A05C-EC483379FEC4@gmail.com>
References: <1469546790-24621-1-git-send-email-git@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bash: add patch to build w/ -Wformat-security
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
X-List-Received-Date: Wed, 27 Jul 2016 00:39:46 -0000
X-Groupsio-MsgNum: 84937
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1232EA98-71AB-4B78-9A58-2DAF1420D563";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1232EA98-71AB-4B78-9A58-2DAF1420D563
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

This change is good. please install it. I think we should think of using =
security flags as default for AB
since thats much stricter and will catch more errors than normal flags. =
Eventually, in 2.3 timeframe we
should contemplate hardening toolchain to default to PIE/pie

> On Jul 26, 2016, at 8:26 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>=20
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
> ...1-help-fix-printf-format-security-warning.patch | 35 =
++++++++++++++++++++++
> meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
> 2 files changed, 36 insertions(+)
> create mode 100644 =
meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warni=
ng.patch
>=20
> diff --git =
a/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch =
b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch
> new file mode 100644
> index 0000000..5405c84
> --- /dev/null
> +++ =
b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-war=
ning.patch
> @@ -0,0 +1,35 @@
> +=46rom e5837a42f8f48a6a721805ff8f7fcd32861d09ca Mon Sep 17 00:00:00 =
2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D =
<adraszik@tycoint.com>
> +Date: Tue, 26 Jul 2016 13:09:47 +0100
> +Subject: [PATCH] help: fix printf() format security warning
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +| ../../bash-4.3.30/builtins/../../bash-4.3.30/builtins/help.def: In =
function 'help_builtin':
> +| =
../../bash-4.3.30/builtins/../../bash-4.3.30/builtins/help.def:130:7: =
error: format not a string literal and no format arguments =
[-Werror=3Dformat-security]
> +|        printf (ngettext ("Shell commands matching keyword `", =
"Shell commands matching keywords `", (list->next ? 2 : 1)));
> +|        ^~~~~~
> +
> +Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> +---
> +Upstream-Status: Pending
> + builtins/help.def | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/builtins/help.def b/builtins/help.def
> +index 1894f17..cf624c6 100644
> +--- a/builtins/help.def
> ++++ b/builtins/help.def
> +@@ -127,7 +127,7 @@ help_builtin (list)
> +
> +   if (glob_pattern_p (list->word->word))
> +     {
> +-      printf (ngettext ("Shell commands matching keyword `", "Shell =
commands matching keywords `", (list->next ? 2 : 1)));
> ++      printf ("%s", ngettext ("Shell commands matching keyword `", =
"Shell commands matching keywords `", (list->next ? 2 : 1)));
> +       print_word_list (list, ", ");
> +       printf ("'\n\n");
> +     }
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb =
b/meta/recipes-extended/bash/bash_4.3.30.bb
> index 95ed392..16a3139 100644
> --- a/meta/recipes-extended/bash/bash_4.3.30.bb
> +++ b/meta/recipes-extended/bash/bash_4.3.30.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D =
"${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtarball \
>            =
file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
>            file://run-ptest \
> 	   file://fix-run-builtins.patch \
> +           file://0001-help-fix-printf-format-security-warning.patch =
\
>            "
>=20
> SRC_URI[tarball.md5sum] =3D "a27b3ee9be83bd3ba448c0ff52b28447"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_1232EA98-71AB-4B78-9A58-2DAF1420D563
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleYAs8ACgkQuwUzVZGdMxScYACeL382lxZOyzdN6hBSbHxUs0MV
22sAnRjL7eWKlOARA6JfljrwNZfPe0+w
=2pcH
-----END PGP SIGNATURE-----

--Apple-Mail=_1232EA98-71AB-4B78-9A58-2DAF1420D563--
