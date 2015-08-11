Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B15D5766E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 23:27:00 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so301004pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 16:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=79qJsqRWBdVsu/39dLSZRw6wXWbxm4F2pNdn+b8xmQg=;
	b=MAfSs+17rKSxWOwziXr3lBAV1Ha9tMyhU/25Vot+s1Em9RUfLyybhlzcSsbR3QGBfb
	Yeuqm8OqOF09+pdpacTPbJR9n7Q9+Ny72oZjKBNBVWVX42tAwGc8d+0zfnAbTMIce0+L
	m9/pjaBGf7+teFK6dxib8lyC2P8ms8PMA+Sx01iSDIXPCE1/bQJ98EGnmW2gfHrCWMl3
	Xr60jHcQmDkirjstLCJRVp3EjimujLvPWa4zpTaUrnJ864WSM+xDImJSgSfBCNV6Prj0
	1isZYdLLqyqDguyuADMvGoLhOd0U6hpnBNmeZGwbefIMwHPJvlyfBOJev6d5ow9fTwUI
	xUeQ==
X-Received: by 10.70.8.97 with SMTP id q1mr61491568pda.31.1439335621132;
	Tue, 11 Aug 2015 16:27:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:157:79f9:ef5c:d3d0?
	([2601:646:8601:4580:157:79f9:ef5c:d3d0])
	by smtp.gmail.com with ESMTPSA id z4sm3989662pdo.88.2015.08.11.16.26.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 16:27:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
Date: Tue, 11 Aug 2015 16:26:49 -0700
Message-Id: <AE4F97E0-42B4-44F7-9C52-9F730E4B50A6@gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 11 Aug 2015 23:27:01 -0000
X-Groupsio-MsgNum: 69319
Content-Type: multipart/signed;
	boundary="Apple-Mail=_324A3329-CFE5-4E42-91A3-85C479CAB79C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_324A3329-CFE5-4E42-91A3-85C479CAB79C
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A6B6C63E-A74F-4876-BC8C-ED6354EFC4F1"

--Apple-Mail=_A6B6C63E-A74F-4876-BC8C-ED6354EFC4F1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 11, 2015, at 1:36 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> can we freeze this thread please.
>=20
> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, =
if someone on this list asks what Poky is, 99% of the time they're =
trolling.  :)

this ml it might be. But I interact with many folks who hear of it for =
first time and in general its quite confusing when you explain this to =
someone new. They get confused when they see yocto 1.8 and then poky =
13.0, bitbake 1.26
and oe-core branched with codenames, poky distro layer is called =
meta-yocto and it also has BSPs in same repo, if you think from their =
POV its very confusing for some one new who is trying to get some =
understanding of this all. may be we can do without some of these now a =
days. but thats discussion for another day :)

>=20
> The original and unanswered question was "should oe-core continue to =
maintain GPLv2 recipes where upstream has moved to GPLv3 or should those =
recipes move to a standalone layer" with various implied questions:
>=20
> - If the v2 recipes move to a separate layer, who own/maintains/tests =
it?

motivated enough to use OE some folks might come up but it won=E2=80=99t =
be same, at this time I know it gets more users for OE may be less =
developers but then look at patches to these components has come from =
users turned developers. We should also look into the case why glibc =
folded the secondary class architectures which were maintained in ports =
repository into glibc proper.

> - Should there be v2 recipes for every recipe that has moved to v3, or =
only (as is now) the "more-core" recipes (currently YP tests that =
core-image-base builds without GPLv3, nothing else more complicated)
> - Should meta-gplv2 only contain recipes from oe-core, or all layers?  =
If other layers decide to hold both v3 and v2 recipes (not that I'm =
aware any have), what makes oe-core special?

These are pertinent questions that I have raised earlier on thread that =
can cause more confusion to end user, but i think if we keep the check =
for choosing GPLv2 only packages in OE-Core and move these recipes to =
something like meta-legacy or something like that and not associate it =
with license name then we don=E2=80=99t have to worry about above =
questions.

>=20
> I'm torn, Richard is torn.  Neither of those are useful to forming a =
decision.  Does anyone else have any *useful* feedback?

however it can be left in there if its not causing a lot of maintenance =
burden since it still serves a purpose downstream.

>=20
> Ross


--Apple-Mail=_A6B6C63E-A74F-4876-BC8C-ED6354EFC4F1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 11, 2015, at 1:36 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 11 August 2015 at 16:46, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1sw" =
class=3D"a3s" style=3D"overflow:hidden">can we freeze this thread =
please.</div></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Or more usefully, reboot it.&nbsp; Philip, you're turning =
into Koen!&nbsp; Alex, if someone on this list asks what Poky is, 99% of =
the time they're trolling. =
&nbsp;:)</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>this ml it might be. But I interact with many =
folks who hear of it for first time and in general its quite confusing =
when you explain this to someone new. They get confused when they see =
yocto 1.8 and then poky 13.0, bitbake 1.26</div><div>and oe-core =
branched with codenames, poky distro layer is called meta-yocto and it =
also has BSPs in same repo, if you think from their POV its very =
confusing for some one new who is trying to get some understanding of =
this all. may be we can do without some of these now a days. but thats =
discussion for another day :)</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><div class=3D"">The original and unanswered question =
was "should oe-core continue to maintain GPLv2 recipes where upstream =
has moved to GPLv3 or should those recipes move to a standalone layer" =
with various implied questions:</div><div class=3D""><br =
class=3D""></div><div class=3D"">- If the v2 recipes move to a separate =
layer, who own/maintains/tests =
it?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>motivated enough to use OE some folks might come =
up but it won=E2=80=99t be same, at this time I know it gets more users =
for OE may be less developers but then look at patches to these =
components has come from users turned developers. We should also look =
into the case why glibc folded the secondary class architectures which =
were maintained in ports repository into glibc proper.</div><div><br =
class=3D""></div><blockquote type=3D"cite" class=3D""><div class=3D""><div=
 dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D"">- Should there be v2 recipes for =
every recipe that has moved to v3, or only (as is now) the "more-core" =
recipes (currently YP tests that core-image-base builds without GPLv3, =
nothing else more complicated)</div><div class=3D"">- Should meta-gplv2 =
only contain recipes from oe-core, or all layers?&nbsp; If other layers =
decide to hold both v3 and v2 recipes (not that I'm aware any have), =
what makes oe-core =
special?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>These are pertinent questions that I have raised =
earlier on thread that can cause more confusion to end user, but i think =
if we keep the check for choosing GPLv2 only packages in OE-Core and =
move these recipes to something like meta-legacy or something like that =
and not associate it with license name then we don=E2=80=99t have to =
worry about above questions.</div><div><br class=3D""></div><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><div class=3D"">I'm torn, Richard is torn.&nbsp; =
Neither of those are useful to forming a decision.&nbsp; Does anyone =
else have any *useful* =
feedback?</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>however it can be left in there if its not causing =
a lot of maintenance burden since it still serves a purpose =
downstream.&nbsp;</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><div class=3D"">Ross</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_A6B6C63E-A74F-4876-BC8C-ED6354EFC4F1--

--Apple-Mail=_324A3329-CFE5-4E42-91A3-85C479CAB79C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKhMMACgkQuwUzVZGdMxTZaACghtFxRK743IvDKxBsU+jcd+8N
CuQAnRQaSzeR3lFdOv5hKwLdrnhIb1w+
=P4dS
-----END PGP SIGNATURE-----

--Apple-Mail=_324A3329-CFE5-4E42-91A3-85C479CAB79C--
