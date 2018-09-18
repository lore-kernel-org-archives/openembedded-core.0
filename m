Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD57745FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:22:42 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q8-v6so3041809wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=F+phnYv3BHlFCH6MQb9mu2yglmlSq4qduEopLqdP7/E=;
	b=ka1A6fGPLszVtu45iAhY8sSmRArGQCxsJyNbMMCcVbzmEZ7PyaBAJjBydXtCuT8xfF
	JvN/I6srbfiIop89x+XXe0VvxQuZDlFHSfOdorNF151dvuvvvLGMv5HvnYfIszeJmQFQ
	hv3bECWBkf4Ymvx8RqElveYFjXqjrTVi7AqHy0sw4qsHTenW7HrbtdBiSSDvFVnqWS+i
	Ds6VoPEKFI5JIb5oojQmYAXIXPxvXGuuBBEhUNOFrIHpxIKh7UbcNzVF+dEIMS5aTGb0
	DpfhPMsYfWQ85yT+TKdCHPNH1i4KZJ8BtrK5Gj8Hylp9IHA+RmVZsJ+0X+iWGhxMjxPP
	FF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=F+phnYv3BHlFCH6MQb9mu2yglmlSq4qduEopLqdP7/E=;
	b=o8tOjOgb/U04NllMlMYiE0NSjyD6BPQyFFACqn+Vj5lpDlba0Zzfj9NuhhCyXSXh+X
	5Tq4bLrmxvu48trJpGHd+pTr28Yn+iVDWIKl2z2bm+/8DuCLzCRTxA0S+U1j1zL3dzYQ
	BjEml4y3WNzUobDU+obOn37kcPrjm78ns2W2DQ7ZkY+SqTRbcGOUzwgddk6cZ9OBhAf2
	eUCiQxyXAou80e4IJiWDcMiARtbCYwO8wVbbBYZG8boMeX62i1VC3SuxrLiyMEB3bJ75
	AaOvlv5IIUGZLFt+8CXYddVawO28/bk3XpLfxPYjyHqHEOKeiY+ueVvvbCrTVe15I5/P
	5+ew==
X-Gm-Message-State: APzg51ABXjzQzv51xqryyJn1SmnoQ8bwmcuDyTldftwkADmcNrvUEdJk
	JZC+CukIfiKTAg3rTHA4HZkH8U/W
X-Google-Smtp-Source: ANB0VdaVM1eJ0090LILOp1zUoK9Z6ouc1v0qWHtGwnFHS0j7VeBHHPydKcprQM7Caa1hV2w2wQqOTA==
X-Received: by 2002:a1c:2dc8:: with SMTP id
	t191-v6mr16288544wmt.94.1537280563541; 
	Tue, 18 Sep 2018 07:22:43 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	z11-v6sm20026709wrm.94.2018.09.18.07.22.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Sep 2018 07:22:42 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <857A2B10-9583-4449-A252-29F4D3C29DA2@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 18 Sep 2018 16:22:38 +0200
In-Reply-To: <20180917190314.13844.30776@do.openembedded.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <20180917184949.22961-1-sno@netbsd.org>
	<20180917190314.13844.30776@do.openembedded.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjN7LC1uYXRpdmV9OiB1cGRhdGUgdG8gMy43LjAgKHJldjMp?=
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
X-List-Received-Date: Tue, 18 Sep 2018 14:22:43 -0000
X-Groupsio-MsgNum: 116402
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C32328DE-533B-41A6-A8CB-BC90D0596AB5";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_C32328DE-533B-41A6-A8CB-BC90D0596AB5
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1921F17E-96E2-4A63-BEF6-068D185206BD"

