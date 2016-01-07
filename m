Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3C166731C0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:48:35 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id yy13so170189664pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ZlMmhAc2gl2OonPKa1KL2NcxyFgg0/Zo6vDQ6FOw1eE=;
	b=V0f7Gw9/HEtAoZj1qfxTDEekvaNI+4NB+AY4oem24FJC2YqaymzpaDDO0O+JaKxmCi
	01H7n1BbKqhhH4/UzsrdnhfVepjW/QcZkRWjmYCyTe+DZ6hL7qfh0Ng3r+R0ExQoakXj
	VP9UR5/jrzLQUgXI4fel8DzKH/EQ9IN1Cmj1Xv3b1c8Xr3kQvYRjTTHXbwkZRKz2P7eA
	+iRWEvYaJAf0FqMW0HI+sPU+R6I7cMc/iQR6Ec0J8CZ4/8pPeLUDdJvRynyms4EKkReG
	GyH6UmBScEubwn+8R8Ibck+fOjzvIl7nwxlpdPeDmMNFZ3S3jgcbbxK0eR9EP2D4jgam
	x4Qg==
X-Received: by 10.66.141.41 with SMTP id rl9mr151685178pab.139.1452185316723; 
	Thu, 07 Jan 2016 08:48:36 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:982a:b8a1:a8a1:aeba?
	([2601:646:8802:5d5c:982a:b8a1:a8a1:aeba])
	by smtp.gmail.com with ESMTPSA id
	tv6sm105139830pab.4.2016.01.07.08.48.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 08:48:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbtH+=faMv7DpSbhsmaB6A9DmXkDSwAk6YA4cvGi7c_qg@mail.gmail.com>
Date: Thu, 7 Jan 2016 08:48:30 -0800
Message-Id: <FA9D87D2-D8D7-4985-9A64-7A8D63626875@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<CAJTo0LbtH+=faMv7DpSbhsmaB6A9DmXkDSwAk6YA4cvGi7c_qg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] musl fixes phase 2
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
X-List-Received-Date: Thu, 07 Jan 2016 16:48:36 -0000
X-Groupsio-MsgNum: 75581
Content-Type: multipart/signed;
	boundary="Apple-Mail=_51A45180-E83B-4B1F-93B7-CA3748E29D9A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_51A45180-E83B-4B1F-93B7-CA3748E29D9A
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8856A6E1-4F98-4FE7-B60E-672782ED2797"

--Apple-Mail=_8856A6E1-4F98-4FE7-B60E-672782ED2797
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Ross

No worries, I will prepare phase3 today at earliest. Where these will be =
addressed along with new fixes.

Thanks
-Khem

> On Jan 7, 2016, at 7:32 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Hi Khem,
>=20
> I just reviewed this series again and there's still some patches that =
need tweaking:
>=20
> On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Khem Raj (17):
>   powertop: Include right headers for timval struct
>=20
> Missing Upstream-Status.
>=20
>   dhcp: Include sys/types.h for u_int* defs
>=20
> Missing Upstream-Status.
>=20
>   blktrace: Include <sys/types.h for dev_t
>=20
> Missing Upstream-Status (Status doesn't count, there's machinery about =
this tag now)
>=20
>   fts: Add recipe
>=20
> Every patch is missing patch explanation / signed-off-by / =
upstream-status.
>=20
>   libcgroup: Add dependency on fts when building on musl
>=20
> The U-S is Pending but the commit isn't from you - was this actually a =
backport or just a patch that eg buildroot is carrying?
>=20
>   linux-libc-headers: Port patches for linux-headers for musl
>=20
> Patches are missing signed-off-by.
>=20
>   gdk-pixbuf: Fix latent build  issue exposed by musl
>=20
> This is a test that uses glibc features, so simply changing it to use =
malloc isn't right.  This is already fixed upstream properly: =
https://git.gnome.org/browse/gdk-pixbuf/commit/tests/pixbuf-lowmem.c?id=3D=
205a3b04e1216c1df199aec95185f7f48b8e0491 =
<https://git.gnome.org/browse/gdk-pixbuf/commit/tests/pixbuf-lowmem.c?id=3D=
205a3b04e1216c1df199aec95185f7f48b8e0491>
>=20
> The rest are merged into ross/mut so can you please rebase onto that.
>=20
> Ross
>=20
>=20


--Apple-Mail=_8856A6E1-4F98-4FE7-B60E-672782ED2797
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Ross<div class=3D""><br class=3D""></div><div class=3D"">No =
worries, I will prepare phase3 today at earliest. Where these will be =
addressed along with new fixes.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks</div><div =
class=3D"">-Khem</div><div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Jan 7, 2016, at 7:32 AM, =
Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">Hi Khem,</div><div =
class=3D"gmail_extra"><br class=3D""></div><div class=3D"gmail_extra">I =
just reviewed this series again and there's still some patches that need =
tweaking:</div><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 19 December 2015 at 23:52, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><span class=3D"">Khem</span> Raj (17):<br =
class=3D"">
&nbsp; powertop: Include right headers for timval struct<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Missing Upstream-Status.</div><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">
&nbsp; dhcp: Include sys/types.h for u_int* defs<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Missing Upstream-Status.</div><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">
&nbsp; blktrace: Include &lt;sys/types.h for dev_t<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Missing Upstream-Status (Status doesn't count, there's =
machinery about this tag now)</div><div class=3D"">&nbsp;</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">&nbsp; fts: Add recipe<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Every patch is missing patch explanation / signed-off-by / =
upstream-status.</div><div class=3D""><br class=3D""></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">&nbsp; libcgroup: Add dependency on fts =
when building on musl<br class=3D""></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">The U-S is Pending but the commit isn't =
from you - was this actually a backport or just a patch that eg =
buildroot is carrying?</div><div class=3D""><br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">
&nbsp; linux-libc-headers: Port patches for linux-headers for musl<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Patches are missing signed-off-by.</div><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">&nbsp; gdk-pixbuf: Fix latent build&nbsp; =
issue exposed by musl<br class=3D""></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">This is a test that uses glibc =
features, so simply changing it to use malloc isn't right.&nbsp; This is =
already fixed upstream properly: <a =
href=3D"https://git.gnome.org/browse/gdk-pixbuf/commit/tests/pixbuf-lowmem=
.c?id=3D205a3b04e1216c1df199aec95185f7f48b8e0491" =
class=3D"">https://git.gnome.org/browse/gdk-pixbuf/commit/tests/pixbuf-low=
mem.c?id=3D205a3b04e1216c1df199aec95185f7f48b8e0491</a></div><div =
class=3D"">&nbsp;</div><div class=3D"">The rest are merged into ross/mut =
so can you please rebase onto that.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Ross</div><div class=3D""><br =
class=3D""></div></div><br class=3D""></div></div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_8856A6E1-4F98-4FE7-B60E-672782ED2797--

--Apple-Mail=_51A45180-E83B-4B1F-93B7-CA3748E29D9A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaOluIACgkQuwUzVZGdMxS3FgCeM/U2XKgksk13B1y8cdpNWzyg
T5IAoJMOQXRB4V7YtGyEcFOPSJx+Wcfp
=2u1O
-----END PGP SIGNATURE-----

--Apple-Mail=_51A45180-E83B-4B1F-93B7-CA3748E29D9A--
