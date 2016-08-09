Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F714771DA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:48:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i6so25996861pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 18:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=CjgF+7nYPWA6QV79bBiHPDhOw2YUyjeOH0jqnv1Skw8=;
	b=hYzxo12UHjfB3ALg+5gYPsY4uDTtUAgV9OQR9oNkjj1DktkRFOH/P2R8CD70r9k07f
	uYtIxbHE0QJn4BCnMdpQFOVYZgiqL6qJpHaN5jIDsRne7nWAhwc0LJVtGw4Sn6+1RYMH
	RV6RfRW8JcIw5xziqssq/rBGvsE3UvKBdNVCYopRCCCFw8XNxBcZ0N+33E085mndvrx2
	witLZdrdVgvpaVzvM942Wh26EY7J2o/E72ZrLw8oj4AsFpy77XPIfIIV+JHwiUrW+BeI
	3UmcIeV0OcdHrffXsgq+E93WQNwDJ9rGZgzqFpGhbXXUx16t76m8Ohy9S42tnpNo43Jx
	kWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CjgF+7nYPWA6QV79bBiHPDhOw2YUyjeOH0jqnv1Skw8=;
	b=XfJGZXxvWkf2pOHEt+4tbatQ6RYY+yO44JAFYjox3nohexUWTvLgMrZGxDwdH1TlDA
	RpmidUxOBgYeh5VpEkRI7F+mUzcYKiRrdMYI46PrhQWIpUxqg6reRwwkLxTd/VHX8Esq
	T/WmmTzn7WJ0CIXnjHNOmYszLzDYqxXn1xvkdnlJzGUNn/8CChuwtyaHyQ5PEeBei+4c
	fCjiqX95BG7g8KOMRhOVAjhq3UeXVtytqY0V9BkTjPKPNRlhej9LLH+wegd7xELuZDvq
	/9qiFQmZ0dg32cR3Ki+4+BvwMXHAYXh7BcEhnq+ZDlPCWXSVKkF31Au/TGtJ2iilj4kP
	uJxw==
X-Gm-Message-State: AEkooutc0vFOW4Q70g+7xijvu/Q6tjIX9uG/AAQ4lqnYVOnYo64J1/NDicY2sPBOlcRyoA==
X-Received: by 10.98.36.15 with SMTP id r15mr168661596pfj.1.1470707293348;
	Mon, 08 Aug 2016 18:48:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:b0d5:2987:dae1:5cd8?
	([2601:646:8882:b8c:b0d5:2987:dae1:5cd8])
	by smtp.gmail.com with ESMTPSA id
	n10sm20583721pap.16.2016.08.08.18.48.12
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 18:48:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYGGyd20Whnox1TCcrROVx24YybiGWkVaS+JX4U+hxiiQ@mail.gmail.com>
Date: Mon, 8 Aug 2016 18:48:43 -0700
Message-Id: <FFE62A6A-2AB5-4F99-BD19-0BD85BB048A2@gmail.com>
References: <20160808225101.32385-1-raj.khem@gmail.com>
	<20160808225101.32385-2-raj.khem@gmail.com>
	<CAJTo0LYGGyd20Whnox1TCcrROVx24YybiGWkVaS+JX4U+hxiiQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libunwind: Do not use gold for linking
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
X-List-Received-Date: Tue, 09 Aug 2016 01:48:13 -0000
X-Groupsio-MsgNum: 85532
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4A58C7B5-72EB-40E9-87BE-B9565DDC91C5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4A58C7B5-72EB-40E9-87BE-B9565DDC91C5
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2B720459-33A8-4FD1-B8C9-9327AD452F7A"

--Apple-Mail=_2B720459-33A8-4FD1-B8C9-9327AD452F7A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 4:25 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 8 August 2016 at 23:51, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> This effectively reverts the commit
> 3dd233ac0c80393824100c54bb525236f8290fd2
>=20
> gold now emits errors on copy relocs against
> protected symbols what ld.bfd did in past, however
> it seems its too conservative.
>=20
> This does not fix the case for folks who
> use gold as default linker, however it
> does make bintuls 2.27 work with default
> configuration of OE
>=20
> Presumably this is blocked by the binutils upgrade and should be =
merged with it and not beforehand?

Thats right.

>=20
> Ross


--Apple-Mail=_2B720459-33A8-4FD1-B8C9-9327AD452F7A
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 8, 2016, at 4:25 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 8 August 2016 at 23:51, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1bm" class="a3s aXjCH m1566c5a9a87d5cea">This effectively reverts the commit<br class="">
3dd233ac0c80393824100c54bb5252<wbr class="">36f8290fd2<br class="">
<br class="">
gold now emits errors on copy relocs against<br class="">
protected symbols what ld.bfd did in past, however<br class="">
it seems its too conservative.<br class="">
<br class="">
This does not fix the case for folks who<br class="">
use gold as default linker, however it<br class="">
does make bintuls 2.27 work with default<br class="">
configuration of OE</div></blockquote></div><br class="">Presumably this is blocked by the binutils upgrade and should be merged with it and not beforehand?</div></div></div></blockquote><div><br class=""></div><div>Thats right.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_2B720459-33A8-4FD1-B8C9-9327AD452F7A--

--Apple-Mail=_4A58C7B5-72EB-40E9-87BE-B9565DDC91C5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlepNoEACgkQuwUzVZGdMxQZ8gCfQRFoUkgCkPtmjP2LlCksRPUC
M84AnRkzj9rMDK68IrPAx2SlAxlvqWfO
=LB3g
-----END PGP SIGNATURE-----

--Apple-Mail=_4A58C7B5-72EB-40E9-87BE-B9565DDC91C5--
