Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1D0601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 07:57:13 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so19236346wgg.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 23:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3CFZm87zBpdt4Pql5K0zn6+PBkXbLE97ZVpsRQ7LiPU=;
	b=bQjdN/QAAhSrh2oBLAiyr1eyPtiglGXHOkYZD3mWFTow+T8sP83iafi482wRqn+c74
	eW1CO5Z4lcOsjWFfOd9Zjb5bAsZcTvyETLYgc43WuV3CxNgQYsRlSD1DecPb57XfP0P/
	+1+bgifZsFPDh75wCY2haxUatVJeYBo/9i9NEH+yWp8015yOF2Y3CEjL/KQ+4/c1k4xC
	DP1vsSXbT/DxFj5DzuSGJpZgyZSiS1CY8xXiJ1ifSTLj8xUSWp/vX7Kkchj1nYB7dm15
	eRPS9V+7Z+b2uZXUq5b9r36+x5+QDQnQBAbnitu9DCwNya4z1vCLVvnD+fNFXkOU8f1B
	JJfg==
X-Gm-Message-State: ALoCoQk/mo0/INIaG8CXPh/5Exp1OW4nQlX+TYjKiL2ozcpqYukCw/UfpJuJGNlfMgIoqk4Xz8kk
X-Received: by 10.180.72.199 with SMTP id f7mr100463148wiv.53.1417593433621;
	Tue, 02 Dec 2014 23:57:13 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id jp3sm49641434wid.9.2014.12.02.23.57.11
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Dec 2014 23:57:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
Date: Wed, 3 Dec 2014 08:57:10 +0100
Message-Id: <29CAEA25-9585-4F74-A429-27818EDC8B55@dominion.thruhere.net>
References: <cover.1417535164.git.ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4][RFC] Change libexecdir to ${prefix}/libexec
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
X-List-Received-Date: Wed, 03 Dec 2014 07:57:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 2 dec. 2014, om 16:53 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:
>=20
> Hi,
>=20
> First, this is VERY MUCH A RFC!
>=20
> There's numerous problems with setting ${libexecdir} to =
${libdir}/${BPN}, but
> the a easy argument in my opinion is that nobody else does this.
>=20
> The Debian world sets libexecdir to ${exec_prefix}/lib, and the Red =
Hat world
> uses ${exec_prefix}/libexec.  The FHS says either are fine.  Nobody =
puts the
> package name into the definition of libexecdir, as automake provides
> pkglibexecdir ($libexec/$package) for package-specific binaries.
>=20
> This branch changes bitbake.conf to use ${exec_prefix}/libexec and a =
few patches
> to fix (or hack around) any problems this has revealed so far.
>=20
> Comments and testing (especially with other layers, and multilib =
configurations)
> much appreciated.

In the past I've patched things like gdm to look in ${libdir}/${BPN} for =
helper binaries (which are from a different recipe), so not only recipes =
need to be inspected, but patches as well.

regards,

Koen=