--Apple-Mail=_1921F17E-96E2-4A63-BEF6-068D185206BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 17.09.2018 um 21:03 schrieb Patchwork =
<patchwork@patchwork.openembedded.org>:
>=20
> =3D=3D Series Details =3D=3D
>=20
> Series: python3{,-native}: update to 3.7.0 (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/13851/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
>=20
> Thank you for submitting this patch series to OpenEmbedded Core. This =
is
> an automated response. Several tests have been executed on the =
proposed
> series by patchtest resulting in the following failures:
>=20
>=20
>=20
> * Issue             Added patch file is missing Upstream-Status in the =
header [test_upstream_status_presence_format]
>  Suggested fix    Add Upstream-Status: <Valid status> to the header of =
meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
>  Standard format  Upstream-Status: <Valid status>
>  Valid status     Pending, Accepted, Backport, Denied, Inappropriate =
[reason], Submitted [where]
>=20
>=20
>=20
> If you believe any of these test results are incorrect, please reply =
to the
> mailing list (openembedded-core@lists.openembedded.org) raising your =
concerns.
> Otherwise we would appreciate you correcting the issues and submitting =
a new
> version of the patchset if applicable. Please ensure you add/increment =
the
> version number when sending the new version (i.e. [PATCH] -> [PATCH =
v2] ->
> [PATCH v3] -> ...).
>=20
> ---
> Guidelines:     =
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe =
<http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe>


I understand this policy. I have an issue wrt. this particular one.
Why? Well - the patch seems to be reasonable submitted to upstream, =
since it's a
quirk and likely an error. OTOH - supporting Yocto and OpenEmbedded in =
getting
software up-to-date is one thing - having my name in the Python =
contributors is
something complete different.

Please find someone else doing that.

Thanks in advance,
Jens
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_1921F17E-96E2-4A63-BEF6-068D185206BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 17.09.2018 um 21:03 schrieb Patchwork &lt;<a =
href=3D"mailto:patchwork@patchwork.openembedded.org" =
class=3D"">patchwork@patchwork.openembedded.org</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">=3D=3D=
 Series Details =3D=3D<br class=3D""><br class=3D"">Series: =
python3{,-native}: update to 3.7.0 (rev3)<br class=3D"">Revision: 3<br =
class=3D"">URL &nbsp;&nbsp;: <a =
href=3D"https://patchwork.openembedded.org/series/13851/" =
class=3D"">https://patchwork.openembedded.org/series/13851/</a><br =
class=3D"">State : failure<br class=3D""><br class=3D"">=3D=3D Summary =
=3D=3D<br class=3D""><br class=3D""><br class=3D"">Thank you for =
submitting this patch series to OpenEmbedded Core. This is<br =
class=3D"">an automated response. Several tests have been executed on =
the proposed<br class=3D"">series by patchtest resulting in the =
following failures:<br class=3D""><br class=3D""><br class=3D""><br =
class=3D"">* Issue =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ad=
ded patch file is missing Upstream-Status in the header =
[test_upstream_status_presence_format] <br class=3D""> &nbsp;Suggested =
fix &nbsp;&nbsp;&nbsp;Add Upstream-Status: &lt;Valid status&gt; to the =
header of =
meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch<br =
class=3D""> &nbsp;Standard format &nbsp;Upstream-Status: &lt;Valid =
status&gt;<br class=3D""> &nbsp;Valid status =
&nbsp;&nbsp;&nbsp;&nbsp;Pending, Accepted, Backport, Denied, =
Inappropriate [reason], Submitted [where]<br class=3D""><br class=3D""><br=
 class=3D""><br class=3D"">If you believe any of these test results are =
incorrect, please reply to the<br class=3D"">mailing list (<a =
href=3D"mailto:openembedded-core@lists.openembedded.org" =
class=3D"">openembedded-core@lists.openembedded.org</a>) raising your =
concerns.<br class=3D"">Otherwise we would appreciate you correcting the =
issues and submitting a new<br class=3D"">version of the patchset if =
applicable. Please ensure you add/increment the<br class=3D"">version =
number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;<br class=3D"">[PATCH v3] -&gt; ...).<br class=3D""><br =
class=3D"">---<br class=3D"">Guidelines: &nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines"=
 =
class=3D"">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelin=
es</a><br class=3D"">Test framework: <a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patchtest" =
class=3D"">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a><br =
class=3D"">Test suite: &nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe" =
class=3D"">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a><br =
class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">I understand this policy. I have an =
issue wrt. this particular one.</div><div class=3D"">Why? Well - the =
patch seems to be reasonable submitted to upstream, since it's =
a</div><div class=3D"">quirk and likely an error. OTOH - supporting =
Yocto and OpenEmbedded in getting</div><div class=3D"">software =
up-to-date is one thing - having my name in the Python contributors =
is</div><div class=3D"">something complete different.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Please find someone else =
doing that.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks in advance,</div><div class=3D"">Jens</div><div =
class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_1921F17E-96E2-4A63-BEF6-068D185206BD--

--Apple-Mail=_C32328DE-533B-41A6-A8CB-BC90D0596AB5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluhCi4ACgkQRJmWrtzl
Cp3HNg//b0oJz3D5xFZr0UR0WSV/Bmk9lZpxd4ltCT/+haPIijofFE4MKBMB00zg
Ym+/xniymzOsq+mMK1gTM5wwT/BUgaHWDjXRxEHA5/7E3uxCpMgLGxojchkObSFf
ir9tUQ7R7qlJpRVzQUZSYLbdvayiuOdp24IWqZdCDO762otje+ljvyc2zCnCDls9
YOztaAsh/9Sij5xZwlYGtq6Jh8xaUeEMu8wUl/+FsmJtlovmEvHNCNidLzz5y+ME
XW3pXPyYB/cVzYv5CKYra9DFI5728RBfZZ0MysjUURK3vMLU22+d8mpdWEiqxREm
tgJGVpCtobylYilQir7I6jPmCkbjFllz+ZkD4p0z7LDrqKY0BQ+O0IujBsi8CaC/
L8s9NvTxxKhbEWUF6oAR6um0XIzFDB7Ji9id+QuZS6Jfmjf/Xj+pJbiW+RTy5L7M
woURaOwuWJygSp+uS0qWySTizSj5wgNIXSjWCfpQkyW9Oj54OuKHxO6KThTPOMXf
CwCmLRTW4w/1eTQfOkCEv+OqUOKSFK0tTzC5yrD525DKxL7MTuXygBbwgSOTkJf/
XnSi6RYN31Hs/tjjRi6wuxuLEE3H7tXbveCQYCXS3600G7LmHBhEtX5cPZ8upTHp
meIulFvSwN9owjtGr2XgGeyOH22LZbB1ZH+qAvdQtW7N5vKjMCc=
=hxiy
-----END PGP SIGNATURE-----

--Apple-Mail=_C32328DE-533B-41A6-A8CB-BC90D0596AB5--
