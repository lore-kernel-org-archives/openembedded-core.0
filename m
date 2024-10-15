Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2960DCFC287
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 10:36:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.10299.1728988601626591725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 03:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HpIer4BN;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e6f085715so1244752b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728988601; x=1729593401; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aROTTHmJQO8g82awoNa3oEg+7HLQr0Mqr/HkMfzWloQ=;
        b=HpIer4BNfoiqJ5cljAc6BzXynMCqJ5gVn1FN9cEmijeLHp2F9chRreRBEC0Aaa25FZ
         fZfJ5H68xXXnNFeVrrqylMK7iYUPeq+1YduRbRY/gunwP/u9BJwsIfKhEG3GcktJObGW
         +7L8Knl8TMnQ+wC5k+4DcLA0ttNjEhAZ0lKAb5E0lyDZ/k+xcwdB6Pt1elkTIXdKn10G
         g1llGyPbGgHF7w3mBpCkDkQCLl3+87POWo2UOluNQeJRS/Qgw+xVI82T25u3cvsJRGVQ
         T/2UMsnkRn2VmaK2Fdfv9N/dhD7KFcRCi2rIJxLzXezcTLrFde0WpBWCncquRZflBPDg
         CwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728988601; x=1729593401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aROTTHmJQO8g82awoNa3oEg+7HLQr0Mqr/HkMfzWloQ=;
        b=pk2Qk5WD3VOG0YKIKmw21pVs7f1wAFexRgv0lK8oWQJ0m7sulu15orQr49JJpv7Z6l
         ksHsa5aA+4RN9ebIMZg0Iw7AQt6ab3eo5pbm6795CuKxr3TTr2Bsjx4tcPOp0y2/IWQs
         VLpR6OZ08KTIidO0hl5Ju0NxBitpvtK73R9fQ1XmMHDmQ4/46drW8odzE0AS6q2T/DWZ
         RZhPYdDREuYVqCCgV0tBVubpRTP2rZMuCVMC1dt1sQQsGUTiNwi8PBYw1n7qxucMef86
         ohWODcktIMlL+jhG1yuA44e3UwHkNO+HW4smG+7BGAIHhanSd2eF3ih11OVcwixKifoB
         vmRQ==
X-Gm-Message-State: AOJu0YzVMhcqzidAKXiL6PfX+H7jBsEPBz11KSy4oPTRaF8tRsOQHUoJ
	xnuI5Ufap1pTcO5BrUvAzmIo6faf+R2hdHkSAL9sqjuNqLzTCClsjAVbMYRZ55NvCZb/xzUtE8W
	eI2y8YkLqYkFx6+fOuUzNfi1zQzs=
X-Google-Smtp-Source: AGHT+IEfs4caOC0F+9xOfiwICRUOZelJ7xCer2gctlml3i5ZE23GZKQ9aliyCsRmnqCvxLPSJAffRSPXiBQAKGQihMY=
X-Received: by 2002:a05:6a00:2e11:b0:71e:c0c:5996 with SMTP id
 d2e1a72fcca58-71e4c1512ccmr18923536b3a.7.1728988600476; Tue, 15 Oct 2024
 03:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241014221636.1276264-2-t.f.g.geelen@gmail.com> <CANNYZj-5txmYyWUAXZj5TUZ7EAq5bphCzNGCsB4bNhv2LFcPdg@mail.gmail.com>
In-Reply-To: <CANNYZj-5txmYyWUAXZj5TUZ7EAq5bphCzNGCsB4bNhv2LFcPdg@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Tue, 15 Oct 2024 12:36:30 +0200
Message-ID: <CAJo0Az4dP3H09-jcb3kEzK1jAa+M8HTpspJUO-zJ=R_3S6y5Rw@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v3] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a2aa006248187b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 10:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205804

