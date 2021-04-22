Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.6585.1619055285538107352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vzt6Rj8I;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id t17so16423477qkg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 18:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WcdGf+dhS+ETwBb/5iA5InribuN5Ah+uY1vjn2Hj70=;
        b=Vzt6Rj8IsTBm1YBU/nvixY+C87N+fh/hEpLitWcJAlpLdDDdcd/GJea4Cqf59FUyB0
         ukms5uAOAoxJ3piE3jlI7UnrEGMhCSmZ++L6/f1JP3/BODgmsFnyPSxp1AVGsTw5vOE2
         7g09kS30b8M/zTQGm0D4nYHZnJueqfepv6SHhWv/XDWeemXtdpm4xMCAQYSHlvkiVytg
         d4MfRzuujmEsHIFlNtlRqZRkvYrAFupi9V1LWtyt+9n39+QdXB6jzoy5iY7sR+MMAd5n
         cuUFDM6VU4rfNm4pZyX2+aAfSv+seuneSVgc5HEkw5kupqV9LjOaxIS4L5RAQpUbQMIN
         8VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WcdGf+dhS+ETwBb/5iA5InribuN5Ah+uY1vjn2Hj70=;
        b=RX/0gi84fI1J2OghNSb5SJy6YX6iBrxh/sATZi3pKs18gTSHDBxY2e4UoDoiF34vgP
         EPZCNxN2rNCNNywZbl8ByPs67IVDcM/B/7EHXIwlXznQtYAvLrs3CYB39NJBFMaGlZ/t
         BuH0Pjqec6WSZZ93EC96iNMYI2jWtRKlpU3uuTmVvQQ9v0pSkvqXZlykyAJnABb6azi0
         7Tq5wfdOvESIcnGp2ynKxXcB2EiHJu33VH5o6hq+sxz2L1RVY9T8qVL4EhbnGttyVx9h
         2MOvs4Nx1so9QhPNc41F/90f7IsvaQ6fcVm3BziqvA2WERM7W2V3ZtcTBONzR/18Tiz6
         IM5w==
X-Gm-Message-State: AOAM533yP7O+Kd/CfifLp+7XjZHCUH8wpyVaCHbHagmqT9DQwLLrlYuP
	alWl3+dxdd7bWdOB8IwQ0zLpDpQCdiobrY6mD4Q=
X-Google-Smtp-Source: ABdhPJyO2xcTU5FZwJ/+IU0mHgDtc047zZZudhuiMlUvy0HszTwipZBXoU/aAoaXbW/tkCGrCteCABsqWIo0Z5O436Y=
X-Received: by 2002:a05:620a:983:: with SMTP id x3mr1141770qkx.119.1619055284489;
 Wed, 21 Apr 2021 18:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210421134403.2389496-1-trevor.gamblin@windriver.com> <569d6d53dce94323c9ff7a05ba15456f698223f2.camel@intel.com>
In-Reply-To: <569d6d53dce94323c9ff7a05ba15456f698223f2.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Apr 2021 18:34:33 -0700
Message-ID: <CAMKF1sq=_S9850LBS8BNzE82yR2uFhuKEZMddVCc-BFeUFO0FA@mail.gmail.com>
Subject: Re: [OE-core][hardknott][PATCH] nettle: fix CVE-2021-20305
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"trevor.gamblin@windriver.com" <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000001a917805c085af9d"

--0000000000001a917805c085af9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 6:05 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> Hi Trevor,
>
> On Wed, 2021-04-21 at 09:44 -0400, Trevor Gamblin wrote:
> > Backport and combine multiple commits from 3.7.2 to address this CVE.
> >
>
> I have taken the 3.7.2 upgrade for hardknott since the release notes
> mention it's a bug fix release.
>
>
> https://github.com/gnutls/nettle/commit/7a5f86321f4c67d7219aa87ea4e2ddca=
677d7378#diff-7ee66c4f1536ac84dc5bbff1b8312e2eef24b974b3e48a5c5c2bcfdf2eb8f=
3ce


Looks good
Usually third dot releases are bug fix only releases and thus safe but
thanks for checking it out

