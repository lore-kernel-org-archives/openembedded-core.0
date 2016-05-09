Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA336FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 23:29:34 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id c189so83644735pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=MPm9tluX3UIfobw8zFhKMUDgcQwpCmbHYDD07Q0xw70=;
	b=dAha1HogL2+zPkVZ2D0SB91LS5eCm5bO6aTkm8QMGyPd+AX1jUeeDTUP4umEbsOG/z
	VFVBjIqczUcIiyq1aG3woG7unbSCQQEQUK30ApTTjJ7kUsav6CHmSEHgvBkwMqSha3jI
	8xfukNXSFuO2U5oKcTVH08AH/bp2HoIt4oFmmYUOQhCMZSwwVy6TOxdblFGTVgk0jshg
	knz3XMR+5JWNcWI7O+SP9vVB6jM3v6tSr/mCL0RXtucIYwhV6t52kKdPB9tcBXdIzkuV
	SxwOQDP6o/Y/QjX20aHnh+lcimuTgpZQxK5JUzaBb/HzR4oZBvK25eMBN7ntDYEEU+lU
	00QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MPm9tluX3UIfobw8zFhKMUDgcQwpCmbHYDD07Q0xw70=;
	b=VEF0w4ALTUEt9pFOUYCkW0qJjtfDR9fUWzB1wg5PyyrP2lrF/lh8PfUiMJzTPVxswk
	bqUMAAGzOB55hBYNAJwf4t8McMJGif0O9Eua7uRE+gKAlRACA2EFa/TxJd1zRGufzczZ
	2131ykzSRK6ORy55XdR4H8cjsgCIFniqhDooY1cXvpneke9wGvxnzOCAyqZN6uUdV2EN
	mImEA/d5dwnT4vtT4nC6o89CTI/k1y0RMLcoQRtvvzS8ucVuCr5r+K9E73+bInmsNEl6
	day4t/cpk0h/nES86caDO2UjOvjJE5qeesLDhh6EMlzj6juxVX/BWJnzfPRCmTSyz/FA
	grCA==
X-Gm-Message-State: AOPr4FXM1cTWqzPXFjHizMXpD0s3A0NRhjwFHHvpMpLt6JqnfO+Fe1UePgkWrSp2+5fMzg==
X-Received: by 10.98.23.211 with SMTP id 202mr54163587pfx.122.1462836575499;
	Mon, 09 May 2016 16:29:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1462:b3e2:90da:dbff?
	([2601:646:8800:5a9a:1462:b3e2:90da:dbff])
	by smtp.gmail.com with ESMTPSA id
	x64sm42970184pfx.95.2016.05.09.16.29.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 16:29:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
Date: Mon, 9 May 2016 16:29:43 -0700
Message-Id: <49D82D08-89C2-42F7-833F-D571F7E9A6DE@gmail.com>
References: <cover.1462832624.git.paul.eggleton@linux.intel.com>
	<cover.1462832624.git.paul.eggleton@linux.intel.com>
	<f072033b140806b67ff2b098d6aa3d3a7e85a7b5.1462832624.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Mon, 09 May 2016 23:29:36 -0000
X-Groupsio-MsgNum: 81770
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AEDD260F-1DF6-43D8-B40E-C5DF0B251B68";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AEDD260F-1DF6-43D8-B40E-C5DF0B251B68
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 9, 2016, at 3:25 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> Recipes such as images and packagegroups don't actually fetch or build
> any source, so there's really no point having LIC_FILES_CHKSUM set.
> Forcing users to set it (as we have done for images inheriting
> image.bbclass) just makes things more difficult for the user for no
> discernable benefit. The easiest way to adjust this check is simply to
> skip it if SRC_URI is not set since this is a pretty good indicator =
that
> no source is being pulled in.

Looks fine idea. May be we also need to improve docs for =
LIC_FILES_CHKSUM

LIC_FILES_CHKSUM[doc] =3D "Checksums of the license text in the recipe =
source code.=E2=80=9D

someone new can think the sources referred to are recipe source itself.

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/insane.bbclass | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 097dc3a..0b151c2 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -681,15 +681,15 @@ python populate_lic_qa_checksum() {
>     import tempfile
>     sane =3D True
>=20
> -    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True)
> +    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True) or ''
>     lic =3D d.getVar('LICENSE', True)
>     pn =3D d.getVar('PN', True)
>=20
>     if lic =3D=3D "CLOSED":
>         return
>=20
> -    if not lic_files:
> -        package_qa_handle_error("license-checksum", pn + ": Recipe =
file does not have license file information (LIC_FILES_CHKSUM)", d)
> +    if not lic_files and d.getVar('SRC_URI', True):
> +        package_qa_handle_error("license-checksum", pn + ": Recipe =
file fetches files and does not have license file information =
(LIC_FILES_CHKSUM)", d)
>         return
>=20
>     srcdir =3D d.getVar('S', True)
> --
> 2.5.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_AEDD260F-1DF6-43D8-B40E-C5DF0B251B68
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxHWoACgkQuwUzVZGdMxRVmQCeJBVXSiqBLm70VzFyup0T7d+Z
x74An3OO4x/T/m/R39oA34ZzzGjGDNM1
=ZBQm
-----END PGP SIGNATURE-----

--Apple-Mail=_AEDD260F-1DF6-43D8-B40E-C5DF0B251B68--
