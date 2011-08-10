Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/oh1y2BT5//SLhjabE65gPvIU3h4l1gxk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qr8Ln-0000Z1-17
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:57:35 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7ACr5gW023240
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 07:53:05 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312912632.14274.312.camel@rex>
Date: Wed, 10 Aug 2011 07:53:04 -0500
Message-Id: <E668F8AB-D3DB-4573-8A64-082B9C9E7BED@kernel.crashing.org>
References: <1312912632.14274.312.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2011 12:57:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 9, 2011, at 12:57 PM, Richard Purdie wrote:

> If we don't do this, the SDK target sysroot is named generically even
> when it contains package architecture specific optimisations.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/populate_sdk.bbclass =
b/meta/classes/populate_sdk.bbclass
> index 0f3591b..8c19e83 100644
> --- a/meta/classes/populate_sdk.bbclass
> +++ b/meta/classes/populate_sdk.bbclass
> @@ -5,7 +5,7 @@ SDK_DIR =3D "${WORKDIR}/sdk"
> SDK_OUTPUT =3D "${SDK_DIR}/image"
> SDK_DEPLOY =3D "${TMPDIR}/deploy/sdk"
>=20
> -SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${TARGET_SYS}"
> +SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
>=20
> TOOLCHAIN_HOST_TASK ?=3D "task-sdk-host-nativesdk =
task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> TOOLCHAIN_TARGET_TASK ?=3D "task-core-standalone-sdk-target =
task-core-standalone-sdk-target-dbg"
>=20

Ack.

- k=


