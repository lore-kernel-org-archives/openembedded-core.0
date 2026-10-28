Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.824.1793229417632997725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 16:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=O1MVujZW;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1253166f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793229416; x=1793834216; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3GNo53krBxkIckXjnJ8VXaH/ye7eP/p7L+iRrNffMbs=;
        b=O1MVujZWmbUbTC/6vH7xidM2Uy4IeCYzgkvTdfn2DwQQtoIvuSI6OIcb6gcnWM13ph
         b/J5ywGeBuNi+G+QlWQxyw1vDxRYpySIsrXtWMu1mUb15D4UDIxhYayLHwSnTlDoMQia
         qhL25VTeWxDYxABEPwSzRUHyUks4wzxRUz/dHg+vUEVODMPa7YVWLXYghnSvPXOTizHM
         5Sr0XT7LKTHlWCZmNLxcMe8oMTIISYR4iEyORGrVoqye+dUB3iyYZhWslVxoJdiMChrl
         RKXeXC06c9YzcPVS2dEnlucKKKqm3xs9J2zNpZMV2hX4qVyUdaEj+9210S+uz7W0HCYX
         fyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793229416; x=1793834216;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GNo53krBxkIckXjnJ8VXaH/ye7eP/p7L+iRrNffMbs=;
        b=UvzVPykzrcMc9RyH56sRIgcV8bpoiUIja2izqB1eznNnckK1kkk0nCuLtmLRIxY9+V
         PgH9PTP7ojvijm75dUHIJ11tGRpFiZrh/+1vk/WFDOHZZNjg3kRDTsVSFPgbXGUg1PB5
         U5zI8AGHxGM5PfmZgpjXwwo4I4uyAk7VsxRnEN15IbL8FG+eS3zzz9iSqa2D2LX7/tV1
         bbErSqBhqd+Ia6+kntK3WEMxuJSccf+cMlsOhXEDVsxOVsSJQdxElQUwCgWj8uw8m5ol
         5SKaOocDgT/1rYnSftJxUlLKSruDnAdR8BqCTuM9q5QG8QeMyfwBqF6nxInYaVz/Y50p
         RihA==
X-Forwarded-Encrypted: i=1; AKwUvBzpcoEJyw0IQ382wlPgwggCV2XbHcTM32uoh6uh/U7hWI2W8JfoDG2tUQifQinaf3LGnUzYrQntggIRHh7ajU4oYQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIrGht81cNgJdYTjRbDKZJUSwY2WihMT8VO4UfkuGUL6QjvF6O4
	gLh5zAxdQzt4VnsE4wNYZvAb/pti1B14d7UPzUZPsxpdlux7eOgnKeMD
X-Gm-Gg: AYBFou1lwQijkPags0thY2W/FcJHjkgA4rcBAojGJcqFaSMNUvaHyy3lwNI6VbDaerS
	VMnIG/X3IaveziTQsYizqPjHNHDNTg8bJFcLxq5BJu+6NdIDM7wJgNWicZ5wP1mHYRx54e4tn0U
	kqHLdtuTrKOe/VBKKq2F74oU/9eyg7SWawCB9AiTltN4KIxhaiqig7Wsn3qi46HamtKaiSKIfh6
	rm1aQOCA+T6euMzoqrDtwYrutSHtH+jNcYLSMdx1PA4QCmagMDWg5Cr4aMJgvlTRPrhdu/PC70Z
	ASWdqVhfsxT/9KxTJCS0jXiqfkOj0c+vSn7GviAZKFVF5veEDv8x88+A5P04sUy1T/sfbajXZ+d
	7RWjLBviKkmd/IkEBKjt7OzK/I8o26pRyHUbqiNHDnWm7pAuTy2cQjnPSfnHKdrTHIe3VluzDfg
	arOSUvSrm9ofdsYGEVT4n79ScAE2wwoL3Sub2vCGUBoKwAWBKzIYIjLwz4ct3aygLild37fFrYR
	zkT8HARsEflAekfnj15u+n+lJid0+AGwNYtCishXbsClovbhckStalAPcjr+ejqOxanHRTmMbXI
	eAACkIumtvZ96ZtS3uW2hBDr2m/g/qkbaZBuRDp7AXiC+G4aT06e+uSPDokOL2zjY9aTJHzX5px
	nZQ==
