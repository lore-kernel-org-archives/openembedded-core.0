Return-Path: <tomas@novotny.cz>
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id 45DCC719A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 17:27:09 +0000 (UTC)
Received: from tomas.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id AD974101F08;
	Tue, 22 Nov 2016 18:27:08 +0100 (CET)
Date: Tue, 22 Nov 2016 18:27:07 +0100
From: Tomas Novotny <tomas@novotny.cz>
To: Daniel =?UTF-8?B?RMOtYXo=?= <daniel.diaz@linaro.org>
Message-ID: <20161122182707.2736c1a7@tomas.local.tbs-biometrics.cz>
In-Reply-To: <f03bba38-3ac8-ee96-b272-4db2ccdae28e@linaro.org>
References: <20161118191252.43d474b6@tomas.local.tbs-biometrics.cz>
	<f03bba38-3ac8-ee96-b272-4db2ccdae28e@linaro.org>
X-Mailer: Claws Mail 3.11.0 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Loss of a wayland socket by a systemd user session
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
X-List-Received-Date: Tue, 22 Nov 2016 17:27:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 18 Nov 2016 20:47:05 -0600
Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrote:

> Hello!
>=20
>=20
> On 11/18/2016 12:12 PM, Tomas Novotny wrote:
> > I'm using weston and its 'weston-start' script shipped with oe-core (mo=
rty).
> > It works perfectly until root is logged in. The problematic path is:
> [...]
>=20
> We've seen that [1]. If you have PAM, you can modify weston-start to
> pass `-u root' to weston-launch [2].
>=20
> You can also try this systemd service unit and launch Weston directly:
>   https://github.com/mrchapp/meta-96boards/commit/ac3e11e

thanks a lot, this patch works for me. It is nice that it also removes the
weston-launch. Were you thinking about upstreaming your patch?

By the way, the first fix [2] didn't work for me (although I checked it
briefly).

Thanks again,

Tomas

> Greetings!
>=20
> Daniel D=C3=ADaz
> daniel.diaz@linaro.org
>=20
>=20
> [1] https://bugs.linaro.org/show_bug.cgi?id=3D2576
> [2] https://github.com/mrchapp/meta-96boards/commit/ee71b7e
>=20

