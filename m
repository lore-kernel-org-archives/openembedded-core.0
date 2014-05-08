Return-Path: <koen@dominion.thruhere.net>
X-Greylist: delayed 1342 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 15:32:35 UTC
Received: from mail-wi0-f175.google.com (unknown [209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8000E6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:32:35 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id f8so7253558wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 08:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=RA9XKDuN8W2khJPZ1rmCVCZ9BM7OLe3sU+T7+hS5hZQ=;
	b=FeGJxuvI0PUDSMrgKvbUJM/RLyfWQAmHo1ORfWRC/stB/Xhh9CwaH60v0I89Jkaark
	J8JW54Muxb8Wx5+ZNaqZsCbpXbScX8FiUpX9hbe06FrAD/tr0zStBfJBiKNboORMi4JE
	2TwaHA/huGlyWUA8Qjt1IiTqmDQR36uuRiBgjPtplIQ6pOyjFhIwrsmITav5vHSibTMv
	mSxVfkyvd4nxav6uQ2vbI1quAYvv+tTY/x3SD97vZD7s0/CdOSy2svQfSEMuJTkdAmm7
	YGxqcvzsTclIC+MLOYZrRX1l1IjpYUEHhIbEAZmsIcnJde8D5fIYpZR+iHoI3VXn7OqT
	xeOg==
X-Gm-Message-State: ALoCoQkauLMHsjGR8x6q3gxb29ziQVzE60nZq15yPZb22BWmyMqOOpGCMVfvQy1ftLoK1zgVMh9u
X-Received: by 10.194.171.167 with SMTP id av7mr3706464wjc.32.1399561357569;
	Thu, 08 May 2014 08:02:37 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d57a:d7dd:850d:82ea?
	([2001:610:612:0:d57a:d7dd:850d:82ea])
	by mx.google.com with ESMTPSA id km2sm1626372wjb.13.2014.05.08.08.02.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 May 2014 08:02:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
Date: Thu, 8 May 2014 17:02:33 +0200
Message-Id: <A31D944B-B8FC-4ABC-A4EF-1450A2E9D117@dominion.thruhere.net>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:32:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mei 2014, om 16:48 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> Hi all,
>=20
> Sorry for the cross-post but I want this to have a wide audience.
>=20
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.
>=20
> Everyone in agreement? =20

A plus one from me.

> Should I expect any hate mail over this?

This is the internet, of course you'll get hate mail :/=