X-Received: by 2002:a05:6000:240b:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e5d31aa6dmr9461367f8f.57.1793229415569;
        Wed, 28 Oct 2026 16:16:55 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dd7sm31123834f8f.15.2026.10.28.16.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:16:55 -0700 (PDT)
Message-ID: <63d7a5c552ad2521cc9f66a9aa17273fc11522ba.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 13/20] devtool: ide-sdk: parse Rust debug path
 remaps
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 29 Oct 2026 00:16:54 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-13-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
	 <20261026-devtool-ide-sdk-cargo-v1-13-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248852

On Mon, 2026-10-26 at 09:55 +0100, Enguerrand de Ribaucourt via
lists.openembedded.org wrote:
> Use Cargo RUSTFLAGS to populate reverse debug mappings and recognize
> Rust
> --remap-path-prefix alongside the existing GCC prefix-map options.
> The
> following LLDB source-map change depends on these normalized
> mappings.
>=20
> AI-Generated: Uses GitHub Copilot
> Signed-off-by: Enguerrand de Ribaucourt
> <enguerrand.de-ribaucourt@savoirfairelinux.com>
> ---
> =C2=A0scripts/lib/devtool/ide_sdk.py | 14 +++++++++++---
> =C2=A01 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/lib/devtool/ide_sdk.py
> b/scripts/lib/devtool/ide_sdk.py
> index 44429e80b0..f22a98cedf 100755
> --- a/scripts/lib/devtool/ide_sdk.py
> +++ b/scripts/lib/devtool/ide_sdk.py
> @@ -1140,6 +1140,9 @@ class RecipeModified:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.build_tool is Bu=
ildTool.KERNEL_MODULE:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.reverse_debug_prefix_map =3D
> self._init_reverse_debug_prefix_map(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.kernel_cc)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif self.build_tool is Build=
Tool.CARGO:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.=
reverse_debug_prefix_map =3D
> self._init_reverse_debug_prefix_map(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.cargo_rustflags)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.reverse_debug_prefix_map =3D
> self._init_reverse_debug_prefix_map(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 recipe_d.getVar('DEBUG_PREFIX_MAP'))
> @@ -1292,15 +1295,20 @@ class RecipeModified:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ':'.join(self.sol=
ib_search_path(image))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def _init_reverse_debug_prefix_map(self, debug_p=
refix_map):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Parses GCC map options and=
 returns a mapping of target to
> host paths.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Parses compiler map option=
s and returns a mapping of
> target to host paths.
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This function scans a string =
containing GCC options such as
> -fdebug-prefix-map,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This function scans a string =
containing compiler options
> such as -fdebug-prefix-map,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fmacro-prefix-map, and =
-ffile-prefix-map (in both '--option
> value' and '--option=3Dvalue'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 forms), extracting all m=
appings from target paths (used in
> debug info) to host source
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paths. If multiple mappi=
ngs for the same target path are
> found, the most suitable
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host path is selected (p=
referring 'sources' over 'build'
> directories).
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixes =3D ("-fdebug-prefix=
-map", "-fmacro-prefix-map", "-
> ffile-prefix-map")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefixes =3D (
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-fde=
bug-prefix-map",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-fma=
cro-prefix-map",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-ffi=
le-prefix-map",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "--re=
map-path-prefix",

mapping.split('=3D', 1) splits --remap-path-prefix mappings on the first
=3D, but rustc splits on the last. It only matters for paths containing
=3D; .

Regards,
Adrian

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 all_mappings =3D {}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args =3D shlex.split(deb=
ug_prefix_map)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i =3D 0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248650):
> https://lists.openembedded.org/g/openembedded-core/message/248650
> Mute This Topic: https://lists.openembedded.org/mt/121938793/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
