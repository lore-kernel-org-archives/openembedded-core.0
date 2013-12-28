Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id CB7146B57C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:44:00 +0000 (UTC)
Received: (qmail 25320 invoked by uid 1003); 28 Dec 2013 22:44:01 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@71.171.43.170)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Dec 2013 22:44:01 -0000
Message-ID: <52BF51CC.4040300@balister.org>
Date: Sat, 28 Dec 2013 17:33:48 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>	<l9c5ar$2mb$1@ger.gmane.org>
	<1801103.RjHpRo2rCi@helios> <l9mqmg$oia$1@ger.gmane.org>
In-Reply-To: <l9mqmg$oia$1@ger.gmane.org>
X-Enigmail-Version: 1.6
Cc: poky@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Sat, 28 Dec 2013 22:44:02 -0000
X-Groupsio-MsgNum: 48486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="rNCqGmQPj7NEg1FHJoTcgB3uBbfHEIMwg"

--rNCqGmQPj7NEg1FHJoTcgB3uBbfHEIMwg
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12/28/2013 10:28 AM, Koen Kooi wrote:
> Paul Eggleton schreef op 28-12-13 12:48:
>> Hi Koen,
>=20
>> On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote:
>>> Burton, Ross schreef op 23-12-13 19:01:
>>>> We'd like to integrate Piglit (an OpenGL test suite) into Poky so
>>>> that we can run automated QA on the GL stack.  Piglit is currently
>>>> residing in meta-oe, but as Poky is a self-contained project we can'=
t
>>>> just add meta-oe to it:  apart from the size of meta-oe, we can't
>>>> ensure stability if meta-oe makes incompatible changes that affect
>>>> Poky.
>>>>
>>>> Piglit isn't a stand-alone package, there are the dependencies of
>>>> waffle, python-mako and python-numpy to consider too.  There are two=
=20
>>>> possibilities I can see:
>>>>
>>>> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
>>>> and pushes the boundaries of "core platform".  In a sense this is a
>>>> repeat of the discussion we had with Midori...  does oe-core contain=

>>>> everything needed to sufficiently exercise the core components it
>>>> ships or not?
>>>>
>>>> 2) Add piglit and deps to meta-yocto.  Probably a new layer called=20
>>>> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
>>>> forbid mixing distribution policy and recipes.
>>>
>>> Speaking of layers, can you *please* rename meta-yocto to meta-poky?
>>> It's what it's actually is and would remove a lot of confusion when
>>> trying to explain that yocto is not a distro, even if the distro laye=
r
>>> is called 'meta-yocto'.
>=20
>> This is a tangent, but a couple of points:
>=20
>> 1) This rename would not come for free. We'd need to update people's
>> existing bblayers.conf files on the fly, as we did when meta-yocto-bsp=

>> was split out of meta-yocto, and thus bump LCONF_VERSION; however, doi=
ng
>> this only in poky has resulted in annoying problems when users remove
>> poky from their configurations (since LCONF_VERSION is out-of-step
>> between Poky and OE-Core, leading to confusing errors in this situatio=
n).
>> Thus I think we'd want to solve this once and for all by bumping the
>> value in OE-Core as well as Poky.
>=20
>> 2) If you propose this rename, perhaps you will also consider renaming=
=20
>> meta-oe, since that name within a similarly named meta-openembedded
>> repository leads to a similar level of confusion...?
>=20
> I have no problems with renaming that layer since I get confused by thi=
s a
> few times a week myself :)

What would we we rename it to?

Philip

>=20
> regards,
>=20
> Koen
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20


--rNCqGmQPj7NEg1FHJoTcgB3uBbfHEIMwg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSv1QwAAoJEMDJd4rr0merzCkH/A3btEGOPwAJF73Yr9lsSR5j
H5v8CIrR4mxYpH/j3aR6pKO6v69G9YaUeUGZQY4lI75OwRGMpRRuUPQ7Eppm6lCS
wYwpPU0PIHfVF9OJqnFuZemEINzazjZtzcaV16qbKVLRGhT8XuGVeRLsKa/vFq5G
VIS/k/UiLH01HJZVwYRN9duxuDMViK6YhuZBMUINZJ+IGElHL0O7NB6Ke1mDrMsX
XElBRSOwn9ZT7VDqJ3hoSNmtjMVToRz01eP54sb2+JYaiRJIhLZSsj+z+/JGEaeM
+IvOxOkWESHg/lN0QQ5YdmGRDWCbzyukfUrGrPVyU7zdH5wW5ELwDYOfjhMC3xE=
=b4ch
-----END PGP SIGNATURE-----

--rNCqGmQPj7NEg1FHJoTcgB3uBbfHEIMwg--
