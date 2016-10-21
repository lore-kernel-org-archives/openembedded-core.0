Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 72DE171DA4;
	Fri, 21 Oct 2016 17:05:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r16so9111483pfg.3;
	Fri, 21 Oct 2016 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=VPfq3i6SBSpG/APk0ELzLuWDvA9XqPXxbCs4IYLHDhU=;
	b=UnBlki233N8lOoNqO9w5cHY1AabdHFS1PAqaqvQZDBtlp8Cw8J8K0eFOaQBkka72yM
	YquowoYBuvw+Fgd+AxgjuZ46oyREmeI5EM0TI0GE3FJtK1ZwPVa5+9kKbJ9Ez3izRbiv
	L/WDyM90Si0iBCBKaq9bdWxI3w87ss2m9pqyFfPsJZup8Gral85dxdbe8z4fFX65B3Pf
	n5pgC4EwxqkbouoHO2SS6PTd2Iz40JdIgSvExVskH86r+QaEAo7VGQxgRnyyYJn9qEh7
	xHTVM4fPem7d0L6ALviq1cZCam9zauUEyQxUKIioSBP1fwpeWGkjU98rXo74TDLAav6h
	f48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=VPfq3i6SBSpG/APk0ELzLuWDvA9XqPXxbCs4IYLHDhU=;
	b=QN6nu5J6JmuW47DLPD1MQBLS2+lpPOYnyP2QPHRwJNSzvlLdfsF7O0doPpSZOd+US7
	F5kWwc+55N8HZeNBpe75WP6hcnu3RWV+cCIYPrXufNvpOPC989J58VdQEJPZq1cPGsVx
	/s7NpsvZkjAncS/+AQTBxzpobBnXLoATqrd3IjFLyt3ih1Mxb70/du6muwZJuB5Yc0aU
	5ZezhHbnjQerus0rd6bXBn9N/Wbd/NVDPs8kCl3XZU7q3i5XhI8Wa9nIigZbi3hNC55m
	BfoKGuDun9gnof6hVIA5SezCJrF0BcMphd7rJhoJEOfOBXc3TfhOqVHRqj8R4nmjP6GI
	AT9A==
X-Gm-Message-State: ABUngvc6DcAJpdkLKOdZ09NPvcL9imfy5LxfcugjKkpiVU5hIxuSsP2cnsjrpNYIAgKtDA==
X-Received: by 10.98.206.1 with SMTP id y1mr3373021pfg.70.1477069519876;
	Fri, 21 Oct 2016 10:05:19 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id bx5sm6531356pad.6.2016.10.21.10.05.18
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Oct 2016 10:05:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <03b5e98b-0724-daa2-8f78-ab4624f52752@linux.intel.com>
Date: Fri, 21 Oct 2016 10:05:13 -0700
Message-Id: <80B25E1D-5083-4751-BD09-DEB6DBE7FA7F@gmail.com>
References: <03b5e98b-0724-daa2-8f78-ab4624f52752@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Attention all: patches for upstream source will be applied with stricter criteria for context
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
X-List-Received-Date: Fri, 21 Oct 2016 17:05:19 -0000
X-Groupsio-MsgNum: 88495
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1A3F1D3A-449C-400F-ABF9-BCB53103ED0A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1A3F1D3A-449C-400F-ABF9-BCB53103ED0A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 21, 2016, at 5:55 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> Hello all,
>=20
> while updating gnutls to a newer version I came across a rather =
serious issue: the way we patch source code is very lenient about the =
context for the lines to be changed. Basically, it's enough for one line =
before and after the changed line to match, because patch command's =
default setting for 'fuzz factor' allows it. If these lines happen to be =
whitespace or braces, then there's nothing to prevent the patch from =
being applied incorrectly.
>=20
> Here's a particularly nasty example of this happening completely =
silently (compile step works fine too), with security implications:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
>=20
> I think this absolutely needs to be fixed. The downside is that this =
will break a lot of patches across all layers - after setting the fuzz =
to zero in oe-core we have 87 recipes that fail to be patched. Maxin and =
I are currently going through them one by one and getting them fixed.

perhaps a list of the recipes, with steps to configure fuzz factor on =
wiki would enable other folks to
fix them especially the recipe maintainers should care.

>=20
> Regards,
> Alex
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


--Apple-Mail=_1A3F1D3A-449C-400F-ABF9-BCB53103ED0A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgKSs0ACgkQuwUzVZGdMxR+xQCdGaWl9kCDDxDXl8QGOFRMUMKH
p5gAn1mCevm/eb7B1icYwpb4HwMzDJVZ
=H4zG
-----END PGP SIGNATURE-----

--Apple-Mail=_1A3F1D3A-449C-400F-ABF9-BCB53103ED0A--
