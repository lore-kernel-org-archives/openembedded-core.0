Return-Path: <richard.purdie@intel.com>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8A675C8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5UAcVZ0010505; Tue, 30 Jun 2015 11:38:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZdORv3R6sdu2; Tue, 30 Jun 2015 11:38:31 +0100 (BST)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5UAcPs7010477
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2015 11:38:26 +0100
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard.purdie@intel.com>)
	id 1Z9svk-0000I2-KF; Tue, 30 Jun 2015 11:38:20 +0100
Message-ID: <1435660700.7287.84.camel@intel.com>
From: Richard Purdie <richard.purdie@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 11:38:20 +0100
In-Reply-To: <CAJTo0LaOUcu7qRdmYvXm3jqoYQx48_wsKRDM5bxsMZVj_ew-CQ@mail.gmail.com>
References: <1435623417-18133-1-git-send-email-juro.bystricky@intel.com>
	<CAJTo0LaOUcu7qRdmYvXm3jqoYQx48_wsKRDM5bxsMZVj_ew-CQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: OpenSUSE 13.2 configure error
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
X-List-Received-Date: Tue, 30 Jun 2015 10:38:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-06-30 at 11:32 +0100, Burton, Ross wrote:
>=20
> On 30 June 2015 at 01:16, Juro Bystricky <juro.bystricky@intel.com>
> wrote:
>         Qemu configure tests for the presence/existance of SDL by
>         trying to link against libSDL. libSDL in turn attempts to load
>         libcrypt which will then attempt to load libgpg-error.
>         The bitbaked libgpg-error will be built with ABI incompatible
>         with the one required by libcrypt.
>         The remedy is to force qemu configure to use the host's
>         libgpg-error instead. This is achieved by modifying the linker
>         library search order.
>
> I think seeing this summary will send Saul into a quivering wreck as
> this was a massive source of pain in the previous release.
> Interesting solution but I'd like Saul's opinion.
>=20
If backporting this means we don't have to reconfigure the autobuilder
to run old releases, Saul, Beth and I are likely all in favour.
>=20
> The patch should probably only be applied for native and nativesdk
> builds, as I suspect that's going to break a target build quite badly.
> Also, it needs signed-of-by and upstream-status (inappropriate, I
> imagine) tags in the patch header.

It needs a description and the patch should be native only, not
nativesdk which should link against the sysroot.

Cheers,

Richard


