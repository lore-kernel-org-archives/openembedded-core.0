Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6701C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 22:25:05 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.17523.1722723895249632351
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Aug 2024 15:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TyMCv8D3;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: tim.orling@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a309d1a788so11726785a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 15:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722723893; x=1723328693; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz61+XA4fq1SlQLt0MHhQyUIn4+rfvOC2zLTYvbZkoM=;
        b=TyMCv8D3Qg2maecgpE3DVpPhkdcEIU6kMUcYh4oKTzNHbPmE/4okFiDLZB/ksWFYp/
         Tu7ZcyD/7nrMPSpI6/+Op3JVebWneqbQed966XpJ4a0rcYhE+9jWWprd0Qn3r2XvvV2D
         ULbduEPA6EAkCDObgKrxOq+pb3ozkPfnnI4Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722723893; x=1723328693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz61+XA4fq1SlQLt0MHhQyUIn4+rfvOC2zLTYvbZkoM=;
        b=UVzJ8CAIQ/Ur6B2lz8ultBOqVKiy2sHNPwLRRvJRHs/5JQhV4uOHLr/vB5f6XYuaoG
         vbzzQ+jLIKrED5c0NW8DXqWpPVx8SWLX2ogKXL9QQCL2yyyZ1yQJvDWcX2BUWeCvLl5u
         1wCg6eHdMP5SyRGmc/j5BLtv0n4CE7W5cH8kcsV3iibwp1CYX4omVHz2xvqQZ3Utpvqn
         mrLEoCgexa4FZwpb6Agy02ob2IlMMLGxZJLjbP/YkE+r8trKATJzE8jODC7EjmblKOrw
         RrJCD+R1Lr4CaGpU+zy2FIVrWGoheAXc4ub5SjCwTaxJoAkAQiqctDqFdY9Om+WoE7uq
         O6MA==
X-Gm-Message-State: AOJu0Yx2paGV5FT21VrZwx6MG4nsZHEzxB2FDA/N0IRQcckrOOI0hrLS
	UCPFr9CfQoZ0sCpLQN5Az3R3M7ZSK4GXzrfXP/BNBjoRMO9Pi5ZvvZkJLFgKAgKPt/pCHHeXCGQ
	i1qXHFMrYDKxB3RrskPSvyYmgI0lnwLNvU7zRkQ==
X-Google-Smtp-Source: AGHT+IHVJu1NHClSorh+QIqSVLEQJknJX6rSQECp8SHlwnd0hZJNwnCN4s/oIa45WmIT+37/ZLj5Lg1+OmsFt/lmA9c=
X-Received: by 2002:a17:907:2da6:b0:a7a:b9dd:775a with SMTP id
 a640c23a62f3a-a7dc50a59a3mr536588966b.67.1722723893024; Sat, 03 Aug 2024
 15:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <010101910f321b75-bb49db86-29b4-4a83-afa4-152dd36e96f2-000000@us-west-2.amazonses.com>
In-Reply-To: <010101910f321b75-bb49db86-29b4-4a83-afa4-152dd36e96f2-000000@us-west-2.amazonses.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 3 Aug 2024 15:24:41 -0700
Message-ID: <CAOyo-86BjMoeeFC0cad-2mfoBGF4yCsx=KeJJXWAgRmNWD-nPw@mail.gmail.com>
Subject: Re: [AUH] python3-rpds-py: upgrading to 0.19.1 FAILED
To: auh@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b0aea5061ecee9e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 22:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202939

--000000000000b0aea5061ecee9e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

error: package `triomphe v0.1.13` cannot be built because it requires
rustc 1.76 or newer, while the currently active rustc version is
1.75.0


