Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52185.1795433602395471196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XStJUYfu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49a92144733so1490577f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795433600; x=1796038400; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2E8pgzddJqSfGh/UYijgdnfh9BdK3Vhke5mmGZZeyls=;
        b=XStJUYfueKwuXvkVnmH/l6WsiBLl7gMUFyNbKkP3PYuTnoPDpfMcTOerrpONPpJJJk
         mnn84qaLa7F9TuQWWIFvqaRGJSBsgPteVidvdUN7XZxsZoe9CQu114JQM/lPkj/CiBFg
         EVydErTYOVFw70b5GXLwaRjXJvKMw2PSo7jdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433600; x=1796038400;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E8pgzddJqSfGh/UYijgdnfh9BdK3Vhke5mmGZZeyls=;
        b=unzOfn5sfqTYjAWp2AdC5X6kvwBpxHoc60/7tqz0zzp77Z/6Eixn6kJZ1KO0v+h0Ln
         sMX7oAaBrLvEDmjoxLBwxIhW2nxbs/qxnjgI06Izvae6gK4cQ5Fq6ZyZ0CZ1+bCoeZzA
         eogf+q8AC4bHmNB3ZfavVDSrTeGgfBvRJEYaOpJXYANctX2d/oR6d2jIT9LqeFzCgYUo
         /wC4Lqxzp3nnVzhwhaem6HpXoE9r+73rgR7otEFDP9TAldQsAyT21V0m4exCN+OhvjDy
         Ro/p4O8yXQYq3ctsZJ3IqHvPjE8QEYk0R++d4wi9IbRInNLJm42pasmgV2NRyDxeSxyn
         pZJA==
X-Forwarded-Encrypted: i=1; AL+hErGibIM9GcU4jeqlM/HuK6w8Bb7uRH6OGNu2CR18ZOdAOLDNuQbrNy19LL3Xzg9YomJHZZkOzM53eNcCcsUdGnUN9A==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9hOKs9w7Jk4AyQyde0nFQl5LnKATtXuBTV3bw4buR7c8WZ2hnF
	wEyHku4l5G1e9+0ZHrj84sAgUPwj0vjdehg7dJiE5q4a2o4Bz16GBpU9J13R6EC8wUA=
X-Gm-Gg: AZFdTZd1TBAF+gLB0i/VYTduiXpZiaBP5/ipvM2snc9FMTnxW0B8r8hFQYFkG5yyv43
	sEGxpiSY0BvLH9EW8YBumtyoIRsOX/odNySRtLTh6MSkhUTVc/uAForbYmTRZwRLlCAjdQ5UpY5
	SROhN8w6m5yavopRGq/baPoRrqifqoJkG1D7gt4x21pG7MGg0ovoBz1naX6L2hFFR/83iUj9yWH
	68NpCB8fcy86k9/vzOJEmd4oDt4ZYWfwipWc89sDEimZI7NC8Y7eXcLz7NiGnvRcLFoU6Im5hog
	VsDA+FbZVTBgbzFSr9PzW6zlPUPejA6VpQTZM81DEeinsi348RoEGqQc1WDunniWNGj49dI8Xzb
	0vlJh8KukZAV93gEI6vwxp5utx4JHrcYR4nemfUa/rHABmlGZWo4e62jW7OF0zkdAs6+VIPxidk
	Vy0Z3A8HBG62ujmh+HpKEZSS9PGGHVLJbtc0dEuOAXxwMCj9IWeN28KWBKiMedKvlyyiORbD8Ba
	wPIp92LVOfR23sEBUg4yK0eO1lyecPJ7jIURfUXeWsN1JGlepNrYe1/TSAthj2l/6nu/vWY/WV3
	GOh9P2tw2dviXhrGo6iKVCPCvAt1uE9IDtC6Ra5sBwCCAJprIWiS4p58Qox3UsQaUPWTf7zXDya
	clpdnVHlD5FiVIywMEqO/Xvl4DjGVQd68Ax5y9Coq
