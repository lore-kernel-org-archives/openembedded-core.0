Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9539CC25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 13:38:37 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.6671.1661002713696775161
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Aug 2022 06:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRXVjN1S;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-33387bf0c4aso186007687b3.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Aug 2022 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Zern6ztm0nkSVPjbg8/UYIb+IvqI43z5Mt6cfZkSafo=;
        b=IRXVjN1SFkGjcrBv8mM7KPRG9RQ0E7GuA10byFS47SWbcHGb7DgbIGUxCW9zE8o/MV
         zG7tCM+E5De45Wec/uluQyaYUuxktxP2xbJy5bZCqGbMtovP17pcyJBKarUxffBjfZ7Z
         zg/PEaRbJD7HQBT8cE2ldjVaF/2mLL8qFRGOp/5x/KA9b4dCG1l72ICLIPBME+ZN7Uhm
         wTXQ6cIQ05+nO0R4JUMAQVw7ujH2YmdZNcsPoqKYDqKUtwT5oIl8nFhUoR/9Dj7Q+xjo
         DhBmmplUSD451PX+JoaM/rc7L6LrwHMj1AEEmqaDysugr3v8JR5o2h8hkO50sYQ86Tpb
         uRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Zern6ztm0nkSVPjbg8/UYIb+IvqI43z5Mt6cfZkSafo=;
        b=0GrQ6JLNTKZJmCMLxIEy7B7UwPG9W2YcZ/S9iKsjMP90sv/FteWRuV1uqnttZArGHD
         Tj7EB7zEDFgBzh/H3Zomm4Cx5Whhth+UBluxS2tJG3C+FMQ+JEDYtpi1FRGgIAKs7OyF
         9KGxQFpm0B26iroihhCbyb73xThxgtrgHCgJRWfvpNj38VUBb0If9vuZIPO6b2M7odXE
         obDd45K+ckmZPQ52n9CP4vOs79BtTGnRL+K04DjjqDxKIhHcFqtjBHMwc8J9IcV/gLh9
         j58OXIIy94yFi+F5ipuGS5MRiWt9NfMbVnvGtccJc1uX/vxMd9Rwk8ubsx+LA7sNHNFy
         rbiA==
X-Gm-Message-State: ACgBeo1zB6zGCFAlFOkul85fHE9Z5Lj/s2SHImtUp5PZ/tBQR6cVxbP5
	/dde2O+XIMjwmMt320G8TVplruujCXidqRyYqtafJ11ZL5o=
X-Google-Smtp-Source: 
 AA6agR6CsMtit5E5bu5dZpVbPU1wudZC8M+1+I+Q1JIxs5fNCpgdM1hqBTqv7boHWN4QmQgoyhkIh4aO9jjiuVv+pEY=
X-Received: by 2002:a25:b986:0:b0:671:a73:1ea6 with SMTP id
 r6-20020a25b986000000b006710a731ea6mr11517028ybg.405.1661002711660; Sat, 20
 Aug 2022 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220819185820.2228115-1-raj.khem@gmail.com>
 <YwDUuCp8REV4Tdq3@mail.local>
In-Reply-To: <YwDUuCp8REV4Tdq3@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2022 06:38:04 -0700
Message-ID: 
 <CAMKF1so_zz44DtqZQM3VHd=TQjEqn5b3NJdyVEzjdbvG0+QeVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Fix build failure on riscv
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Aug 2022 13:38:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169649

On Sat, Aug 20, 2022 at 5:34 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Khem,
>
> Can you rebase on my master-next, I'm carrying an update to rust 1.63
> which conflicts with this change?
>

I see, yeah I will cherry pick the rust update and rebase this patch,
I guess that should do it.

