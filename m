Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id DA6A86EE0D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 11:29:22 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id e4so458114wiv.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 03:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=VIPIO1Ltzv78krDnItptooy/drRjL13bQQncumeq7ng=;
	b=OOlsaJ72ibiHp7otum8O8lMCVOAe/fatXwj3BJ5Mfu7+lRwFb5D+ZMmPcSnYp79EFH
	kO2gnGzfJwevu2m+wgEgQJVRYDNg+d5i3ZFaLCWI7HidZq1qEawOlhzFdoQ509js8sAy
	zTMdp6eOYqKnSY17a6VUejJYcdKbSFwLBI7dS5SwFRvxkklX6sOxDsuZ7PfXVE1vsW5q
	smxmJXkP/Kgg2BoJlDYNeXo4iQEMRGMQ6/Y/C75IB0GWi6CwQej3EclgDr3i4tpogQBt
	zPnFr1/8YHicQCgV1GBX70yN8Y1H6F6+Vz9+2rAqciUUk2VCWkLmiIg8odU1GPIqDVPp
	UVzQ==
X-Gm-Message-State: ALoCoQmEEWxwCT4LXPPnN5J5mSLUq6uIHCXkrnIeqTzxZO+JO4uqt8PIKpx4+EYEJjAORqf1YnAt
X-Received: by 10.194.59.210 with SMTP id b18mr1633236wjr.60.1392809362994;
	Wed, 19 Feb 2014 03:29:22 -0800 (PST)
Received: from ?IPv6:2001:610:612::cdf4:6708:4555:49cf?
	([2001:610:612:0:cdf4:6708:4555:49cf])
	by mx.google.com with ESMTPSA id p1sm51023880wie.1.2014.02.19.03.29.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 03:29:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1392807290.14081.267.camel@ted>
Date: Wed, 19 Feb 2014 12:32:18 +0100
Message-Id: <B0038D45-06D3-442D-BEB9-84AC354BD631@dominion.thruhere.net>
References: <1392807290.14081.267.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd version - release or git?
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
X-List-Received-Date: Wed, 19 Feb 2014 11:29:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 19 feb. 2014, om 11:54 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> As anyone looking at the autobuidler will know, we've been having a =
lot
> of issues with instability with systemd tests under qemu.

A number of those were (are?) caused by kernel config issues, like =
CONFIG_FHANDLE missing, have those been addressed?=20

> I believe these are real world issues, most likely races in systemd
> itself.
>=20
> The last release of systemd, 208 was five months ago. There have been =
a
> ton of changes since including many bug fixes.
>=20
> Fedora 20 uses systemd 208 (the last release) with 200+ patches on =
top.
>=20
> I'm therefore wondering if we shouldn't bite the bullet and add a git
> recipe rather than trying to patch 208 into some form of life.
>=20
> The proposal is therefore to add a more recent git recipe and make =
that
> the default.
>=20
> I have such a patch in master-next. I've debugged the toolchain =
issues,
> missing kernel config and other issues with systemd master, it always
> now seems to pass the autobuilder tests. I need to check on one
> remaining automated QA test result to ensure its not a regression in
> systemd.
>=20
> Any objections to defaulting to a git version?

In meta-oe we used to build systemd from a git tag instead of tarball =
release and ran into the usual gtk-doc and docbook problems. Can you =
build systemd git without docbook dtds installed on the buildhost?

If the docbook issues have been fixed I have no objection to adding a =
git recipe. I poked Lennart at FOSDEM about v209 and he said they need =
to fix some issues in kdbus and networkd first before making a release, =
"hopefully soon".

Speaking of networkd, any idea if our connman is recent enough to =
support networkd -> connman handover?

regards,

Koen=

