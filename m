Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 21BAA71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:22:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id CA3FC608290
Message-ID: <55E05270.90404@collabora.co.uk>
Date: Fri, 28 Aug 2015 14:22:08 +0200
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
	<CAMKF1so6_ftdkbU5afVrGdnZA9LRDLhktNTgcdnZw2iqrYwSnQ@mail.gmail.com>
In-Reply-To: <CAMKF1so6_ftdkbU5afVrGdnZA9LRDLhktNTgcdnZw2iqrYwSnQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Fri, 28 Aug 2015 12:22:16 -0000
X-Groupsio-MsgNum: 70229
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="AiGX6HckpouPMpKNEdfFLP0g0TNmjh9hk"

--AiGX6HckpouPMpKNEdfFLP0g0TNmjh9hk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/08/15 05:53, Khem Raj wrote:
> On Thu, Aug 27, 2015 at 2:12 AM, Andrew Shadura
> <andrew.shadura@collabora.co.uk> wrote:
>> > The split is no longer necessary, and only makes it more complicated=
 to
>> > do changes in external layers.
>> >
>> > Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
>> > ---
>> >  meta/recipes-core/dbus/dbus.inc       | 170 -----------------------=
----------
>> >  meta/recipes-core/dbus/dbus_1.8.20.bb | 171 +++++++++++++++++++++++=
++++++++++-
>> >  2 files changed, 170 insertions(+), 171 deletions(-)
>> >  delete mode 100644 meta/recipes-core/dbus/dbus.inc
> can you send patch generated with -M 1

Gives me exact same patch, hmm.

--=20
Cheers,
  Andrew


--AiGX6HckpouPMpKNEdfFLP0g0TNmjh9hk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV4FJwAAoJEEFnG7NKhJOB+pYP/2VdUHOn+adk+hmwXMtKLlbH
MqG33VslkHWWztmezSj+OVjaGkXDLO8mEfcHli9btVnpvy7fP3HJdf10ON5eIxtl
2jJGEwk+CgVFYqpIr+eFN2DsDeIuGKpl7BL4vMRDLdwL5bbQdTOwXXbSmRGus2nt
9F/tEl+VeayFEGC4A0pjePTDV2YpTllCeacIysH+SzHZNpbG5N3J+auPA2O1RJCd
swChgm0h5lVcg55CdyAURVgEBEmTocamuUTgZmKfaFn/goLU81L1ASJwbe56suVJ
5TckGPLPHXPL1pcFF7XA/rl3dIrLGqZ5BQ2yQqwZZ4Q4OtByZ2RYhssWYrG7VT2w
Gggk03XdIinGFIePwRBI3ynFyN37Ph1gsr2XeGfSpFiuuvmTB6ZkPWG9DCsTxQoD
9zcGsHLrEg4ZMeSYs6Ro64MLtqcPtrCLQQ3zr88SND44B0MjA+l2P4tLKJJg5NLa
iaJUtR8uud+QFkg1wVQlBK3wpdI5qazURXOoZfthSf/m3hIfNOrbhTQyLYSWZeBz
nMMuzIJ9/6tUHtifNyOBg0xYI9chPLI5/1SFEPfl22LznVgua+FnlUY/VS/P5S58
NYJsv5AezkI5BZzyZacyNn2UppdJYG6Hq0gXoRfB9jXF8LJ+WGEIElYdjyqZSWEx
nKCuyx+p04DfBUtZ4p9+
=99zY
-----END PGP SIGNATURE-----

--AiGX6HckpouPMpKNEdfFLP0g0TNmjh9hk--