X-Received: by 2002:a05:6000:4809:b0:4aa:842f:5f78 with SMTP id ffacd0b85a97d-4abb759e947mr21544021f8f.46.1795433600420;
        Mon, 23 Nov 2026 03:33:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da? ([2001:8b0:aba:5f3c:dfb4:14bb:eea0:b8da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm22386018f8f.59.2026.11.23.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:19 -0800 (PST)
Message-ID: <358071f301b76a339977f3901d491160e0685d99.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 09/12]
 meta/conf/machine/include/riscv/arch-riscv.inc: error on very long package
 archs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, paul@pbarker.dev
Date: Mon, 23 Nov 2026 11:33:19 +0000
In-Reply-To: <20261118204853.2155173-10-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
	 <20261118204853.2155173-10-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250901

On Wed, 2026-11-18 at 15:48 -0500, Trevor Gamblin via openembedded-core wro=
te:
> Tunes that don't set RISCVPKGARCH:tune-<name> fall back to
> TUNE_RISCV_PKGARCH, which grows with every extension enabled. This can
> easily exceed allowable maximums for build and sstate paths, so make it
> a fatal error when it's longer than 64 characters and inform the user
> to set RISCVPKGARCH:tune-<name> instead.
>=20
> Existing tunes already set RISCVPKGARCH:tune-<name>, so they are
> unaffected. The longest known fallback is currently Microblaze-V's
> riscv64imafdc_zicsr_zifencei_zba_zbb_zbs at 41 characters, which is well
> under the set limit.
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> =C2=A0meta/conf/machine/include/riscv/README=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A0meta/conf/machine/include/riscv/arch-riscv.inc | 8 +++++++-
> =C2=A02 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machine/i=
nclude/riscv/README
> index ef7a484f25..c66925eb83 100644
> --- a/meta/conf/machine/include/riscv/README
> +++ b/meta/conf/machine/include/riscv/README
> @@ -93,7 +93,8 @@ RISCVPKGARCH - This is the package arch actually used.=
=C2=A0 As with ARMPKGARCH
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 on arm, each tune sets it as a literal in
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 RISCVPKGARCH:tune-<name>, so that it only changes when
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 deliberately changed.=C2=A0 Tunes that don't set it fall=
 back to
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 TUNE_RISCV_PKGARCH.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 TUNE_RISCV_PKGARCH, which is an error if that is longer
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 than 64 characters.
> =C2=A0
> =C2=A0The standard variables are defined as:
> =C2=A0
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/m=
achine/include/riscv/arch-riscv.inc
> index ff14f94deb..cde35ce56d 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -301,7 +301,13 @@ TUNE_ARCH =3D "${TUNE_RISCV_ARCH}"
> =C2=A0# Tunes that don't set it fall back to TUNE_RISCV_PKGARCH, which is=
 built from
> =C2=A0# TUNE_FEATURES above, e.g.:
> =C2=A0#=C2=A0=C2=A0=C2=A0 riscv32imac
> -RISCVPKGARCH =3D "${@d.getVar('RISCVPKGARCH:tune-${DEFAULTTUNE}') or d.g=
etVar('TUNE_RISCV_PKGARCH')}"
> +# However, TUNE_RISCV_PKGARCH grows with every extension the tune enable=
s, so to
> +# keep build and sstate paths manageable, RISCVPKGARCH:tune-<name> shoul=
d be set
> +# for a custom tune. For TUNE_RISCV_PKGARCH longer than 64 characters, t=
hrow an
> +# error.
> +RISCVPKGARCH =3D "${@d.getVar('RISCVPKGARCH:tune-${DEFAULTTUNE}') or \
> +=C2=A0=C2=A0=C2=A0 ('${TUNE_RISCV_PKGARCH}' if len('${TUNE_RISCV_PKGARCH=
}') <=3D 64 else \
> +=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal('The package arch for tune ${DEFAULTTU=
NE} would be ${TUNE_RISCV_PKGARCH}, which is longer than 64 characters. Set=
 RISCVPKGARCH:tune-${DEFAULTTUNE} to a shorter name.'))}"
> =C2=A0TUNE_PKGARCH =3D "${RISCVPKGARCH}"
> =C2=A0
> =C2=A0# Misc settings

I think I'd rather have that check somewhere end where it isn't going
to be run again and again ever time the variable is used/expanded.
Inline python is ok to a point but I think it is getting too
unreadable.

Cheers,

Richard

