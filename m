Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC28771C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:36:19 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so24522038pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ug84tfCkh8/uYsBemD1xtd+DGks3auGFT6EORIw174w=;
	b=aao2cs9gZuXTJpJww62RwnCNfZXy6j5/EE90WOAzWxz/3MoE13a2D8s+Q8h8pbV4UU
	ScvErVvqm4gJquiZQFxsEc7UOX8pS+AfV2KW0x0m9OleYh+TKFHA0J8S33blUlIdnBLT
	2KfsS6eblU2q0OJRgv/4/24+TeOak2Mo1GGsm/bVLvC2nYhc2wJErEwPq4H/ElFmkH9S
	m0yIjbEoxsfvbnJATHSMf++rC9D5GwHtQti4VHj7Whc+7uAFAG2+awhJY1zucFjwta+b
	J4DvPVncd9No91+w18sH/BN4AWMK0CQtX1NQ9VFKIzGxue9Kpo+fKuRrqzmCXnia8REo
	7ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ug84tfCkh8/uYsBemD1xtd+DGks3auGFT6EORIw174w=;
	b=YTAJcToanxK6MWFwNVHiAY16S9RMHTLJMvctoVmNTsShe4uBIJ+j1EtX7loe0IrdDU
	yUHB13100STRfM4GNh2Q3Tx7mBBD7hT/ep11LUXRrNWDo9VjWMdGn4lKEtIq2kQXf5DT
	If9q2SOKEhnUYzIMRrH0KJ1dSo19jKJrHdEtiXQ+i4tTQmlJIh00nTq6TXVXSdlF7i88
	pqlQzIGDN0oKh8F5SSpgJzWkpSmTx47guLr1D+RmTblXYx70fON29XPwMzfRzM3qIm9s
	DVvY/5qhcrQVCwez3DPY3mMmRpLzxdnQyvu7UiGN8sK68lm7BR27d2g+I3NkKKiyni5D
	Lwug==
X-Gm-Message-State: AEkoouvaeS3gAQNAG3ryni+k5hN8ttvdzqUwM+6+BrcY1oYaSzyVf9MclSYRftyyu0/3gQ==
X-Received: by 10.66.100.202 with SMTP id fa10mr164874872pab.106.1470692180293;
	Mon, 08 Aug 2016 14:36:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:8833:ac66:d76e:6708?
	([2601:646:8882:b8c:8833:ac66:d76e:6708])
	by smtp.gmail.com with ESMTPSA id
	184sm50368806pfg.20.2016.08.08.14.36.18
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 14:36:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYSyg0E-KpL5v+wVro-5XqC+tMKKQSeAohinxKL+Y6jjg@mail.gmail.com>
Date: Mon, 8 Aug 2016 14:36:49 -0700
Message-Id: <DBE02CDB-30C0-4681-B83A-D98A4EED612D@gmail.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<1468332463-4154-6-git-send-email-maxin.john@intel.com>
	<CAJTo0LZfeU9zAdk2tEF9yxPY-4OZ_3LCH_U7e4ggHh1Q53G+jg@mail.gmail.com>
	<20160803074939.GB12566@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYSyg0E-KpL5v+wVro-5XqC+tMKKQSeAohinxKL+Y6jjg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Mon, 08 Aug 2016 21:36:20 -0000
X-Groupsio-MsgNum: 85518
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4BE5217E-C710-4457-9B54-3A73EB05C0D3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4BE5217E-C710-4457-9B54-3A73EB05C0D3
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F51147CE-B8C4-4E87-BC57-8E2DE669009A"

--Apple-Mail=_F51147CE-B8C4-4E87-BC57-8E2DE669009A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 1:13 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 August 2016 at 08:49, Maxin B. John <maxin.john@intel.com =
<mailto:maxin.john@intel.com>> wrote:
> Haven't tested this because of the specific hardware requirement =
(touchscreen). Since we
> remove the pointercal recipe, I thought it is appropriate to replace =
it.
>=20
> Just had a look and we've finally shed the last pieces of software =
from oe-core that still use tslib.  I propose shunting tslib to meta-oe =
along with the pointercal recipes so the dependencies are still valid.  =
Modern software tends to use the kernel drivers directly, or libinput, =
instead of tslib.
>=20
> (tslib still gets pulled in via the tools-testapps packagegroup, but =
that's something that should be removed from oe-core in the process).
>=20

nod.

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_F51147CE-B8C4-4E87-BC57-8E2DE669009A
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 8, 2016, at 1:13 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 3 August 2016 at 08:49, Maxin B. John <span dir="ltr" class="">&lt;<a href="mailto:maxin.john@intel.com" target="_blank" class="">maxin.john@intel.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1ou" class="a3s aXjCH m1564f619260d8a7c">Haven't tested this because of the specific hardware requirement (touchscreen). Since we<br class="">
remove the pointercal recipe, I thought it is appropriate to replace it.</div></blockquote></div><br class="">Just had a look and we've finally shed the last pieces of software from oe-core that still use tslib.&nbsp; I propose shunting tslib to meta-oe along with the pointercal recipes so the dependencies are still valid.&nbsp; Modern software tends to use the kernel drivers directly, or libinput, instead of tslib.</div><div class="gmail_extra"><br class=""></div><div class="gmail_extra">(tslib still gets pulled in via the tools-testapps packagegroup, but that's something that should be removed from oe-core in the process).</div><div class="gmail_extra"><br class=""></div></div></div></blockquote><div><br class=""></div><div>nod.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra">Ross</div></div>
-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""></body></html>

--Apple-Mail=_F51147CE-B8C4-4E87-BC57-8E2DE669009A--

--Apple-Mail=_4BE5217E-C710-4457-9B54-3A73EB05C0D3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleo+3YACgkQuwUzVZGdMxRsDgCfaklv0Q7FbxPeK2hF7uzWXaFz
vo8An3Oui8BAR6TuZCO1vzjCKFchfvcH
=9hEH
-----END PGP SIGNATURE-----

--Apple-Mail=_4BE5217E-C710-4457-9B54-3A73EB05C0D3--
