Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18sn7+WHNtozzlUMQz+qaSHqmNWcstvq7U=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qr8SE-00017P-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 15:04:15 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7ACxiO4026491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 07:59:45 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>
Date: Wed, 10 Aug 2011 07:59:44 -0500
Message-Id: <27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>
References: <1312912632.14274.312.camel@rex>
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>
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
X-List-Received-Date: Wed, 10 Aug 2011 13:04:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 9, 2011, at 11:00 PM, Lu, Lianhao wrote:

> Richard Purdie wrote on 2011-08-10:
>> If we don't do this, the SDK target sysroot is named generically even
>> when it contains package architecture specific optimisations.
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> =
---
>> diff --git a/meta/classes/populate_sdk.bbclass
>> b/meta/classes/populate_sdk.bbclass index 0f3591b..8c19e83 100644 ---
>> a/meta/classes/populate_sdk.bbclass +++
>> b/meta/classes/populate_sdk.bbclass @@ -5,7 +5,7 @@ SDK_DIR =3D
>> "${WORKDIR}/sdk"
>> SDK_OUTPUT =3D "${SDK_DIR}/image"
>> SDK_DEPLOY =3D "${TMPDIR}/deploy/sdk"
>> -SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${TARGET_SYS}"
>> +SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
>=20
> In gcc-configure-sdk.inc, it is set =
"--with-sysroot=3D${SDKPATH}/sysroots/${TARGET_SYS}".=20
> Is there any inconsistency?

Binutils might also need updating.

- k=


