Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8082F75EE7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 16:23:32 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so91677961pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 08:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IsVQfNcHtM8I1HWOTL28PcVtYXmybwcWgJWdzeTq61Y=;
	b=HLQg1NzPWq09fFP/kBPMklncPB+f1tZ0AwtBbD+ByWPWzZL/tR1/6XdvV7zwv8V1oY
	Mwt12DLi/SzK+3C3vkqrpmLt1Q1uZBzvUwVonkNCtCEpNfD6RgZRp8zbPAEGfnqOS4QO
	nk1BcIIQ3/9y02gg/ftfuYJWUMPTX/AgraYhQtDO48FewpejBtKJOUtM+snKABBW53/Q
	Wnw9UwPmxRzV1VXxcJiAMjr77O6Fo80EmCAN+MuHtEc3V0j971bU6/HCJbHNXxgVn8Gg
	J7MYzb3drQnmhCD1n+TtO+OM09DKNukmwUtxgA3Lf8JC1sSeaxgl04hNogkm0htmWisV
	P/NA==
X-Received: by 10.69.26.36 with SMTP id iv4mr10521309pbd.0.1446740613227;
	Thu, 05 Nov 2015 08:23:33 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:a868:fcfa:97f1:9015?
	([2601:646:8601:4580:a868:fcfa:97f1:9015])
	by smtp.gmail.com with ESMTPSA id er1sm8819913pbb.6.2015.11.05.08.23.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Nov 2015 08:23:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
Date: Thu, 5 Nov 2015 08:23:31 -0800
Message-Id: <37C467A4-7065-4F95-B666-94ABB1E7248B@gmail.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
To: Mike Crowe <mac@mcrowe.com>
X-Mailer: Apple Mail (2.3106)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 16:23:33 -0000
X-Groupsio-MsgNum: 72931
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1CF21CD7-81B4-4345-ADF3-C55D54B93495";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1CF21CD7-81B4-4345-ADF3-C55D54B93495
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Nov 5, 2015, at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> 
> export MAKE = "make"
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> +EXTRA_OEMAKE_LEGACY = "-e MAKEFLAGS="
> +EXTRA_OEMAKE = "${EXTRA_OEMAKE_LEGACY}"

may be this should be a weak assignment.

--Apple-Mail=_1CF21CD7-81B4-4345-ADF3-C55D54B93495
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY7goMACgkQuwUzVZGdMxSNcgCeI3rTVoIUe/tJlG1BpGAoIbzh
L/AAn1YDsbZfREwotqJpFzweHKKrqQ73
=2ZN8
-----END PGP SIGNATURE-----

--Apple-Mail=_1CF21CD7-81B4-4345-ADF3-C55D54B93495--
