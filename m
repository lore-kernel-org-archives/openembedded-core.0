Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id EFC5373D13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 12:53:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 42D7E60008F
To: Tanu Kaskinen <tanuk@iki.fi>, openembedded-core@lists.openembedded.org
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442227275-19855-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442317009.1922.4.camel@iki.fi>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <55F814DC.2050403@collabora.co.uk>
Date: Tue, 15 Sep 2015 14:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442317009.1922.4.camel@iki.fi>
Subject: Re: [PATCH v3 1/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 15 Sep 2015 12:53:53 -0000
X-Groupsio-MsgNum: 71104
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ECU2nr1NW1mm13mVgmjFxHo3Ex16SRoXE"

--ECU2nr1NW1mm13mVgmjFxHo3Ex16SRoXE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15/09/15 13:36, Tanu Kaskinen wrote:
> I think user-session should be enabled by default when systemd is in
> DISTRO_FEATURES. Some services, e.g. PulseAudio, can fully enable their=

> systemd integration only if dbus is compiled with --enable-user
> -session.

I think so too, but I think it's worth a separate patch, right?

--=20
Cheers,
  Andrew


--ECU2nr1NW1mm13mVgmjFxHo3Ex16SRoXE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV+BTdAAoJEEFnG7NKhJOByB8P/0qLa6TY+4ofJ/uKnoke7e8+
2Me6qKZ2937dgj55la2xJ3RMqrhhW5ztNEe+z50TcKM65Q70N8cSR1g1y4XcKFza
42llk+Cs0O+DifJvvQNJrE2hxaLZ0LmQOe/pmPIZdogjdg+5qqFqErZDnlupDgXM
8k3t2B2AVuzmGHj22LIk5e/mdhT3jd9VIvYIEM+4XYl5BdzBnFuftXojKz+gt/kr
JmemoDGYgjE25nhaBmr4atyLXIxdL/b6TWTMZE81o0gm73JvPRCM2ZpKJ3jSX7UR
2IUtx19ZgsJuebanwJe6btVTSFi2bhWvyXYC45stoubqZO9KB8BGgKa+vIdsqYuB
6bZQyLL48ENYF5pWgH3qtxcf75YIVu+aNa70gdQe2esDGTGo4r20SBVi5XCaLIa9
h5aoBtbgkG9/GH6eHbIcGCJhLqWOAuwsqj7PbVYBLvZdcDsKVXFTQkidNSFhlsoc
wwxxuGFYdFVocK8agndckUPAKfI8f1gnQbgyxxMHiofjNRuoZlqxggXlST8G4AgZ
uS8XTSKglgaj8v1bBB1ZEHjy8PAnWIIFZP5nxUocLGYYMsE/+Ug9D07swyVBjKBx
JcUVbFv3hAIImzqZpZzqtS+bUSbct5mTVXg+vV6InvBwPsc9Q4YoJ305wMr1RW7T
Kc+Q/qzhWAnrXWYwN7pn
=vYvM
-----END PGP SIGNATURE-----

--ECU2nr1NW1mm13mVgmjFxHo3Ex16SRoXE--