>
> <https://github.com/gnutls/nettle/commit/7a5f86321f4c67d7219aa87ea4e2ddc=
a677d7378#diff-7ee66c4f1536ac84dc5bbff1b8312e2eef24b974b3e48a5c5c2bcfdf2eb8=
f3ce>
>
> Thanks,
>
> Anuj
>
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > ---
> >  .../nettle/nettle/CVE-2021-20305.patch        | 516 +++++++++++++++++=
+
> >  meta/recipes-support/nettle/nettle_3.7.1.bb   |   1 +
> >  2 files changed, 517 insertions(+)
> >  create mode 100644 meta/recipes-support/nettle/nettle/CVE-2021-
> > 20305.patch
> >
> > diff --git a/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch
> > b/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch
> > new file mode 100644
> > index 0000000000..b1065c705a
> > --- /dev/null
> > +++ b/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch
> > @@ -0,0 +1,516 @@
> > +From 80e3d99afb5820d9b4ed807136ba32d57c4229a6 Mon Sep 17 00:00:00 200=
1
> > +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > +Date: Wed, 21 Apr 2021 09:15:34 -0400
> > +Subject: [PATCH] CVE-2021-20305
> > +
> > +Backport the following fixes from nettle 3.7.2:
> > +
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/a63893791280d441c71329=
3491da97c79c0950fe
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/971bed6ab4b27014eb2308=
5e8176917e1a096fd5
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/74ee0e82b6891e090f2072=
3750faeb19064e31b2
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/51f643eee00e2caa65c8a2=
f5857f49acdf3ef1ce
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/401c8d53d8a8cf1e79980e=
62bda3f946f8e07c14
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/ae3801a0e5cce276c27097=
3214385c86048d5f7b
> > +
> >
> https://git.lysator.liu.se/nettle/nettle/-/commit/63f222c60b03470c0005aa=
9bc4296fbf585f68b9
> > +
> > +CVE: CVE-2021-20305
> > +Upstream-Status: Backport
> > +
> > +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > +---
> > + ChangeLog                     | 40
> > ++++++++++++++++++++++++++++++++++-
> > + curve25519-eh-to-x.c          |  6 +-----
> > + curve448-eh-to-x.c            |  5 +----
> > + ecc-ecdsa-sign.c              |  3 +--
> > + ecc-ecdsa-verify.c            |  4 ++--
> > + ecc-eh-to-a.c                 | 12 ++---------
> > + ecc-gostdsa-verify.c          |  6 +++---
> > + ecc-internal.h                | 15 +++++++++++++
> > + ecc-j-to-a.c                  | 15 +++----------
> > + ecc-mod-arith.c               | 24 +++++++++++++++++++++
> > + ecc-mul-m.c                   |  6 ++----
> > + eddsa-hash.c                  | 10 ++++++---
> > + eddsa-verify.c                |  9 ++------
> > + gostdsa-vko.c                 |  2 +-
> > + testsuite/ecdsa-sign-test.c   | 26 +++++++++++++++++++++++
> > + testsuite/ecdsa-verify-test.c | 40
> > +++++++++++++++++++++++++++++++++++
> > + 16 files changed, 169 insertions(+), 54 deletions(-)
> > +
> > +diff --git a/ChangeLog b/ChangeLog
> > +index fd138d82..9ab52fab 100644
> > +--- a/ChangeLog
> > ++++ b/ChangeLog
> > +@@ -1,3 +1,18 @@
> > ++2021-03-13  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > ++
> > ++      * eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
> > ++
> > ++2021-03-11  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > ++
> > ++      * ecc-mod-arith.c (ecc_mod_mul_canonical,
> > ecc_mod_sqr_canonical):
> > ++      New functions.
> > ++      * ecc-internal.h: Declare and document new functions.
> > ++      * curve448-eh-to-x.c (curve448_eh_to_x): Use
> > ecc_mod_sqr_canonical.
> > ++      * curve25519-eh-to-x.c (curve25519_eh_to_x): Use
> > ecc_mod_mul_canonical.
> > ++      * ecc-eh-to-a.c (ecc_eh_to_a): Likewise.
> > ++      * ecc-j-to-a.c (ecc_j_to_a): Likewise.
> > ++      * ecc-mul-m.c (ecc_mul_m): Likewise.
> > ++
> > + 2021-02-17  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > +
> > +       * Released Nettle-3.7.1.
> > +@@ -316,11 +331,34 @@
> > +
> > + 2020-11-02  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > +
> > ++      * gostdsa-vko.c (gostdsa_vko): Use ecc_mod_mul_canonical to
> > ++      compute the scalar used for ecc multiplication.
> > ++
> > ++      * eddsa-hash.c (_eddsa_hash): Ensure result is canonically
> > ++      reduced. Two of the three call sites need that.
> > ++
> > ++      * ecc-gostdsa-verify.c (ecc_gostdsa_verify): Use
> > ecc_mod_mul_canonical
> > ++      to compute the scalars used for ecc multiplication.
> > ++
> > ++      * ecc-ecdsa-sign.c (ecc_ecdsa_sign): Ensure s output is reduce=
d
> > to
> > ++      canonical range.
> > ++
> > ++      * ecc-ecdsa-verify.c (ecc_ecdsa_verify): Use
> > ecc_mod_mul_canonical
> > ++      to compute the scalars used for ecc multiplication.
> > ++      * testsuite/ecdsa-verify-test.c (test_main): Add test case tha=
t
> > ++      triggers an assert on 64-bit platforms, without above fix.
> > ++      * testsuite/ecdsa-sign-test.c (test_main): Test case generatin=
g
> > ++      the same signature.
> > ++
> > ++2021-03-13  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > ++
> > +       * ecc-curve25519.c (ecc_mod_pow_252m3): Reduce scratch need.
> > +       (ecc_curve25519_inv): Likewise.
> > +       (ecc_curve25519_sqrt): Likewise.
> > +
> > +-2020-11-01  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > ++      * eddsa-verify.c (equal_h): Use ecc_mod_mul_canonical.
> > ++
> > ++2021-03-11  Niels M=C3=B6ller  <nisse@lysator.liu.se>
> > +
> > +       * ecc-mod-arith.c (ecc_mod_mul, ecc_mod_sqr): Separate argumen=
t
> > +       for scratch area, reducing required size of result area. Updat=
e
> > +diff --git a/curve25519-eh-to-x.c b/curve25519-eh-to-x.c
> > +index f0f1920d..d90defda 100644
> > +--- a/curve25519-eh-to-x.c
> > ++++ b/curve25519-eh-to-x.c
> > +@@ -53,7 +53,6 @@ curve25519_eh_to_x (mp_limb_t *xp, const mp_limb_t
> > *p,
> > + #define tp (scratch + 2*ecc->p.size)
> > +
> > +   const struct ecc_curve *ecc =3D &_nettle_curve25519;
> > +-  mp_limb_t cy;
> > +
> > +   /* If u =3D U/W and v =3D V/W are the coordinates of the point on =
the
> > +      Edwards curve we get the curve25519 x coordinate as
> > +@@ -69,10 +68,7 @@ curve25519_eh_to_x (mp_limb_t *xp, const mp_limb_t
> > *p,
> > +   ecc->p.invert (&ecc->p, t1, t0, tp);
> > +
> > +   ecc_mod_add (&ecc->p, t0, wp, vp);
> > +-  ecc_mod_mul (&ecc->p, t0, t0, t1, tp);
> > +-
> > +-  cy =3D mpn_sub_n (xp, t0, ecc->p.m, ecc->p.size);
> > +-  cnd_copy (cy, xp, t0, ecc->p.size);
> > ++  ecc_mod_mul_canonical (&ecc->p, xp, t0, t1, tp);
> > + #undef vp
> > + #undef wp
> > + #undef t0
> > +diff --git a/curve448-eh-to-x.c b/curve448-eh-to-x.c
> > +index 8f3f8c45..3b9bf3ec 100644
> > +--- a/curve448-eh-to-x.c
> > ++++ b/curve448-eh-to-x.c
> > +@@ -52,7 +52,6 @@ curve448_eh_to_x (mp_limb_t *xp, const mp_limb_t *p=
,
> > mp_limb_t *scratch)
> > + #define tp (scratch + ecc->p.size)
> > +
> > +   const struct ecc_curve *ecc =3D &_nettle_curve448;
> > +-  mp_limb_t cy;
> > +
> > +   /* If u =3D U/W and v =3D V/W are the coordinates of the point on
> > +      edwards448 we get the curve448 x coordinate as
> > +@@ -62,10 +61,8 @@ curve448_eh_to_x (mp_limb_t *xp, const mp_limb_t
> > *p, mp_limb_t *scratch)
> > +   /* Needs a total of 5*size storage. */
> > +   ecc->p.invert (&ecc->p, t0, up, tp);
> > +   ecc_mod_mul (&ecc->p, t0, t0, vp, tp);
> > +-  ecc_mod_sqr (&ecc->p, t0, t0, tp);
> > ++  ecc_mod_sqr_canonical (&ecc->p, xp, t0, tp);
> > +
> > +-  cy =3D mpn_sub_n (xp, t0, ecc->p.m, ecc->p.size);
> > +-  cnd_copy (cy, xp, t0, ecc->p.size);
> > + #undef up
> > + #undef vp
> > + #undef t0
> > +diff --git a/ecc-ecdsa-sign.c b/ecc-ecdsa-sign.c
> > +index f323196e..4adee1d1 100644
> > +--- a/ecc-ecdsa-sign.c
> > ++++ b/ecc-ecdsa-sign.c
> > +@@ -91,9 +91,8 @@ ecc_ecdsa_sign (const struct ecc_curve *ecc,
> > +
> > +   ecc_mod_mul (&ecc->q, tp, zp, rp, tp);
> > +   ecc_mod_add (&ecc->q, hp, hp, tp);
> > +-  ecc_mod_mul (&ecc->q, tp, hp, kinv, tp);
> > ++  ecc_mod_mul_canonical (&ecc->q, sp, hp, kinv, tp);
> > +
> > +-  mpn_copyi (sp, tp, ecc->p.size);
> > + #undef P
> > + #undef hp
> > + #undef kinv
> > +diff --git a/ecc-ecdsa-verify.c b/ecc-ecdsa-verify.c
> > +index 1b2dcca7..f3b112b0 100644
> > +--- a/ecc-ecdsa-verify.c
> > ++++ b/ecc-ecdsa-verify.c
> > +@@ -102,10 +102,10 @@ ecc_ecdsa_verify (const struct ecc_curve *ecc,
> > +
> > +   /* u1 =3D h / s, P1 =3D u1 * G */
> > +   ecc_hash (&ecc->q, hp, length, digest);
> > +-  ecc_mod_mul (&ecc->q, u1, hp, sinv, u1);
> > ++  ecc_mod_mul_canonical (&ecc->q, u1, hp, sinv, u1);
> > +
> > +   /* u2 =3D r / s, P2 =3D u2 * Y */
> > +-  ecc_mod_mul (&ecc->q, u2, rp, sinv, u2);
> > ++  ecc_mod_mul_canonical (&ecc->q, u2, rp, sinv, u2);
> > +
> > +    /* Total storage: 5*ecc->p.size + ecc->mul_itch */
> > +   ecc->mul (ecc, P2, u2, pp, u2 + ecc->p.size);
> > +diff --git a/ecc-eh-to-a.c b/ecc-eh-to-a.c
> > +index 24f6d0c0..5e3571c1 100644
> > +--- a/ecc-eh-to-a.c
> > ++++ b/ecc-eh-to-a.c
> > +@@ -49,23 +49,15 @@ ecc_eh_to_a (const struct ecc_curve *ecc,
> > + #define izp scratch
> > + #define tp (scratch + ecc->p.size)
> > +
> > +-
> > + #define xp p
> > + #define yp (p + ecc->p.size)
> > + #define zp (p + 2*ecc->p.size)
> > +
> > +-  mp_limb_t cy;
> > +-
> > +   assert(op =3D=3D 0);
> > +
> > +   /* Needs size + scratch for the invert call. */
> > +   ecc->p.invert (&ecc->p, izp, zp, tp);
> > +
> > +-  ecc_mod_mul (&ecc->p, tp, xp, izp, tp);
> > +-  cy =3D mpn_sub_n (r, tp, ecc->p.m, ecc->p.size);
> > +-  cnd_copy (cy, r, tp, ecc->p.size);
> > +-
> > +-  ecc_mod_mul (&ecc->p, tp, yp, izp, tp);
> > +-  cy =3D mpn_sub_n (r + ecc->p.size, tp, ecc->p.m, ecc->p.size);
> > +-  cnd_copy (cy, r + ecc->p.size, tp, ecc->p.size);
> > ++  ecc_mod_mul_canonical (&ecc->p, r, xp, izp, tp);
> > ++  ecc_mod_mul_canonical (&ecc->p, r + ecc->p.size, yp, izp, tp);
> > + }
> > +diff --git a/ecc-gostdsa-verify.c b/ecc-gostdsa-verify.c
> > +index c0613f4f..fcdd4644 100644
> > +--- a/ecc-gostdsa-verify.c
> > ++++ b/ecc-gostdsa-verify.c
> > +@@ -102,11 +102,11 @@ ecc_gostdsa_verify (const struct ecc_curve *ecc=
,
> > +   ecc->q.invert (&ecc->q, vp, hp, vp + ecc->p.size);
> > +
> > +   /* z1 =3D s / h, P1 =3D z1 * G */
> > +-  ecc_mod_mul (&ecc->q, z1, sp, vp, z1);
> > ++  ecc_mod_mul_canonical (&ecc->q, z1, sp, vp, z1);
> > +
> > +   /* z2 =3D - r / h, P2 =3D z2 * Y */
> > +-  ecc_mod_mul (&ecc->q, z2, rp, vp, z2);
> > +-  mpn_sub_n (z2, ecc->q.m, z2, ecc->p.size);
> > ++  mpn_sub_n (hp, ecc->q.m, rp, ecc->p.size);
> > ++  ecc_mod_mul_canonical (&ecc->q, z2, hp, vp, z2);
> > +
> > +    /* Total storage: 5*ecc->p.size + ecc->mul_itch */
> > +   ecc->mul (ecc, P2, z2, pp, z2 + ecc->p.size);
> > +diff --git a/ecc-internal.h b/ecc-internal.h
> > +index 55c9be27..acfcb4d7 100644
> > +--- a/ecc-internal.h
> > ++++ b/ecc-internal.h
> > +@@ -49,6 +49,8 @@
> > + #define ecc_mod_submul_1 _nettle_ecc_mod_submul_1
> > + #define ecc_mod_mul _nettle_ecc_mod_mul
> > + #define ecc_mod_sqr _nettle_ecc_mod_sqr
> > ++#define ecc_mod_mul_canonical _nettle_ecc_mod_mul_canonical
> > ++#define ecc_mod_sqr_canonical _nettle_ecc_mod_sqr_canonical
> > + #define ecc_mod_pow_2k _nettle_ecc_mod_pow_2k
> > + #define ecc_mod_pow_2k_mul _nettle_ecc_mod_pow_2k_mul
> > + #define ecc_mod_random _nettle_ecc_mod_random
> > +@@ -264,6 +266,19 @@ void
> > + ecc_mod_sqr (const struct ecc_modulo *m, mp_limb_t *rp,
> > +            const mp_limb_t *ap, mp_limb_t *tp);
> > +
> > ++/* These mul and sqr functions produce a canonical result, 0 <=3D R =
<
> > M.
> > ++   Requirements on input and output areas are similar to the above
> > ++   functions, except that it is *not* allowed to pass rp =3D rp +
> > ++   m->size.
> > ++ */
> > ++void
> > ++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
> > ++                     const mp_limb_t *ap, const mp_limb_t *bp,
> > mp_limb_t *tp);
> > ++
> > ++void
> > ++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
> > ++                     const mp_limb_t *ap, mp_limb_t *tp);
> > ++
> > + /* R <-- X^{2^k} mod M. Needs 2*ecc->size limbs of scratch space,
> > same
> > +    overlap requirements as mul and sqr above. */
> > + void
> > +diff --git a/ecc-j-to-a.c b/ecc-j-to-a.c
> > +index 2d55b3a5..ac134b51 100644
> > +--- a/ecc-j-to-a.c
> > ++++ b/ecc-j-to-a.c
> > +@@ -49,8 +49,6 @@ ecc_j_to_a (const struct ecc_curve *ecc,
> > + #define iz3p (scratch + 2*ecc->p.size)
> > + #define tp    scratch
> > +
> > +-  mp_limb_t cy;
> > +-
> > +   ecc->p.invert (&ecc->p, izp, p+2*ecc->p.size, izp + ecc->p.size);
> > +   ecc_mod_sqr (&ecc->p, iz2p, izp, iz2p);
> > +
> > +@@ -63,17 +61,13 @@ ecc_j_to_a (const struct ecc_curve *ecc,
> > +     }
> > +
> > +   /* r_x <-- x / z^2 */
> > +-  ecc_mod_mul (&ecc->p, iz3p, iz2p, p, iz3p);
> > +-  /* ecc_mod (and ecc_mod_mul) may return a value up to 2p - 1, so
> > +-     do a conditional subtraction. */
> > +-  cy =3D mpn_sub_n (r, iz3p, ecc->p.m, ecc->p.size);
> > +-  cnd_copy (cy, r, iz3p, ecc->p.size);
> > +-
> > ++  ecc_mod_mul_canonical (&ecc->p, r, iz2p, p, iz3p);
> > +   if (op)
> > +     {
> > +       /* Skip y coordinate */
> > +       if (op > 1)
> > +       {
> > ++        mp_limb_t cy;
> > +         /* Also reduce the x coordinate mod ecc->q. It should
> > +            already be < 2*ecc->q, so one subtraction should
> > +            suffice. */
> > +@@ -83,10 +77,7 @@ ecc_j_to_a (const struct ecc_curve *ecc,
> > +       return;
> > +     }
> > +   ecc_mod_mul (&ecc->p, iz3p, iz2p, izp, iz3p);
> > +-  ecc_mod_mul (&ecc->p, tp, iz3p, p + ecc->p.size, tp);
> > +-  /* And a similar subtraction. */
> > +-  cy =3D mpn_sub_n (r + ecc->p.size, tp, ecc->p.m, ecc->p.size);
> > +-  cnd_copy (cy, r + ecc->p.size, tp, ecc->p.size);
> > ++  ecc_mod_mul_canonical (&ecc->p, r + ecc->p.size, iz3p, p + ecc-
> > >p.size, tp);
> > +
> > + #undef izp
> > + #undef iz2p
> > +diff --git a/ecc-mod-arith.c b/ecc-mod-arith.c
> > +index 551f2c14..b3021d94 100644
> > +--- a/ecc-mod-arith.c
> > ++++ b/ecc-mod-arith.c
> > +@@ -125,6 +125,30 @@ ecc_mod_sqr (const struct ecc_modulo *m,
> > mp_limb_t *rp,
> > +   m->reduce (m, rp, tp);
> > + }
> > +
> > ++void
> > ++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
> > ++                     const mp_limb_t *ap, const mp_limb_t *bp,
> > mp_limb_t *tp)
> > ++{
> > ++  mp_limb_t cy;
> > ++  mpn_mul_n (tp, ap, bp, m->size);
> > ++  m->reduce (m, tp + m->size, tp);
> > ++
> > ++  cy =3D mpn_sub_n (rp, tp + m->size, m->m, m->size);
> > ++  cnd_copy (cy, rp, tp + m->size, m->size);
> > ++}
> > ++
> > ++void
> > ++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,
> > ++                     const mp_limb_t *ap, mp_limb_t *tp)
> > ++{
> > ++  mp_limb_t cy;
> > ++  mpn_sqr (tp, ap, m->size);
> > ++  m->reduce (m, tp + m->size, tp);
> > ++
> > ++  cy =3D mpn_sub_n (rp, tp + m->size, m->m, m->size);
> > ++  cnd_copy (cy, rp, tp + m->size, m->size);
> > ++}
> > ++
> > + void
> > + ecc_mod_pow_2k (const struct ecc_modulo *m,
> > +               mp_limb_t *rp, const mp_limb_t *xp,
> > +diff --git a/ecc-mul-m.c b/ecc-mul-m.c
> > +index a3355751..f0ceb924 100644
> > +--- a/ecc-mul-m.c
> > ++++ b/ecc-mul-m.c
> > +@@ -48,7 +48,7 @@ ecc_mul_m (const struct ecc_modulo *m,
> > +          mp_limb_t *scratch)
> > + {
> > +   unsigned i;
> > +-  mp_limb_t cy, swap;
> > ++  mp_limb_t swap;
> > +
> > + #define x2 (scratch)
> > + #define z2 (scratch + m->size)
> > +@@ -162,7 +162,5 @@ ecc_mul_m (const struct ecc_modulo *m,
> > +     }
> > +   assert (m->invert_itch <=3D 7 * m->size);
> > +   m->invert (m, x3, z2, z3 + m->size);
> > +-  ecc_mod_mul (m, z3, x2, x3, z3);
> > +-  cy =3D mpn_sub_n (qx, z3, m->m, m->size);
> > +-  cnd_copy (cy, qx, z3, m->size);
> > ++  ecc_mod_mul_canonical (m, qx, x2, x3, z3);
> > + }
> > +diff --git a/eddsa-hash.c b/eddsa-hash.c
> > +index 95e0dd70..6ebbe977 100644
> > +--- a/eddsa-hash.c
> > ++++ b/eddsa-hash.c
> > +@@ -44,13 +44,14 @@
> > + #include "ecc-internal.h"
> > + #include "nettle-internal.h"
> > +
> > +-/* Convert hash digest to integer, and reduce modulo q, to m->size
> > +-   limbs. Needs space for 2*m->size + 1 at rp. */
> > ++/* Convert hash digest to integer, and reduce canonically modulo q.
> > ++   Needs space for 2*m->size + 1 at rp. */
> > + void
> > + _eddsa_hash (const struct ecc_modulo *m,
> > +            mp_limb_t *rp, size_t digest_size, const uint8_t *digest)
> > + {
> > +   mp_size_t nlimbs =3D (8*digest_size + GMP_NUMB_BITS - 1) /
> > GMP_NUMB_BITS;
> > ++  mp_limb_t cy;
> > +
> > +   mpn_set_base256_le (rp, nlimbs, digest, digest_size);
> > +
> > +@@ -74,5 +75,8 @@ _eddsa_hash (const struct ecc_modulo *m,
> > +       hi =3D mpn_cnd_add_n (hi, rp + m->size, rp + m->size, m->B, m-
> > >size);
> > +       assert (hi =3D=3D 0);
> > +     }
> > +-  m->mod (m, rp, rp);
> > ++  m->mod (m, rp + m->size , rp);
> > ++  /* Ensure canonical reduction. */
> > ++  cy =3D mpn_sub_n (rp, rp + m->size, m->m, m->size);
> > ++  cnd_copy (cy, rp, rp + m->size, m->size);
> > + }
> > +diff --git a/eddsa-verify.c b/eddsa-verify.c
> > +index de68f240..10d075ee 100644
> > +--- a/eddsa-verify.c
> > ++++ b/eddsa-verify.c
> > +@@ -53,13 +53,8 @@ equal_h (const struct ecc_modulo *p,
> > + #define t0 scratch
> > + #define t1 (scratch + p->size)
> > +
> > +-  ecc_mod_mul (p, t0, x1, z2, t0);
> > +-  if (mpn_cmp (t0, p->m, p->size) >=3D 0)
> > +-    mpn_sub_n (t0, t0, p->m, p->size);
> > +-
> > +-  ecc_mod_mul (p, t1, x2, z1, t1);
> > +-  if (mpn_cmp (t1, p->m, p->size) >=3D 0)
> > +-    mpn_sub_n (t1, t1, p->m, p->size);
> > ++  ecc_mod_mul_canonical (p, t0, x1, z2, t0);
> > ++  ecc_mod_mul_canonical (p, t1, x2, z1, t1);
> > +
> > +   return mpn_cmp (t0, t1, p->size) =3D=3D 0;
> > +
> > +diff --git a/gostdsa-vko.c b/gostdsa-vko.c
> > +index a02d59a9..3dc42a1e 100644
> > +--- a/gostdsa-vko.c
> > ++++ b/gostdsa-vko.c
> > +@@ -87,7 +87,7 @@ gostdsa_vko (const struct ecc_scalar *priv,
> > +   if (mpn_zero_p (UKM, size))
> > +     UKM[0] =3D 1;
> > +
> > +-  ecc_mod_mul (&ecc->q, TEMP, priv->p, UKM, TEMP); /* TEMP =3D UKM *
> > priv */
> > ++  ecc_mod_mul_canonical (&ecc->q, TEMP, priv->p, UKM, TEMP); /* TEMP
> > =3D UKM * priv */
> > +   ecc->mul (ecc, XYZ, TEMP, pub->p, scratch + 4*size); /* XYZ =3D UK=
M *
> > priv * pub */
> > +   ecc->h_to_a (ecc, 0, TEMP, XYZ, scratch + 5*size); /* TEMP =3D XYZ=
 */
> > +   mpn_get_base256_le (out, bsize, TEMP, size);
> > +diff --git a/testsuite/ecdsa-sign-test.c b/testsuite/ecdsa-sign-test.=
c
> > +index b240a31b..ed7e22bc 100644
> > +--- a/testsuite/ecdsa-sign-test.c
> > ++++ b/testsuite/ecdsa-sign-test.c
> > +@@ -58,6 +58,32 @@ test_ecdsa (const struct ecc_curve *ecc,
> > + void
> > + test_main (void)
> > + {
> > ++  /* Producing the signature for corresponding test in
> > ++     ecdsa-verify-test.c, with special u1 and u2. */
> > ++  test_ecdsa (&_nettle_secp_224r1,
> > ++            "99b5b787484def12894ca507058b3bf5"
> > ++            "43d72d82fa7721d2e805e5e6",
> > ++            "2",
> > ++            SHEX("cdb887ac805a3b42e22d224c85482053"
> > ++                 "16c755d4a736bb2032c92553"),
> > ++            "706a46dc76dcb76798e60e6d89474788"
> > ++            "d16dc18032d268fd1a704fa6", /* r */
> > ++            "3a41e1423b1853e8aa89747b1f987364"
> > ++            "44705d6d6d8371ea1f578f2e"); /* s */
> > ++
> > ++  /* Producing the signature for corresponding test in
> > ++     ecdsa-verify-test.c, with special u1 and u2. */
> > ++  test_ecdsa (&_nettle_secp_224r1,
> > ++            "99b5b787484def12894ca507058b3bf5"
> > ++            "43d72d82fa7721d2e805e5e6",
> > ++            "2",
> > ++            SHEX("cdb887ac805a3b42e22d224c85482053"
> > ++                 "16c755d4a736bb2032c92553"),
> > ++            "706a46dc76dcb76798e60e6d89474788"
> > ++            "d16dc18032d268fd1a704fa6", /* r */
> > ++            "3a41e1423b1853e8aa89747b1f987364"
> > ++            "44705d6d6d8371ea1f578f2e"); /* s */
> > ++
> > +   /* Test cases for the smaller groups, verified with a
> > +      proof-of-concept implementation done for Yubico AB. */
> > +   test_ecdsa (&_nettle_secp_192r1,
> > +diff --git a/testsuite/ecdsa-verify-test.c b/testsuite/ecdsa-verify-
> > test.c
> > +index 3ceac0eb..edcd32ea 100644
> > +--- a/testsuite/ecdsa-verify-test.c
> > ++++ b/testsuite/ecdsa-verify-test.c
> > +@@ -81,6 +81,46 @@ test_ecdsa (const struct ecc_curve *ecc,
> > + void
> > + test_main (void)
> > + {
> > ++  /* Corresponds to nonce k =3D 2 and private key z =3D
> > ++     0x99b5b787484def12894ca507058b3bf543d72d82fa7721d2e805e5e6. z
> > and
> > ++     hash are chosen so that intermediate scalars in the verify
> > ++     equations are u1 =3D 0x6b245680e700, u2 =3D
> > ++     259da6542d4ba7d21ad916c3bd57f811. These values require canonica=
l
> > ++     reduction of the scalars. Bug caused by missing canonical
> > ++     reduction reported by Guido Vranken. */
> > ++  test_ecdsa (&_nettle_secp_224r1,
> > ++            "9e7e6cc6b1bdfa8ee039b66ad85e5490"
> > ++            "7be706a900a3cba1c8fdd014", /* x */
> > ++            "74855db3f7c1b4097ae095745fc915e3"
> > ++            "8a79d2a1de28f282eafb22ba", /* y */
> > ++
> > ++            SHEX("cdb887ac805a3b42e22d224c85482053"
> > ++                 "16c755d4a736bb2032c92553"),
> > ++            "706a46dc76dcb76798e60e6d89474788"
> > ++            "d16dc18032d268fd1a704fa6", /* r */
> > ++            "3a41e1423b1853e8aa89747b1f987364"
> > ++            "44705d6d6d8371ea1f578f2e"); /* s */
> > ++
> > ++  /* Corresponds to nonce k =3D 2 and private key z =3D
> > ++     0x99b5b787484def12894ca507058b3bf543d72d82fa7721d2e805e5e6. z
> > and
> > ++     hash are chosen so that intermediate scalars in the verify
> > ++     equations are u1 =3D 0x6b245680e700, u2 =3D
> > ++     259da6542d4ba7d21ad916c3bd57f811. These values require canonica=
l
> > ++     reduction of the scalars. Bug caused by missing canonical
> > ++     reduction reported by Guido Vranken. */
> > ++  test_ecdsa (&_nettle_secp_224r1,
> > ++            "9e7e6cc6b1bdfa8ee039b66ad85e5490"
> > ++            "7be706a900a3cba1c8fdd014", /* x */
> > ++            "74855db3f7c1b4097ae095745fc915e3"
> > ++            "8a79d2a1de28f282eafb22ba", /* y */
> > ++
> > ++            SHEX("cdb887ac805a3b42e22d224c85482053"
> > ++                 "16c755d4a736bb2032c92553"),
> > ++            "706a46dc76dcb76798e60e6d89474788"
> > ++            "d16dc18032d268fd1a704fa6", /* r */
> > ++            "3a41e1423b1853e8aa89747b1f987364"
> > ++            "44705d6d6d8371ea1f578f2e"); /* s */
> > ++
> > +   /* Test case provided by Guido Vranken, from oss-fuzz */
> > +   test_ecdsa (&_nettle_secp_192r1,
> > +             "14683086 f1734c6d e68743a6 48181b54 a74d4c5b 383eb6a8",
> > /* x */
> > +--
> > +2.30.2
> > +
> > diff --git a/meta/recipes-support/nettle/nettle_3.7.1.bb
> > b/meta/recipes-support/nettle/nettle_3.7.1.bb
> > index 3bbcf17c7a..0e2bd2a7e1 100644
> > --- a/meta/recipes-support/nettle/nettle_3.7.1.bb
> > +++ b/meta/recipes-support/nettle/nettle_3.7.1.bb
> > @@ -18,6 +18,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
> >             file://Add-target-to-only-build-tests-not-run-them.patch \
> >             file://run-ptest \
> >
> > file://check-header-files-of-openssl-only-if-enable_.patch \
> > +           file://CVE-2021-20305.patch \
> >             "
> >
> >  SRC_URI_append_class-target =3D "\
> >
> >
> >
>
>
>=20
>
>

--0000000000001a917805c085af9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 21, 2021 at 6:05 PM Anuj Mittal &lt;<a href=3D=
"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hi Trevor,<br>
<br>
On Wed, 2021-04-21 at 09:44 -0400, Trevor Gamblin wrote:<br>
&gt; Backport and combine multiple commits from 3.7.2 to address this CVE.=
<br>
&gt; <br>
<br>
I have taken the 3.7.2 upgrade for hardknott since the release notes<br>
mention it&#39;s a bug fix release. <br>
<br>
<a href=3D"https://github.com/gnutls/nettle/commit/7a5f86321f4c67d7219aa87=
ea4e2ddca677d7378#diff-7ee66c4f1536ac84dc5bbff1b8312e2eef24b974b3e48a5c5c2b=
cfdf2eb8f3ce" rel=3D"noreferrer" target=3D"_blank">https://github.com/gnutl=
s/nettle/commit/7a5f86321f4c67d7219aa87ea4e2ddca677d7378#diff-7ee66c4f1536a=
c84dc5bbff1b8312e2eef24b974b3e48a5c5c2bcfdf2eb8f3ce</a></blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">Looks good</div><div dir=3D"auto">Us=
ually third dot releases are bug fix only releases and thus safe but thanks=
 for checking it out=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"=
><a href=3D"https://github.com/gnutls/nettle/commit/7a5f86321f4c67d7219aa87=
ea4e2ddca677d7378#diff-7ee66c4f1536ac84dc5bbff1b8312e2eef24b974b3e48a5c5c2b=
cfdf2eb8f3ce" rel=3D"noreferrer" target=3D"_blank"></a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@wi=
ndriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../nettle/nettle/CVE-2021-20305.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 516 ++++++++++++++++++<br>
&gt; =C2=A0meta/recipes-support/nettle/<a href=3D"http://nettle_3.7.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nettle_3.7.1.bb</a>=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +<br>
&gt; =C2=A02 files changed, 517 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-support/nettle/nettle/CVE-2021-=
<br>
&gt; 20305.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch<=
br>
&gt; b/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b1065c705a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/nettle/nettle/CVE-2021-20305.patch<br>
&gt; @@ -0,0 +1,516 @@<br>
&gt; +From 80e3d99afb5820d9b4ed807136ba32d57c4229a6 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.=
com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; +Date: Wed, 21 Apr 2021 09:15:34 -0400<br>
&gt; +Subject: [PATCH] CVE-2021-20305<br>
&gt; +<br>
&gt; +Backport the following fixes from nettle 3.7.2:<br>
&gt; +<br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/a6389379=
1280d441c713293491da97c79c0950fe" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/a63893791280d441c713293491da9=
7c79c0950fe</a><br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/971bed6a=
b4b27014eb23085e8176917e1a096fd5" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/971bed6ab4b27014eb23085e81769=
17e1a096fd5</a><br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/74ee0e82=
b6891e090f20723750faeb19064e31b2" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/74ee0e82b6891e090f20723750fae=
b19064e31b2</a><br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/51f643ee=
e00e2caa65c8a2f5857f49acdf3ef1ce" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/51f643eee00e2caa65c8a2f5857f4=
9acdf3ef1ce</a><br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/401c8d53=
d8a8cf1e79980e62bda3f946f8e07c14" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/401c8d53d8a8cf1e79980e62bda3f=
946f8e07c14</a><br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/ae3801a0=
e5cce276c270973214385c86048d5f7b" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/ae3801a0e5cce276c270973214385=
c86048d5f7b</a><br>
&gt; +<br>
&gt; <a href=3D"https://git.lysator.liu.se/nettle/nettle/-/commit/63f222c6=
0b03470c0005aa9bc4296fbf585f68b9" rel=3D"noreferrer" target=3D"_blank">http=
s://git.lysator.liu.se/nettle/nettle/-/commit/63f222c60b03470c0005aa9bc4296=
fbf585f68b9</a><br>
&gt; +<br>
&gt; +CVE: CVE-2021-20305<br>
&gt; +Upstream-Status: Backport<br>
&gt; +<br>
&gt; +Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@w=
indriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; +---<br>
&gt; + ChangeLog=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 40<br>
&gt; ++++++++++++++++++++++++++++++++++-<br>
&gt; + curve25519-eh-to-x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +-----<br>
&gt; + curve448-eh-to-x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +----<br>
&gt; + ecc-ecdsa-sign.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +--<br>
&gt; + ecc-ecdsa-verify.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--<br>
&gt; + ecc-eh-to-a.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++---------<br>
&gt; + ecc-gostdsa-verify.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +++---<br>
&gt; + ecc-internal.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++++++++<br>
&gt; + ecc-j-to-a.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++----------<br>
&gt; + ecc-mod-arith.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 +++++++++++++++++++++<br>
&gt; + ecc-mul-m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++----<br=
>
&gt; + eddsa-hash.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++---<br>
&gt; + eddsa-verify.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++------<br>
&gt; + gostdsa-vko.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<br>
&gt; + testsuite/ecdsa-sign-test.c=C2=A0=C2=A0 | 26 ++++++++++++++++++++++=
+<br>
&gt; + testsuite/ecdsa-verify-test.c | 40<br>
&gt; +++++++++++++++++++++++++++++++++++<br>
&gt; + 16 files changed, 169 insertions(+), 54 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/ChangeLog b/ChangeLog<br>
&gt; +index fd138d82..9ab52fab 100644<br>
&gt; +--- a/ChangeLog<br>
&gt; ++++ b/ChangeLog<br>
&gt; +@@ -1,3 +1,18 @@<br>
&gt; ++2021-03-13=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* eddsa-verify.c (equal_h): Use=
 ecc_mod_mul_canonical.<br>
&gt; ++<br>
&gt; ++2021-03-11=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-mod-arith.c (ecc_mod_mul_=
canonical,<br>
&gt; ecc_mod_sqr_canonical):<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0New functions.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-internal.h: Declare and d=
ocument new functions.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* curve448-eh-to-x.c (curve448_=
eh_to_x): Use<br>
&gt; ecc_mod_sqr_canonical.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* curve25519-eh-to-x.c (curve25=
519_eh_to_x): Use<br>
&gt; ecc_mod_mul_canonical.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-eh-to-a.c (ecc_eh_to_a): =
Likewise.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-j-to-a.c (ecc_j_to_a): Li=
kewise.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-mul-m.c (ecc_mul_m): Like=
wise.<br>
&gt; ++<br>
&gt; + 2021-02-17=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Released Nettle-3.7.1.<b=
r>
&gt; +@@ -316,11 +331,34 @@<br>
&gt; + <br>
&gt; + 2020-11-02=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; + <br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gostdsa-vko.c (gostdsa_vko): =
Use ecc_mod_mul_canonical to<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compute the scalar used for ecc=
 multiplication.<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* eddsa-hash.c (_eddsa_hash): E=
nsure result is canonically<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reduced. Two of the three call =
sites need that.<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-gostdsa-verify.c (ecc_gos=
tdsa_verify): Use<br>
&gt; ecc_mod_mul_canonical<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0to compute the scalars used for=
 ecc multiplication.<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-ecdsa-sign.c (ecc_ecdsa_s=
ign): Ensure s output is reduced<br>
&gt; to<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0canonical range.<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-ecdsa-verify.c (ecc_ecdsa=
_verify): Use<br>
&gt; ecc_mod_mul_canonical<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0to compute the scalars used for=
 ecc multiplication.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* testsuite/ecdsa-verify-test.c=
 (test_main): Add test case that<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0triggers an assert on 64-bit pl=
atforms, without above fix.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* testsuite/ecdsa-sign-test.c (=
test_main): Test case generating<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0the same signature.<br>
&gt; ++<br>
&gt; ++2021-03-13=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-curve25519.c (ecc_mo=
d_pow_252m3): Reduce scratch need.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ecc_curve25519_inv): Like=
wise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ecc_curve25519_sqrt): Lik=
ewise.<br>
&gt; + <br>
&gt; +-2020-11-01=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* eddsa-verify.c (equal_h): Use=
 ecc_mod_mul_canonical.<br>
&gt; ++<br>
&gt; ++2021-03-11=C2=A0 Niels M=C3=B6ller=C2=A0 &lt;<a href=3D"mailto:niss=
e@lysator.liu.se" target=3D"_blank">nisse@lysator.liu.se</a>&gt;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* ecc-mod-arith.c (ecc_mod=
_mul, ecc_mod_sqr): Separate argument<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for scratch area, reducing=
 required size of result area. Update<br>
&gt; +diff --git a/curve25519-eh-to-x.c b/curve25519-eh-to-x.c<br>
&gt; +index f0f1920d..d90defda 100644<br>
&gt; +--- a/curve25519-eh-to-x.c<br>
&gt; ++++ b/curve25519-eh-to-x.c<br>
&gt; +@@ -53,7 +53,6 @@ curve25519_eh_to_x (mp_limb_t *xp, const mp_limb_t=
<br>
&gt; *p,<br>
&gt; + #define tp (scratch + 2*ecc-&gt;p.size)<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 const struct ecc_curve *ecc =3D &amp;_nettle_curve25519=
;<br>
&gt; +-=C2=A0 mp_limb_t cy;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* If u =3D U/W and v =3D V/W are the coordinates of th=
e point on the<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Edwards curve we get the curve25519 x=
 coordinate as<br>
&gt; +@@ -69,10 +68,7 @@ curve25519_eh_to_x (mp_limb_t *xp, const mp_limb_=
t<br>
&gt; *p,<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;p.invert (&amp;ecc-&gt;p, t1, t0, tp);<br>
&gt; +=C2=A0=C2=A0 <br>
&gt; +=C2=A0=C2=A0 ecc_mod_add (&amp;ecc-&gt;p, t0, wp, vp);<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, t0, t0, t1, tp);<br>
&gt; +-<br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (xp, t0, ecc-&gt;p.m, ecc-&gt;p.size);<br>
&gt; +-=C2=A0 cnd_copy (cy, xp, t0, ecc-&gt;p.size);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;p, xp, t0, t1, tp);<br>
&gt; + #undef vp<br>
&gt; + #undef wp<br>
&gt; + #undef t0<br>
&gt; +diff --git a/curve448-eh-to-x.c b/curve448-eh-to-x.c<br>
&gt; +index 8f3f8c45..3b9bf3ec 100644<br>
&gt; +--- a/curve448-eh-to-x.c<br>
&gt; ++++ b/curve448-eh-to-x.c<br>
&gt; +@@ -52,7 +52,6 @@ curve448_eh_to_x (mp_limb_t *xp, const mp_limb_t *=
p,<br>
&gt; mp_limb_t *scratch)<br>
&gt; + #define tp (scratch + ecc-&gt;p.size)<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 const struct ecc_curve *ecc =3D &amp;_nettle_curve448;<=
br>
&gt; +-=C2=A0 mp_limb_t cy;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* If u =3D U/W and v =3D V/W are the coordinates of th=
e point on<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 edwards448 we get the curve448 x coor=
dinate as<br>
&gt; +@@ -62,10 +61,8 @@ curve448_eh_to_x (mp_limb_t *xp, const mp_limb_t<=
br>
&gt; *p, mp_limb_t *scratch)<br>
&gt; +=C2=A0=C2=A0 /* Needs a total of 5*size storage. */<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;p.invert (&amp;ecc-&gt;p, t0, up, tp);<br>
&gt; +=C2=A0=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, t0, t0, vp, tp);<br>
&gt; +-=C2=A0 ecc_mod_sqr (&amp;ecc-&gt;p, t0, t0, tp);<br>
&gt; ++=C2=A0 ecc_mod_sqr_canonical (&amp;ecc-&gt;p, xp, t0, tp);<br>
&gt; + <br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (xp, t0, ecc-&gt;p.m, ecc-&gt;p.size);<br>
&gt; +-=C2=A0 cnd_copy (cy, xp, t0, ecc-&gt;p.size);<br>
&gt; + #undef up<br>
&gt; + #undef vp<br>
&gt; + #undef t0<br>
&gt; +diff --git a/ecc-ecdsa-sign.c b/ecc-ecdsa-sign.c<br>
&gt; +index f323196e..4adee1d1 100644<br>
&gt; +--- a/ecc-ecdsa-sign.c<br>
&gt; ++++ b/ecc-ecdsa-sign.c<br>
&gt; +@@ -91,9 +91,8 @@ ecc_ecdsa_sign (const struct ecc_curve *ecc,<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, tp, zp, rp, tp);<br>
&gt; +=C2=A0=C2=A0 ecc_mod_add (&amp;ecc-&gt;q, hp, hp, tp);<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, tp, hp, kinv, tp);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;q, sp, hp, kinv, tp);<br=
>
&gt; + <br>
&gt; +-=C2=A0 mpn_copyi (sp, tp, ecc-&gt;p.size);<br>
&gt; + #undef P<br>
&gt; + #undef hp<br>
&gt; + #undef kinv<br>
&gt; +diff --git a/ecc-ecdsa-verify.c b/ecc-ecdsa-verify.c<br>
&gt; +index 1b2dcca7..f3b112b0 100644<br>
&gt; +--- a/ecc-ecdsa-verify.c<br>
&gt; ++++ b/ecc-ecdsa-verify.c<br>
&gt; +@@ -102,10 +102,10 @@ ecc_ecdsa_verify (const struct ecc_curve *ecc,=
<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* u1 =3D h / s, P1 =3D u1 * G */<br>
&gt; +=C2=A0=C2=A0 ecc_hash (&amp;ecc-&gt;q, hp, length, digest);<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, u1, hp, sinv, u1);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;q, u1, hp, sinv, u1);<br=
>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* u2 =3D r / s, P2 =3D u2 * Y */<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, u2, rp, sinv, u2);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;q, u2, rp, sinv, u2);<br=
>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0 /* Total storage: 5*ecc-&gt;p.size + ecc-&gt;mul_=
itch */<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;mul (ecc, P2, u2, pp, u2 + ecc-&gt;p.size);<br>
&gt; +diff --git a/ecc-eh-to-a.c b/ecc-eh-to-a.c<br>
&gt; +index 24f6d0c0..5e3571c1 100644<br>
&gt; +--- a/ecc-eh-to-a.c<br>
&gt; ++++ b/ecc-eh-to-a.c<br>
&gt; +@@ -49,23 +49,15 @@ ecc_eh_to_a (const struct ecc_curve *ecc,<br>
&gt; + #define izp scratch<br>
&gt; + #define tp (scratch + ecc-&gt;p.size)<br>
&gt; + <br>
&gt; +-<br>
&gt; + #define xp p<br>
&gt; + #define yp (p + ecc-&gt;p.size)<br>
&gt; + #define zp (p + 2*ecc-&gt;p.size)<br>
&gt; + <br>
&gt; +-=C2=A0 mp_limb_t cy;<br>
&gt; +-<br>
&gt; +=C2=A0=C2=A0 assert(op =3D=3D 0);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* Needs size + scratch for the invert call. */<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;p.invert (&amp;ecc-&gt;p, izp, zp, tp);<br>
&gt; + <br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, tp, xp, izp, tp);<br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (r, tp, ecc-&gt;p.m, ecc-&gt;p.size);<br>
&gt; +-=C2=A0 cnd_copy (cy, r, tp, ecc-&gt;p.size);<br>
&gt; +-<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, tp, yp, izp, tp);<br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (r + ecc-&gt;p.size, tp, ecc-&gt;p.m, ecc-&=
gt;p.size);<br>
&gt; +-=C2=A0 cnd_copy (cy, r + ecc-&gt;p.size, tp, ecc-&gt;p.size);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;p, r, xp, izp, tp);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;p, r + ecc-&gt;p.size, y=
p, izp, tp);<br>
&gt; + }<br>
&gt; +diff --git a/ecc-gostdsa-verify.c b/ecc-gostdsa-verify.c<br>
&gt; +index c0613f4f..fcdd4644 100644<br>
&gt; +--- a/ecc-gostdsa-verify.c<br>
&gt; ++++ b/ecc-gostdsa-verify.c<br>
&gt; +@@ -102,11 +102,11 @@ ecc_gostdsa_verify (const struct ecc_curve *ec=
c,<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;q.invert (&amp;ecc-&gt;q, vp, hp, vp + ecc-&gt;=
p.size);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* z1 =3D s / h, P1 =3D z1 * G */<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, z1, sp, vp, z1);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;q, z1, sp, vp, z1);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* z2 =3D - r / h, P2 =3D z2 * Y */<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, z2, rp, vp, z2);<br>
&gt; +-=C2=A0 mpn_sub_n (z2, ecc-&gt;q.m, z2, ecc-&gt;p.size);<br>
&gt; ++=C2=A0 mpn_sub_n (hp, ecc-&gt;q.m, rp, ecc-&gt;p.size);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;q, z2, hp, vp, z2);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0 /* Total storage: 5*ecc-&gt;p.size + ecc-&gt;mul_=
itch */<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;mul (ecc, P2, z2, pp, z2 + ecc-&gt;p.size);<br>
&gt; +diff --git a/ecc-internal.h b/ecc-internal.h<br>
&gt; +index 55c9be27..acfcb4d7 100644<br>
&gt; +--- a/ecc-internal.h<br>
&gt; ++++ b/ecc-internal.h<br>
&gt; +@@ -49,6 +49,8 @@<br>
&gt; + #define ecc_mod_submul_1 _nettle_ecc_mod_submul_1<br>
&gt; + #define ecc_mod_mul _nettle_ecc_mod_mul<br>
&gt; + #define ecc_mod_sqr _nettle_ecc_mod_sqr<br>
&gt; ++#define ecc_mod_mul_canonical _nettle_ecc_mod_mul_canonical<br>
&gt; ++#define ecc_mod_sqr_canonical _nettle_ecc_mod_sqr_canonical<br>
&gt; + #define ecc_mod_pow_2k _nettle_ecc_mod_pow_2k<br>
&gt; + #define ecc_mod_pow_2k_mul _nettle_ecc_mod_pow_2k_mul<br>
&gt; + #define ecc_mod_random _nettle_ecc_mod_random<br>
&gt; +@@ -264,6 +266,19 @@ void<br>
&gt; + ecc_mod_sqr (const struct ecc_modulo *m, mp_limb_t *rp,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst mp_limb_t *ap, mp_limb_t *tp);<br>
&gt; + <br>
&gt; ++/* These mul and sqr functions produce a canonical result, 0 &lt;=
=3D R &lt;<br>
&gt; M.<br>
&gt; ++=C2=A0=C2=A0 Requirements on input and output areas are similar to =
the above<br>
&gt; ++=C2=A0=C2=A0 functions, except that it is *not* allowed to pass rp =
=
=3D rp +<br>
&gt; ++=C2=A0=C2=A0 m-&gt;size.<br>
&gt; ++ */<br>
&gt; ++void<br>
&gt; ++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const mp_limb_t *ap=
, const mp_limb_t *bp,<br>
&gt; mp_limb_t *tp);<br>
&gt; ++<br>
&gt; ++void<br>
&gt; ++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const mp_limb_t *ap=
, mp_limb_t *tp);<br>
&gt; ++<br>
&gt; + /* R &lt;-- X^{2^k} mod M. Needs 2*ecc-&gt;size limbs of scratch sp=
ace,<br>
&gt; same<br>
&gt; +=C2=A0=C2=A0=C2=A0 overlap requirements as mul and sqr above. */<br>
&gt; + void<br>
&gt; +diff --git a/ecc-j-to-a.c b/ecc-j-to-a.c<br>
&gt; +index 2d55b3a5..ac134b51 100644<br>
&gt; +--- a/ecc-j-to-a.c<br>
&gt; ++++ b/ecc-j-to-a.c<br>
&gt; +@@ -49,8 +49,6 @@ ecc_j_to_a (const struct ecc_curve *ecc,<br>
&gt; + #define iz3p (scratch + 2*ecc-&gt;p.size)<br>
&gt; + #define tp=C2=A0=C2=A0=C2=A0 scratch<br>
&gt; + <br>
&gt; +-=C2=A0 mp_limb_t cy;<br>
&gt; +-<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;p.invert (&amp;ecc-&gt;p, izp, p+2*ecc-&gt;p.si=
ze, izp + ecc-&gt;p.size);<br>
&gt; +=C2=A0=C2=A0 ecc_mod_sqr (&amp;ecc-&gt;p, iz2p, izp, iz2p);<br>
&gt; + <br>
&gt; +@@ -63,17 +61,13 @@ ecc_j_to_a (const struct ecc_curve *ecc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* r_x &lt;-- x / z^2 */<br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, iz3p, iz2p, p, iz3p);<br>
&gt; +-=C2=A0 /* ecc_mod (and ecc_mod_mul) may return a value up to 2p - 1=
, so<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0 do a conditional subtraction. */<br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (r, iz3p, ecc-&gt;p.m, ecc-&gt;p.size);<br>
&gt; +-=C2=A0 cnd_copy (cy, r, iz3p, ecc-&gt;p.size);<br>
&gt; +-<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;p, r, iz2p, p, iz3p);<br=
>
&gt; +=C2=A0=C2=A0 if (op)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Skip y coordinate */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (op &gt; 1)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mp_limb_t cy;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Also reduce the =
x coordinate mod ecc-&gt;q. It should<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
lready be &lt; 2*ecc-&gt;q, so one subtraction should<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
uffice. */<br>
&gt; +@@ -83,10 +77,7 @@ ecc_j_to_a (const struct ecc_curve *ecc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, iz3p, iz2p, izp, iz3p);<br=
>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;p, tp, iz3p, p + ecc-&gt;p.size, t=
p);<br>
&gt; +-=C2=A0 /* And a similar subtraction. */<br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (r + ecc-&gt;p.size, tp, ecc-&gt;p.m, ecc-&=
gt;p.size);<br>
&gt; +-=C2=A0 cnd_copy (cy, r + ecc-&gt;p.size, tp, ecc-&gt;p.size);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;p, r + ecc-&gt;p.size, i=
z3p, p + ecc-<br>
&gt; &gt;p.size, tp);<br>
&gt; + <br>
&gt; + #undef izp<br>
&gt; + #undef iz2p<br>
&gt; +diff --git a/ecc-mod-arith.c b/ecc-mod-arith.c<br>
&gt; +index 551f2c14..b3021d94 100644<br>
&gt; +--- a/ecc-mod-arith.c<br>
&gt; ++++ b/ecc-mod-arith.c<br>
&gt; +@@ -125,6 +125,30 @@ ecc_mod_sqr (const struct ecc_modulo *m,<br>
&gt; mp_limb_t *rp,<br>
&gt; +=C2=A0=C2=A0 m-&gt;reduce (m, rp, tp);<br>
&gt; + }<br>
&gt; + <br>
&gt; ++void<br>
&gt; ++ecc_mod_mul_canonical (const struct ecc_modulo *m, mp_limb_t *rp,<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const mp_limb_t *ap=
, const mp_limb_t *bp,<br>
&gt; mp_limb_t *tp)<br>
&gt; ++{<br>
&gt; ++=C2=A0 mp_limb_t cy;<br>
&gt; ++=C2=A0 mpn_mul_n (tp, ap, bp, m-&gt;size);<br>
&gt; ++=C2=A0 m-&gt;reduce (m, tp + m-&gt;size, tp);<br>
&gt; ++<br>
&gt; ++=C2=A0 cy =3D mpn_sub_n (rp, tp + m-&gt;size, m-&gt;m, m-&gt;size);=
<br>
&gt; ++=C2=A0 cnd_copy (cy, rp, tp + m-&gt;size, m-&gt;size);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void<br>
&gt; ++ecc_mod_sqr_canonical (const struct ecc_modulo *m, mp_limb_t *rp,<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const mp_limb_t *ap=
, mp_limb_t *tp)<br>
&gt; ++{<br>
&gt; ++=C2=A0 mp_limb_t cy;<br>
&gt; ++=C2=A0 mpn_sqr (tp, ap, m-&gt;size);<br>
&gt; ++=C2=A0 m-&gt;reduce (m, tp + m-&gt;size, tp);<br>
&gt; ++<br>
&gt; ++=C2=A0 cy =3D mpn_sub_n (rp, tp + m-&gt;size, m-&gt;m, m-&gt;size);=
<br>
&gt; ++=C2=A0 cnd_copy (cy, rp, tp + m-&gt;size, m-&gt;size);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + void<br>
&gt; + ecc_mod_pow_2k (const struct ecc_modulo *m,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0mp_limb_t *rp, const mp_limb_t *xp,<br>
&gt; +diff --git a/ecc-mul-m.c b/ecc-mul-m.c<br>
&gt; +index a3355751..f0ceb924 100644<br>
&gt; +--- a/ecc-mul-m.c<br>
&gt; ++++ b/ecc-mul-m.c<br>
&gt; +@@ -48,7 +48,7 @@ ecc_mul_m (const struct ecc_modulo *m,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mp_limb_t *sc=
ratch)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 unsigned i;<br>
&gt; +-=C2=A0 mp_limb_t cy, swap;<br>
&gt; ++=C2=A0 mp_limb_t swap;<br>
&gt; + <br>
&gt; + #define x2 (scratch)<br>
&gt; + #define z2 (scratch + m-&gt;size)<br>
&gt; +@@ -162,7 +162,5 @@ ecc_mul_m (const struct ecc_modulo *m,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 assert (m-&gt;invert_itch &lt;=3D 7 * m-&gt;size);<br>
&gt; +=C2=A0=C2=A0 m-&gt;invert (m, x3, z2, z3 + m-&gt;size);<br>
&gt; +-=C2=A0 ecc_mod_mul (m, z3, x2, x3, z3);<br>
&gt; +-=C2=A0 cy =3D mpn_sub_n (qx, z3, m-&gt;m, m-&gt;size);<br>
&gt; +-=C2=A0 cnd_copy (cy, qx, z3, m-&gt;size);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (m, qx, x2, x3, z3);<br>
&gt; + }<br>
&gt; +diff --git a/eddsa-hash.c b/eddsa-hash.c<br>
&gt; +index 95e0dd70..6ebbe977 100644<br>
&gt; +--- a/eddsa-hash.c<br>
&gt; ++++ b/eddsa-hash.c<br>
&gt; +@@ -44,13 +44,14 @@<br>
&gt; + #include &quot;ecc-internal.h&quot;<br>
&gt; + #include &quot;nettle-internal.h&quot;<br>
&gt; + <br>
&gt; +-/* Convert hash digest to integer, and reduce modulo q, to m-&gt;si=
ze<br>
&gt; +-=C2=A0=C2=A0 limbs. Needs space for 2*m-&gt;size + 1 at rp. */<br>
&gt; ++/* Convert hash digest to integer, and reduce canonically modulo q.=
<br>
&gt; ++=C2=A0=C2=A0 Needs space for 2*m-&gt;size + 1 at rp. */<br>
&gt; + void<br>
&gt; + _eddsa_hash (const struct ecc_modulo *m,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
p_limb_t *rp, size_t digest_size, const uint8_t *digest)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 mp_size_t nlimbs =3D (8*digest_size + GMP_NUMB_BITS - 1=
) /<br>
&gt; GMP_NUMB_BITS;<br>
&gt; ++=C2=A0 mp_limb_t cy;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 mpn_set_base256_le (rp, nlimbs, digest, digest_size);<b=
r>
&gt; + <br>
&gt; +@@ -74,5 +75,8 @@ _eddsa_hash (const struct ecc_modulo *m,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hi =3D mpn_cnd_add_n (hi, rp + =
m-&gt;size, rp + m-&gt;size, m-&gt;B, m-<br>
&gt; &gt;size);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert (hi =3D=3D 0);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-=C2=A0 m-&gt;mod (m, rp, rp);<br>
&gt; ++=C2=A0 m-&gt;mod (m, rp + m-&gt;size , rp);<br>
&gt; ++=C2=A0 /* Ensure canonical reduction. */<br>
&gt; ++=C2=A0 cy =3D mpn_sub_n (rp, rp + m-&gt;size, m-&gt;m, m-&gt;size);=
<br>
&gt; ++=C2=A0 cnd_copy (cy, rp, rp + m-&gt;size, m-&gt;size);<br>
&gt; + }<br>
&gt; +diff --git a/eddsa-verify.c b/eddsa-verify.c<br>
&gt; +index de68f240..10d075ee 100644<br>
&gt; +--- a/eddsa-verify.c<br>
&gt; ++++ b/eddsa-verify.c<br>
&gt; +@@ -53,13 +53,8 @@ equal_h (const struct ecc_modulo *p,<br>
&gt; + #define t0 scratch<br>
&gt; + #define t1 (scratch + p-&gt;size)<br>
&gt; + <br>
&gt; +-=C2=A0 ecc_mod_mul (p, t0, x1, z2, t0);<br>
&gt; +-=C2=A0 if (mpn_cmp (t0, p-&gt;m, p-&gt;size) &gt;=3D 0)<br>
&gt; +-=C2=A0=C2=A0=C2=A0 mpn_sub_n (t0, t0, p-&gt;m, p-&gt;size);<br>
&gt; +-<br>
&gt; +-=C2=A0 ecc_mod_mul (p, t1, x2, z1, t1);<br>
&gt; +-=C2=A0 if (mpn_cmp (t1, p-&gt;m, p-&gt;size) &gt;=3D 0)<br>
&gt; +-=C2=A0=C2=A0=C2=A0 mpn_sub_n (t1, t1, p-&gt;m, p-&gt;size);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (p, t0, x1, z2, t0);<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (p, t1, x2, z1, t1);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 return mpn_cmp (t0, t1, p-&gt;size) =3D=3D 0;<br>
&gt; + <br>
&gt; +diff --git a/gostdsa-vko.c b/gostdsa-vko.c<br>
&gt; +index a02d59a9..3dc42a1e 100644<br>
&gt; +--- a/gostdsa-vko.c<br>
&gt; ++++ b/gostdsa-vko.c<br>
&gt; +@@ -87,7 +87,7 @@ gostdsa_vko (const struct ecc_scalar *priv,<br>
&gt; +=C2=A0=C2=A0 if (mpn_zero_p (UKM, size))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 UKM[0] =3D 1;<br>
&gt; + <br>
&gt; +-=C2=A0 ecc_mod_mul (&amp;ecc-&gt;q, TEMP, priv-&gt;p, UKM, TEMP); /=
* TEMP =3D UKM *<br>
&gt; priv */<br>
&gt; ++=C2=A0 ecc_mod_mul_canonical (&amp;ecc-&gt;q, TEMP, priv-&gt;p, UKM=
, TEMP); /* TEMP<br>
&gt; =3D UKM * priv */<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;mul (ecc, XYZ, TEMP, pub-&gt;p, scratch + 4*siz=
e); /* XYZ =3D UKM *<br>
&gt; priv * pub */<br>
&gt; +=C2=A0=C2=A0 ecc-&gt;h_to_a (ecc, 0, TEMP, XYZ, scratch + 5*size); /=
* TEMP =3D XYZ */<br>
&gt; +=C2=A0=C2=A0 mpn_get_base256_le (out, bsize, TEMP, size);<br>
&gt; +diff --git a/testsuite/ecdsa-sign-test.c b/testsuite/ecdsa-sign-test=
.c<br>
&gt; +index b240a31b..ed7e22bc 100644<br>
&gt; +--- a/testsuite/ecdsa-sign-test.c<br>
&gt; ++++ b/testsuite/ecdsa-sign-test.c<br>
&gt; +@@ -58,6 +58,32 @@ test_ecdsa (const struct ecc_curve *ecc,<br>
&gt; + void<br>
&gt; + test_main (void)<br>
&gt; + {<br>
&gt; ++=C2=A0 /* Producing the signature for corresponding test in<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 ecdsa-verify-test.c, with special u1 and u=
2. */<br>
&gt; ++=C2=A0 test_ecdsa (&amp;_nettle_secp_224r1,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;99b5b787484def12894ca507058b3bf5&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;43d72d82fa7721d2e805e5e6&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;2&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
SHEX(&quot;cdb887ac805a3b42e22d224c85482053&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;16c755d4a736bb2032c92553&quot;),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;706a46dc76dcb76798e60e6d89474788&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;d16dc18032d268fd1a704fa6&quot;, /* r */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;3a41e1423b1853e8aa89747b1f987364&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;44705d6d6d8371ea1f578f2e&quot;); /* s */<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Producing the signature for corresponding test in<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 ecdsa-verify-test.c, with special u1 and u=
2. */<br>
&gt; ++=C2=A0 test_ecdsa (&amp;_nettle_secp_224r1,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;99b5b787484def12894ca507058b3bf5&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;43d72d82fa7721d2e805e5e6&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;2&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
SHEX(&quot;cdb887ac805a3b42e22d224c85482053&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;16c755d4a736bb2032c92553&quot;),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;706a46dc76dcb76798e60e6d89474788&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;d16dc18032d268fd1a704fa6&quot;, /* r */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;3a41e1423b1853e8aa89747b1f987364&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;44705d6d6d8371ea1f578f2e&quot;); /* s */<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0 /* Test cases for the smaller groups, verified with a<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proof-of-concept implementation done =
for Yubico AB. */<br>
&gt; +=C2=A0=C2=A0 test_ecdsa (&amp;_nettle_secp_192r1,<br>
&gt; +diff --git a/testsuite/ecdsa-verify-test.c b/testsuite/ecdsa-verify-=
<br>
&gt; test.c<br>
&gt; +index 3ceac0eb..edcd32ea 100644<br>
&gt; +--- a/testsuite/ecdsa-verify-test.c<br>
&gt; ++++ b/testsuite/ecdsa-verify-test.c<br>
&gt; +@@ -81,6 +81,46 @@ test_ecdsa (const struct ecc_curve *ecc,<br>
&gt; + void<br>
&gt; + test_main (void)<br>
&gt; + {<br>
&gt; ++=C2=A0 /* Corresponds to nonce k =3D 2 and private key z =3D<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 0x99b5b787484def12894ca507058b3bf543d72d82=
fa7721d2e805e5e6. z<br>
&gt; and<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 hash are chosen so that intermediate scala=
rs in the verify<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 equations are u1 =3D 0x6b245680e700, u2 =
=3D<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 259da6542d4ba7d21ad916c3bd57f811. These va=
lues require canonical<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 reduction of the scalars. Bug caused by mi=
ssing canonical<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 reduction reported by Guido Vranken. */<br=
>
&gt; ++=C2=A0 test_ecdsa (&amp;_nettle_secp_224r1,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;9e7e6cc6b1bdfa8ee039b66ad85e5490&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;7be706a900a3cba1c8fdd014&quot;, /* x */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;74855db3f7c1b4097ae095745fc915e3&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;8a79d2a1de28f282eafb22ba&quot;, /* y */<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
SHEX(&quot;cdb887ac805a3b42e22d224c85482053&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;16c755d4a736bb2032c92553&quot;),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;706a46dc76dcb76798e60e6d89474788&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;d16dc18032d268fd1a704fa6&quot;, /* r */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;3a41e1423b1853e8aa89747b1f987364&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;44705d6d6d8371ea1f578f2e&quot;); /* s */<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Corresponds to nonce k =3D 2 and private key z =3D<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 0x99b5b787484def12894ca507058b3bf543d72d82=
fa7721d2e805e5e6. z<br>
&gt; and<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 hash are chosen so that intermediate scala=
rs in the verify<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 equations are u1 =3D 0x6b245680e700, u2 =
=3D<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 259da6542d4ba7d21ad916c3bd57f811. These va=
lues require canonical<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 reduction of the scalars. Bug caused by mi=
ssing canonical<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 reduction reported by Guido Vranken. */<br=
>
&gt; ++=C2=A0 test_ecdsa (&amp;_nettle_secp_224r1,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;9e7e6cc6b1bdfa8ee039b66ad85e5490&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;7be706a900a3cba1c8fdd014&quot;, /* x */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;74855db3f7c1b4097ae095745fc915e3&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;8a79d2a1de28f282eafb22ba&quot;, /* y */<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
SHEX(&quot;cdb887ac805a3b42e22d224c85482053&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;16c755d4a736bb2032c92553&quot;),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;706a46dc76dcb76798e60e6d89474788&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;d16dc18032d268fd1a704fa6&quot;, /* r */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;3a41e1423b1853e8aa89747b1f987364&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
&quot;44705d6d6d8371ea1f578f2e&quot;); /* s */<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0 /* Test case provided by Guido Vranken, from oss-fuzz *=
/<br>
&gt; +=C2=A0=C2=A0 test_ecdsa (&amp;_nettle_secp_192r1,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;14683086 f1734c6d e68743a6 48181b54 a74d4c5b 383eb6a8&quot;,<=
br>
&gt; /* x */<br>
&gt; +-- <br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/nettle/<a href=3D"http://nettle_3.7=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nettle_3.7.1.bb</a><br>
&gt; b/meta/recipes-support/nettle/<a href=3D"http://nettle_3.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nettle_3.7.1.bb</a><br>
&gt; index 3bbcf17c7a..0e2bd2a7e1 100644<br>
&gt; --- a/meta/recipes-support/nettle/<a href=3D"http://nettle_3.7.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nettle_3.7.1.bb</a><br>
&gt; +++ b/meta/recipes-support/nettle/<a href=3D"http://nettle_3.7.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nettle_3.7.1.bb</a><br>
&gt; @@ -18,6 +18,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.gz=
 \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi=
le://Add-target-to-only-build-tests-not-run-them.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi=
le://run-ptest=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <b=
r>
&gt; file://check-header-files-of-openssl-only-if-enable_.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
CVE-2021-20305.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &q=
uot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0SRC_URI_append_class-target =3D &quot;\<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000001a917805c085af9d--