> On 19/08/2022 11:58:20-0700, Khem Raj wrote:
> > Latest rust has started using ENOTSUP define, which is not available in
> > the older libc that current release of compiler is using therefore
> > backport the needed patches. Eventually when vendored version of libc
> > bumps to 1.33+ we should not need this patch.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust-source.inc    |  5 +++-
> >  ...dd-ENOTSUP-constant-for-riscv32-musl.patch | 26 ++++++++++++++++++
> >  ...dd-ENOTSUP-constant-for-riscv64-musl.patch | 27 +++++++++++++++++++
> >  3 files changed, 57 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-co=
nstant-for-riscv32-musl.patch
> >  create mode 100644 meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-co=
nstant-for-riscv64-musl.patch
> >
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> > index dbcef2cbc2..77198ad038 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -1,7 +1,10 @@
> >  SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz=
;name=3Drust"
> >  SRC_URI[rust.sha256sum] =3D "02066a93c2f6596cc046a897d5716c86e3607c1cd=
0f54db9a867ae8c8265072e"
> >
> > -SRC_URI:append:class-target:pn-rust =3D " file://hardcodepaths.patch"
> > +SRC_URI:append:class-target:pn-rust =3D " \
> > +    file://hardcodepaths.patch \
> > +    file://0001-Add-ENOTSUP-constant-for-riscv64-musl.patch \
> > +    file://0001-Add-ENOTSUP-constant-for-riscv32-musl.patch"
> >  SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcode=
paths.patch"
> >
> >  RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
> > diff --git a/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-constant-=
for-riscv32-musl.patch b/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-c=
onstant-for-riscv32-musl.patch
> > new file mode 100644
> > index 0000000000..f4e49a838d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-constant-for-ris=
cv32-musl.patch
> > @@ -0,0 +1,26 @@
> > +From e9fb036eeffaaa5cb7b1e6fc1dabb92ed6263f0f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 19 Aug 2022 10:26:43 -0700
> > +Subject: [PATCH] Add ENOTSUP constant for riscv32/musl
> > +
> > +Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/288=
4]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + vendor/libc/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +--- a/vendor/libc/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
> > ++++ b/vendor/libc/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
> > +@@ -271,6 +271,7 @@ pub const ENOPROTOOPT: ::c_int =3D 92;
> > + pub const EPROTONOSUPPORT: ::c_int =3D 93;
> > + pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
> > + pub const EOPNOTSUPP: ::c_int =3D 95;
> > ++pub const ENOTSUP: ::c_int =3D EOPNOTSUPP;
> > + pub const EPFNOSUPPORT: ::c_int =3D 96;
> > + pub const EAFNOSUPPORT: ::c_int =3D 97;
> > + pub const EADDRINUSE: ::c_int =3D 98;
> > +--- a/vendor/libc/.cargo-checksum.json
> > ++++ b/vendor/libc/.cargo-checksum.json
> > +@@ -1 +1 @@
> > +-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa515=
9b619ce09555c779e1fb586b","Cargo.toml":"283d7068d58932d9959db0f119fa6874b06=
934a99375abd1096b468c9ee4f04a","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f13328=
82fbb00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"41f9743021d9e=
5ed74ede55c94057cf6867a322a13b25a5d524b966656a08e38","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42=
da99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"bc8c46531bd1a2429f=
36aaf2bc137b50e42505b798de83f34eecfa94ad89179b","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585225=
5ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefe=
ed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bf=
a8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"3f13d5f9b29=
d8969dde507661f1637524e21fe3bd34957fc778868f2f3713c46","src/macros.rs":"148=
cf62f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs"=
:"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sg=
x.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","s=
rc/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37=
a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb4=
8d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12=
856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a79287899=
26e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef=
7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/=
b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92=
b4b4859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2e=
af0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/b=
sd/apple/b64/aarch64/mod.rs":"a3f0dfff62d0f7f4f1b5f9a4e2b662acf233a46badbc5=
419d3cc2d735629a710","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2=
d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.=
rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src=
/unix/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba=
5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5=
855038aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/a=
pple/mod.rs":"d7155927fbd1af6dd984a4c6c1a735a5932af828c96818209487eb6ae72d7=
d7e","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d91=
92cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragon=
fly/mod.rs":"baf5161c9ee8a61131d3b25927960dc49eeaafe6e8cae508787838386bc914=
aa","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9b=
e738ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd=
/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b=
0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/free=
bsd/freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda3347=
6c37a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f=
8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd12/mod.rs":"266fe364867d858610b51a950e936fb10c7990f=
5e627cd59f7947f4b232ab259","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_=
64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","=
src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b=
686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebs=
d/freebsd13/mod.rs":"12bf5c9aef74d43005aca762a48c2c6d64c21d138bd789b20f7143=
fc20a6db95","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7=
f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f2=
5c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod=
.rs":"fdbc49a641a247aabb6e725647826bc5341447d9bff1319bfe092ba5fcda7b26","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cf=
b4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freeb=
sd/mod.rs":"6aa766a4693aa14f3ed2f6bcbba6c42ba34a9aea7baea0bc3600faab367ef02=
2","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d7=
6a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/=
powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a5462=
8a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64=
365f8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freeb=
sd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c=
5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b=
1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/fre=
ebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0=
e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"a7345cc3fb7372572efe06848feb=
2cc246dfc2c2a0cc9ccf434f4c55041a59fa","src/unix/bsd/mod.rs":"7720ec82c9334f=
988ec4b271784768a017c3dc2e6dfae4d02418eef753388aa7","src/unix/bsd/netbsdlik=
e/mod.rs":"3f246d482e31e9dad99790cabca8749a9231c2a686d789379f5d34ac95b10652=
","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3=
eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.r=
s":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/=
unix/bsd/netbsdlike/netbsd/mod.rs":"8826303cad14a575fa8189f67c7df52a7e11f8e=
ea0381d7d389ff8206757de9e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7=
ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bs=
d/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a4=
5cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e3=
6bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbs=
dlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c=
899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7=
ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdli=
ke/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ce=
d729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d=
9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/ope=
nbsd/mod.rs":"ef82f9db83f85abac7f5e3d91b7be2650c52a283611add66022fdaa462f9b=
055","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d9=
82181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/=
powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2=
c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffde=
eaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd=
/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4=
085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd8=
6570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_=
64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","=
src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95=
dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa2635=
3f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d5833ff9b94daa81d24=
70df544453212af17530d78c5a7fb912eac915d00f329","src/unix/haiku/native.rs":"=
dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix=
/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f=
043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae1=
0ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4=
b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs"=
:"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/un=
ix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e=
00150063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b98=
530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_=
like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4c=
f31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd=
3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux=
_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2fa=
f6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128=
.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","sr=
c/unix/linux_like/android/b64/aarch64/mod.rs":"ef230d49fd0d182adf2dae6f8e10=
babf18d72259d65980bf1c4c2dc8a4f84501","src/unix/linux_like/android/b64/mod.=
rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src=
/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9f=
da5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_=
64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d21215878c95fe07c1=
9","src/unix/linux_like/android/mod.rs":"18ea827764ec6ad330314df3a94b21de77=
849ced3d8a107348079fdd1913f591","src/unix/linux_like/emscripten/align.rs":"=
86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix=
/linux_like/emscripten/mod.rs":"b71d37106750f57bc2dae4e9bcb473ff098ef482358=
27e41a1687a39825f0aa4","src/unix/linux_like/emscripten/no_align.rs":"0128e4=
aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux=
_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93a8d02=
641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"e20013ed91ed=
cfb7f84f3f9f5a9ef827fd5c406e24b65989d8438da332236ef6","src/unix/linux_like/=
linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43=
adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1=
500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/=
arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206=
a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd=
8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/lin=
ux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a=
7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae9=
9fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linu=
x/gnu/b32/arm/mod.rs":"92ea7edc0e24f79dfbf5e3efc2d7509bed230562036e6aa85ef4=
f2c8088ecc8f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a=
9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_lik=
e/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214d1ae7=
d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429=
fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/li=
nux_like/linux/gnu/b32/mips/mod.rs":"0d7849eb2435ec1f49b6774872a0518f0129c5=
0f37c9d38b37b1535722777a22","src/unix/linux_like/linux/gnu/b32/mod.rs":"8da=
281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/unix/li=
nux_like/linux/gnu/b32/powerpc.rs":"049d6211ba4a9304bd4497c160bc21ae847c24e=
0528dd9d76263f16192e6aff5","src/unix/linux_like/linux/gnu/b32/riscv32/align=
.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","sr=
c/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"a4256148cec0bb672c8dfa6058=
66930d9761af9655721de72ae41eeeb8fdbf6d","src/unix/linux_like/linux/gnu/b32/=
sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bc=
ca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"525618615aa0cb80c=
6c90860bf579dfed8db307fffd56b97dc235fb945419434","src/unix/linux_like/linux=
/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fb=
c47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"78b403885298=
6436888c63be9258037cf642124daee9d5fa5cef2bf8e412bf54","src/unix/linux_like/=
linux/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/u=
nix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f=
09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/=
aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff=
62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c4e20b1c63d7a0=
3a6e22aef2046689ef95cc4651011ade7cb94176fcea1dc252","src/unix/linux_like/li=
nux/gnu/b64/loongarch64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306d=
c0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/loongarch64/mo=
d.rs":"387808d5398b24339e7e2bf7591150735011befc5b421fa713d7017c04a7b1da","s=
rc/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719a=
ec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b6=
4/mips64/mod.rs":"17aad16329431d83e1909e3a08022f6e28f4bcba7dec4a967fe1a321a=
6a43b99","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31=
a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/=
b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83=
f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"97e0e=
cf11ecce793a13fec39654fb513c5479edf7faa7a276fa714b61993d0fc","src/unix/linu=
x_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a2=
2e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/m=
od.rs":"b3fe290afe63d2d6e315d0cf1f775464e9c1f2a1906d243c1af74a137a4031cb","=
src/unix/linux_like/linux/gnu/b64/s390x.rs":"254f00266ecf9644a4b469457cb37c=
4dd6c055820926c1de0fb9035b6048e75c","src/unix/linux_like/linux/gnu/b64/spar=
c64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f12681=
30d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"87dd7f3d5bf3c09f4=
064ec738e306cc9cc41ad49b4a5df62c5983301c3bbf99a","src/unix/linux_like/linux=
/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc=
1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"1b939a=
af3cdf3efc7d3bd53e83e80235530d3ba0c24bb7611d4730d35d457ec1","src/unix/linux=
_like/linux/gnu/b64/x86_64/not_x32.rs":"b88ef8a1eaa9ed73bf2acb8192afb73af98=
7a92abb94140c6376fc83f2fa5553","src/unix/linux_like/linux/gnu/b64/x86_64/x3=
2.rs":"79305936a60d342efdc10519ba89507d6b48e65f13f33090d3b04dc9655ceed0","s=
rc/unix/linux_like/linux/gnu/mod.rs":"9b8eb3b02d41e72c6df87e34c2f7b78ff21d8=
007f888c9598c3aac8f71ab4c5d","src/unix/linux_like/linux/gnu/no_align.rs":"9=
cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/=
linux_like/linux/mod.rs":"cef218c2cc9ef9d83506249b15189290fb647bfdc6638d739=
89a155a83bd1d18","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac05=
2c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_=
like/linux/musl/b32/arm/mod.rs":"e5faee8efda8a225ea0b17d4d6f9e893a678e73773=
fa62c549a8e19c106b9f04","src/unix/linux_like/linux/musl/b32/hexagon.rs":"22=
6a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/l=
inux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d=
360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mo=
d.rs":"df8f8b529a6cc6b8a7326639e83303cf1320c6c50d76517c17d42bcf45f6240a","s=
rc/unix/linux_like/linux/musl/b32/mod.rs":"7b3d9dfd8605b00bb9b5fa1439abe5eb=
f60199c7fa033eee555e8d181e93ffa2","src/unix/linux_like/linux/musl/b32/power=
pc.rs":"c957d99a4d4371d2411a5769be8cf344516bf9ddc1011f977501a4eb57cb4e82","=
src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547=
903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/mus=
l/b32/riscv32/mod.rs":"698f77bfcc838f82126c54f7387881fe3e89490117e5a4f333d1=
b4433823a672","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd74=
35d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_lik=
e/linux/musl/b32/x86/mod.rs":"199a91e90b454f9dc32770d5204cc4f6e5b8f144e0e34=
a1c91829949d6e804b3","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":=
"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/uni=
x/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f0=
9724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/=
aarch64/mod.rs":"9c4878df0fea0e0affd85346e0bc191abdc5e41e74dc9199b5644ec33d=
29c300","src/unix/linux_like/linux/musl/b64/mips64.rs":"3686fc8cb2e311cda8e=
6b96f6dfe90b65a366714bd480312b692b1a6ca1241b6","src/unix/linux_like/linux/m=
usl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e55cd53=
3fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"36694cbdcdc33879=
e00502d55cb95eaa0096d213538993dd39c3da800cdd06d1","src/unix/linux_like/linu=
x/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99=
cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"3=
6621aca8ecf714f8dd42662dc2997833d95b9f129ef8c220503362e21efd695","src/unix/=
linux_like/linux/musl/b64/s390x.rs":"9b05b1fae6bcb7cb6d909b9973977fde016841=
75f3e26c27dcb44223cc3933d9","src/unix/linux_like/linux/musl/b64/x86_64/alig=
n.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","s=
rc/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"238789097a26abc8b7cd578ed=
1a8e6cb8672083054303902781983902cd66854","src/unix/linux_like/linux/musl/mo=
d.rs":"9d1f77945b00c294ad0759749f976bc6ccbc07386af1c90f44443a746df47b28","s=
rc/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae6a982=
ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustive.rs"=
:"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/un=
ix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67=
366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs=
":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/u=
nix/linux_like/linux/uclibc/arm/mod.rs":"a056bbf718ddd775519058706bdb4909b5=
6e6256985869e3c3132aa8ec5faca0","src/unix/linux_like/linux/uclibc/arm/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d6=
12c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/=
uclibc/mips/mips32/mod.rs":"b84def53a49587e87f884c2bc28b21b290463b00b52e1d0=
309f2ba233a5b4a99","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fa=
d83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclib=
c/mips/mips64/mod.rs":"256a428290a560163ef7dc7d18b27bd3c6ce9748a0f28d5dc7f8=
2203ee228220","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4=
a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/=
linux_like/linux/uclibc/mips/mod.rs":"367ec5483ad317e6ccba1ac0888da6cf088a8=
d32689214cc8d16129aa692260c","src/unix/linux_like/linux/uclibc/mod.rs":"ddd=
223d4f574b2b92072bbdab091f12d8d89d5e05f41076ddfa6bc6af379698f","src/unix/li=
nux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b939=
6e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs=
":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/u=
nix/linux_like/linux/uclibc/x86_64/mod.rs":"bf6985e901041a61e90ccee1296b35a=
4c62ef90aa528d31989e1d647f072e79a","src/unix/linux_like/linux/uclibc/x86_64=
/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a=
8","src/unix/linux_like/mod.rs":"dd4f7a1d66d8501b4a2c4e75e6e9305ed69f1002ae=
99e410596a6c636878595a","src/unix/mod.rs":"d6a8e150f1014d76906ba3ae6ff63f53=
4821b9b1727d60fb55da243119b8ff57","src/unix/newlib/aarch64/mod.rs":"bac9383=
6a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib=
/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28=
a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015=
983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"ff9c13e99d84912f5e=
be75b7a7ea9c1e9d8f35a268716081e09899c7ea822bc6","src/unix/newlib/generic.rs=
":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/u=
nix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be=
96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"54633d606e4e0413274af0b5beb5e6=
97e6c061b63feaa0704b026554cc9d9c3e","src/unix/newlib/no_align.rs":"e0743b21=
79495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/=
powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be=
393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01=
d951855e382d22de78e53","src/unix/redox/mod.rs":"033768cb273daf2c8090d97252c=
2de9dba6809e6a5d2457f5727d724807695db","src/unix/solarish/compat.rs":"b07a5=
bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/sola=
rish/illumos.rs":"29387916ee7dc58f07478746024003215e631cd30953e8fa2a5c415f8=
1839007","src/unix/solarish/mod.rs":"976b07a13e195840b67c166a62318abfa9ffc8=
d5ebbb0358f199dd213ec98d1b","src/unix/solarish/solaris.rs":"65b005453aefa9b=
9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86.r=
s":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/=
unix/solarish/x86_64.rs":"9074e813949f3c613afeac39d4118fb942c0b3c476232fc53=
6489357cff5790f","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c2246046=
8391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0af=
dc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/ar=
m.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","s=
rc/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a=
2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e=
506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f00=
7f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x8=
6_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a"=
,"src/wasi.rs":"4fae202af0327d768ed9e1b586b75816cce14fe2dc16947d2f3d381f209=
a54c1","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e3=
1d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936=
db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"e3ad95ba54=
f76e74c301611fe868d3d94f6b8939b03be672f568b06b10ae71c7","src/windows/msvc/m=
od.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","=
tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e5=
45f21f1f4"},"package":"5916d2ae698f6de9bfb891ad7a8d65c09d232dc58cc4ac433c7d=
a3b2fd84bc2b"}
> > ++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa515=
9b619ce09555c779e1fb586b","Cargo.toml":"283d7068d58932d9959db0f119fa6874b06=
934a99375abd1096b468c9ee4f04a","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f13328=
82fbb00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"41f9743021d9e=
5ed74ede55c94057cf6867a322a13b25a5d524b966656a08e38","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42=
da99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"bc8c46531bd1a2429f=
36aaf2bc137b50e42505b798de83f34eecfa94ad89179b","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585225=
5ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefe=
ed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bf=
a8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"3f13d5f9b29=
d8969dde507661f1637524e21fe3bd34957fc778868f2f3713c46","src/macros.rs":"148=
cf62f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs"=
:"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sg=
x.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","s=
rc/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37=
a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb4=
8d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12=
856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a79287899=
26e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef=
7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/=
b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92=
b4b4859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2e=
af0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/b=
sd/apple/b64/aarch64/mod.rs":"a3f0dfff62d0f7f4f1b5f9a4e2b662acf233a46badbc5=
419d3cc2d735629a710","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2=
d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.=
rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src=
/unix/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba=
5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5=
855038aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/a=
pple/mod.rs":"d7155927fbd1af6dd984a4c6c1a735a5932af828c96818209487eb6ae72d7=
d7e","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d91=
92cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragon=
fly/mod.rs":"baf5161c9ee8a61131d3b25927960dc49eeaafe6e8cae508787838386bc914=
aa","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9b=
e738ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd=
/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b=
0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/free=
bsd/freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda3347=
6c37a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f=
8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd12/mod.rs":"266fe364867d858610b51a950e936fb10c7990f=
5e627cd59f7947f4b232ab259","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_=
64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","=
src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b=
686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebs=
d/freebsd13/mod.rs":"12bf5c9aef74d43005aca762a48c2c6d64c21d138bd789b20f7143=
fc20a6db95","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7=
f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f2=
5c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod=
.rs":"fdbc49a641a247aabb6e725647826bc5341447d9bff1319bfe092ba5fcda7b26","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cf=
b4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freeb=
sd/mod.rs":"6aa766a4693aa14f3ed2f6bcbba6c42ba34a9aea7baea0bc3600faab367ef02=
2","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d7=
6a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/=
powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a5462=
8a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64=
365f8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freeb=
sd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c=
5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b=
1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/fre=
ebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0=
e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"a7345cc3fb7372572efe06848feb=
2cc246dfc2c2a0cc9ccf434f4c55041a59fa","src/unix/bsd/mod.rs":"7720ec82c9334f=
988ec4b271784768a017c3dc2e6dfae4d02418eef753388aa7","src/unix/bsd/netbsdlik=
e/mod.rs":"3f246d482e31e9dad99790cabca8749a9231c2a686d789379f5d34ac95b10652=
","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3=
eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.r=
s":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/=
unix/bsd/netbsdlike/netbsd/mod.rs":"8826303cad14a575fa8189f67c7df52a7e11f8e=
ea0381d7d389ff8206757de9e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7=
ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bs=
d/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a4=
5cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e3=
6bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbs=
dlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c=
899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7=
ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdli=
ke/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ce=
d729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d=
9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/ope=
nbsd/mod.rs":"ef82f9db83f85abac7f5e3d91b7be2650c52a283611add66022fdaa462f9b=
055","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d9=
82181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/=
powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2=
c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffde=
eaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd=
/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4=
085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd8=
6570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_=
64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","=
src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95=
dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa2635=
3f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d5833ff9b94daa81d24=
70df544453212af17530d78c5a7fb912eac915d00f329","src/unix/haiku/native.rs":"=
dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix=
/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f=
043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae1=
0ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4=
b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs"=
:"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/un=
ix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e=
00150063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b98=
530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_=
like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4c=
f31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd=
3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux=
_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2fa=
f6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128=
.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","sr=
c/unix/linux_like/android/b64/aarch64/mod.rs":"ef230d49fd0d182adf2dae6f8e10=
babf18d72259d65980bf1c4c2dc8a4f84501","src/unix/linux_like/android/b64/mod.=
rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src=
/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9f=
da5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_=
64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d21215878c95fe07c1=
9","src/unix/linux_like/android/mod.rs":"18ea827764ec6ad330314df3a94b21de77=
849ced3d8a107348079fdd1913f591","src/unix/linux_like/emscripten/align.rs":"=
86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix=
/linux_like/emscripten/mod.rs":"b71d37106750f57bc2dae4e9bcb473ff098ef482358=
27e41a1687a39825f0aa4","src/unix/linux_like/emscripten/no_align.rs":"0128e4=
aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux=
_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93a8d02=
641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"e20013ed91ed=
cfb7f84f3f9f5a9ef827fd5c406e24b65989d8438da332236ef6","src/unix/linux_like/=
linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43=
adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1=
500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/=
arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206=
a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd=
8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/lin=
ux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a=
7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae9=
9fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linu=
x/gnu/b32/arm/mod.rs":"92ea7edc0e24f79dfbf5e3efc2d7509bed230562036e6aa85ef4=
f2c8088ecc8f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a=
9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_lik=
e/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214d1ae7=
d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429=
fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/li=
nux_like/linux/gnu/b32/mips/mod.rs":"0d7849eb2435ec1f49b6774872a0518f0129c5=
0f37c9d38b37b1535722777a22","src/unix/linux_like/linux/gnu/b32/mod.rs":"8da=
281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/unix/li=
nux_like/linux/gnu/b32/powerpc.rs":"049d6211ba4a9304bd4497c160bc21ae847c24e=
0528dd9d76263f16192e6aff5","src/unix/linux_like/linux/gnu/b32/riscv32/align=
.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","sr=
c/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"a4256148cec0bb672c8dfa6058=
66930d9761af9655721de72ae41eeeb8fdbf6d","src/unix/linux_like/linux/gnu/b32/=
sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bc=
ca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"525618615aa0cb80c=
6c90860bf579dfed8db307fffd56b97dc235fb945419434","src/unix/linux_like/linux=
/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fb=
c47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"78b403885298=
6436888c63be9258037cf642124daee9d5fa5cef2bf8e412bf54","src/unix/linux_like/=
linux/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/u=
nix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f=
09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/=
aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff=
62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c4e20b1c63d7a0=
3a6e22aef2046689ef95cc4651011ade7cb94176fcea1dc252","src/unix/linux_like/li=
nux/gnu/b64/loongarch64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306d=
c0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/loongarch64/mo=
d.rs":"387808d5398b24339e7e2bf7591150735011befc5b421fa713d7017c04a7b1da","s=
rc/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719a=
ec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b6=
4/mips64/mod.rs":"17aad16329431d83e1909e3a08022f6e28f4bcba7dec4a967fe1a321a=
6a43b99","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31=
a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/=
b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83=
f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"97e0e=
cf11ecce793a13fec39654fb513c5479edf7faa7a276fa714b61993d0fc","src/unix/linu=
x_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a2=
2e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/m=
od.rs":"b3fe290afe63d2d6e315d0cf1f775464e9c1f2a1906d243c1af74a137a4031cb","=
src/unix/linux_like/linux/gnu/b64/s390x.rs":"254f00266ecf9644a4b469457cb37c=
4dd6c055820926c1de0fb9035b6048e75c","src/unix/linux_like/linux/gnu/b64/spar=
c64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f12681=
30d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"87dd7f3d5bf3c09f4=
064ec738e306cc9cc41ad49b4a5df62c5983301c3bbf99a","src/unix/linux_like/linux=
/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc=
1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"1b939a=
af3cdf3efc7d3bd53e83e80235530d3ba0c24bb7611d4730d35d457ec1","src/unix/linux=
_like/linux/gnu/b64/x86_64/not_x32.rs":"b88ef8a1eaa9ed73bf2acb8192afb73af98=
7a92abb94140c6376fc83f2fa5553","src/unix/linux_like/linux/gnu/b64/x86_64/x3=
2.rs":"79305936a60d342efdc10519ba89507d6b48e65f13f33090d3b04dc9655ceed0","s=
rc/unix/linux_like/linux/gnu/mod.rs":"9b8eb3b02d41e72c6df87e34c2f7b78ff21d8=
007f888c9598c3aac8f71ab4c5d","src/unix/linux_like/linux/gnu/no_align.rs":"9=
cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/=
linux_like/linux/mod.rs":"cef218c2cc9ef9d83506249b15189290fb647bfdc6638d739=
89a155a83bd1d18","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac05=
2c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_=
like/linux/musl/b32/arm/mod.rs":"e5faee8efda8a225ea0b17d4d6f9e893a678e73773=
fa62c549a8e19c106b9f04","src/unix/linux_like/linux/musl/b32/hexagon.rs":"22=
6a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/l=
inux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d=
360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mo=
d.rs":"df8f8b529a6cc6b8a7326639e83303cf1320c6c50d76517c17d42bcf45f6240a","s=
rc/unix/linux_like/linux/musl/b32/mod.rs":"7b3d9dfd8605b00bb9b5fa1439abe5eb=
f60199c7fa033eee555e8d181e93ffa2","src/unix/linux_like/linux/musl/b32/power=
pc.rs":"c957d99a4d4371d2411a5769be8cf344516bf9ddc1011f977501a4eb57cb4e82","=
src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547=
903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/mus=
l/b32/riscv32/mod.rs":"e57dc5562553aab6d0765e0ec266254aa52975f8757bfe97e0c6=
028fa7d5d37c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd74=
35d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_lik=
e/linux/musl/b32/x86/mod.rs":"199a91e90b454f9dc32770d5204cc4f6e5b8f144e0e34=
a1c91829949d6e804b3","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":=
"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/uni=
x/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f0=
9724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/=
aarch64/mod.rs":"9c4878df0fea0e0affd85346e0bc191abdc5e41e74dc9199b5644ec33d=
29c300","src/unix/linux_like/linux/musl/b64/mips64.rs":"3686fc8cb2e311cda8e=
6b96f6dfe90b65a366714bd480312b692b1a6ca1241b6","src/unix/linux_like/linux/m=
usl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e55cd53=
3fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"36694cbdcdc33879=
e00502d55cb95eaa0096d213538993dd39c3da800cdd06d1","src/unix/linux_like/linu=
x/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99=
cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"3=
6621aca8ecf714f8dd42662dc2997833d95b9f129ef8c220503362e21efd695","src/unix/=
linux_like/linux/musl/b64/s390x.rs":"9b05b1fae6bcb7cb6d909b9973977fde016841=
75f3e26c27dcb44223cc3933d9","src/unix/linux_like/linux/musl/b64/x86_64/alig=
n.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","s=
rc/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"238789097a26abc8b7cd578ed=
1a8e6cb8672083054303902781983902cd66854","src/unix/linux_like/linux/musl/mo=
d.rs":"9d1f77945b00c294ad0759749f976bc6ccbc07386af1c90f44443a746df47b28","s=
rc/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae6a982=
ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustive.rs"=
:"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/un=
ix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67=
366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs=
":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/u=
nix/linux_like/linux/uclibc/arm/mod.rs":"a056bbf718ddd775519058706bdb4909b5=
6e6256985869e3c3132aa8ec5faca0","src/unix/linux_like/linux/uclibc/arm/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d6=
12c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/=
uclibc/mips/mips32/mod.rs":"b84def53a49587e87f884c2bc28b21b290463b00b52e1d0=
309f2ba233a5b4a99","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fa=
d83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclib=
c/mips/mips64/mod.rs":"256a428290a560163ef7dc7d18b27bd3c6ce9748a0f28d5dc7f8=
2203ee228220","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4=
a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/=
linux_like/linux/uclibc/mips/mod.rs":"367ec5483ad317e6ccba1ac0888da6cf088a8=
d32689214cc8d16129aa692260c","src/unix/linux_like/linux/uclibc/mod.rs":"ddd=
223d4f574b2b92072bbdab091f12d8d89d5e05f41076ddfa6bc6af379698f","src/unix/li=
nux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b939=
6e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs=
":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/u=
nix/linux_like/linux/uclibc/x86_64/mod.rs":"bf6985e901041a61e90ccee1296b35a=
4c62ef90aa528d31989e1d647f072e79a","src/unix/linux_like/linux/uclibc/x86_64=
/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a=
8","src/unix/linux_like/mod.rs":"dd4f7a1d66d8501b4a2c4e75e6e9305ed69f1002ae=
99e410596a6c636878595a","src/unix/mod.rs":"d6a8e150f1014d76906ba3ae6ff63f53=
4821b9b1727d60fb55da243119b8ff57","src/unix/newlib/aarch64/mod.rs":"bac9383=
6a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib=
/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28=
a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015=
983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"ff9c13e99d84912f5e=
be75b7a7ea9c1e9d8f35a268716081e09899c7ea822bc6","src/unix/newlib/generic.rs=
":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/u=
nix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be=
96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"54633d606e4e0413274af0b5beb5e6=
97e6c061b63feaa0704b026554cc9d9c3e","src/unix/newlib/no_align.rs":"e0743b21=
79495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/=
powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be=
393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01=
d951855e382d22de78e53","src/unix/redox/mod.rs":"033768cb273daf2c8090d97252c=
2de9dba6809e6a5d2457f5727d724807695db","src/unix/solarish/compat.rs":"b07a5=
bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/sola=
rish/illumos.rs":"29387916ee7dc58f07478746024003215e631cd30953e8fa2a5c415f8=
1839007","src/unix/solarish/mod.rs":"976b07a13e195840b67c166a62318abfa9ffc8=
d5ebbb0358f199dd213ec98d1b","src/unix/solarish/solaris.rs":"65b005453aefa9b=
9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86.r=
s":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/=
unix/solarish/x86_64.rs":"9074e813949f3c613afeac39d4118fb942c0b3c476232fc53=
6489357cff5790f","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c2246046=
8391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0af=
dc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/ar=
m.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","s=
rc/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a=
2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e=
506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f00=
7f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x8=
6_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a"=
,"src/wasi.rs":"4fae202af0327d768ed9e1b586b75816cce14fe2dc16947d2f3d381f209=
a54c1","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e3=
1d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936=
db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"e3ad95ba54=
f76e74c301611fe868d3d94f6b8939b03be672f568b06b10ae71c7","src/windows/msvc/m=
od.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","=
tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e5=
45f21f1f4"},"package":"5916d2ae698f6de9bfb891ad7a8d65c09d232dc58cc4ac433c7d=
a3b2fd84bc2b"}
> > diff --git a/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-constant-=
for-riscv64-musl.patch b/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-c=
onstant-for-riscv64-musl.patch
> > new file mode 100644
> > index 0000000000..5922473acb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/rust/0001-Add-ENOTSUP-constant-for-ris=
cv64-musl.patch
> > @@ -0,0 +1,27 @@
> > +From 1c5bc66f7b31529282d79f0ba843d95b238cedca Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?S=3DC3=3DB6ren=3D20Tempel?=3D <soeren+git@soeren-tem=
pel.net>
> > +Date: Sun, 8 May 2022 17:34:02 +0200
> > +Subject: [PATCH] Add ENOTSUP constant for riscv64 musl
> > +
> > +Upstream-Status: Backport [https://github.com/rust-lang/libc/commit/1c=
5bc66f7]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/unix/linux_like/linux/musl/b64/riscv64/mod.rs | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +--- a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
> > ++++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
> > +@@ -546,6 +546,7 @@ pub const ENOPROTOOPT: ::c_int =3D 92;
> > + pub const EPROTONOSUPPORT: ::c_int =3D 93;
> > + pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
> > + pub const EOPNOTSUPP: ::c_int =3D 95;
> > ++pub const ENOTSUP: ::c_int =3D EOPNOTSUPP;
> > + pub const EPFNOSUPPORT: ::c_int =3D 96;
> > + pub const EAFNOSUPPORT: ::c_int =3D 97;
> > + pub const EADDRINUSE: ::c_int =3D 98;
> > +--- a/vendor/libc/.cargo-checksum.json
> > ++++ b/vendor/libc/.cargo-checksum.json
> > +@@ -1 +1 @@
> > +-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa515=
9b619ce09555c779e1fb586b","Cargo.toml":"283d7068d58932d9959db0f119fa6874b06=
934a99375abd1096b468c9ee4f04a","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f13328=
82fbb00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"41f9743021d9e=
5ed74ede55c94057cf6867a322a13b25a5d524b966656a08e38","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42=
da99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"bc8c46531bd1a2429f=
36aaf2bc137b50e42505b798de83f34eecfa94ad89179b","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585225=
5ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefe=
ed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bf=
a8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"3f13d5f9b29=
d8969dde507661f1637524e21fe3bd34957fc778868f2f3713c46","src/macros.rs":"148=
cf62f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs"=
:"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sg=
x.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","s=
rc/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37=
a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb4=
8d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12=
856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a79287899=
26e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef=
7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/=
b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92=
b4b4859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2e=
af0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/b=
sd/apple/b64/aarch64/mod.rs":"a3f0dfff62d0f7f4f1b5f9a4e2b662acf233a46badbc5=
419d3cc2d735629a710","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2=
d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.=
rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src=
/unix/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba=
5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5=
855038aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/a=
pple/mod.rs":"d7155927fbd1af6dd984a4c6c1a735a5932af828c96818209487eb6ae72d7=
d7e","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d91=
92cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragon=
fly/mod.rs":"baf5161c9ee8a61131d3b25927960dc49eeaafe6e8cae508787838386bc914=
aa","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9b=
e738ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd=
/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b=
0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/free=
bsd/freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda3347=
6c37a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f=
8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd12/mod.rs":"266fe364867d858610b51a950e936fb10c7990f=
5e627cd59f7947f4b232ab259","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_=
64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","=
src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b=
686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebs=
d/freebsd13/mod.rs":"12bf5c9aef74d43005aca762a48c2c6d64c21d138bd789b20f7143=
fc20a6db95","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7=
f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f2=
5c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod=
.rs":"fdbc49a641a247aabb6e725647826bc5341447d9bff1319bfe092ba5fcda7b26","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cf=
b4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freeb=
sd/mod.rs":"6aa766a4693aa14f3ed2f6bcbba6c42ba34a9aea7baea0bc3600faab367ef02=
2","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d7=
6a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/=
powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a5462=
8a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64=
365f8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freeb=
sd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c=
5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b=
1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/fre=
ebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0=
e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"a7345cc3fb7372572efe06848feb=
2cc246dfc2c2a0cc9ccf434f4c55041a59fa","src/unix/bsd/mod.rs":"7720ec82c9334f=
988ec4b271784768a017c3dc2e6dfae4d02418eef753388aa7","src/unix/bsd/netbsdlik=
e/mod.rs":"3f246d482e31e9dad99790cabca8749a9231c2a686d789379f5d34ac95b10652=
","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3=
eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.r=
s":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/=
unix/bsd/netbsdlike/netbsd/mod.rs":"8826303cad14a575fa8189f67c7df52a7e11f8e=
ea0381d7d389ff8206757de9e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7=
ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bs=
d/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a4=
5cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e3=
6bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbs=
dlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c=
899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7=
ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdli=
ke/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ce=
d729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d=
9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/ope=
nbsd/mod.rs":"ef82f9db83f85abac7f5e3d91b7be2650c52a283611add66022fdaa462f9b=
055","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d9=
82181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/=
powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2=
c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffde=
eaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd=
/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4=
085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd8=
6570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_=
64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","=
src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95=
dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa2635=
3f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d5833ff9b94daa81d24=
70df544453212af17530d78c5a7fb912eac915d00f329","src/unix/haiku/native.rs":"=
dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix=
/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f=
043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae1=
0ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4=
b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs"=
:"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/un=
ix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e=
00150063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b98=
530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_=
like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4c=
f31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd=
3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux=
_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2fa=
f6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128=
.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","sr=
c/unix/linux_like/android/b64/aarch64/mod.rs":"ef230d49fd0d182adf2dae6f8e10=
babf18d72259d65980bf1c4c2dc8a4f84501","src/unix/linux_like/android/b64/mod.=
rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src=
/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9f=
da5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_=
64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d21215878c95fe07c1=
9","src/unix/linux_like/android/mod.rs":"18ea827764ec6ad330314df3a94b21de77=
849ced3d8a107348079fdd1913f591","src/unix/linux_like/emscripten/align.rs":"=
86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix=
/linux_like/emscripten/mod.rs":"b71d37106750f57bc2dae4e9bcb473ff098ef482358=
27e41a1687a39825f0aa4","src/unix/linux_like/emscripten/no_align.rs":"0128e4=
aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux=
_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93a8d02=
641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"e20013ed91ed=
cfb7f84f3f9f5a9ef827fd5c406e24b65989d8438da332236ef6","src/unix/linux_like/=
linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43=
adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1=
500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/=
arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206=
a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd=
8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/lin=
ux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a=
7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae9=
9fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linu=
x/gnu/b32/arm/mod.rs":"92ea7edc0e24f79dfbf5e3efc2d7509bed230562036e6aa85ef4=
f2c8088ecc8f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a=
9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_lik=
e/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214d1ae7=
d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429=
fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/li=
nux_like/linux/gnu/b32/mips/mod.rs":"0d7849eb2435ec1f49b6774872a0518f0129c5=
0f37c9d38b37b1535722777a22","src/unix/linux_like/linux/gnu/b32/mod.rs":"8da=
281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/unix/li=
nux_like/linux/gnu/b32/powerpc.rs":"049d6211ba4a9304bd4497c160bc21ae847c24e=
0528dd9d76263f16192e6aff5","src/unix/linux_like/linux/gnu/b32/riscv32/align=
.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","sr=
c/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"a4256148cec0bb672c8dfa6058=
66930d9761af9655721de72ae41eeeb8fdbf6d","src/unix/linux_like/linux/gnu/b32/=
sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bc=
ca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"525618615aa0cb80c=
6c90860bf579dfed8db307fffd56b97dc235fb945419434","src/unix/linux_like/linux=
/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fb=
c47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"78b403885298=
6436888c63be9258037cf642124daee9d5fa5cef2bf8e412bf54","src/unix/linux_like/=
linux/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/u=
nix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f=
09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/=
aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff=
62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c4e20b1c63d7a0=
3a6e22aef2046689ef95cc4651011ade7cb94176fcea1dc252","src/unix/linux_like/li=
nux/gnu/b64/loongarch64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306d=
c0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/loongarch64/mo=
d.rs":"387808d5398b24339e7e2bf7591150735011befc5b421fa713d7017c04a7b1da","s=
rc/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719a=
ec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b6=
4/mips64/mod.rs":"17aad16329431d83e1909e3a08022f6e28f4bcba7dec4a967fe1a321a=
6a43b99","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31=
a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/=
b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83=
f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"97e0e=
cf11ecce793a13fec39654fb513c5479edf7faa7a276fa714b61993d0fc","src/unix/linu=
x_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a2=
2e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/m=
od.rs":"b3fe290afe63d2d6e315d0cf1f775464e9c1f2a1906d243c1af74a137a4031cb","=
src/unix/linux_like/linux/gnu/b64/s390x.rs":"254f00266ecf9644a4b469457cb37c=
4dd6c055820926c1de0fb9035b6048e75c","src/unix/linux_like/linux/gnu/b64/spar=
c64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f12681=
30d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"87dd7f3d5bf3c09f4=
064ec738e306cc9cc41ad49b4a5df62c5983301c3bbf99a","src/unix/linux_like/linux=
/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc=
1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"1b939a=
af3cdf3efc7d3bd53e83e80235530d3ba0c24bb7611d4730d35d457ec1","src/unix/linux=
_like/linux/gnu/b64/x86_64/not_x32.rs":"b88ef8a1eaa9ed73bf2acb8192afb73af98=
7a92abb94140c6376fc83f2fa5553","src/unix/linux_like/linux/gnu/b64/x86_64/x3=
2.rs":"79305936a60d342efdc10519ba89507d6b48e65f13f33090d3b04dc9655ceed0","s=
rc/unix/linux_like/linux/gnu/mod.rs":"9b8eb3b02d41e72c6df87e34c2f7b78ff21d8=
007f888c9598c3aac8f71ab4c5d","src/unix/linux_like/linux/gnu/no_align.rs":"9=
cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/=
linux_like/linux/mod.rs":"cef218c2cc9ef9d83506249b15189290fb647bfdc6638d739=
89a155a83bd1d18","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac05=
2c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_=
like/linux/musl/b32/arm/mod.rs":"e5faee8efda8a225ea0b17d4d6f9e893a678e73773=
fa62c549a8e19c106b9f04","src/unix/linux_like/linux/musl/b32/hexagon.rs":"22=
6a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/l=
inux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d=
360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mo=
d.rs":"df8f8b529a6cc6b8a7326639e83303cf1320c6c50d76517c17d42bcf45f6240a","s=
rc/unix/linux_like/linux/musl/b32/mod.rs":"7b3d9dfd8605b00bb9b5fa1439abe5eb=
f60199c7fa033eee555e8d181e93ffa2","src/unix/linux_like/linux/musl/b32/power=
pc.rs":"c957d99a4d4371d2411a5769be8cf344516bf9ddc1011f977501a4eb57cb4e82","=
src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547=
903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/mus=
l/b32/riscv32/mod.rs":"698f77bfcc838f82126c54f7387881fe3e89490117e5a4f333d1=
b4433823a672","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd74=
35d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_lik=
e/linux/musl/b32/x86/mod.rs":"199a91e90b454f9dc32770d5204cc4f6e5b8f144e0e34=
a1c91829949d6e804b3","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":=
"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/uni=
x/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f0=
9724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/=
aarch64/mod.rs":"9c4878df0fea0e0affd85346e0bc191abdc5e41e74dc9199b5644ec33d=
29c300","src/unix/linux_like/linux/musl/b64/mips64.rs":"3686fc8cb2e311cda8e=
6b96f6dfe90b65a366714bd480312b692b1a6ca1241b6","src/unix/linux_like/linux/m=
usl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e55cd53=
3fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"36694cbdcdc33879=
e00502d55cb95eaa0096d213538993dd39c3da800cdd06d1","src/unix/linux_like/linu=
x/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99=
cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"8=
d556d82a6a8e0643ede14f69bb9da29e4fb9f22abce8e57b08ea29382ebc22c","src/unix/=
linux_like/linux/musl/b64/s390x.rs":"9b05b1fae6bcb7cb6d909b9973977fde016841=
75f3e26c27dcb44223cc3933d9","src/unix/linux_like/linux/musl/b64/x86_64/alig=
n.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","s=
rc/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"238789097a26abc8b7cd578ed=
1a8e6cb8672083054303902781983902cd66854","src/unix/linux_like/linux/musl/mo=
d.rs":"9d1f77945b00c294ad0759749f976bc6ccbc07386af1c90f44443a746df47b28","s=
rc/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae6a982=
ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustive.rs"=
:"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/un=
ix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67=
366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs=
":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/u=
nix/linux_like/linux/uclibc/arm/mod.rs":"a056bbf718ddd775519058706bdb4909b5=
6e6256985869e3c3132aa8ec5faca0","src/unix/linux_like/linux/uclibc/arm/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d6=
12c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/=
uclibc/mips/mips32/mod.rs":"b84def53a49587e87f884c2bc28b21b290463b00b52e1d0=
309f2ba233a5b4a99","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fa=
d83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclib=
c/mips/mips64/mod.rs":"256a428290a560163ef7dc7d18b27bd3c6ce9748a0f28d5dc7f8=
2203ee228220","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4=
a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/=
linux_like/linux/uclibc/mips/mod.rs":"367ec5483ad317e6ccba1ac0888da6cf088a8=
d32689214cc8d16129aa692260c","src/unix/linux_like/linux/uclibc/mod.rs":"ddd=
223d4f574b2b92072bbdab091f12d8d89d5e05f41076ddfa6bc6af379698f","src/unix/li=
nux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b939=
6e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs=
":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/u=
nix/linux_like/linux/uclibc/x86_64/mod.rs":"bf6985e901041a61e90ccee1296b35a=
4c62ef90aa528d31989e1d647f072e79a","src/unix/linux_like/linux/uclibc/x86_64=
/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a=
8","src/unix/linux_like/mod.rs":"dd4f7a1d66d8501b4a2c4e75e6e9305ed69f1002ae=
99e410596a6c636878595a","src/unix/mod.rs":"d6a8e150f1014d76906ba3ae6ff63f53=
4821b9b1727d60fb55da243119b8ff57","src/unix/newlib/aarch64/mod.rs":"bac9383=
6a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib=
/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28=
a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015=
983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"ff9c13e99d84912f5e=
be75b7a7ea9c1e9d8f35a268716081e09899c7ea822bc6","src/unix/newlib/generic.rs=
":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/u=
nix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be=
96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"54633d606e4e0413274af0b5beb5e6=
97e6c061b63feaa0704b026554cc9d9c3e","src/unix/newlib/no_align.rs":"e0743b21=
79495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/=
powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be=
393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01=
d951855e382d22de78e53","src/unix/redox/mod.rs":"033768cb273daf2c8090d97252c=
2de9dba6809e6a5d2457f5727d724807695db","src/unix/solarish/compat.rs":"b07a5=
bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/sola=
rish/illumos.rs":"29387916ee7dc58f07478746024003215e631cd30953e8fa2a5c415f8=
1839007","src/unix/solarish/mod.rs":"976b07a13e195840b67c166a62318abfa9ffc8=
d5ebbb0358f199dd213ec98d1b","src/unix/solarish/solaris.rs":"65b005453aefa9b=
9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86.r=
s":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/=
unix/solarish/x86_64.rs":"9074e813949f3c613afeac39d4118fb942c0b3c476232fc53=
6489357cff5790f","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c2246046=
8391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0af=
dc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/ar=
m.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","s=
rc/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a=
2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e=
506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f00=
7f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x8=
6_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a"=
,"src/wasi.rs":"4fae202af0327d768ed9e1b586b75816cce14fe2dc16947d2f3d381f209=
a54c1","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e3=
1d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936=
db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"e3ad95ba54=
f76e74c301611fe868d3d94f6b8939b03be672f568b06b10ae71c7","src/windows/msvc/m=
od.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","=
tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e5=
45f21f1f4"},"package":"5916d2ae698f6de9bfb891ad7a8d65c09d232dc58cc4ac433c7d=
a3b2fd84bc2b"}
> > +\ No newline at end of file
> > ++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa515=
9b619ce09555c779e1fb586b","Cargo.toml":"283d7068d58932d9959db0f119fa6874b06=
934a99375abd1096b468c9ee4f04a","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca5=
2d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a89=
32dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f13328=
82fbb00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"41f9743021d9e=
5ed74ede55c94057cf6867a322a13b25a5d524b966656a08e38","rustfmt.toml":"eaa2ea=
84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_widt=
h_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0c=
a","src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42=
da99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e=
60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"bc8c46531bd1a2429f=
36aaf2bc137b50e42505b798de83f34eecfa94ad89179b","src/fuchsia/no_align.rs":"=
303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuch=
sia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585225=
5ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefe=
ed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bf=
a8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"3f13d5f9b29=
d8969dde507661f1637524e21fe3bd34957fc778868f2f3713c46","src/macros.rs":"148=
cf62f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs"=
:"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sg=
x.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","s=
rc/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37=
a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb4=
8d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12=
856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a79287899=
26e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef=
7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/=
b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92=
b4b4859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2e=
af0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/b=
sd/apple/b64/aarch64/mod.rs":"a3f0dfff62d0f7f4f1b5f9a4e2b662acf233a46badbc5=
419d3cc2d735629a710","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2=
d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.=
rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src=
/unix/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba=
5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5=
855038aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/a=
pple/mod.rs":"d7155927fbd1af6dd984a4c6c1a735a5932af828c96818209487eb6ae72d7=
d7e","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d91=
92cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragon=
fly/mod.rs":"baf5161c9ee8a61131d3b25927960dc49eeaafe6e8cae508787838386bc914=
aa","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9b=
e738ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd=
/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b=
0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/free=
bsd/freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda3347=
6c37a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f=
8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd12/mod.rs":"266fe364867d858610b51a950e936fb10c7990f=
5e627cd59f7947f4b232ab259","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_=
64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","=
src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b=
686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebs=
d/freebsd13/mod.rs":"12bf5c9aef74d43005aca762a48c2c6d64c21d138bd789b20f7143=
fc20a6db95","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7=
f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f2=
5c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod=
.rs":"fdbc49a641a247aabb6e725647826bc5341447d9bff1319bfe092ba5fcda7b26","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cf=
b4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freeb=
sd/mod.rs":"6aa766a4693aa14f3ed2f6bcbba6c42ba34a9aea7baea0bc3600faab367ef02=
2","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d7=
6a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/=
powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a5462=
8a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64=
365f8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freeb=
sd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c=
5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b=
1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/fre=
ebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0=
e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"a7345cc3fb7372572efe06848feb=
2cc246dfc2c2a0cc9ccf434f4c55041a59fa","src/unix/bsd/mod.rs":"7720ec82c9334f=
988ec4b271784768a017c3dc2e6dfae4d02418eef753388aa7","src/unix/bsd/netbsdlik=
e/mod.rs":"3f246d482e31e9dad99790cabca8749a9231c2a686d789379f5d34ac95b10652=
","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3=
eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.r=
s":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/=
unix/bsd/netbsdlike/netbsd/mod.rs":"8826303cad14a575fa8189f67c7df52a7e11f8e=
ea0381d7d389ff8206757de9e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7=
ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bs=
d/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a4=
5cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e3=
6bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbs=
dlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c=
899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7=
ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdli=
ke/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ce=
d729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d=
9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/ope=
nbsd/mod.rs":"ef82f9db83f85abac7f5e3d91b7be2650c52a283611add66022fdaa462f9b=
055","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d9=
82181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/=
powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2=
c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffde=
eaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd=
/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4=
085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd8=
6570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_=
64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","=
src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95=
dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa2635=
3f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d5833ff9b94daa81d24=
70df544453212af17530d78c5a7fb912eac915d00f329","src/unix/haiku/native.rs":"=
dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix=
/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f=
043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae1=
0ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4=
b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs"=
:"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/un=
ix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e=
00150063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b98=
530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_=
like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4c=
f31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd=
3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux=
_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2fa=
f6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128=
.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","sr=
c/unix/linux_like/android/b64/aarch64/mod.rs":"ef230d49fd0d182adf2dae6f8e10=
babf18d72259d65980bf1c4c2dc8a4f84501","src/unix/linux_like/android/b64/mod.=
rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src=
/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9f=
da5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_=
64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d21215878c95fe07c1=
9","src/unix/linux_like/android/mod.rs":"18ea827764ec6ad330314df3a94b21de77=
849ced3d8a107348079fdd1913f591","src/unix/linux_like/emscripten/align.rs":"=
86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix=
/linux_like/emscripten/mod.rs":"b71d37106750f57bc2dae4e9bcb473ff098ef482358=
27e41a1687a39825f0aa4","src/unix/linux_like/emscripten/no_align.rs":"0128e4=
aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux=
_like/linux/align.rs":"d6c259942c8e843373accd180fc8f4f45f03544dfd21b93a8d02=
641ead3ef63e","src/unix/linux_like/linux/arch/generic/mod.rs":"e20013ed91ed=
cfb7f84f3f9f5a9ef827fd5c406e24b65989d8438da332236ef6","src/unix/linux_like/=
linux/arch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43=
adc4277e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1=
500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/=
arch/powerpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206=
a912c41b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd=
8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/lin=
ux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a=
7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae9=
9fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linu=
x/gnu/b32/arm/mod.rs":"92ea7edc0e24f79dfbf5e3efc2d7509bed230562036e6aa85ef4=
f2c8088ecc8f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a=
9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_lik=
e/linux/gnu/b32/m68k/mod.rs":"a2a0a9400dae44086ebf579e0448e0676d4a3214d1ae7=
d13a024857251e23b6b","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429=
fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/li=
nux_like/linux/gnu/b32/mips/mod.rs":"0d7849eb2435ec1f49b6774872a0518f0129c5=
0f37c9d38b37b1535722777a22","src/unix/linux_like/linux/gnu/b32/mod.rs":"8da=
281da578cdee972e952b118b903b370320897a7e335342a15e1359864bef2","src/unix/li=
nux_like/linux/gnu/b32/powerpc.rs":"049d6211ba4a9304bd4497c160bc21ae847c24e=
0528dd9d76263f16192e6aff5","src/unix/linux_like/linux/gnu/b32/riscv32/align=
.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","sr=
c/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"a4256148cec0bb672c8dfa6058=
66930d9761af9655721de72ae41eeeb8fdbf6d","src/unix/linux_like/linux/gnu/b32/=
sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bc=
ca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"525618615aa0cb80c=
6c90860bf579dfed8db307fffd56b97dc235fb945419434","src/unix/linux_like/linux=
/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fb=
c47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"78b403885298=
6436888c63be9258037cf642124daee9d5fa5cef2bf8e412bf54","src/unix/linux_like/=
linux/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"21a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/u=
nix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f=
09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/=
aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff=
62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c4e20b1c63d7a0=
3a6e22aef2046689ef95cc4651011ade7cb94176fcea1dc252","src/unix/linux_like/li=
nux/gnu/b64/loongarch64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306d=
c0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/loongarch64/mo=
d.rs":"387808d5398b24339e7e2bf7591150735011befc5b421fa713d7017c04a7b1da","s=
rc/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719a=
ec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b6=
4/mips64/mod.rs":"17aad16329431d83e1909e3a08022f6e28f4bcba7dec4a967fe1a321a=
6a43b99","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31=
a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/=
b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83=
f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"97e0e=
cf11ecce793a13fec39654fb513c5479edf7faa7a276fa714b61993d0fc","src/unix/linu=
x_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a2=
2e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/m=
od.rs":"b3fe290afe63d2d6e315d0cf1f775464e9c1f2a1906d243c1af74a137a4031cb","=
src/unix/linux_like/linux/gnu/b64/s390x.rs":"254f00266ecf9644a4b469457cb37c=
4dd6c055820926c1de0fb9035b6048e75c","src/unix/linux_like/linux/gnu/b64/spar=
c64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f12681=
30d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"87dd7f3d5bf3c09f4=
064ec738e306cc9cc41ad49b4a5df62c5983301c3bbf99a","src/unix/linux_like/linux=
/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc=
1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"1b939a=
af3cdf3efc7d3bd53e83e80235530d3ba0c24bb7611d4730d35d457ec1","src/unix/linux=
_like/linux/gnu/b64/x86_64/not_x32.rs":"b88ef8a1eaa9ed73bf2acb8192afb73af98=
7a92abb94140c6376fc83f2fa5553","src/unix/linux_like/linux/gnu/b64/x86_64/x3=
2.rs":"79305936a60d342efdc10519ba89507d6b48e65f13f33090d3b04dc9655ceed0","s=
rc/unix/linux_like/linux/gnu/mod.rs":"9b8eb3b02d41e72c6df87e34c2f7b78ff21d8=
007f888c9598c3aac8f71ab4c5d","src/unix/linux_like/linux/gnu/no_align.rs":"9=
cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/=
linux_like/linux/mod.rs":"cef218c2cc9ef9d83506249b15189290fb647bfdc6638d739=
89a155a83bd1d18","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac05=
2c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_=
like/linux/musl/b32/arm/mod.rs":"e5faee8efda8a225ea0b17d4d6f9e893a678e73773=
fa62c549a8e19c106b9f04","src/unix/linux_like/linux/musl/b32/hexagon.rs":"22=
6a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/l=
inux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d=
360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mo=
d.rs":"df8f8b529a6cc6b8a7326639e83303cf1320c6c50d76517c17d42bcf45f6240a","s=
rc/unix/linux_like/linux/musl/b32/mod.rs":"7b3d9dfd8605b00bb9b5fa1439abe5eb=
f60199c7fa033eee555e8d181e93ffa2","src/unix/linux_like/linux/musl/b32/power=
pc.rs":"c957d99a4d4371d2411a5769be8cf344516bf9ddc1011f977501a4eb57cb4e82","=
src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547=
903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/mus=
l/b32/riscv32/mod.rs":"698f77bfcc838f82126c54f7387881fe3e89490117e5a4f333d1=
b4433823a672","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd74=
35d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_lik=
e/linux/musl/b32/x86/mod.rs":"199a91e90b454f9dc32770d5204cc4f6e5b8f144e0e34=
a1c91829949d6e804b3","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":=
"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/uni=
x/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f0=
9724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/=
aarch64/mod.rs":"9c4878df0fea0e0affd85346e0bc191abdc5e41e74dc9199b5644ec33d=
29c300","src/unix/linux_like/linux/musl/b64/mips64.rs":"3686fc8cb2e311cda8e=
6b96f6dfe90b65a366714bd480312b692b1a6ca1241b6","src/unix/linux_like/linux/m=
usl/b64/mod.rs":"8c10627bd582cb272514e7350ae4743a65d489356eae039d2e7e55cd53=
3fbbc8","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"36694cbdcdc33879=
e00502d55cb95eaa0096d213538993dd39c3da800cdd06d1","src/unix/linux_like/linu=
x/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99=
cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"3=
6621aca8ecf714f8dd42662dc2997833d95b9f129ef8c220503362e21efd695","src/unix/=
linux_like/linux/musl/b64/s390x.rs":"9b05b1fae6bcb7cb6d909b9973977fde016841=
75f3e26c27dcb44223cc3933d9","src/unix/linux_like/linux/musl/b64/x86_64/alig=
n.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","s=
rc/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"238789097a26abc8b7cd578ed=
1a8e6cb8672083054303902781983902cd66854","src/unix/linux_like/linux/musl/mo=
d.rs":"9d1f77945b00c294ad0759749f976bc6ccbc07386af1c90f44443a746df47b28","s=
rc/unix/linux_like/linux/no_align.rs":"da2a8721becaaaa528781f97f5d9aae6a982=
ae5d4f5f6d2ffc0150bed72319b3","src/unix/linux_like/linux/non_exhaustive.rs"=
:"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/un=
ix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67=
366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs=
":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/u=
nix/linux_like/linux/uclibc/arm/mod.rs":"a056bbf718ddd775519058706bdb4909b5=
6e6256985869e3c3132aa8ec5faca0","src/unix/linux_like/linux/uclibc/arm/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d6=
12c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/=
uclibc/mips/mips32/mod.rs":"b84def53a49587e87f884c2bc28b21b290463b00b52e1d0=
309f2ba233a5b4a99","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.r=
s":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/=
unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fa=
d83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclib=
c/mips/mips64/mod.rs":"256a428290a560163ef7dc7d18b27bd3c6ce9748a0f28d5dc7f8=
2203ee228220","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4=
a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/=
linux_like/linux/uclibc/mips/mod.rs":"367ec5483ad317e6ccba1ac0888da6cf088a8=
d32689214cc8d16129aa692260c","src/unix/linux_like/linux/uclibc/mod.rs":"ddd=
223d4f574b2b92072bbdab091f12d8d89d5e05f41076ddfa6bc6af379698f","src/unix/li=
nux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b939=
6e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs=
":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/u=
nix/linux_like/linux/uclibc/x86_64/mod.rs":"bf6985e901041a61e90ccee1296b35a=
4c62ef90aa528d31989e1d647f072e79a","src/unix/linux_like/linux/uclibc/x86_64=
/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a=
8","src/unix/linux_like/mod.rs":"dd4f7a1d66d8501b4a2c4e75e6e9305ed69f1002ae=
99e410596a6c636878595a","src/unix/mod.rs":"d6a8e150f1014d76906ba3ae6ff63f53=
4821b9b1727d60fb55da243119b8ff57","src/unix/newlib/aarch64/mod.rs":"bac9383=
6a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib=
/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28=
a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015=
983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"ff9c13e99d84912f5e=
be75b7a7ea9c1e9d8f35a268716081e09899c7ea822bc6","src/unix/newlib/generic.rs=
":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/u=
nix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be=
96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"54633d606e4e0413274af0b5beb5e6=
97e6c061b63feaa0704b026554cc9d9c3e","src/unix/newlib/no_align.rs":"e0743b21=
79495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/=
powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be=
393b67","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01=
d951855e382d22de78e53","src/unix/redox/mod.rs":"033768cb273daf2c8090d97252c=
2de9dba6809e6a5d2457f5727d724807695db","src/unix/solarish/compat.rs":"b07a5=
bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/sola=
rish/illumos.rs":"29387916ee7dc58f07478746024003215e631cd30953e8fa2a5c415f8=
1839007","src/unix/solarish/mod.rs":"976b07a13e195840b67c166a62318abfa9ffc8=
d5ebbb0358f199dd213ec98d1b","src/unix/solarish/solaris.rs":"65b005453aefa9b=
9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86.r=
s":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/=
unix/solarish/x86_64.rs":"9074e813949f3c613afeac39d4118fb942c0b3c476232fc53=
6489357cff5790f","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c2246046=
8391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0af=
dc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/ar=
m.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","s=
rc/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a=
2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e=
506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f00=
7f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x8=
6_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a"=
,"src/wasi.rs":"4fae202af0327d768ed9e1b586b75816cce14fe2dc16947d2f3d381f209=
a54c1","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e3=
1d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936=
db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"e3ad95ba54=
f76e74c301611fe868d3d94f6b8939b03be672f568b06b10ae71c7","src/windows/msvc/m=
od.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","=
tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e5=
45f21f1f4"},"package":"5916d2ae698f6de9bfb891ad7a8d65c09d232dc58cc4ac433c7d=
a3b2fd84bc2b"}
> > --
> > 2.37.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169639): https://lists.openembedded.org/g/openembed=
ded-core/message/169639
> > Mute This Topic: https://lists.openembedded.org/mt/93131398/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

