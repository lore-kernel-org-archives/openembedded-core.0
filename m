Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7493A77323
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:25:41 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p63so20381521wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 02:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version;
	bh=0q0Q/k2sO4EQlEfNN1ICs8kGvuChOgmEGEAeOQAb8C4=;
	b=cH7EwYmkfviYcvNz7hd/uNRW6RdkTlxHJzBghltqDaSV9RoNo7m3BKlbT+YacZ+A7w
	xOIIbI6b1PM7geAhedAH2Q9eyhmy3kv17yfm9lBT6HOfFRkZ3GKBS1icIrXJILFbMrif
	3SvPuND9CSb36whm1BT9xOuLAPVidKYSdEhQo7qcwdGKBaQAs6L+GfNN3EmRaZT9I7DA
	9Un3w5Wd326hl5vHCPALQ+pslcyzl4hOvBXDPwhcTDKyAyVZ2fwSr1QdATPn/z+gD2jf
	vPPAvy08MCH3sdebvZKRwau5a35RHNcq9rCF/FWFwiDS27Tjp99wOUjanOitYwwrCXjQ
	7IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:cc:to
	:mime-version;
	bh=0q0Q/k2sO4EQlEfNN1ICs8kGvuChOgmEGEAeOQAb8C4=;
	b=bfaIVcZtVA6TUoK5KEH8lQJXZBuHqSX7rRlD6KL3kM804kGt/0s4Sr/uNIwK5gA1If
	WiYNoAxZg3zSagLf4G4Ft83uZ30lR8cW5bFGztcMbK544MpPd8XoLT8WoufegIHgDAtD
	a5DH6URy9hGrqJHuK6t4Q/FDtDlCqlhgzrTCLyGbkIAVOhDE+XyPVNxh16PT3AT4ft2Y
	FvyoAaumX3pcfoKyN6hwG9u99Qjh4gzdnBBuOoXF2mSCP96c5Gb8RFLsCF/9owp+hUIl
	Xy3tNLbk9SL0sM8UTbEFRO5Z7E10WSsYVYnFrJRxBTp6ZKY/V5QZdgXnAw+JlTZxlQG5
	/b7Q==
X-Gm-Message-State: AG10YORGbgZcwp3qeLnx1h/eqidKs/L7AeFru6Bdp+bkjE5SFxhQzPLlVMicKcBiSP6ozw==
X-Received: by 10.194.174.36 with SMTP id bp4mr12952356wjc.137.1454667942063; 
	Fri, 05 Feb 2016 02:25:42 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	c185sm30229106wma.5.2016.02.05.02.25.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Feb 2016 02:25:41 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 5 Feb 2016 11:25:40 +0100
Message-Id: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH][jethro] cross-localedef-native: add ABI breaking glibc patch
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
X-List-Received-Date: Fri, 05 Feb 2016 10:25:41 -0000
X-Groupsio-MsgNum: 77597
Content-Type: multipart/signed;
	boundary="Apple-Mail=_08C43347-62C1-4683-8AB3-DCBD596F7553";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_08C43347-62C1-4683-8AB3-DCBD596F7553
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Add patch from commit 96b1b5c127e9e0e637aaf7948cf3330a94a5cd57 to =
cross-localedef-native
to avoid broken images built with ENABLE_BINARY_LOCALE_GENERATION set to =
1:

    $ sh -c "export LANG=3Dde_DE; ls -la"
    sh: loadlocale.c:130: _nl_intern_locale_data: Assertion `cnt < =
(sizeof (_nl_value_type_LC_COLLATE) / sizeof =
(_nl_value_type_LC_COLLATE[0]))' failed.
    Aborted

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb =
b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 03be9c0..3aefe74 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -20,6 +20,7 @@ GLIBC_GIT_URI ?=3D =
"git://sourceware.org/git/glibc.git"
 SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
            =
git://github.com/kraj/localedef;branch=3Dmaster;name=3Dlocaledef;destsuffi=
x=3Dgit/localedef \
            file://fix_for_centos_5.8.patch \
+	   =
file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
            ${EGLIBCPATCHES} \
 "
 EGLIBCPATCHES =3D "\
--
1.9.1

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_08C43347-62C1-4683-8AB3-DCBD596F7553
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWtHikAAoJEESZlq7c5Qqdz/0P/AiWD0YrbkAPmSzMvv1fv5Bp
Ce4gwTPLCX1RGavK5qPcXo0bZi1g6FBMsCSzcbU/EDryL+HkAIi2DRn5OMeny8CX
hAmrkjepfcfp+4rMJg6y9uRAMRfndmzTYt2/Y0jMCVEKGdeiLw0fAioqC1q3znFX
qxBF3mgPeV1kOE3HhvlkFSDWAuhnHoXYFxPPPG/6+RrffpLYmiFcVfRtiKNoFBE1
J699wO3jilDSUNXOMf7+WacAO+2UZrFhOOBf+FdKqC6ssRN5ainLjTEITa9RwxQe
nmHJPl0qqyOYBR3s7GAxAw9Kp3Xv8buVnSAHIw/eedfHQN2Hr7lXW5cEzjn/WA/+
M/lcmVDb1Z+eDRipMaSroFri6HMBnThTqEQIDEvJroecEaeum52vVT6NNEaSI+qH
l+ta4dCA7oWlav/TJVKr3QDuSb6DFsG4/YkFbFz5ZCFpbt1ngbsDeh+XkI22dTez
XdJs8/nayxuvSI5A9FN8hXN0ZllKz0Oo3WRn+vGKDCFdlHQtAsQpBQyHftOYf85x
H12fiCDlh8AglL/nxYkoni0Lvgg5QmwKsSmKHWYqLXbPgyyh9ebRkq3jJbOVmAJf
H+FwJy1S2jSHrqSV3869M5BBrJlAYiWtjetrutUnaAc2EpBVqEPYVjze9QuYjGiy
b0QXpXLjrfDti07mHD/r
=gPtg
-----END PGP SIGNATURE-----

--Apple-Mail=_08C43347-62C1-4683-8AB3-DCBD596F7553--
