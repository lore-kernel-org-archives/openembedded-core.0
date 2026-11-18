Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12096.1795007299909912969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 05:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=Y77Wz3zu;
 spf=pass (domain: geanix.com, ip: 185.70.43.23, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795007297; x=1795266497;
	bh=MGewBq9VM+VrWczogOu9ipQ5uJjsbgkxN1TYHNkKxM4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y77Wz3zu2VTt0abwYC+mYaDApjxuYkPlCDZvWLX0h0sFkWsC4GZ+ZtYUC85SSyVAT
	 IRzTcNt0sL70bU8LcXicm4IZ73bMynR4wv2RvCfNsmXWZqM6Ig4hRXcS9qZxbeFcgc
	 vB1eHgB0Zg/8UuDg2HbbLbEaHvUjSZblKrc+2drlbYhl/9cT2jAa09O/CnyAYUgn3I
	 cWRMt38F60tT03NLhJjBjkYezgp704WtT9NmO3NZ4oSB/DUeNAr6xFtLZpABiYMNnr
	 EOp9V6vltzdBESC8P/SWv//7t1MFuOUZ8Uhyv2seR38AAB1BwF0MadsAA/GKIMLpQD
	 w2JRBGXxDGLlg==
Date: Wed, 18 Nov 2026 13:08:11 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/3] oeqa/selftest/incompatible_lic: build the SDK in NoGPL3 core-image-minimal test
Message-ID: <13017DE2-343E-42DD-9DA3-81479674F9FD@geanix.com>
In-Reply-To: <CANNYZj8S=HnSE8UN8hpVF4OfNQaaXu3W8MCaJCGjujfAJbOsvA@mail.gmail.com>
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-4-sean@geanix.com> <CANNYZj8S=HnSE8UN8hpVF4OfNQaaXu3W8MCaJCGjujfAJbOsvA@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: b28b03849bec9fa7aa54b07ed700417ac381e255
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 13:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250548



> On 17 Nov 2026, at 18.31, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Tue, 17 Nov 2026 at 13:02, Sean Nyekjaer via openembedded-core <sean=
=3Dgeanix.com@lists.openembedded.org> wrote:
> +ERROR_QA:remove:pn-core-image-minimal =3D "license-exception"
>=20
> Why is this added? I thought the point of the patchset is actually fix th=
e error, so the test should ensure it does not occur?

To avoid the QA error when using INCOMPATIBLE_LICENSE_EXCEPTIONS.

ERROR: core-image-minimal-1.0-r0 do_populate_sdk: QA Issue: Including gcc-r=
untime-dbg with incompatible license(s) GPL-3.0-or-later WITH GCC-exception=
-3.1 into the image, because it has been allowed by exception list. [licens=
e-exception]

Just like next test test_core_image_full_cmdline_weston()

/Sean