On Thu, Aug 1, 2024 at 11:27=E2=80=AFAM <auh@yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to
> *0.19.1* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am
> 0001-python3-rpds-py-upgrade-0.18.1-0.19.1.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From dd9b210498899dfa42aafc4dc6d1e012cf60d753 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Thu, 1 Aug 2024 11:00:40 +0000
> Subject: [PATCH] python3-rpds-py: upgrade 0.18.1 -> 0.19.1
>
> ---
>  .../python/python3-rpds-py-crates.inc         | 102 +++++++-----------
>  ...py_0.18.1.bb =3D> python3-rpds-py_0.19.1.bb} |   2 +-
>  2 files changed, 39 insertions(+), 65 deletions(-)
>  rename meta/recipes-devtools/python/{python3-rpds-py_0.18.1.bb =3D>
> python3-rpds-py_0.19.1.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
> b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
> index 3551bdb5f7..e6c1ef8add 100644
> --- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
> +++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
> @@ -3,80 +3,54 @@
>  # from Cargo.lock
>  SRC_URI +=3D " \
>      crate://crates.io/archery/1.2.0 \
> -    crate://crates.io/autocfg/1.1.0 \
> -    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/autocfg/1.3.0 \
> +    crate://crates.io/cc/1.0.90 \
>      crate://crates.io/cfg-if/1.0.0 \
> -    crate://crates.io/heck/0.4.1 \
> -    crate://crates.io/indoc/2.0.4 \
> -    crate://crates.io/libc/0.2.147 \
> -    crate://crates.io/lock_api/0.4.10 \
> -    crate://crates.io/memoffset/0.9.0 \
> -    crate://crates.io/once_cell/1.18.0 \
> -    crate://crates.io/parking_lot/0.12.1 \
> -    crate://crates.io/parking_lot_core/0.9.8 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/indoc/2.0.5 \
> +    crate://crates.io/libc/0.2.155 \
> +    crate://crates.io/memoffset/0.9.1 \
> +    crate://crates.io/once_cell/1.19.0 \
>      crate://crates.io/portable-atomic/1.6.0 \
> -    crate://crates.io/proc-macro2/1.0.66 \
> -    crate://crates.io/pyo3/0.20.3 \
> -    crate://crates.io/pyo3-build-config/0.20.3 \
> -    crate://crates.io/pyo3-ffi/0.20.3 \
> -    crate://crates.io/pyo3-macros/0.20.3 \
> -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> -    crate://crates.io/quote/1.0.31 \
> -    crate://crates.io/redox_syscall/0.3.5 \
> +    crate://crates.io/proc-macro2/1.0.86 \
> +    crate://crates.io/pyo3/0.22.2 \
> +    crate://crates.io/pyo3-build-config/0.22.2 \
> +    crate://crates.io/pyo3-ffi/0.22.2 \
> +    crate://crates.io/pyo3-macros/0.22.2 \
> +    crate://crates.io/pyo3-macros-backend/0.22.2 \
> +    crate://crates.io/python3-dll-a/0.2.10 \
> +    crate://crates.io/quote/1.0.36 \
>      crate://crates.io/rpds/1.1.0 \
> -    crate://crates.io/scopeguard/1.1.0 \
> -    crate://crates.io/smallvec/1.11.0 \
>      crate://crates.io/static_assertions/1.1.0 \
> -    crate://crates.io/syn/2.0.32 \
> -    crate://crates.io/target-lexicon/0.12.9 \
> -    crate://crates.io/triomphe/0.1.9 \
> -    crate://crates.io/unicode-ident/1.0.11 \
> +    crate://crates.io/syn/2.0.69 \
> +    crate://crates.io/target-lexicon/0.12.14 \
> +    crate://crates.io/triomphe/0.1.13 \
> +    crate://crates.io/unicode-ident/1.0.12 \
>      crate://crates.io/unindent/0.2.3 \
> -    crate://crates.io/windows-targets/0.48.1 \
> -    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
> -    crate://crates.io/windows_aarch64_msvc/0.48.0 \
> -    crate://crates.io/windows_i686_gnu/0.48.0 \
> -    crate://crates.io/windows_i686_msvc/0.48.0 \
> -    crate://crates.io/windows_x86_64_gnu/0.48.0 \
> -    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
> -    crate://crates.io/windows_x86_64_msvc/0.48.0 \
>  "
>
>  SRC_URI[archery-1.2.0.sha256sum] =3D
> "8967cd1cc9e9e1954f644e14fbd6042fe9a37da96c52a67e44a2ac18261f8561"
> -SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> -SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> +SRC_URI[cc-1.0.90.sha256sum] =3D
> "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> -SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> -SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> -SRC_URI[libc-0.2.147.sha256sum] =3D
> "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
> -SRC_URI[lock_api-0.4.10.sha256sum] =3D
> "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
> -SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> -SRC_URI[once_cell-1.18.0.sha256sum] =3D
> "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
> -SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> -SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D
> "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[indoc-2.0.5.sha256sum] =3D
> "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
> +SRC_URI[libc-0.2.155.sha256sum] =3D
> "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
> +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> +SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
>  SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> -SRC_URI[proc-macro2-1.0.66.sha256sum] =3D
> "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
> -SRC_URI[pyo3-0.20.3.sha256sum] =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> -SRC_URI[quote-1.0.31.sha256sum] =3D
> "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
> -SRC_URI[redox_syscall-0.3.5.sha256sum] =3D
> "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> +SRC_URI[pyo3-0.22.2.sha256sum] =3D
> "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
> +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D
> "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
> +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D
> "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
> +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D
> "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
> +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D
> "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
> +SRC_URI[python3-dll-a-0.2.10.sha256sum] =3D
> "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
> +SRC_URI[quote-1.0.36.sha256sum] =3D
> "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
>  SRC_URI[rpds-1.1.0.sha256sum] =3D
> "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
> -SRC_URI[scopeguard-1.1.0.sha256sum] =3D
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> -SRC_URI[smallvec-1.11.0.sha256sum] =3D
> "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9"
>  SRC_URI[static_assertions-1.1.0.sha256sum] =3D
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> -SRC_URI[syn-2.0.32.sha256sum] =3D
> "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
> -SRC_URI[target-lexicon-0.12.9.sha256sum] =3D
> "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
> -SRC_URI[triomphe-0.1.9.sha256sum] =3D
> "0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f"
> -SRC_URI[unicode-ident-1.0.11.sha256sum] =3D
> "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
> +SRC_URI[syn-2.0.69.sha256sum] =3D
> "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
> +SRC_URI[target-lexicon-0.12.14.sha256sum] =3D
> "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
> +SRC_URI[triomphe-0.1.13.sha256sum] =3D
> "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
> +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
>  SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> -SRC_URI[windows-targets-0.48.1.sha256sum] =3D
> "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
> -SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D
> "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
> -SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D
> "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
> -SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D
> "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
> -SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D
> "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
> -SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D
> "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
> -SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D
> "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
> -SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D
> "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
> diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> b/meta/recipes-devtools/python/python3-rpds-py_0.19.1.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> rename to meta/recipes-devtools/python/python3-rpds-py_0.19.1.bb
> index f46df1115c..f6f7b390ad 100644
> --- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> +++ b/meta/recipes-devtools/python/python3-rpds-py_0.19.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D7767fa537c4596c54141f32882c4a984"
>
>  SRC_URI +=3D "file://run-ptest"
>
> -SRC_URI[sha256sum] =3D
> "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
> +SRC_URI[sha256sum] =3D
> "31dd5794837f00b46f4096aa8ccaa5972f73a938982e32ed817bb520c465e520"
>
>  require ${BPN}-crates.inc
>
> --
> 2.44.0
>
>

--000000000000b0aea5061ecee9e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-aLF-aPX-K0-aPE" style=3D"font-family:&=
quot;Courier New&quot;,Courier,monospace,arial,sans-serif;margin-top:0px;ma=
rgin-bottom:0px;color:rgb(0,0,0);font-size:14px">error: package `triomphe v=
0.1.13` cannot be built because it requires rustc 1.76 or newer, while the =
currently active rustc version is 1.75.0</pre></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 1, 2024 at 11:27=
=E2=80=AFAM &lt;<a href=3D"mailto:auh@yoctoproject.org">auh@yoctoproject.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0=
.19.1* has Failed(do_compile).<br>
<br>
Detailed error information:<br>
<br>
do_compile failed<br>
<br>
<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-rpds-py-upgrade-0.18.1=
-0.19.1.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-- &gt;8 --<br>
From dd9b210498899dfa42aafc4dc6d1e012cf60d753 Mon Sep 17 00:00:00 2001<br>
From: Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"=
_blank">auh@yoctoproject.org</a>&gt;<br>
Date: Thu, 1 Aug 2024 11:00:40 +0000<br>
Subject: [PATCH] python3-rpds-py: upgrade 0.18.1 -&gt; 0.19.1<br>
<br>
---<br>
=C2=A0.../python/python3-rpds-py-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 102 +++++++-----------<br>
=C2=A0...<a href=3D"http://py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">py_0.18.1.bb</a> =3D&gt; <a href=3D"http://python3-rpds-py_0.19.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.19.1.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A02 files changed, 39 insertions(+), 65 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-rpds-p=
y_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.bb=
</a> =3D&gt; <a href=3D"http://python3-rpds-py_0.19.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-rpds-py_0.19.1.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta=
/recipes-devtools/python/python3-rpds-py-crates.inc<br>
index 3551bdb5f7..e6c1ef8add 100644<br>
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc<br>
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc<br>
@@ -3,80 +3,54 @@<br>
=C2=A0# from Cargo.lock<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/archery/1.2.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/archery/1.2.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.3.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.90" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.0.90</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.147" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.147</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.10" rel=3D"=
noreferrer" target=3D"_blank">crates.io/lock_api/0.4.10</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.18.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.18.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.12.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.9.8" =
rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.8</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/indoc/2.0.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.155" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.155</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.19.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.19.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/portable-atomic/1.6=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.6.0</a=
> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.66" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.66</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.20.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.20.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.20.3</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.20=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.20=
.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.31" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.31</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.3.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.3.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.86" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.86</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.22.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.22.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.22.2</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.22.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.22.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.22=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.22=
.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/python3-dll-a/0.2.10" re=
l=3D"noreferrer" target=3D"_blank">crates.io/python3-dll-a/0.2.10</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.36" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.36</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/rpds/1.1.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/rpds/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.11.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.11.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/static_assertions/1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/static_assertions/1.1.=
0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.32" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.32</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12.9" r=
el=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.9</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/triomphe/0.1.9" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/triomphe/0.1.9</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.11" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.69" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.69</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12.14" =
rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.14</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/triomphe/0.1.13" rel=3D"=
noreferrer" target=3D"_blank">crates.io/triomphe/0.1.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.12" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.12</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unindent/0.2.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.48.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.1</a> \=
<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnullvm/=
0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_gnul=
lvm/0.48.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msvc/0.4=
8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
48.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.48.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.48.0</a>=
 \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0.48.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.48.0</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/0.48.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0.48.0=
</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnullvm/0=
.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.48.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc/0.48=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc/0.48=
.0</a> \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[archery-1.2.0.sha256sum] =3D &quot;8967cd1cc9e9e1954f644e14fb=
d6042fe9a37da96c52a67e44a2ac18261f8561&quot;<br>
-SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b053f41e=
72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
-SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7dfd33cc=
f595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
+SRC_URI[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74681c0ad2149761=
0ce1b7c91b1022cd21c80c6fbdd9476b0&quot;<br>
+SRC_URI[cc-1.0.90.sha256sum] =3D &quot;8cd6604a82acf3039f1144f54b8eb34e91f=
fba622051189e71b781822d5ee1f5&quot;<br>
=C2=A0SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc=
0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
-SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb0281560f54b=
440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
-SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4797e3=
42f988cecda4fb6c939150f96315fd8&quot;<br>
-SRC_URI[libc-0.2.147.sha256sum] =3D &quot;b4668fb0ea861c1df094127ac5f1da34=
09a82116a4ba74fca2e58ef927159bb3&quot;<br>
-SRC_URI[lock_api-0.4.10.sha256sum] =3D &quot;c1cc9717a20b1bb222f333e6a92fd=
32f7d8a18ddc5a3191a11af45dcbf4dcd16&quot;<br>
-SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a95585bd15607c6ab0c=
4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
-SRC_URI[once_cell-1.18.0.sha256sum] =3D &quot;dd8b5dd2ae5ed71462c540258bed=
cb51965123ad7e7ccf4b9a8cafaa4a63576d&quot;<br>
-SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06bc9fff0a37f=
f4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
-SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D &quot;93f00c865fe7cabf650081=
affecd3871070f26767e7b2070a3ffae14c654b447&quot;<br>
+SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3b60a8=
84b5d30c0fca7d82fe33449bbe55ea&quot;<br>
+SRC_URI[indoc-2.0.5.sha256sum] =3D &quot;b248f5224d1d606005e02c97f5aa4e88e=
eb230488bcc03bc9ca4d7991399f2b5&quot;<br>
+SRC_URI[libc-0.2.155.sha256sum] =3D &quot;97b3888a4aecf77e811145cadf6eef59=
01f4782c53886191b2f693f24761847c&quot;<br>
+SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092f6cb4=
48677611ce4449e970ceaf42695203f218a&quot;<br>
+SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b2476b595f9358c5161aa4=
67c2438859caa136dec86c26fdd2efe17b92&quot;<br>
=C2=A0SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef9988bc169ba1=
6dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
-SRC_URI[proc-macro2-1.0.66.sha256sum] =3D &quot;18fb31db3f9bddb2ea821cde30=
a9f70117e3f119938b5ee630b7403aa6e2ead9&quot;<br>
-SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d45cc287af5f32ff=
add5f4761438b527b055fb0d4bb8233&quot;<br>
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa5745de3f5231ce10=
517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d4ef1f6e85a2ed4=
22eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
-SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01b8055ec95e484a=
6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e9b68bb9c3149c5=
b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
-SRC_URI[quote-1.0.31.sha256sum] =3D &quot;5fe8a65d69dd0808184ebb5f836ab526=
bb259db23c657efa38711b1072ee47f0&quot;<br>
-SRC_URI[redox_syscall-0.3.5.sha256sum] =3D &quot;567664f262709473930a4bf9e=
51bf2ebf3348f2e748ccc50dea20646858f8f29&quot;<br>
+SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665df0d1c8fbfd238=
015744736151d4445ec0836b8e628aae103b77&quot;<br>
+SRC_URI[pyo3-0.22.2.sha256sum] =3D &quot;831e8e819a138c36e212f3af3fd9eeffe=
d6bf1510a805af35b0edee5ffa59433&quot;<br>
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D &quot;1e8730e591b14492a894=
5cdff32f089250b05f5accecf74aeddf9e8272ce1fa8&quot;<br>
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D &quot;5e97e919d2df92eb88ca80a037969=
f44e5e70356559654962cbb3316d00300c6&quot;<br>
+SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D &quot;eb57983022ad41f9e683a599f2=
fd13c3664d7063a3ac5714cae4b7bee7d3f206&quot;<br>
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D &quot;ec480c0c51ddec8101=
9531705acac51bcdbeae563557c982aa8263bb96880372&quot;<br>
+SRC_URI[python3-dll-a-0.2.10.sha256sum] =3D &quot;bd0b78171a90d808b319acfa=
d166c4790d9e9759bbc14ac8273fe133673dd41b&quot;<br>
+SRC_URI[quote-1.0.36.sha256sum] =3D &quot;0fa76aaf39101c457836aec0ce2316db=
dc3ab723cdda1c6bd4e6ad4208acaca7&quot;<br>
=C2=A0SRC_URI[rpds-1.1.0.sha256sum] =3D &quot;a0e15515d3ce3313324d842629ea4=
905c25a13f81953eadb88f85516f59290a4&quot;<br>
-SRC_URI[scopeguard-1.1.0.sha256sum] =3D &quot;d29ab0c6d3fc0ee92fe66e2d99f7=
00eab17a8d57d1c1d3b748380fb20baa78cd&quot;<br>
-SRC_URI[smallvec-1.11.0.sha256sum] =3D &quot;62bb4feee49fdd9f707ef802e2236=
5a35de4b7b299de4763d44bfea899442ff9&quot;<br>
=C2=A0SRC_URI[static_assertions-1.1.0.sha256sum] =3D &quot;a2eb9349b6444b32=
6872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f&quot;<br>
-SRC_URI[syn-2.0.32.sha256sum] =3D &quot;239814284fd6f1a4ffe4ca893952cdd93c=
224b6a1571c9a9eadd670295c0c9e2&quot;<br>
-SRC_URI[target-lexicon-0.12.9.sha256sum] =3D &quot;df8e77cb757a61f51b947ec=
4a7e3646efd825b73561db1c232a8ccb639e611a0&quot;<br>
-SRC_URI[triomphe-0.1.9.sha256sum] =3D &quot;0eee8098afad3fb0c54a9007aab680=
4558410503ad676d4633f9c2559a00ac0f&quot;<br>
-SRC_URI[unicode-ident-1.0.11.sha256sum] =3D &quot;301abaae475aa91687eb8251=
4b328ab47a211a533026cb25fc3e519b86adfc3c&quot;<br>
+SRC_URI[syn-2.0.69.sha256sum] =3D &quot;201fcda3845c23e8212cd466bfebf0bd20=
694490fc0356ae8e428e0824a915a6&quot;<br>
+SRC_URI[target-lexicon-0.12.14.sha256sum] =3D &quot;e1fc403891a21bcfb7c378=
34ba66a547a8f402146eba7265b5a6d88059c9ff2f&quot;<br>
+SRC_URI[triomphe-0.1.13.sha256sum] =3D &quot;e6631e42e10b40c0690bf92f404eb=
cfe6e1fdb480391d15f17cc8e96eeed5369&quot;<br>
+SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b9ac3fae1ff6755cb6db=
53683adb661634f67557942dea4facebec0fee4b&quot;<br>
=C2=A0SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58364ee=
906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
-SRC_URI[windows-targets-0.48.1.sha256sum] =3D &quot;05d4b17490f70499f20b9e=
791dcf6a299785ce8af4d709018206dc5b4953e95f&quot;<br>
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D &quot;91ae572e1b79db=
a883e0d315474df7305d12f569b400fcf90581b06062f7e1bc&quot;<br>
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D &quot;b2ef27e0d7bdfcfc7=
b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3&quot;<br>
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D &quot;622a1962a7db830d6fd0a=
69683c80a18fda201879f0f447f065a3b7467daa241&quot;<br>
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D &quot;4542c6e364ce21bf45d6=
9fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00&quot;<br>
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D &quot;ca2b8a661f7628cbd23=
440e50b05d705db3686f894fc9580820623656af974b1&quot;<br>
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D &quot;7896dbc1f41e088=
72e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953&quot;<br>
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D &quot;1a515f5799fe4961cb=
532f983ce2b23082366b898e52ffbce459c86f67c8378a&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py=
_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py_0.19.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.19.1.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py_=
0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.bb</=
a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py_0.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.19.1.bb</a>=
<br>
index f46df1115c..f6f7b390ad 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py_0.18.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py_0.19.1=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.19.1.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7767fa537c4=
596c54141f32882c4a984&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;dc48b479d540770c811fbd1eb9ba2bb66951863e448ef=
ec2e2c102625328e92f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;31dd5794837f00b46f4096aa8ccaa5972f73a938982e3=
2ed817bb520c465e520&quot;<br>
<br>
=C2=A0require ${BPN}-crates.inc<br>
<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div>

--000000000000b0aea5061ecee9e1--

