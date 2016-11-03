Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id F3239719D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:27:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a136so5654865pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=6wWq9vZs4jdTtHOp/G65pYJjqjFtnPUxXLoRAP8yp6g=;
	b=zwOlP/QlsKO33ai2rPDDn7cZ1TpSS3Bss9br8CukIeKT8ZC7QfHbwY3MlwrckLSTtK
	tNlmXdJ/lewYyILaQrQT5PDPgXr7LVYqTD6C0v496czCYCfBvTSsClakEBQUsi2pgpyF
	SrCZ4jsZlktDAJU35ASs9B4vnr0p3cxOxBzoIp5amqp56MipBLk9nniH871FS2gmqCgy
	U6muGhXzwbazFel0tEN6IuNx3HU3CWBEJ8fa1AfP2uWor+reLXZrNXm+za4VBHDU0K93
	GXgOT+BqS4zVBI1/PAmLyXyYuYbPI66oSi0Mpo8hyPVvT5wJjKH5zQl2NcJ/7o/QwT+B
	bDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6wWq9vZs4jdTtHOp/G65pYJjqjFtnPUxXLoRAP8yp6g=;
	b=Sv30YWQkUZIF+rTV4BcBgkLuAOcWOeHS8nYs/T6B1oCIdXKcV4MQX66gpLdxfwCxDG
	lsPcGKMfM+JZDfSdbrvsDYL9G5ZZ9GOC2q4pPPwasT0vRjkZveA8UX79+0Rg23hiZn3E
	tj1srf543ihrlqvuOeZhMt8IA0folW0/rXw8sVqK/nH+4WMdo8wG03PZGswsZYGZYk7Q
	CgHIXpbmJSs/CdCgUjpcguicou9inJw6dO7kAZ8yv3623QJ6+KrfpG0mHZgumMgfuWsC
	+esC2K9D6/JCc0+5ouq0FPlE0qZVSu+fIZ9q7u0nb6X6LWlEB9Xe9W6zjCVozmx3btt5
	2U1w==
X-Gm-Message-State: ABUngvcABDSxgAYWlBBGaXX5kHpbkvXTlI7MCB6jScVgjWEHeIFFlXXqzB+Do7U6Kdfqew==
X-Received: by 10.99.125.14 with SMTP id y14mr16308150pgc.163.1478201276065;
	Thu, 03 Nov 2016 12:27:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:a08a:c533:b969:820?
	([2601:646:8882:b8c:a08a:c533:b969:820])
	by smtp.gmail.com with ESMTPSA id
	z9sm14568713pfd.29.2016.11.03.12.27.55
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 12:27:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
Date: Thu, 3 Nov 2016 12:27:50 -0700
Message-Id: <7911D314-6608-4EF6-87B2-1D0D5EB31963@gmail.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
X-Mailer: Apple Mail (2.3124)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 19:27:55 -0000
X-Groupsio-MsgNum: 88985
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1065179A-3C45-4FA2-8182-74916E5E3453";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1065179A-3C45-4FA2-8182-74916E5E3453
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4E2F2663-3E4D-4DAD-927C-061AF33B266D"

--Apple-Mail=_4E2F2663-3E4D-4DAD-927C-061AF33B266D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 3, 2016, at 9:29 AM, Christopher Larson <clarson@kergoth.com> =
wrote:
>=20
>=20
> On Thu, Nov 3, 2016 at 9:01 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com =
<mailto:alexander.kanavin@linux.intel.com>> wrote:
> it would be very useful if devtool offered support for rebasing source =
patches when they fail to apply, but currently there does not seem to be =
any such feature:
>=20
> ak@kanavin-desktop:~/development/poky/build$ devtool modify libksba
> Parsing recipes..done.
> NOTE: Fetching libksba...
> NOTE: Unpacking...
> NOTE: Patching...
> ERROR: Applying 'ksba-add-pkgconfig-support.pa =
<http://ksba-add-pkgconfig-support.pa/>tch' failed:
> checking file Makefile.am
> Hunk #1 FAILED at 21.
> 1 out of 1 hunk FAILED
> checking file configure.ac <http://configure.ac/>
> Hunk #1 succeeded at 414 (offset 14 lines).
> checking file ksba.pc.in <http://ksba.pc.in/>
> checking file src/ksba.m4
> ERROR: Function failed: patch_do_patch
> ak@kanavin-desktop:~/development/poky/build$
>=20
> What devtool could do here is apply the patches that can be applied =
and then partially apply the patches that fail. Then give the developer =
some kind of UI for dealing with the rejected hunks (which typically =
means finding the place in the target file where the changes should go =
and then manually editing them in, while looking at the original patch).
>=20
> Without this feature devtool is half as useful as it could be =
particularly for recipe version updates.
>=20
> That would be useful, indeed.
>=20
> git already provides such a UI, afaik devtool just needs to use git-am =
to apply the patches, ideally passing -3 to it, and let the user use git =
am to resolve and continue applying patches.

