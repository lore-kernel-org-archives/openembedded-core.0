Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5E57171AC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 20:06:25 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ciRYw-0003cs-E4 from Joe_MacDonald@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 12:06:26 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Feb 2017 12:06:25 -0800
Received: by burninator (Postfix, from userid 1000)	id 4C4705805F3; Mon, 27
	Feb 2017 15:06:25 -0500 (EST)
Date: Mon, 27 Feb 2017 15:06:25 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20170227200624.GA1688@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
	<20170227183329.9748.13885@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170227183329.9748.13885@do.openembedded.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGRlcHJlY2F0ZWQuYmJjbGFzczogQWRkIGEgUE5ERVBSRUNBVEVEIHZhcmlhYmxlIGZvciByZWNpcGVzIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 27 Feb 2017 20:06:25 -0000
X-Groupsio-MsgNum: 94026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[=E2=9C=97 patchtest: failure for deprecated.bbclass: Add a PNDEPRECATED va=
riable for recipes (rev3)] On 17.02.27 (Mon 18:33) Patchwork wrote:

> =3D=3D Series Details =3D=3D
>=20
> Series: deprecated.bbclass: Add a PNDEPRECATED variable for recipes (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/5489/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
>=20
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>=20
>=20
>=20
> * Issue             Series does not apply on top of target branch [test_s=
eries_merge_on_head]=20
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 65cfc8aca3)

I had been out of date, but this time I'm reasonably confident v3 is
still directly on top of master.

yocto-mainline> git config --local --get-regexp '^remote'
remote.yocto.url git://git.yoctoproject.org/poky
remote.yocto.projectname poky
remote.yocto.fetch +refs/heads/*:refs/remotes/yocto/*
yocto-mainline> git pull
Already up-to-date.
yocto-mainline> git status
On branch master
Your branch is ahead of 'yocto/master' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working directory clean

Is patchtest having a bad day?

> If you believe any of these test results are incorrect, please reply to t=
he
> mailing list (openembedded-core@lists.openembedded.org) raising your conc=
erns.
> Otherwise we would appreciate you correcting the issues and submitting a =
new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>=20
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>=20

--=20
-Joe MacDonald.
:wq

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYtIbAAAoJEEn8ffcsOfaWDz4H/jcqzI0VlhrhAUBMCMkCwa/7
GmaZ5rapDV8w5JvB6UjsrFVE7yXrz3dsrM9FepubUpxZaxoi/vte82lsqUwO+/Qf
6rxymGtd6uEzLyrHUHLf1A75O5KhJmHVa+E3GUkQHy5e3GUV9adgdPJgc7DapJC7
vjnOTdxoGcjo+kM3Nw/R+Q6x/16EJpwWWH4aHRtem1nwck1TluVsGCqAnXUl960w
uIcYUufySGpIUAZn9ff5KJ3ByPzcQrjcYkeaENgnzoCTOY7cTXaMx8O1liwZVkAE
jgnUr44sT9PwCR6BDJj9PFKbx7BGiNRTn4hobhRXjYowpsIvvR72Ljp7wzkriJ4=
=ryZD
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
