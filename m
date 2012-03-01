Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S33Wu-00035b-HS for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 11:46:36 +0100
Received: from f053033002.adsl.alicedsl.de ([78.53.33.2] helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S33Oo-0000R4-E5; Thu, 01 Mar 2012 10:38:14 +0000
Message-ID: <1330598285.3569.25.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 01 Mar 2012 11:38:05 +0100
In-Reply-To: <4F4F13A8.5070009@windriver.com>
References: <cover.1328774359.git.xiaofeng.yan@windriver.com>
	<92a87a54f47245d723727bd190c35323e66ad3ea.1328774359.git.xiaofeng.yan@windriver.com>
	<1328778363.5379.3.camel@mattotaupa> <4F4F13A8.5070009@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] libx11-1.4.4: Add patch makekeys_crosscompile.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 10:46:36 -0000
X-Groupsio-MsgNum: 18250
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-6bBbbF1sKTKkrZHjBx8p"

--=-6bBbbF1sKTKkrZHjBx8p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 01.03.2012, 14:14 +0800 schrieb Xiaofeng Yan:
> On 2012=E5=B9=B402=E6=9C=8809=E6=97=A5 17:06, Paul Menzel wrote:

> > Am Donnerstag, den 09.02.2012, 16:05 +0800 schrieb Xiaofeng Yan:
> >> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> >>
> >> LSB 4.1 complain a host contamination error from libx11 because of abs=
ent
> >> patch "makekeys_crosscompile.patch" from libx11-trim-1.4.4.
> >>
> >> [YOCTO #1970]
> > could you squash both patches please?
> >
> > Also please add the output from the cover letter to the commit message.
> >
> >> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>

I just noticed. Your Thunderbird setup seems to be broken. For some
reason it deletes spaces.

> >> ---
> >>   .../libx11-1.4.4/makekeys_crosscompile.patch       |   45 ++++++++++=
++++++++++
> >>   1 files changed, 45 insertions(+), 0 deletions(-)
> >>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/makek=
eys_crosscompile.patch
> >>
> >> diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_cros=
scompile.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_cross=
compile.patch

Here Thunderbird removed a line break.

> >> new file mode 100644
> >> index 0000000..e5eacf0
> >> --- /dev/null
> >> +++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompil=
e.patch
> >> @@ -0,0 +1,45 @@
> >> +Because the size of "unsigned long" is different between 32-bit
> >> +and 64-bit, judge whether target is 32-bit or 64-bit and tell
> >> +"makekey".
> > Trailing space at the end.
> >
> > Could you also add the error message to the patch file in a *separate*
> > patch please. Preferably before copying it.
>
> Do you mean I use an separated file to record error message?
> So there are two file here. one is for  makekeys_crosscompile.patch,=20
> another is for a file to record error message. right?

Sorry, I did not understand your reply either. :/

1. Copy the error message you got when building without the patch.
2. Go to

    meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.=
patch

and add that error message to the commit message of the patch above.
Make that the first patch.
3. Now copy this file to libx11-1.4.4 and submit as a second patch.

> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: dbuitenh@windriver.com
> >> +
> >> +--- libX11-1.3.4.orig/src/util/makekeys.c	2010-01-15 09:11:36.0000000=
00 +0800
> >> ++++ libX11-1.3.4/src/util/makekeys.c	2011-05-24 19:04:25.454774908 +0=
800
> > [=E2=80=A6]


Thanks,

Paul

--=-6bBbbF1sKTKkrZHjBx8p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk9PUY0ACgkQPX1aK2wOHVg08QCeK04yVHxJrmsXs6zuXY7KPtze
1lQAniwSkrjqmu4v24GdPXSbtbcs9gHX
=9O8x
-----END PGP SIGNATURE-----

--=-6bBbbF1sKTKkrZHjBx8p--
