Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 33D1960119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 16:57:05 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id di2so18472471pad.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=cPK7jL+H3TGujqrmbOPskYWUe4pPf9G4rTd1Fdlo7lY=;
	b=FU4y8jHzP9OqOigcY23J3/PXFTNoAyZ6JjiHdhavri1QPFGjRK33YzKHT/fit/phJY
	+qwK0vX/LrVgQXZlOsTUZL0IuWh2B/kuFVBwdNjSOJu5r3L24AR2YZjkfNXmNSfKM2NT
	Q1I59qWgNZLLdr72ErpsxxNUMrAr/Cv+VMOuf7NfcAbgKS3hGmfR5IZU670M209teFJO
	vMChf4l6r3zcOmafP1AeQvo0vdwr7rJUWlGqOu20kIukOi+0MPmXO8gumoCX3s++q59M
	NvuuKaV6FFczsh+U3IY7e+2v0PZUflWXwnUWs4uZ79glET8URCkApyZoJC69GaBOqkgY
	GocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cPK7jL+H3TGujqrmbOPskYWUe4pPf9G4rTd1Fdlo7lY=;
	b=BCTFMB8hwX+8zvMTMcvDSl68MZK0giWn5c67JHBXs5Qzund/HlJI+Wl1PpywdnrEo+
	Nd1B6OUdlfEwMu0aqo17RojVVG0rtjZfzcWrnRebY8rJgRfth0b47BqvwJO2OW9L28Id
	jrP4LHksCnCN1ZqdOfDNS0DbsOykkNZkX1gVqTgE3D+qrG0VngNY4sk/393C+z494In7
	b1riHYyZCqDP76C90X2T8EUozGQ7OTyQnvoNtF87Cgb1YbwRMcpDj+o4i/QNQH8QmOks
	tHK1ZxE45XfAnSRCSB6kSojcYbEoLxBlnzY+/Yh7EIzWnaLd6iXDfkS+Fx+kqhTLBMsO
	tsRA==
X-Gm-Message-State: AE9vXwPEdmMENpjtiy2E+ydJ3aIg9n4bkl0NVAn6Vr61NqygyEI1VqmLjdwdRSKVuP77qw==
X-Received: by 10.66.13.200 with SMTP id j8mr17993029pac.150.1472144226275;
	Thu, 25 Aug 2016 09:57:06 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:157a:f659:3403:a165?
	([2601:647:4c00:3edf:157a:f659:3403:a165])
	by smtp.gmail.com with ESMTPSA id
	s12sm22170462pfj.73.2016.08.25.09.57.05
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Aug 2016 09:57:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYmUmp8+KBwdJUYqNDHmxLjG+YUCviE4e+pmXOJGpjJ2g@mail.gmail.com>
Date: Thu, 25 Aug 2016 09:57:32 -0700
Message-Id: <EFF516A8-3F18-4735-B2B9-EB285AE19F87@gmail.com>
References: <cover.1472060412.git.mariano.lopez@linux.intel.com>
	<2ea1073b1b15da51334a47814732d809fc1d4a3a.1472060412.git.mariano.lopez@linux.intel.com>
	<CAJTo0LYmUmp8+KBwdJUYqNDHmxLjG+YUCviE4e+pmXOJGpjJ2g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Thu, 25 Aug 2016 16:57:08 -0000
X-Groupsio-MsgNum: 86304
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF6783A3-C21C-4386-91A8-286A8EFE0A85";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF6783A3-C21C-4386-91A8-286A8EFE0A85
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AFF6A370-271B-4374-889B-FAE1F794D926"

--Apple-Mail=_AFF6A370-271B-4374-889B-FAE1F794D926
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 25, 2016, at 7:28 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 24 August 2016 at 19:58, <mariano.lopez@linux.intel.com =
<mailto:mariano.lopez@linux.intel.com>> wrote:
> +CFLAGS +=3D "-Wno-error=3Dpedantic"
>=20
> This doesn't work in native builds, as the native class reassigns the =
value at the last minute.  You'll have to use _append.

this change is needed with musl, so it may not cause issues per se but I =
agree using append is better here

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_AFF6A370-271B-4374-889B-FAE1F794D926
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 25, 2016, at 7:28 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 24 August 2016 at 19:58,  <span dir=3D"ltr" =
class=3D"">&lt;<a href=3D"mailto:mariano.lopez@linux.intel.com" =
target=3D"_blank" class=3D"">mariano.lopez@linux.intel.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19t" =
class=3D"a3s aXjCH m156bfa5c1b1bd960">+CFLAGS +=3D =
"-Wno-error=3Dpedantic"<br class=3D""></div></blockquote></div><br =
class=3D"">This doesn't work in native builds, as the native class =
reassigns the value at the last minute.&nbsp; You'll have to use =
_append.</div></div></div></blockquote><div><br class=3D""></div><div>this=
 change is needed with musl, so it may not cause issues per se but I =
agree using append is better here</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_AFF6A370-271B-4374-889B-FAE1F794D926--

--Apple-Mail=_BF6783A3-C21C-4386-91A8-286A8EFE0A85
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle/I4AACgkQuwUzVZGdMxRaygCfSj/i8SZjqZAgDSainxA8m+Fs
XhcAoIiZQIUV1CZ6ecfsarLjtFVrw7EA
=M4/a
-----END PGP SIGNATURE-----

--Apple-Mail=_BF6783A3-C21C-4386-91A8-286A8EFE0A85--
