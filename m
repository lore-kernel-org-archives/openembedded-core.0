Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1C16162D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:12:37 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id q15so825899ead.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=sBFi2tZvhxX2N67TWMX5/IhvlsS1+wrJlU33uWGWYvU=;
	b=XQyrHstUp6KXUZO7UfgXUIVsDAcc72u1lh80EW50yYRbmd7jh+MbPJXHIZ5hcMcFrm
	BM7j8ia4er5W8C42zipbCJCHGM2Kxh3k3uP3/EnnsdJw0V5fUy51d0aAUHuMEL4wYg7N
	MoOkXUY+doxGvIrWPWb4iAz5VcF/F27UB2f5CbQo8Rvhie2lG7TZwm4m2dfSrHvJItGj
	/VITSr0GD0rpqtezfospGo059ICeqbyffv1CGf0KxvOBX5OjaKy8U83DrfQmlPbyl5nQ
	9CRtl/+qFJtfwjcox9VN3sLTsOqrtU+N72ifOPrLmYwrusSpRnL5UhbRjgMYiZQ4hhja
	3VPQ==
X-Received: by 10.15.32.142 with SMTP id a14mr10782923eev.152.1369944757435;
	Thu, 30 May 2013 13:12:37 -0700 (PDT)
Received: from ?IPv6:2001:610:612::e4ff:bb4b:ff36:f86c?
	([2001:610:612:0:e4ff:bb4b:ff36:f86c])
	by mx.google.com with ESMTPSA id f1sm34365189eem.17.2013.05.30.13.12.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 13:12:36 -0700 (PDT)
References: <3311603.tBhLUzvcSX@helios>
Mime-Version: 1.0 (1.0)
In-Reply-To: <3311603.tBhLUzvcSX@helios>
Message-Id: <34C50232-3B54-4D15-9A33-5B53CC32349D@dominion.thruhere.net>
X-Mailer: iPad Mail (10B329)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 30 May 2013 22:12:34 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnmFQooH/W/gFXU7Jhm4A0PhlOrM6LKGimMD9gXIKYxNPkHiQnZeas2Z8XG0YlKtbCwYxAq
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: libav, ffmpeg, and OE-Core
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
X-List-Received-Date: Thu, 30 May 2013 20:12:38 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 30 mei 2013 om 21:59 heeft Paul Eggleton <paul.eggleton@linux.intel.com> h=
et volgende geschreven:

> Hi all,
>=20
> Video decoding is an important function for a lot of devices. We currently=

> have gst-ffmpeg, which includes the ffmpeg sources, in OE-Core but we don'=
t have
> ffmpeg or libav itself that is a bit more re-usable outside of GStreamer. T=
his
> brings up a few questions:
>=20
> 1) Which is the preferred option for OE; ffmpeg or its "fork" libav? libav=

> seems to be better suited to use as a library but on the other hand ffmpeg=

> isn't exactly dead. Some background:
>=20
> http://aballier.wordpress.com/2013/01/18/ffmpeg-vs-libav-a-distribution-ma=
intainer-point-of-view-almost-two-years-after-the-split/
>=20
> http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html

All the developers I have worked with moved to libav. So from a cross-compil=
e and testing point of view libav is the way to go since the buildsystem per=
son and funky architecture people have moved there. I am very biased on this=
 however :)

> 2) Following on from that, should we pull the preferred library into OE-Co=
re
> and avoid the need for the current bbappend in meta-oe for gst-ffmpeg? (On=
e of
> my personal motivations for sorting this out).

I can't make up my mind on that. On one hand it shouldn't be in oe-core sinc=
e it's just fluff, but on the other hand having libav in oe-core would make a=
 strong case to have everything working with libav and avoid having to have b=
oth ffmpeg and libav recipes.

> This would of course be
> protected by LICENSE_FLAGS as we currently do with gst-ffmpeg.

I guess we'd need to do something similar to the gstreamer proposal: a ton o=
f PACKAGECONFIG options to allow the recipe to drag in meta-multimedia depen=
dencies.

regards,

Koen

>=20
> Thoughts?
>=20
> Cheers,
> Paul
>=20
>=20
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

