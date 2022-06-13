X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Mon, 13 Jun 2022 22:40:57 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] Subject: [PATCH 1/3] [PATCH] [master] weston.py: added xwayland test
Message-ID: <Yqeg2X+m5Airhm0s@mail.local>
References: <AGlB.1655124001881764456.MSf8@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <AGlB.1655124001881764456.MSf8@lists.openembedded.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: Sebastian.Suesens@baslerweb.com
Cc: openembedded-core@lists.openembedded.org

Hello,

I'm sorry but none of the patches apply correctly and this is proving
difficult to fix.

Could you resend using git send-email?

You have more information here:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

On 13/06/2022 05:40:01-0700, S=FCsens, Sebastian via lists.openembedded.org=
 wrote:
> Test xwayland support if DISTRO_FEATURE X11 is enabled
>=20
> Test checked if xserver listening on display
>=20
> Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
> ---
> meta/lib/oeqa/runtime/cases/weston.py | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtim=
e/cases/weston.py
> index b81cc299ef..1fd471e611 100644
> --- a/meta/lib/oeqa/runtime/cases/weston.py
> +++ b/meta/lib/oeqa/runtime/cases/weston.py
> @@ -77,3 +77,11 @@ class WestonTest(OERuntimeTestCase):
> self.target.run('kill -9 %s' % w)
> __, weston_log =3D self.target.run('cat %s' % self.weston_log_file)
> self.assertTrue(new_wl_processes, msg=3D'Could not get new weston-desktop=
-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_=
cnt, weston_log))
> +
> +=A0 =A0 @skipIfNotFeature('x11', 'Test requires x11 to be in DISTRO_FEAT=
URES')
> +=A0 =A0 @OEHasPackage(['weston'])
> +=A0 =A0 def test_weston_supports_xwayland(self):
> +=A0 =A0 =A0 =A0 cmd =3D'cat %s | grep "xserver listening on display"' % =
self.weston_log_file
> +=A0 =A0 =A0 =A0 status, output =3D self.target.run(cmd)
> +=A0 =A0 =A0 =A0 msg =3D ('xwayland does not appear to be running')
> +=A0 =A0 =A0 =A0 self.assertEqual(status, 0, msg=3Dmsg)
> --
> 2.25.1

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
