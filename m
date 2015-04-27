Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 268D673D66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:50:29 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so132628424pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PtUZdCpY+emCEqbpZsVCzF3aEy5HmJdRItrN64GE5gA=;
	b=bkmYM8Nv1tPC2CQsIAhHnuHaOH0Va8J8oJBIoKogdeoLCniJte8keM3ppbpAC64NkA
	Je3evlOYCIDUbfHFAGhZhsP5xhi1olLp00fX8NPtTSjgBtReUKcdk8RZ2zm1cm0jO+dk
	9fPLCma6i6HNIKZgemUXLKgPm+GG45eS1yZ0TxZr9F8VjkceSRg0Bo8LGeu0lVz7N0ig
	JeK349i9cNiCL0A1cnInRSrYNmKmqBwVI0oZ9Jhk6OU3Gz7c716nq13ptMrcqCMzwTF+
	aBDdVe0bZLXMEsidi5oc7GgDNOSfwUUjYzpm/grfdjL8fr/dIvR00M/r6G3flwmrhCYq
	TUPg==
X-Received: by 10.67.8.98 with SMTP id dj2mr23253136pad.79.1430149831128;
	Mon, 27 Apr 2015 08:50:31 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id o3sm12255880pds.1.2015.04.27.08.50.29
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 08:50:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbWOFRj0HAzjcbtQGwS9rmOFmp4zT_T-sHWkaU4V-sdfQ@mail.gmail.com>
Date: Mon, 27 Apr 2015 08:50:28 -0700
Message-Id: <56E83ADE-075F-4E5A-AE45-810914842923@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<77a5f2f42f3ca50a912306b1771e08286b4e8648.1429846255.git.raj.khem@gmail.com>
	<CAJTo0LbC+Jt5N1VANt71jpuJU7KHE5YC1hkd2amLe02Zm1p+YQ@mail.gmail.com>
	<CAJTo0LbWOFRj0HAzjcbtQGwS9rmOFmp4zT_T-sHWkaU4V-sdfQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/14] xserver-xorg: Fix build with gcc-5
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
X-List-Received-Date: Mon, 27 Apr 2015 15:50:30 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CA8B6AEC-6F6F-4C46-BE0F-79C5BFA470DA"

--Apple-Mail=_CA8B6AEC-6F6F-4C46-BE0F-79C5BFA470DA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 27, 2015, at 7:59 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Oh, and upstream has merged a different fix:
>=20
> =
http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=3D=
21b896939c5bb242f3aacc37baf12379e43254b6 =
<http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=3D=
21b896939c5bb242f3aacc37baf12379e43254b6>
>=20

thats the proper fix IMO. Let me see if I can test a back port of it =
today.

> Ross
>=20
> On 27 April 2015 at 15:58, Burton, Ross <ross.burton@intel.com =
<mailto:ross.burton@intel.com>> wrote:
>=20
> On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> +Upstream-Status: Pending
>=20
> Patches should also have *your* signed-off-by in, so we know who =
originally proposed the patch.
>=20
> Ross
>=20


--Apple-Mail=_CA8B6AEC-6F6F-4C46-BE0F-79C5BFA470DA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Apr 27, 2015, at 7:59 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Oh, and upstream has merged a different fix:<div class=3D""><br=
 class=3D""></div><div class=3D""><a =
href=3D"http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms=
.sh?id=3D21b896939c5bb242f3aacc37baf12379e43254b6" =
class=3D"">http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdks=
yms.sh?id=3D21b896939c5bb242f3aacc37baf12379e43254b6</a><div =
class=3D""><br class=3D""></div></div></div></div></blockquote><div><br =
class=3D""></div><div>thats the proper fix IMO. Let me see if I can test =
a back port of it today.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D""><div class=3D"">Ross</div></div></div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On 27 =
April 2015 at 15:58, Burton, Ross <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank" =
class=3D"">ross.burton@intel.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 24 April 2015 at 04:35, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"overflow:hidden" class=3D"">+Upstream-Status: Pending<br =
class=3D""></div></blockquote></div><br class=3D"">Patches should also =
have *your* signed-off-by in, so we know who originally proposed the =
patch.</div><span class=3D"HOEnZb"><font color=3D"#888888" class=3D""><div=
 class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br class=3D""></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_CA8B6AEC-6F6F-4C46-BE0F-79C5BFA470DA--
