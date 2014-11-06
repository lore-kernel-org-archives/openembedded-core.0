Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 198F372072
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 07:48:28 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id h11so641853wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 23:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=OlbWDDKDip5hqJ1dVqbcODSSyUozzaRy8Jd/xKIo9us=;
	b=Ag7V8yrm66b2Cbepnr9YCBdZZuYNYC133AnEP4JvTO54mVVMv+kbbSKtU98a2eklAJ
	vgvr0W4sVbqc0UBpTX8i39RLC7OMvF4iAB5mcGj7+wxymlw2vBmsPGEm4vOBu8G/ESKa
	CWNPrsJ1hG84/yOUyciNS5fNjJBUMRaneIc5plKGr0rK/pP77dTW9aEfM5yT3R8SsSq1
	FybVSLT+X++0Tf/5CTzIW8BdLbKVhdKnkdwDL41HvSDyjyQaKlfbDgC3NjlApKaI+pkV
	0Kt6gm5zhwrmaKihy3sUpN6pFa/ftLsLsSYdC3cfUqCXG6RNdFUTjsdpCu0xdAy6XBno
	9XXg==
X-Gm-Message-State: ALoCoQnMSdW+bxYkgtCaBu1/nG7mhj73mDXfPzOiN1+g/LGg0RwevtCyGDzSSGTzXs1m5ARhk4hN
X-Received: by 10.180.36.205 with SMTP id s13mr37570062wij.11.1415260108851;
	Wed, 05 Nov 2014 23:48:28 -0800 (PST)
Received: from ?IPv6:2001:610:612::c8d2:e185:c3ca:99c7?
	([2001:610:612:0:c8d2:e185:c3ca:99c7])
	by mx.google.com with ESMTPSA id fx2sm6750631wjb.37.2014.11.05.23.48.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Nov 2014 23:48:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
Date: Thu, 6 Nov 2014 08:48:26 +0100
Message-Id: <51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: make /etc/sysctl.conf have real effect
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
X-List-Received-Date: Thu, 06 Nov 2014 07:48:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:

> In systemd, /etc/sysctl.conf is actually ignored by systemd-sysctl,
> because this command only examine *.conf files under a bunch of =
directories
> like /etc/sysctl.d or /usr/lib/sysctl.d.
>=20
> The problem is we are used to configuring kernel parameters in =
/etc/sysctl.conf,
> so it would be really strange if the configuration in that file =
doesn't have any
> effect.
>=20
> This patch reference Fedora's solution to this problem, creating a =
symlink to
> /etc/sysctl.conf under /etc/sysctl.d/.

Shouldn't this be done in procps instead?=