this seems good. Although, I have seen that all patches are not git am =
applicable, then I use git apply, something even that does not work, =
then third option is
to use patch  < patch and this works if it does not work then patch =
needs manual work.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4E2F2663-3E4D-4DAD-927C-061AF33B266D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 3, 2016, at 9:29 AM, Christopher Larson &lt;<a =
href=3D"mailto:clarson@kergoth.com" class=3D"">clarson@kergoth.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On Thu, Nov 3, 2016 at 9:01 AM, Alexander Kanavin =
<span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank" =
class=3D"">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":kb" =
class=3D"a3s aXjCH m1582afc939339589">it would be very useful if devtool =
offered support for rebasing source patches when they fail to apply, but =
currently there does not seem to be any such feature:<br class=3D"">
<br class=3D"">
ak@kanavin-desktop:~/developme<wbr class=3D"">nt/poky/build$ devtool =
modify libksba<br class=3D"">
Parsing recipes..done.<br class=3D"">
NOTE: Fetching libksba...<br class=3D"">
NOTE: Unpacking...<br class=3D"">
NOTE: Patching...<br class=3D"">
ERROR: Applying '<a href=3D"http://ksba-add-pkgconfig-support.pa/" =
class=3D"">ksba-add-pkgconfig-support.pa</a><wbr class=3D"">tch' =
failed:<br class=3D"">
checking file Makefile.am<br class=3D"">
Hunk #1 FAILED at 21.<br class=3D"">
1 out of 1 hunk FAILED<br class=3D"">
checking file <a href=3D"http://configure.ac/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">configure.ac</a><br class=3D"">
Hunk #1 succeeded at 414 (offset 14 lines).<br class=3D"">
checking file <a href=3D"http://ksba.pc.in/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">ksba.pc.in</a><br class=3D"">
checking file src/ksba.m4<br class=3D"">
ERROR: Function failed: patch_do_patch<br class=3D"">
ak@kanavin-desktop:~/developme<wbr class=3D"">nt/poky/build$<br =
class=3D"">
<br class=3D"">
What devtool could do here is apply the patches that can be applied and =
then partially apply the patches that fail. Then give the developer some =
kind of UI for dealing with the rejected hunks (which typically means =
finding the place in the target file where the changes should go and =
then manually editing them in, while looking at the original patch).<br =
class=3D"">
<br class=3D"">
Without this feature devtool is half as useful as it could be =
particularly for recipe version updates.</div></blockquote></div><div =
class=3D"gmail_extra"><br class=3D""></div>That would be useful, =
indeed.</div><div class=3D"gmail_extra"><br class=3D"">git already =
provides such a UI, afaik devtool just needs to use git-am to apply the =
patches, ideally passing -3 to it, and let the user use git am to =
resolve and continue applying patches.<br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>this seems good. Although, I have seen that all =
patches are not git am applicable, then I use git apply, something even =
that does not work, then third option is</div><div>to use patch =
&nbsp;&lt; patch and this works if it does not work then patch needs =
manual work.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div=
 class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra">-- =
<br class=3D""><div class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">Christopher Larson<br =
class=3D"">clarson at kergoth dot com<br class=3D"">Founder - BitBake, =
OpenEmbedded, OpenZaurus<br class=3D"">Maintainer - Tslib<br =
class=3D"">Senior Software Engineer, Mentor Graphics</div>
</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_4E2F2663-3E4D-4DAD-927C-061AF33B266D--

--Apple-Mail=_1065179A-3C45-4FA2-8182-74916E5E3453
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgbj7oACgkQuwUzVZGdMxQuGQCfQrgavFnurhN/P4Xj9BCMovQs
DUAAn36JDul1Y4FwDTNX0kjbsqiPQJjh
=l+yl
-----END PGP SIGNATURE-----

--Apple-Mail=_1065179A-3C45-4FA2-8182-74916E5E3453--
