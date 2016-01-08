Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 675F060670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:41:01 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so187071363pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MJu2d84/HRskTH5UL4Vaf4AtNlW7d5uRg3EzLYP3y38=;
	b=kzytBgGbBMRceOOndw6XhFw4m3vmPuXpAxoxq8N/JYWJsuENUFf0zWc9onEaacUQS2
	1bgm46OMcwgiU+h5guYHvhScXzmjOUrVCvRS+1pUwwqyRcy3mcXbUGh8Arq2SYCx+AvI
	PIIYjoMh3PHkgdFdL89WM6kslT+owZ7fyuKmiVFTs9a2ArOdJFetx04u/8yGBc7Ws6jB
	9WB1hE6O8w9lvFbL+Rrqo2eMMaQPpplyhxxOMmxTi2nQMtXXUKOwe74NIQcjXtSpFPuC
	Bj0rtnkOcdGh8C33yvsm4DkP2M+nmcQqqgbYK/0Tl3rsVXBsW+NpnpEPW0rOxnaMZu+f
	NnZw==
X-Received: by 10.66.55.66 with SMTP id q2mr91130523pap.120.1452246062152;
	Fri, 08 Jan 2016 01:41:02 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4934:16a1:ccba:482b?
	([2601:646:8802:5d5c:4934:16a1:ccba:482b])
	by smtp.gmail.com with ESMTPSA id
	u69sm3360771pfa.61.2016.01.08.01.41.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 01:41:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbtH+=faMv7DpSbhsmaB6A9DmXkDSwAk6YA4cvGi7c_qg@mail.gmail.com>
Date: Fri, 8 Jan 2016 01:40:55 -0800
Message-Id: <0348DF50-6B9B-4765-9F27-C731D38BBE4C@gmail.com>
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
X-List-Received-Date: Fri, 08 Jan 2016 09:41:02 -0000
X-Groupsio-MsgNum: 75642
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BB918D38-9D5C-451B-A29E-3A0DAD2A844D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BB918D38-9D5C-451B-A29E-3A0DAD2A844D
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0B12CD64-335C-4F0C-BC62-CCC1B537F22E"

--Apple-Mail=_0B12CD64-335C-4F0C-BC62-CCC1B537F22E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


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

This is a patch from sabotage linux, I have addressed all other issues.

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


--Apple-Mail=_0B12CD64-335C-4F0C-BC62-CCC1B537F22E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 7, 2016, at 7:32 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
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
buildroot is =
carrying?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>This is a patch from sabotage linux, I have =
addressed all other issues.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
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
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_0B12CD64-335C-4F0C-BC62-CCC1B537F22E--

--Apple-Mail=_BB918D38-9D5C-451B-A29E-3A0DAD2A844D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaPhCsACgkQuwUzVZGdMxRjfACfeV/OVmGlbhRcxjbcejqr6UGt
HxgAoJSt4YDq01MQ8kwAL+oS0ztP+X58
=LqE9
-----END PGP SIGNATURE-----

--Apple-Mail=_BB918D38-9D5C-451B-A29E-3A0DAD2A844D--