--0000000000005a2aa006248187b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct, as discussed in the mail conversation on the previous iteration (
https://lists.openembedded.org/g/openembedded-core/message/205784) the
reproducibility issue will be tackled in a different patch.
Tom

On Tue, Oct 15, 2024, 10:05=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> This still doesn't include the reproducibility fix, and so can't be merge=
d.
>
> Alex
>
> On Tue, 15 Oct 2024 at 00:17, Tom Geelen via lists.openembedded.org
> <t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > python3-cryptography-vectors: upgrade 42.0.8 -> 43.0.1
> >
> > Changelog:
> > - https://cryptography.io/en/latest/changelog/#v43-0-0
> > - https://cryptography.io/en/latest/changelog/#v43-0-1
> >
> > Change build tool to use python3-maturin-native as specified in
> pyproject.toml file.
> > Performed linting on the recipe and removed packages from the ptest
> which are not required according to the included pyproject.toml.
> >
> > Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> > ---
> >  .../python/python3-cryptography-crates.inc    | 130 +++++++-----------
> >  ...=3D> python3-cryptography-vectors_43.0.1.bb} |   8 +-
> >  ...toml-remove-benchmark-disable-option.patch |   8 +-
> >  ....0.8.bb =3D> python3-cryptography_43.0.1.bb} |  61 ++++----
> >  4 files changed, 87 insertions(+), 120 deletions(-)
> >  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_42.0.8.bb =3D>
> python3-cryptography-vectors_43.0.1.bb} (75%)
> >  rename meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb =
=3D>
> python3-cryptography_43.0.1.bb} (73%)
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > index dbeda05dc4..319a47dabd 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > @@ -2,101 +2,71 @@
> >
> >  # from src/rust/Cargo.lock
> >  SRC_URI +=3D " \
> > -    crate://crates.io/asn1/0.15.5 \
> > -    crate://crates.io/asn1_derive/0.15.5 \
> > -    crate://crates.io/autocfg/1.1.0 \
> > -    crate://crates.io/base64/0.21.7 \
> > -    crate://crates.io/bitflags/1.3.2 \
> > -    crate://crates.io/bitflags/2.4.2 \
> > -    crate://crates.io/cc/1.0.83 \
> > +    crate://crates.io/asn1/0.16.2 \
> > +    crate://crates.io/asn1_derive/0.16.2 \
> > +    crate://crates.io/autocfg/1.3.0 \
> > +    crate://crates.io/base64/0.22.1 \
> > +    crate://crates.io/bitflags/2.6.0 \
> > +    crate://crates.io/cc/1.1.6 \
> >      crate://crates.io/cfg-if/1.0.0 \
> >      crate://crates.io/foreign-types/0.3.2 \
> >      crate://crates.io/foreign-types-shared/0.1.1 \
> > -    crate://crates.io/heck/0.4.1 \
> > -    crate://crates.io/indoc/2.0.4 \
> > -    crate://crates.io/libc/0.2.152 \
> > -    crate://crates.io/lock_api/0.4.11 \
> > -    crate://crates.io/memoffset/0.9.0 \
> > +    crate://crates.io/heck/0.5.0 \
> > +    crate://crates.io/indoc/2.0.5 \
> > +    crate://crates.io/libc/0.2.155 \
> > +    crate://crates.io/memoffset/0.9.1 \
> >      crate://crates.io/once_cell/1.19.0 \
> > -    crate://crates.io/openssl/0.10.64 \
> > +    crate://crates.io/openssl/0.10.66 \
> >      crate://crates.io/openssl-macros/0.1.1 \
> > -    crate://crates.io/openssl-sys/0.9.102 \
> > -    crate://crates.io/parking_lot/0.12.1 \
> > -    crate://crates.io/parking_lot_core/0.9.9 \
> > -    crate://crates.io/pem/3.0.3 \
> > -    crate://crates.io/pkg-config/0.3.29 \
> > -    crate://crates.io/portable-atomic/1.6.0 \
> > -    crate://crates.io/proc-macro2/1.0.78 \
> > -    crate://crates.io/pyo3/0.20.3 \
> > -    crate://crates.io/pyo3-build-config/0.20.3 \
> > -    crate://crates.io/pyo3-ffi/0.20.3 \
> > -    crate://crates.io/pyo3-macros/0.20.3 \
> > -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> > -    crate://crates.io/quote/1.0.35 \
> > -    crate://crates.io/redox_syscall/0.4.1 \
> > -    crate://crates.io/scopeguard/1.2.0 \
> > -    crate://crates.io/self_cell/1.0.3 \
> > -    crate://crates.io/smallvec/1.13.1 \
> > -    crate://crates.io/syn/2.0.48 \
> > -    crate://crates.io/target-lexicon/0.12.13 \
> > +    crate://crates.io/openssl-sys/0.9.103 \
> > +    crate://crates.io/pem/3.0.4 \
> > +    crate://crates.io/pkg-config/0.3.30 \
> > +    crate://crates.io/portable-atomic/1.7.0 \
> > +    crate://crates.io/proc-macro2/1.0.86 \
> > +    crate://crates.io/pyo3/0.22.2 \
> > +    crate://crates.io/pyo3-build-config/0.22.2 \
> > +    crate://crates.io/pyo3-ffi/0.22.2 \
> > +    crate://crates.io/pyo3-macros/0.22.2 \
> > +    crate://crates.io/pyo3-macros-backend/0.22.2 \
> > +    crate://crates.io/quote/1.0.36 \
> > +    crate://crates.io/self_cell/1.0.4 \
> > +    crate://crates.io/syn/2.0.71 \
> > +    crate://crates.io/target-lexicon/0.12.15 \
> >      crate://crates.io/unicode-ident/1.0.12 \
> >      crate://crates.io/unindent/0.2.3 \
> >      crate://crates.io/vcpkg/0.2.15 \
> > -    crate://crates.io/windows-targets/0.48.5 \
> > -    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> > -    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> > -    crate://crates.io/windows_i686_gnu/0.48.5 \
> > -    crate://crates.io/windows_i686_msvc/0.48.5 \
> > -    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> > -    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> > -    crate://crates.io/windows_x86_64_msvc/0.48.5 \
> >  "
> >
> > -SRC_URI[asn1-0.15.5.sha256sum] =3D
> "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
> > -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D
> "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
> > -SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > -SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> > -SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > -SRC_URI[bitflags-2.4.2.sha256sum] =3D
> "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
> > -SRC_URI[cc-1.0.83.sha256sum] =3D
> "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
> > +SRC_URI[asn1-0.16.2.sha256sum] =3D
> "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
> > +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D
> "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
> > +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> > +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> > +SRC_URI[bitflags-2.6.0.sha256sum] =3D
> "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
> > +SRC_URI[cc-1.1.6.sha256sum] =3D
> "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
> >  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> >  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
> >  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> > -SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> > -SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> > -SRC_URI[libc-0.2.152.sha256sum] =3D
> "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
> > -SRC_URI[lock_api-0.4.11.sha256sum] =3D
> "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
> > -SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> > +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> > +SRC_URI[indoc-2.0.5.sha256sum] =3D
> "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
> > +SRC_URI[libc-0.2.155.sha256sum] =3D
> "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
> > +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> >  SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
> > -SRC_URI[openssl-0.10.64.sha256sum] =3D
> "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
> > +SRC_URI[openssl-0.10.66.sha256sum] =3D
> "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
> >  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> > -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D
> "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
> > -SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> > -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
> > -SRC_URI[pem-3.0.3.sha256sum] =3D
> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
> > -SRC_URI[pkg-config-0.3.29.sha256sum] =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> > -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> > -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
> > -SRC_URI[pyo3-0.20.3.sha256sum] =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> > -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> > -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> > -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> > -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> > -SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
> > -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
> > -SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> > -SRC_URI[self_cell-1.0.3.sha256sum] =3D
> "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
> > -SRC_URI[smallvec-1.13.1.sha256sum] =3D
> "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
> > -SRC_URI[syn-2.0.48.sha256sum] =3D
> "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
> > -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D
> "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
> > +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D
> "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
> > +SRC_URI[pem-3.0.4.sha256sum] =3D
> "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
> > +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
> "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
> > +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D
> "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
> > +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> > +SRC_URI[pyo3-0.22.2.sha256sum] =3D
> "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
> > +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D
> "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
> > +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D
> "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
> > +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D
> "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
> > +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D
> "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
> > +SRC_URI[quote-1.0.36.sha256sum] =3D
> "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
> > +SRC_URI[self_cell-1.0.4.sha256sum] =3D
> "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
> > +SRC_URI[syn-2.0.71.sha256sum] =3D
> "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
> > +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D
> "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
> >  SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
> >  SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> >  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> > -SRC_URI[windows-targets-0.48.5.sha256sum] =3D
> "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
> > -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
> "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> > -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
> "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> > -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
> "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> > -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
> "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> > -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
> "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> > -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
> "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> > -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
> "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> > diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> > similarity index 75%
> > rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> > rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> > index 1256e75c47..7b8216b05e 100644
> > --- a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> > +++ b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> > @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> >  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
> >  #       Upgrade both recipes at the same time
> >
> > -SRC_URI[sha256sum] =3D
> "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
> > +SRC_URI[sha256sum] =3D
> "68a0fc18fe27b309e933a293a54f3356b78a14c15207e96c9ff85681af0509de"
> >
> >  PYPI_PACKAGE =3D "cryptography_vectors"
> >
> >  inherit pypi python_setuptools_build_meta
> >
> > -DEPENDS +=3D " \
> > +DEPENDS +=3D "\
> >      python3-cryptography \
> >  "
> >
> >  do_install:append () {
> > -       # Remove the sha256 checksum lines for pycache files
> > -       sed
> ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECOR=
D
> -e '/__pycache__/d' -i
> > +    # Remove the sha256 checksum lines for pycache files
> > +    sed
> ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECOR=
D
> -e '/__pycache__/d' -i
> >  }
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > index 3eed171ffe..907e462653 100644
> > ---
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > @@ -1,4 +1,4 @@
> > -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001
> > +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17 00:00:00 2001
> >  From: Mingli Yu <mingli.yu@windriver.com>
> >  Date: Tue, 17 May 2022 17:22:48 +0800
> >  Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
> > @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/pyproject.toml b/pyproject.toml
> > -index d2e304f..10aabcf 100644
> > +index e5b801d..985fc8c 100644
> >  --- a/pyproject.toml
> >  +++ b/pyproject.toml
> > -@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
> > -
> > +@@ -117,7 +117,7 @@ exclude =3D [
> > + ]
> >
> >   [tool.pytest.ini_options]
> >  -addopts =3D "-r s --capture=3Dno --strict-markers --benchmark-disable=
"
> > diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.8.b=
b
> b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> > similarity index 73%
> > rename from meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> > rename to meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> > index 3f70f910d4..784669cd01 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> > +++ b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> > @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> >                     "
> >  LDSHARED +=3D "-pthread"
> >
> > -SRC_URI[sha256sum] =3D
> "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
> > -
> > -SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> > -            file://check-memfree.py \
> > -            file://run-ptest \
> > -           "
> > -
> > -require ${BPN}-crates.inc
> > -
> > -inherit pypi python_setuptools3_rust cargo-update-recipe-crates
> pkgconfig
> > -
> > -DEPENDS +=3D " \
> > +DEPENDS +=3D "\
> >      python3-cffi-native \
> >  "
> >
> > -RDEPENDS:${PN} +=3D " \
> > -    python3-cffi \
> > -"
> > +SRC_URI[sha256sum] =3D
> "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
> >
> > -RDEPENDS:${PN}:append:class-target =3D " \
> > -    python3-numbers \
> > -    python3-threading \
> > +SRC_URI:append =3D " \
> > +    file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> > +    file://check-memfree.py \
> > +    file://run-ptest \
> >  "
> >
> > -RDEPENDS:${PN}-ptest +=3D " \
> > -    python3-bcrypt \
> > -    python3-cryptography-vectors (=3D ${PV}) \
> > -    python3-hypothesis \
> > -    python3-iso8601 \
> > -    python3-mmap \
> > -    python3-pretend \
> > -    python3-psutil \
> > -    python3-pytest \
> > -    python3-unittest-automake-output \
> > -    python3-pytest-subtests \
> > -    python3-pytz \
> > -"
> > +require ${BPN}-crates.inc
> > +
> > +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
> >
> >  inherit ptest
> >
> > @@ -60,8 +38,27 @@ do_install_ptest() {
> >      cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
> >  }
> >
> > -FILES:${PN}-dbg +=3D " \
> > +FILES:${PN}-dbg +=3D "\
> >      ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
> >  "
> >
> > +RDEPENDS:${PN} +=3D "\
> > +    python3-cffi \
> > +"
> > +
> > +RDEPENDS:${PN}:append:class-target =3D " \
> > +    python3-numbers \
> > +    python3-threading \
> > +"
> > +
> > +RDEPENDS:${PN}-ptest +=3D "\
> > +    python3-certifi \
> > +    python3-cryptography-vectors (=3D ${PV}) \
> > +    python3-mmap \
> > +    python3-pretend \
> > +    python3-pytest \
> > +    python3-pytest-subtests \
> > +    python3-unittest-automake-output \
> > +"
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#205795):
> https://lists.openembedded.org/g/openembedded-core/message/205795
> > Mute This Topic: https://lists.openembedded.org/mt/109011761/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005a2aa006248187b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><p dir=3D"ltr">Correct, as discussed in the mail con=
versation on the previous iteration (<a href=3D"https://lists.openembedded.=
org/g/openembedded-core/message/205784">https://lists.openembedded.org/g/op=
enembedded-core/message/205784</a>) the reproducibility issue will be tackl=
ed in a different patch.</p>Tom<br>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Oct 15, 2024, 10:05=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This still do=
esn&#39;t include the reproducibility fix, and so can&#39;t be merged.<br>
<br>
Alex<br>
<br>
On Tue, 15 Oct 2024 at 00:17, Tom Geelen via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">list=
s.openembedded.org</a><br>
&lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br>
&gt;<br>
&gt; python3-cryptography-vectors: upgrade 42.0.8 -&gt; 43.0.1<br>
&gt;<br>
&gt; Changelog:<br>
&gt; - <a href=3D"https://cryptography.io/en/latest/changelog/#v43-0-0" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://cryptograph=
y.io/en/latest/changelog/#v43-0-0</a><br>
&gt; - <a href=3D"https://cryptography.io/en/latest/changelog/#v43-0-1" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://cryptograph=
y.io/en/latest/changelog/#v43-0-1</a><br>
&gt;<br>
&gt; Change build tool to use python3-maturin-native as specified in pyproj=
ect.toml file.<br>
&gt; Performed linting on the recipe and removed packages from the ptest wh=
ich are not required according to the included pyproject.toml.<br>
&gt;<br>
&gt; Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">t.f.g.geelen@gmail.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 | 130 ++=
+++++-----------<br>
&gt;=C2=A0 ...=3D&gt; <a href=3D"http://python3-cryptography-vectors_43.0.1=
.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python3-cry=
ptography-vectors_43.0.1.bb</a>} |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 ...toml-remove-benchmark-disable-option.patch |=C2=A0 =C2=A08 +-=
<br>
&gt;=C2=A0 ....<a href=3D"http://0.8.bb" rel=3D"noreferrer noreferrer noref=
errer" target=3D"_blank">0.8.bb</a> =3D&gt; <a href=3D"http://python3-crypt=
ography_43.0.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">python3-cryptography_43.0.1.bb</a>} |=C2=A0 61 ++++----<br>
&gt;=C2=A0 4 files changed, 87 insertions(+), 120 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-c=
ryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" tar=
get=3D"_blank">python3-cryptography-vectors_42.0.8.bb</a> =3D&gt; <a href=
=3D"http://python3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer norefe=
rrer noreferrer" target=3D"_blank">python3-cryptography-vectors_43.0.1.bb</=
a>} (75%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-c=
ryptography_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">python3-cryptography_42.0.8.bb</a> =3D&gt; <a href=3D"http://python3=
-cryptography_43.0.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D=
"_blank">python3-cryptography_43.0.1.bb</a>} (73%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.=
inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; index dbeda05dc4..319a47dabd 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; @@ -2,101 +2,71 @@<br>
&gt;<br>
&gt;=C2=A0 # from src/rust/Cargo.lock<br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.15.5" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/asn1/0.15.5<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.15.5"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/asn1_=
derive/0.15.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/autocfg/1=
.1.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.7" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/base64/0.=
21.7</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/bitflags/=
1.3.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.4.2" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/bitflags/=
2.4.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.83" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">crates.io/cc/1.0.83</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.16.2" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/asn1/0.16.2<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.16.2"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/asn1_=
derive/0.16.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.3.0" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/autocfg/1=
.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.22.1" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/base64/0.=
22.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.6.0" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/bitflags/=
2.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.1.6" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">crates.io/cc/1.1.6</a> \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/cfg-if=
/1.0.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types/=
0.3.2" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io=
/foreign-types/0.3.2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types-=
shared/0.1.1" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">cr=
ates.io/foreign-types-shared/0.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/heck/0.4.1</a=
> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/indoc/2.0.4<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.152" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/libc/0.2.=
152</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.11" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/lock_api=
/0.4.11</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.0" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/memoffse=
t/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/heck/0.5.0</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.5" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/indoc/2.0.5<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.155" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/libc/0.2.=
155</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/memoffse=
t/0.9.1</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.19=
.0" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/on=
ce_cell/1.19.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.64" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/openssl/=
0.10.64</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.66" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/openssl/=
0.10.66</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-macros=
/0.1.1" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.i=
o/openssl-macros/0.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.102=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/open=
ssl-sys/0.9.102</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.12.1"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/parki=
ng_lot/0.12.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.9" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/p=
arking_lot_core/0.9.9</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.3" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pem/3.0.3</a> =
\<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.29" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pkg-co=
nfig/0.3.29</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.6=
.0" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/po=
rtable-atomic/1.6.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.78"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/proc-=
macro2/1.0.78</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.3" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pyo3/0.20.3<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.20.3" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io=
/pyo3-build-config/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.3" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pyo3-ffi=
/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.3"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pyo3-=
macros/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.20.3" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.=
io/pyo3-macros-backend/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.35" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/quote/1.0=
.35</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.4.1=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/redo=
x_syscall/0.4.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.2.0" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/scopegu=
ard/1.2.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.3" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/self_cel=
l/1.0.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.13.1" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/smallvec=
/1.13.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.48" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/syn/2.0.48</a=
> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.13" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/t=
arget-lexicon/0.12.13</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.103=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/open=
ssl-sys/0.9.103</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.4" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pem/3.0.4</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.30" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pkg-co=
nfig/0.3.30</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.7=
.0" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/po=
rtable-atomic/1.7.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.86"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/proc-=
macro2/1.0.86</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.22.2" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pyo3/0.22.2<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.22.2" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io=
/pyo3-build-config/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.22.2" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pyo3-ffi=
/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.22.2"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/pyo3-=
macros/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.22.2" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.=
io/pyo3-macros-backend/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.36" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/quote/1.0=
.36</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.4" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/self_cel=
l/1.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.71" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/syn/2.0.71</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.15" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/t=
arget-lexicon/0.12.15</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/=
1.0.12" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.i=
o/unicode-ident/1.0.12</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.2.3=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/unin=
dent/0.2.3</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vcpkg/0.2.15" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/vcpkg/=
0.2.15</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.4=
8.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/w=
indows-targets/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">cra=
tes.io/windows_aarch64_gnullvm/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates=
.io/windows_aarch64_msvc/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.=
48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/=
windows_i686_gnu/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0=
.48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io=
/windows_i686_msvc/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.i=
o/windows_x86_64_gnu/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crat=
es.io/windows_x86_64_gnullvm/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.5" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.=
io/windows_x86_64_msvc/0.48.5</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[asn1-0.15.5.sha256sum] =3D &quot;ae3ecbce89a22627b5e8e6e11d69=
715617138290289e385cde773b1fe50befdb&quot;<br>
&gt; -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D &quot;861af988fac460ac69a09=
f41e6217a8fb9178797b76fcc9478444be6a59be19c&quot;<br>
&gt; -SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b05=
3f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt; -SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2ccc13d763=
5fa0714f12c87adce1c75356b39ca9b7178567&quot;<br>
&gt; -SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7df=
d33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
&gt; -SRC_URI[bitflags-2.4.2.sha256sum] =3D &quot;ed570934406eb16438a4e976b=
1b4500774099c13b8cb96eec99f620f05090ddf&quot;<br>
&gt; -SRC_URI[cc-1.0.83.sha256sum] =3D &quot;f1174fb0b6ec23863f8b971027804a=
42614e347eafb0a95bf0b12cdae21fc4d0&quot;<br>
&gt; +SRC_URI[asn1-0.16.2.sha256sum] =3D &quot;532ceda058281b62096b2add4ab0=
0ab3a453d30dee28b8890f62461a0109ebbd&quot;<br>
&gt; +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D &quot;56e6076d38cc17cc22b0f=
65f31170a2ee1975e6b07f0012893aefd86ce19c987&quot;<br>
&gt; +SRC_URI[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74681c0ad21=
497610ce1b7c91b1022cd21c80c6fbdd9476b0&quot;<br>
&gt; +SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a8381aa12e40e=
3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
&gt; +SRC_URI[bitflags-2.6.0.sha256sum] =3D &quot;b048fb63fd8b5923fc5aa7b34=
0d8e156aec7ec02f0c78fa8a6ddc2613f6f71de&quot;<br>
&gt; +SRC_URI[cc-1.1.6.sha256sum] =3D &quot;2aba8f4e9906c7ce3c73463f62a7f0c=
65183ada1a2d47e397cc8810827f9694f&quot;<br>
&gt;=C2=A0 SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619=
e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt;=C2=A0 SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339eb8adc052=
cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
&gt;=C2=A0 SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot;00b02284=
11908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
&gt; -SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb028156=
0f54b440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
&gt; -SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4=
797e342f988cecda4fb6c939150f96315fd8&quot;<br>
&gt; -SRC_URI[libc-0.2.152.sha256sum] =3D &quot;13e3bf6590cbc649f4d1a3eefc9=
d5d6eb746f5200ffb04e5e142700b8faa56e7&quot;<br>
&gt; -SRC_URI[lock_api-0.4.11.sha256sum] =3D &quot;3c168f8615b12bc01f9c17e2=
eb0cc07dcae1940121185446edc3744920e8ef45&quot;<br>
&gt; -SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a95585bd15607c=
6ab0c4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
&gt; +SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3=
b60a884b5d30c0fca7d82fe33449bbe55ea&quot;<br>
&gt; +SRC_URI[indoc-2.0.5.sha256sum] =3D &quot;b248f5224d1d606005e02c97f5aa=
4e88eeb230488bcc03bc9ca4d7991399f2b5&quot;<br>
&gt; +SRC_URI[libc-0.2.155.sha256sum] =3D &quot;97b3888a4aecf77e811145cadf6=
eef5901f4782c53886191b2f693f24761847c&quot;<br>
&gt; +SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092=
f6cb448677611ce4449e970ceaf42695203f218a&quot;<br>
&gt;=C2=A0 SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b2476b595f93=
58c5161aa467c2438859caa136dec86c26fdd2efe17b92&quot;<br>
&gt; -SRC_URI[openssl-0.10.64.sha256sum] =3D &quot;95a0481286a310808298130d=
22dd1fef0fa571e05a8f44ec801801e84b216b1f&quot;<br>
&gt; +SRC_URI[openssl-0.10.66.sha256sum] =3D &quot;9529f4786b70a3e8c61e1117=
9af17ab6188ad8d0ded78c5529441ed39d4bd9c1&quot;<br>
&gt;=C2=A0 SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f=
465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
&gt; -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D &quot;c597637d56fbc83893a3=
5eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2&quot;<br>
&gt; -SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06bc9fff=
0a37ff4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
&gt; -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a9226546d68ac=
dd9c0a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
&gt; -SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64beda2d3b462=
595dd2753e3f268d89c5aae77e8cf2c310&quot;<br>
&gt; -SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305130c13ddd=
391e0ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
&gt; -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef9988bc169ba1=
6dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
&gt; -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d89c99f8f3e=
6b88a9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
&gt; -SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d45cc287af5=
f32ffadd5f4761438b527b055fb0d4bb8233&quot;<br>
&gt; -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa5745de3f523=
1ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
&gt; -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d4ef1f6e85=
a2ed422eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
&gt; -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01b8055ec95=
e484a6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
&gt; -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e9b68bb9c3=
149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
&gt; -SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf503a6466c=
5d5251535d108ee747472c3977cc5acc868ef&quot;<br>
&gt; -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff46b75989d=
d134e5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
&gt; -SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109f92c262ed=
2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
&gt; -SRC_URI[self_cell-1.0.3.sha256sum] =3D &quot;58bf37232d3bb9a2c4e641ca=
2a11d83b5062066f88df7fed36c28772046d65ba&quot;<br>
&gt; -SRC_URI[smallvec-1.13.1.sha256sum] =3D &quot;e6ecd384b10a64542d77071b=
d64bd7b231f4ed5940fba55e98c3de13824cf3d7&quot;<br>
&gt; -SRC_URI[syn-2.0.48.sha256sum] =3D &quot;0f3531638e407dfc0814761abb7c0=
0a5b54992b849452a0646b7f65c9f770f3f&quot;<br>
&gt; -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D &quot;69758bda2e78f098e=
4ccb393021a0963bb3442eac05f135c30f61b7370bbafae&quot;<br>
&gt; +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D &quot;7f9e8deee91df40a943c=
71b917e5874b951d32a802526c85721ce3b776c929d6&quot;<br>
&gt; +SRC_URI[pem-3.0.4.sha256sum] =3D &quot;8e459365e590736a54c3fa561947c8=
4837534b8e9af6fc5bf781307e82658fae&quot;<br>
&gt; +SRC_URI[pkg-config-0.3.30.sha256sum] =3D &quot;d231b230927b5e4ad203db=
57bbcbee2802f6bce620b1e4a9024a07d94e2907ec&quot;<br>
&gt; +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D &quot;da544ee218f0d287a9=
11e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265&quot;<br>
&gt; +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665df0d1c8fb=
fd238015744736151d4445ec0836b8e628aae103b77&quot;<br>
&gt; +SRC_URI[pyo3-0.22.2.sha256sum] =3D &quot;831e8e819a138c36e212f3af3fd9=
eeffed6bf1510a805af35b0edee5ffa59433&quot;<br>
&gt; +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D &quot;1e8730e591b1449=
2a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8&quot;<br>
&gt; +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D &quot;5e97e919d2df92eb88ca80a0=
37969f44e5e70356559654962cbb3316d00300c6&quot;<br>
&gt; +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D &quot;eb57983022ad41f9e683a=
599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206&quot;<br>
&gt; +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D &quot;ec480c0c51dde=
c81019531705acac51bcdbeae563557c982aa8263bb96880372&quot;<br>
&gt; +SRC_URI[quote-1.0.36.sha256sum] =3D &quot;0fa76aaf39101c457836aec0ce2=
316dbdc3ab723cdda1c6bd4e6ad4208acaca7&quot;<br>
&gt; +SRC_URI[self_cell-1.0.4.sha256sum] =3D &quot;d369a96f978623eb3dc28807=
c4852d6cc617fed53da5d3c400feff1ef34a714a&quot;<br>
&gt; +SRC_URI[syn-2.0.71.sha256sum] =3D &quot;b146dcf730474b4bcd16c311627b3=
1ede9ab149045db4d6088b3becaea046462&quot;<br>
&gt; +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D &quot;4873307b7c257eddc=
b50c9bedf158eb669578359fb28428bef438fec8e6ba7c2&quot;<br>
&gt;=C2=A0 SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b9ac3fae1f=
f6755cb6db53683adb661634f67557942dea4facebec0fee4b&quot;<br>
&gt;=C2=A0 SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58=
364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
&gt;=C2=A0 SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe230=
66fb0957d48ef677f6eeb8215f372f52e48bb32426&quot;<br>
&gt; -SRC_URI[windows-targets-0.48.5.sha256sum] =3D &quot;9a2fa6e2155d7247b=
e68c096456083145c183cbbbc2764150dda45a87197940c&quot;<br>
&gt; -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D &quot;2b38e32f0=
abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8&quot;<br>
&gt; -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D &quot;dc35310971f3=
b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc&quot;<br>
&gt; -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D &quot;a75915e7def60c94=
dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e&quot;<br>
&gt; -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D &quot;8f55c233f70c4b2=
7f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406&quot;<br>
&gt; -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D &quot;53d40abd2583d2=
3e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e&quot;<br>
&gt; -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D &quot;0b7b527678=
68a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc&quot;<br>
&gt; -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D &quot;ed94fce61571a=
4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" targ=
et=3D"_blank">python3-cryptography-vectors_42.0.8.bb</a> b/meta/recipes-dev=
tools/python/<a href=3D"http://python3-cryptography-vectors_43.0.1.bb" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python3-cryptograph=
y-vectors_43.0.1.bb</a><br>
&gt; similarity index 75%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-cry=
ptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" targe=
t=3D"_blank">python3-cryptography-vectors_42.0.8.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography-vectors_43.0.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">python3-cryptography-vectors_43.0.1.bb</a><br>
&gt; index 1256e75c47..7b8216b05e 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">python3-cryptography-vectors_42.0.8.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy-vectors_43.0.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">python3-cryptography-vectors_43.0.1.bb</a><br>
&gt; @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c36=
17db4fb6fae01f1d253ab91511e4 \<br>
&gt;=C2=A0 # NOTE: Make sure to keep this recipe at the same version as pyt=
hon3-cryptography<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same tim=
e<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;df5657367bc0a90c374309cb261009a2c53cae91=
a458781339a0f724f819a46a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;68a0fc18fe27b309e933a293a54f3356b78a14c1=
5207e96c9ff85681af0509de&quot;<br>
&gt;<br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pypi python_setuptools_build_meta<br>
&gt;<br>
&gt; -DEPENDS +=3D &quot; \<br>
&gt; +DEPENDS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-cryptography \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 do_install:append () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the sha256 checksum lines for pyc=
ache files<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptog=
raphy_vectors-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
&gt; +=C2=A0 =C2=A0 # Remove the sha256 checksum lines for pycache files<br=
>
&gt; +=C2=A0 =C2=A0 sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors=
-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-py=
project.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/=
python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-op=
tion.patch<br>
&gt; index 3eed171ffe..907e462653 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject=
.toml-remove-benchmark-disable-option.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject=
.toml-remove-benchmark-disable-option.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">mingli.yu@windriver.com</a>&=
gt;<br>
&gt;=C2=A0 Date: Tue, 17 May 2022 17:22:48 +0800<br>
&gt;=C2=A0 Subject: [PATCH] pyproject.toml: remove --benchmark-disable opti=
on<br>
&gt; @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ti=
m.orling@konsulko.com" rel=3D"noreferrer noreferrer" target=3D"_blank">tim.=
orling@konsulko.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; -index d2e304f..10aabcf 100644<br>
&gt; +index e5b801d..985fc8c 100644<br>
&gt;=C2=A0 --- a/pyproject.toml<br>
&gt;=C2=A0 +++ b/pyproject.toml<br>
&gt; -@@ -92,7 +92,7 @@ rust-version =3D &quot;&gt;=3D1.63.0&quot;<br>
&gt; -<br>
&gt; +@@ -117,7 +117,7 @@ exclude =3D [<br>
&gt; + ]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0[tool.pytest.ini_options]<br>
&gt;=C2=A0 -addopts =3D &quot;-r s --capture=3Dno --strict-markers --benchm=
ark-disable&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">python3-cryptography_42.0.8.bb</a> b/meta/recipes-devtools/python/<a =
href=3D"http://python3-cryptography_43.0.1.bb" rel=3D"noreferrer noreferrer=
 noreferrer" target=3D"_blank">python3-cryptography_43.0.1.bb</a><br>
&gt; similarity index 73%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-cry=
ptography_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bl=
ank">python3-cryptography_42.0.8.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography_43.0.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">python3-cryptography_43.0.1.bb</a><br>
&gt; index 3f70f910d4..784669cd01 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy_42.0.8.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">p=
ython3-cryptography_42.0.8.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy_43.0.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">p=
ython3-cryptography_43.0.1.bb</a><br>
&gt; @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c36=
17db4fb6fae01f1d253ab91511e4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;=C2=A0 LDSHARED +=3D &quot;-pthread&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;8d09d05439ce7baa8e9e95b07ec5b6c886f548de=
b7e0f69ef25f64b3bce842f2&quot;<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-disabl=
e-option.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-memfree.py \<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -require ${BPN}-crates.inc<br>
&gt; -<br>
&gt; -inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgco=
nfig<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot; \<br>
&gt; +DEPENDS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-cffi-native \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -RDEPENDS:${PN} +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 python3-cffi \<br>
&gt; -&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;203e92a75716d8cfb491dc47c79e17d0d9207ccf=
fcbcb35f598fbe463ae3444d&quot;<br>
&gt;<br>
&gt; -RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 python3-numbers \<br>
&gt; -=C2=A0 =C2=A0 python3-threading \<br>
&gt; +SRC_URI:append =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 file://0001-pyproject.toml-remove-benchmark-disable-opt=
ion.patch \<br>
&gt; +=C2=A0 =C2=A0 file://check-memfree.py \<br>
&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 python3-bcrypt \<br>
&gt; -=C2=A0 =C2=A0 python3-cryptography-vectors (=3D ${PV}) \<br>
&gt; -=C2=A0 =C2=A0 python3-hypothesis \<br>
&gt; -=C2=A0 =C2=A0 python3-iso8601 \<br>
&gt; -=C2=A0 =C2=A0 python3-mmap \<br>
&gt; -=C2=A0 =C2=A0 python3-pretend \<br>
&gt; -=C2=A0 =C2=A0 python3-psutil \<br>
&gt; -=C2=A0 =C2=A0 python3-pytest \<br>
&gt; -=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
&gt; -=C2=A0 =C2=A0 python3-pytest-subtests \<br>
&gt; -=C2=A0 =C2=A0 python3-pytz \<br>
&gt; -&quot;<br>
&gt; +require ${BPN}-crates.inc<br>
&gt; +<br>
&gt; +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig<br>
&gt;<br>
&gt;=C2=A0 inherit ptest<br>
&gt;<br>
&gt; @@ -60,8 +38,27 @@ do_install_ptest() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES:${PN}-dbg +=3D &quot; \<br>
&gt; +FILES:${PN}-dbg +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindi=
ngs/.debug \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 python3-cffi \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 python3-numbers \<br>
&gt; +=C2=A0 =C2=A0 python3-threading \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 python3-certifi \<br>
&gt; +=C2=A0 =C2=A0 python3-cryptography-vectors (=3D ${PV}) \<br>
&gt; +=C2=A0 =C2=A0 python3-mmap \<br>
&gt; +=C2=A0 =C2=A0 python3-pretend \<br>
&gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt; +=C2=A0 =C2=A0 python3-pytest-subtests \<br>
&gt; +=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#205795): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/205795" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/205795</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10901176=
1/1686489" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https=
://lists.openembedded.org/mt/109011761/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-cor=
e+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto=
:alex.kanavin@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">al=
ex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</div></div>

--0000000000005a2aa006248187b9--

