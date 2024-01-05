Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BF3C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:04:26 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.24017.1704463464708399523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OscTQENO;
 spf=pass (domain: mvista.com, ip: 209.85.208.182, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cce70ad1a3so20235371fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 06:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704463463; x=1705068263; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UO4KDliVNvnjQH5AZ/cizwkViR237/c8RoblZSGztLg=;
        b=OscTQENObqWgaPSLi7bSs+ZK2cBAKJbG7rSKDt1pOIFSs6mM5EryANMJ2rQqH3lnNg
         2OYGmrehLWpkcPXrVQ1mavDaF/Xfmxc/I/WQyDcTacaGuWey3EYKjiM9W7E4WlS+Qxgy
         Bk/qiye+sAP+ug5jZ9TfKPegI/M20m89muOMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704463463; x=1705068263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO4KDliVNvnjQH5AZ/cizwkViR237/c8RoblZSGztLg=;
        b=ASYub4hEiM30afK+cTjemnbn32xyLufcKjykAURPWByhnSZj/MjUq8LkOlznWmZlUF
         FTzaNkxuTrfr2VgKalPUI4g5EEhms97j4aQz3aPO7IBElkVM1Xj2AdYBzJjgWYZJnLNc
         ZAhLaTI6iohhyBJJ+ICpmLHUTWNrhpoCiFcHkPaB+o1+KVkET4fFscmfVr7Bm3EAPVRH
         OiV/oTBmZfftK+pkTrNZtvAEQODGxYoWyLYHxBbGz5BYAtcCK0Hd7U/5hrnUIb50trsx
         Dp3DStKcxQo2glDrITlNpLgwaCrwsOol9DM79t7USX1r41TPbybP2wiUbwlk6UR3Rjsf
         8VlA==
X-Gm-Message-State: AOJu0Yz1Ablnr93R2s641QfxW/+Ruxv4oSZcErmO3Tg0FXRvVeJx/uX0
	Sd2sCGshx+ra3vf4zJ3vdH742B1V0ZUTm6HdKXRXNtLeWKxB4g==
X-Google-Smtp-Source: AGHT+IH2enmUZ81tqe2+Ga3Ed4JAgYF3KK9d3ZstfDQZW/pgEfGVSf3+ijWwtt3MAIDtWDLEApkwP2fNhwMkw8HRrzU=
X-Received: by 2002:a2e:9cc4:0:b0:2cd:1919:ee43 with SMTP id
 g4-20020a2e9cc4000000b002cd1919ee43mr973265ljj.82.1704463461574; Fri, 05 Jan
 2024 06:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20240105073314.1537646-1-vanusuri@mvista.com> <CAOSpxdZvxkzYKKhppb7Cce=VyO4sJNEVy4OM6E8C9EdovJ-Brg@mail.gmail.com>
In-Reply-To: <CAOSpxdZvxkzYKKhppb7Cce=VyO4sJNEVy4OM6E8C9EdovJ-Brg@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 5 Jan 2024 19:34:09 +0530
Message-ID: <CANQUz1_VNtTmMkgsHhYTzghgODHZhxj5zJ=q+MJS86uD+oqqZg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] go: Backport fix for CVE-2023-45287
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028fed9060e335375"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193366

--00000000000028fed9060e335375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Steve for testing.

I will again create patch from scratch and send V3 to you.

Thanks & Regards,
Vijay

On Fri, Jan 5, 2024 at 7:29=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> V2 also has issues, as flagged by patchtest and my local testing:
>
> Applying: go: Backport fix for CVE-2023-45287
> error: corrupt patch at line 2273
> error: could not build fake ancestor
> Patch failed at 0001 go: Backport fix for CVE-2023-45287
>
> Steve
>
> On Thu, Jan 4, 2024 at 9:33=E2=80=AFPM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport
> > [
> https://github.com/golang/go/commit/9baafabac9a84813a336f068862207d2bb06d=
255
> > &
> >
> https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f=
2f3
> > &
> >
> https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6=
807
> > &
> >
> https://github.com/golang/go/commit/8a81fdf165facdcefa06531de5af98a4db343=
035
> ]
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  meta/recipes-devtools/go/go-1.14.inc          |    4 +
> >  .../go/go-1.14/CVE-2023-45287-pre1.patch      |  393 ++++
> >  .../go/go-1.14/CVE-2023-45287-pre2.patch      |  401 ++++
> >  .../go/go-1.14/CVE-2023-45287-pre3.patch      |   86 +
> >  .../go/go-1.14/CVE-2023-45287.patch           | 1697 +++++++++++++++++
> >  5 files changed, 2581 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
> >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
> >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
> >  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45287.pat=
ch
> >
> > diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> > index b827a3606d..42a9ac8435 100644
> > --- a/meta/recipes-devtools/go/go-1.14.inc
> > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > @@ -83,6 +83,10 @@ SRC_URI +=3D "\
> >      file://CVE-2023-39318.patch \
> >      file://CVE-2023-39319.patch \
> >      file://CVE-2023-39326.patch \
> > +    file://CVE-2023-45287-pre1.patch \
> > +    file://CVE-2023-45287-pre2.patch \
> > +    file://CVE-2023-45287-pre3.patch \
> > +    file://CVE-2023-45287.patch \
> >  "
> >
> >  SRC_URI_append_libc-musl =3D "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
> > new file mode 100644
> > index 0000000000..4d65180253
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch
> > @@ -0,0 +1,393 @@
> > +From 9baafabac9a84813a336f068862207d2bb06d255 Mon Sep 17 00:00:00 2001
> > +From: Filippo Valsorda <filippo@golang.org>
> > +Date: Wed, 1 Apr 2020 17:25:40 -0400
> > +Subject: [PATCH] crypto/rsa: refactor RSA-PSS signing and verification
> > +
> > +Cleaned up for readability and consistency.
> > +
> > +There is one tiny behavioral change: when PSSSaltLengthEqualsHash is
> > +used and both hash and opts.Hash were set, hash.Size() was used for th=
e
> > +salt length instead of opts.Hash.Size(). That's clearly wrong because
> > +opts.Hash is documented to override hash.
> > +
> > +Change-Id: I3e25dad933961eac827c6d2e3bbfe45fc5a6fb0e
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/226937
> > +Run-TryBot: Filippo Valsorda <filippo@golang.org>
> > +TryBot-Result: Gobot Gobot <gobot@golang.org>
> > +Reviewed-by: Katie Hockman <katie@golang.org>
> > +
> > +Upstream-Status: Backport [
> https://github.com/golang/go/commit/9baafabac9a84813a336f068862207d2bb06d=
255
> ]
> > +CVE: CVE-2023-45287 #Dependency Patch1
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/crypto/rsa/pss.go | 173 ++++++++++++++++++++++-------------------=
-
> > + src/crypto/rsa/rsa.go |   9 ++-
> > + 2 files changed, 96 insertions(+), 86 deletions(-)
> > +
> > +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> > +index 3ff0c2f4d0076..f9844d87329a8 100644
> > +--- a/src/crypto/rsa/pss.go
> > ++++ b/src/crypto/rsa/pss.go
> > +@@ -4,9 +4,7 @@
> > +
> > + package rsa
> > +
> > +-// This file implements the PSS signature scheme [1].
> > +-//
> > +-// [1]
> https://www.emc.com/collateral/white-papers/h11300-pkcs-1v2-2-rsa-cryptog=
raphy-standard-wp.pdf
> > ++// This file implements the RSASSA-PSS signature scheme according to
> RFC 8017.
> > +
> > + import (
> > +       "bytes"
> > +@@ -17,8 +15,22 @@ import (
> > +       "math/big"
> > + )
> > +
> > ++// Per RFC 8017, Section 9.1
> > ++//
> > ++//     EM =3D MGF1 xor DB || H( 8*0x00 || mHash || salt ) || 0xbc
> > ++//
> > ++// where
> > ++//
> > ++//     DB =3D PS || 0x01 || salt
> > ++//
> > ++// and PS can be empty so
> > ++//
> > ++//     emLen =3D dbLen + hLen + 1 =3D psLen + sLen + hLen + 2
> > ++//
> > ++
> > + func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash
> hash.Hash) ([]byte, error) {
> > +-      // See [1], section 9.1.1
> > ++      // See RFC 8017, Section 9.1.1.
> > ++
> > +       hLen :=3D hash.Size()
> > +       sLen :=3D len(salt)
> > +       emLen :=3D (emBits + 7) / 8
> > +@@ -30,7 +42,7 @@ func emsaPSSEncode(mHash []byte, emBits int, salt
> []byte, hash hash.Hash) ([]byt
> > +       // 2.  Let mHash =3D Hash(M), an octet string of length hLen.
> > +
> > +       if len(mHash) !=3D hLen {
> > +-              return nil, errors.New("crypto/rsa: input must be hashe=
d
> message")
> > ++              return nil, errors.New("crypto/rsa: input must be hashe=
d
> with given hash")
> > +       }
> > +
> > +       // 3.  If emLen < hLen + sLen + 2, output "encoding error" and
> stop.
> > +@@ -40,8 +52,9 @@ func emsaPSSEncode(mHash []byte, emBits int, salt
> []byte, hash hash.Hash) ([]byt
> > +       }
> > +
> > +       em :=3D make([]byte, emLen)
> > +-      db :=3D em[:emLen-sLen-hLen-2+1+sLen]
> > +-      h :=3D em[emLen-sLen-hLen-2+1+sLen : emLen-1]
> > ++      psLen :=3D emLen - sLen - hLen - 2
> > ++      db :=3D em[:psLen+1+sLen]
> > ++      h :=3D em[psLen+1+sLen : emLen-1]
> > +
> > +       // 4.  Generate a random octet string salt of length sLen; if
> sLen =3D 0,
> > +       //     then salt is the empty string.
> > +@@ -69,8 +82,8 @@ func emsaPSSEncode(mHash []byte, emBits int, salt
> []byte, hash hash.Hash) ([]byt
> > +       // 8.  Let DB =3D PS || 0x01 || salt; DB is an octet string of
> length
> > +       //     emLen - hLen - 1.
> > +
> > +-      db[emLen-sLen-hLen-2] =3D 0x01
> > +-      copy(db[emLen-sLen-hLen-1:], salt)
> > ++      db[psLen] =3D 0x01
> > ++      copy(db[psLen+1:], salt)
> > +
> > +       // 9.  Let dbMask =3D MGF(H, emLen - hLen - 1).
> > +       //
> > +@@ -81,47 +94,57 @@ func emsaPSSEncode(mHash []byte, emBits int, salt
> []byte, hash hash.Hash) ([]byt
> > +       // 11. Set the leftmost 8 * emLen - emBits bits of the leftmost
> octet in
> > +       //     maskedDB to zero.
> > +
> > +-      db[0] &=3D (0xFF >> uint(8*emLen-emBits))
> > ++      db[0] &=3D 0xff >> (8*emLen - emBits)
> > +
> > +       // 12. Let EM =3D maskedDB || H || 0xbc.
> > +-      em[emLen-1] =3D 0xBC
> > ++      em[emLen-1] =3D 0xbc
> > +
> > +       // 13. Output EM.
> > +       return em, nil
> > + }
> > +
> > + func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash=
)
> error {
> > ++      // See RFC 8017, Section 9.1.2.
> > ++
> > ++      hLen :=3D hash.Size()
> > ++      if sLen =3D=3D PSSSaltLengthEqualsHash {
> > ++              sLen =3D hLen
> > ++      }
> > ++      emLen :=3D (emBits + 7) / 8
> > ++      if emLen !=3D len(em) {
> > ++              return errors.New("rsa: internal error: inconsistent
> length")
> > ++      }
> > ++
> > +       // 1.  If the length of M is greater than the input limitation
> for the
> > +       //     hash function (2^61 - 1 octets for SHA-1), output
> "inconsistent"
> > +       //     and stop.
> > +       //
> > +       // 2.  Let mHash =3D Hash(M), an octet string of length hLen.
> > +-      hLen :=3D hash.Size()
> > +       if hLen !=3D len(mHash) {
> > +               return ErrVerification
> > +       }
> > +
> > +       // 3.  If emLen < hLen + sLen + 2, output "inconsistent" and
> stop.
> > +-      emLen :=3D (emBits + 7) / 8
> > +       if emLen < hLen+sLen+2 {
> > +               return ErrVerification
> > +       }
> > +
> > +       // 4.  If the rightmost octet of EM does not have hexadecimal
> value
> > +       //     0xbc, output "inconsistent" and stop.
> > +-      if em[len(em)-1] !=3D 0xBC {
> > ++      if em[emLen-1] !=3D 0xbc {
> > +               return ErrVerification
> > +       }
> > +
> > +       // 5.  Let maskedDB be the leftmost emLen - hLen - 1 octets of
> EM, and
> > +       //     let H be the next hLen octets.
> > +       db :=3D em[:emLen-hLen-1]
> > +-      h :=3D em[emLen-hLen-1 : len(em)-1]
> > ++      h :=3D em[emLen-hLen-1 : emLen-1]
> > +
> > +       // 6.  If the leftmost 8 * emLen - emBits bits of the leftmost
> octet in
> > +       //     maskedDB are not all equal to zero, output "inconsistent=
"
> and
> > +       //     stop.
> > +-      if em[0]&(0xFF<<uint(8-(8*emLen-emBits))) !=3D 0 {
> > ++      var bitMask byte =3D 0xff >> (8*emLen - emBits)
> > ++      if em[0] & ^bitMask !=3D 0 {
> > +               return ErrVerification
> > +       }
> > +
> > +@@ -132,37 +155,30 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLe=
n
> int, hash hash.Hash) error {
> > +
> > +       // 9.  Set the leftmost 8 * emLen - emBits bits of the leftmost
> octet in DB
> > +       //     to zero.
> > +-      db[0] &=3D (0xFF >> uint(8*emLen-emBits))
> > ++      db[0] &=3D bitMask
> > +
> > ++      // If we don't know the salt length, look for the 0x01 delimite=
r.
> > +       if sLen =3D=3D PSSSaltLengthAuto {
> > +-      FindSaltLength:
> > +-              for sLen =3D emLen - (hLen + 2); sLen >=3D 0; sLen-- {
> > +-                      switch db[emLen-hLen-sLen-2] {
> > +-                      case 1:
> > +-                              break FindSaltLength
> > +-                      case 0:
> > +-                              continue
> > +-                      default:
> > +-                              return ErrVerification
> > +-                      }
> > +-              }
> > +-              if sLen < 0 {
> > ++              psLen :=3D bytes.IndexByte(db, 0x01)
> > ++              if psLen < 0 {
> > +                       return ErrVerification
> > +               }
> > +-      } else {
> > +-              // 10. If the emLen - hLen - sLen - 2 leftmost octets o=
f
> DB are not zero
> > +-              //     or if the octet at position emLen - hLen - sLen =
-
> 1 (the leftmost
> > +-              //     position is "position 1") does not have
> hexadecimal value 0x01,
> > +-              //     output "inconsistent" and stop.
> > +-              for _, e :=3D range db[:emLen-hLen-sLen-2] {
> > +-                      if e !=3D 0x00 {
> > +-                              return ErrVerification
> > +-                      }
> > +-              }
> > +-              if db[emLen-hLen-sLen-2] !=3D 0x01 {
> > ++              sLen =3D len(db) - psLen - 1
> > ++      }
> > ++
> > ++      // 10. If the emLen - hLen - sLen - 2 leftmost octets of DB are
> not zero
> > ++      //     or if the octet at position emLen - hLen - sLen - 1 (the
> leftmost
> > ++      //     position is "position 1") does not have hexadecimal valu=
e
> 0x01,
> > ++      //     output "inconsistent" and stop.
> > ++      psLen :=3D emLen - hLen - sLen - 2
> > ++      for _, e :=3D range db[:psLen] {
> > ++              if e !=3D 0x00 {
> > +                       return ErrVerification
> > +               }
> > +       }
> > ++      if db[psLen] !=3D 0x01 {
> > ++              return ErrVerification
> > ++      }
> > +
> > +       // 11.  Let salt be the last sLen octets of DB.
> > +       salt :=3D db[len(db)-sLen:]
> > +@@ -181,19 +197,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLe=
n
> int, hash hash.Hash) error {
> > +       h0 :=3D hash.Sum(nil)
> > +
> > +       // 14. If H =3D H', output "consistent." Otherwise, output
> "inconsistent."
> > +-      if !bytes.Equal(h0, h) {
> > ++      if !bytes.Equal(h0, h) { // TODO: constant time?
> > +               return ErrVerification
> > +       }
> > +       return nil
> > + }
> > +
> > +-// signPSSWithSalt calculates the signature of hashed using PSS [1]
> with specified salt.
> > ++// signPSSWithSalt calculates the signature of hashed using PSS with
> specified salt.
> > + // Note that hashed must be the result of hashing the input message
> using the
> > + // given hash function. salt is a random sequence of bytes whose
> length will be
> > + // later used to verify the signature.
> > + func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash
> crypto.Hash, hashed, salt []byte) (s []byte, err error) {
> > +-      nBits :=3D priv.N.BitLen()
> > +-      em, err :=3D emsaPSSEncode(hashed, nBits-1, salt, hash.New())
> > ++      emBits :=3D priv.N.BitLen() - 1
> > ++      em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
> > +       if err !=3D nil {
> > +               return
> > +       }
> > +@@ -202,7 +218,7 @@ func signPSSWithSalt(rand io.Reader, priv
> *PrivateKey, hash crypto.Hash, hashed,
> > +       if err !=3D nil {
> > +               return
> > +       }
> > +-      s =3D make([]byte, (nBits+7)/8)
> > ++      s =3D make([]byte, priv.Size())
> > +       copyWithLeftPad(s, c.Bytes())
> > +       return
> > + }
> > +@@ -223,16 +239,15 @@ type PSSOptions struct {
> > +       // PSSSaltLength constants.
> > +       SaltLength int
> > +
> > +-      // Hash, if not zero, overrides the hash function passed to
> SignPSS.
> > +-      // This is the only way to specify the hash function when using
> the
> > +-      // crypto.Signer interface.
> > ++      // Hash is the hash function used to generate the message
> digest. If not
> > ++      // zero, it overrides the hash function passed to SignPSS. It's
> required
> > ++      // when using PrivateKey.Sign.
> > +       Hash crypto.Hash
> > + }
> > +
> > +-// HashFunc returns pssOpts.Hash so that PSSOptions implements
> > +-// crypto.SignerOpts.
> > +-func (pssOpts *PSSOptions) HashFunc() crypto.Hash {
> > +-      return pssOpts.Hash
> > ++// HashFunc returns opts.Hash so that PSSOptions implements
> crypto.SignerOpts.
> > ++func (opts *PSSOptions) HashFunc() crypto.Hash {
> > ++      return opts.Hash
> > + }
> > +
> > + func (opts *PSSOptions) saltLength() int {
> > +@@ -242,56 +257,50 @@ func (opts *PSSOptions) saltLength() int {
> > +       return opts.SaltLength
> > + }
> > +
> > +-// SignPSS calculates the signature of hashed using RSASSA-PSS [1].
> > +-// Note that hashed must be the result of hashing the input message
> using the
> > +-// given hash function. The opts argument may be nil, in which case
> sensible
> > +-// defaults are used.
> > +-func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash,
> hashed []byte, opts *PSSOptions) ([]byte, error) {
> > ++// SignPSS calculates the signature of digest using PSS.
> > ++//
> > ++// digest must be the result of hashing the input message using the
> given hash
> > ++// function. The opts argument may be nil, in which case sensible
> defaults are
> > ++// used. If opts.Hash is set, it overrides hash.
> > ++func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash,
> digest []byte, opts *PSSOptions) ([]byte, error) {
> > ++      if opts !=3D nil && opts.Hash !=3D 0 {
> > ++              hash =3D opts.Hash
> > ++      }
> > ++
> > +       saltLength :=3D opts.saltLength()
> > +       switch saltLength {
> > +       case PSSSaltLengthAuto:
> > +-              saltLength =3D (priv.N.BitLen()+7)/8 - 2 - hash.Size()
> > ++              saltLength =3D priv.Size() - 2 - hash.Size()
> > +       case PSSSaltLengthEqualsHash:
> > +               saltLength =3D hash.Size()
> > +       }
> > +
> > +-      if opts !=3D nil && opts.Hash !=3D 0 {
> > +-              hash =3D opts.Hash
> > +-      }
> > +-
> > +       salt :=3D make([]byte, saltLength)
> > +       if _, err :=3D io.ReadFull(rand, salt); err !=3D nil {
> > +               return nil, err
> > +       }
> > +-      return signPSSWithSalt(rand, priv, hash, hashed, salt)
> > ++      return signPSSWithSalt(rand, priv, hash, digest, salt)
> > + }
> > +
> > + // VerifyPSS verifies a PSS signature.
> > +-// hashed is the result of hashing the input message using the given
> hash
> > +-// function and sig is the signature. A valid signature is indicated =
by
> > +-// returning a nil error. The opts argument may be nil, in which case
> sensible
> > +-// defaults are used.
> > +-func VerifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig
> []byte, opts *PSSOptions) error {
> > +-      return verifyPSS(pub, hash, hashed, sig, opts.saltLength())
> > +-}
> > +-
> > +-// verifyPSS verifies a PSS signature with the given salt length.
> > +-func verifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig
> []byte, saltLen int) error {
> > +-      nBits :=3D pub.N.BitLen()
> > +-      if len(sig) !=3D (nBits+7)/8 {
> > ++//
> > ++// A valid signature is indicated by returning a nil error. digest
> must be the
> > ++// result of hashing the input message using the given hash function.
> The opts
> > ++// argument may be nil, in which case sensible defaults are used.
> opts.Hash is
> > ++// ignored.
> > ++func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig
> []byte, opts *PSSOptions) error {
> > ++      if len(sig) !=3D pub.Size() {
> > +               return ErrVerification
> > +       }
> > +       s :=3D new(big.Int).SetBytes(sig)
> > +       m :=3D encrypt(new(big.Int), pub, s)
> > +-      emBits :=3D nBits - 1
> > ++      emBits :=3D pub.N.BitLen() - 1
> > +       emLen :=3D (emBits + 7) / 8
> > +-      if emLen < len(m.Bytes()) {
> > ++      emBytes :=3D m.Bytes()
> > ++      if emLen < len(emBytes) {
> > +               return ErrVerification
> > +       }
> > +       em :=3D make([]byte, emLen)
> > +-      copyWithLeftPad(em, m.Bytes())
> > +-      if saltLen =3D=3D PSSSaltLengthEqualsHash {
> > +-              saltLen =3D hash.Size()
> > +-      }
> > +-      return emsaPSSVerify(hashed, em, emBits, saltLen, hash.New())
> > ++      copyWithLeftPad(em, emBytes)
> > ++      return emsaPSSVerify(digest, em, emBits, opts.saltLength(),
> hash.New())
> > + }
> > +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
> > +index 5a42990640164..b4bfa13defbdf 100644
> > +--- a/src/crypto/rsa/rsa.go
> > ++++ b/src/crypto/rsa/rsa.go
> > +@@ -2,7 +2,7 @@
> > + // Use of this source code is governed by a BSD-style
> > + // license that can be found in the LICENSE file.
> > +
> > +-// Package rsa implements RSA encryption as specified in PKCS#1.
> > ++// Package rsa implements RSA encryption as specified in PKCS#1 and
> RFC 8017.
> > + //
> > + // RSA is a single, fundamental operation that is used in this packag=
e
> to
> > + // implement either public-key encryption or public-key signatures.
> > +@@ -10,13 +10,13 @@
> > + // The original specification for encryption and signatures with RSA
> is PKCS#1
> > + // and the terms "RSA encryption" and "RSA signatures" by default
> refer to
> > + // PKCS#1 version 1.5. However, that specification has flaws and new
> designs
> > +-// should use version two, usually called by just OAEP and PSS, where
> > ++// should use version 2, usually called by just OAEP and PSS, where
> > + // possible.
> > + //
> > + // Two sets of interfaces are included in this package. When a more
> abstract
> > + // interface isn't necessary, there are functions for
> encrypting/decrypting
> > + // with v1.5/OAEP and signing/verifying with v1.5/PSS. If one needs t=
o
> abstract
> > +-// over the public-key primitive, the PrivateKey struct implements th=
e
> > ++// over the public key primitive, the PrivateKey type implements the
> > + // Decrypter and Signer interfaces from the crypto package.
> > + //
> > + // The RSA operations in this package are not implemented using
> constant-time algorithms.
> > +@@ -111,7 +111,8 @@ func (priv *PrivateKey) Public() crypto.PublicKey =
{
> > +
> > + // Sign signs digest with priv, reading randomness from rand. If opts
> is a
> > + // *PSSOptions then the PSS algorithm will be used, otherwise PKCS#1
> v1.5 will
> > +-// be used.
> > ++// be used. digest must be the result of hashing the input message
> using
> > ++// opts.HashFunc().
> > + //
> > + // This method implements crypto.Signer, which is an interface to
> support keys
> > + // where the private part is kept in, for example, a hardware module.
> Common
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
> > new file mode 100644
> > index 0000000000..1327b44545
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch
> > @@ -0,0 +1,401 @@
> > +From c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3 Mon Sep 17 00:00:00 2001
> > +From: Filippo Valsorda <filippo@golang.org>
> > +Date: Mon, 27 Apr 2020 21:52:38 -0400
> > +Subject: [PATCH] math/big: add (*Int).FillBytes
> > +
> > +Replaced almost every use of Bytes with FillBytes.
> > +
> > +Note that the approved proposal was for
> > +
> > +    func (*Int) FillBytes(buf []byte)
> > +
> > +while this implements
> > +
> > +    func (*Int) FillBytes(buf []byte) []byte
> > +
> > +because the latter was far nicer to use in all callsites.
> > +
> > +Fixes #35833
> > +
> > +Change-Id: Ia912df123e5d79b763845312ea3d9a8051343c0a
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/230397
> > +Reviewed-by: Robert Griesemer <gri@golang.org>
> > +
> > +Upstream-Status: Backport [
> https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f=
2f3
> ]
> > +CVE: CVE-2023-45287 #Dependency Patch2
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/crypto/elliptic/elliptic.go | 13 ++++----
> > + src/crypto/rsa/pkcs1v15.go      | 20 +++---------
> > + src/crypto/rsa/pss.go           | 17 +++++------
> > + src/crypto/rsa/rsa.go           | 32 +++----------------
> > + src/crypto/tls/key_schedule.go  |  7 ++---
> > + src/crypto/x509/sec1.go         |  7 ++---
> > + src/math/big/int.go             | 15 +++++++++
> > + src/math/big/int_test.go        | 54 ++++++++++++++++++++++++++++++++=
+
> > + src/math/big/nat.go             | 15 ++++++---
> > + 9 files changed, 106 insertions(+), 74 deletions(-)
> > +
> > +diff --git a/src/crypto/elliptic/elliptic.go
> b/src/crypto/elliptic/elliptic.go
> > +index e2f71cdb63bab..bd5168c5fd842 100644
> > +--- a/src/crypto/elliptic/elliptic.go
> > ++++ b/src/crypto/elliptic/elliptic.go
> > +@@ -277,7 +277,7 @@ var mask =3D []byte{0xff, 0x1, 0x3, 0x7, 0xf, 0x1f=
,
> 0x3f, 0x7f}
> > + func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y
> *big.Int, err error) {
> > +       N :=3D curve.Params().N
> > +       bitSize :=3D N.BitLen()
> > +-      byteLen :=3D (bitSize + 7) >> 3
> > ++      byteLen :=3D (bitSize + 7) / 8
> > +       priv =3D make([]byte, byteLen)
> > +
> > +       for x =3D=3D nil {
> > +@@ -304,15 +304,14 @@ func GenerateKey(curve Curve, rand io.Reader)
> (priv []byte, x, y *big.Int, err e
> > +
> > + // Marshal converts a point into the uncompressed form specified in
> section 4.3.6 of ANSI X9.62.
> > + func Marshal(curve Curve, x, y *big.Int) []byte {
> > +-      byteLen :=3D (curve.Params().BitSize + 7) >> 3
> > ++      byteLen :=3D (curve.Params().BitSize + 7) / 8
> > +
> > +       ret :=3D make([]byte, 1+2*byteLen)
> > +       ret[0] =3D 4 // uncompressed point
> > +
> > +-      xBytes :=3D x.Bytes()
> > +-      copy(ret[1+byteLen-len(xBytes):], xBytes)
> > +-      yBytes :=3D y.Bytes()
> > +-      copy(ret[1+2*byteLen-len(yBytes):], yBytes)
> > ++      x.FillBytes(ret[1 : 1+byteLen])
> > ++      y.FillBytes(ret[1+byteLen : 1+2*byteLen])
> > ++
> > +       return ret
> > + }
> > +
> > +@@ -320,7 +319,7 @@ func Marshal(curve Curve, x, y *big.Int) []byte {
> > + // It is an error if the point is not in uncompressed form or is not
> on the curve.
> > + // On error, x =3D nil.
> > + func Unmarshal(curve Curve, data []byte) (x, y *big.Int) {
> > +-      byteLen :=3D (curve.Params().BitSize + 7) >> 3
> > ++      byteLen :=3D (curve.Params().BitSize + 7) / 8
> > +       if len(data) !=3D 1+2*byteLen {
> > +               return
> > +       }
> > +diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
> > +index 499242ffc5b57..3208119ae1ff4 100644
> > +--- a/src/crypto/rsa/pkcs1v15.go
> > ++++ b/src/crypto/rsa/pkcs1v15.go
> > +@@ -61,8 +61,7 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey,
> msg []byte) ([]byte, error)
> > +       m :=3D new(big.Int).SetBytes(em)
> > +       c :=3D encrypt(new(big.Int), pub, m)
> > +
> > +-      copyWithLeftPad(em, c.Bytes())
> > +-      return em, nil
> > ++      return c.FillBytes(em), nil
> > + }
> > +
> > + // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding
> scheme from PKCS#1 v1.5.
> > +@@ -150,7 +149,7 @@ func decryptPKCS1v15(rand io.Reader, priv
> *PrivateKey, ciphertext []byte) (valid
> > +               return
> > +       }
> > +
> > +-      em =3D leftPad(m.Bytes(), k)
> > ++      em =3D m.FillBytes(make([]byte, k))
> > +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> > +       secondByteIsTwo :=3D subtle.ConstantTimeByteEq(em[1], 2)
> > +
> > +@@ -256,8 +255,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKey=
,
> hash crypto.Hash, hashed []b
> > +               return nil, err
> > +       }
> > +
> > +-      copyWithLeftPad(em, c.Bytes())
> > +-      return em, nil
> > ++      return c.FillBytes(em), nil
> > + }
> > +
> > + // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.
> > +@@ -286,7 +284,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash
> crypto.Hash, hashed []byte, sig []byte)
> > +
> > +       c :=3D new(big.Int).SetBytes(sig)
> > +       m :=3D encrypt(new(big.Int), pub, c)
> > +-      em :=3D leftPad(m.Bytes(), k)
> > ++      em :=3D m.FillBytes(make([]byte, k))
> > +       // EM =3D 0x00 || 0x01 || PS || 0x00 || T
> > +
> > +       ok :=3D subtle.ConstantTimeByteEq(em[0], 0)
> > +@@ -323,13 +321,3 @@ func pkcs1v15HashInfo(hash crypto.Hash, inLen int=
)
> (hashLen int, prefix []byte,
> > +       }
> > +       return
> > + }
> > +-
> > +-// copyWithLeftPad copies src to the end of dest, padding with zero
> bytes as
> > +-// needed.
> > +-func copyWithLeftPad(dest, src []byte) {
> > +-      numPaddingBytes :=3D len(dest) - len(src)
> > +-      for i :=3D 0; i < numPaddingBytes; i++ {
> > +-              dest[i] =3D 0
> > +-      }
> > +-      copy(dest[numPaddingBytes:], src)
> > +-}
> > +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> > +index f9844d87329a8..b2adbedb28fa8 100644
> > +--- a/src/crypto/rsa/pss.go
> > ++++ b/src/crypto/rsa/pss.go
> > +@@ -207,20 +207,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLe=
n
> int, hash hash.Hash) error {
> > + // Note that hashed must be the result of hashing the input message
> using the
> > + // given hash function. salt is a random sequence of bytes whose
> length will be
> > + // later used to verify the signature.
> > +-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash
> crypto.Hash, hashed, salt []byte) (s []byte, err error) {
> > ++func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash
> crypto.Hash, hashed, salt []byte) ([]byte, error) {
> > +       emBits :=3D priv.N.BitLen() - 1
> > +       em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
> > +       if err !=3D nil {
> > +-              return
> > ++              return nil, err
> > +       }
> > +       m :=3D new(big.Int).SetBytes(em)
> > +       c, err :=3D decryptAndCheck(rand, priv, m)
> > +       if err !=3D nil {
> > +-              return
> > ++              return nil, err
> > +       }
> > +-      s =3D make([]byte, priv.Size())
> > +-      copyWithLeftPad(s, c.Bytes())
> > +-      return
> > ++      s :=3D make([]byte, priv.Size())
> > ++      return c.FillBytes(s), nil
> > + }
> > +
> > + const (
> > +@@ -296,11 +295,9 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash,
> digest []byte, sig []byte, opts
> > +       m :=3D encrypt(new(big.Int), pub, s)
> > +       emBits :=3D pub.N.BitLen() - 1
> > +       emLen :=3D (emBits + 7) / 8
> > +-      emBytes :=3D m.Bytes()
> > +-      if emLen < len(emBytes) {
> > ++      if m.BitLen() > emLen*8 {
> > +               return ErrVerification
> > +       }
> > +-      em :=3D make([]byte, emLen)
> > +-      copyWithLeftPad(em, emBytes)
> > ++      em :=3D m.FillBytes(make([]byte, emLen))
> > +       return emsaPSSVerify(digest, em, emBits, opts.saltLength(),
> hash.New())
> > + }
> > +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
> > +index b4bfa13defbdf..28eb5926c1a54 100644
> > +--- a/src/crypto/rsa/rsa.go
> > ++++ b/src/crypto/rsa/rsa.go
> > +@@ -416,16 +416,9 @@ func EncryptOAEP(hash hash.Hash, random io.Reader=
,
> pub *PublicKey, msg []byte, l
> > +       m :=3D new(big.Int)
> > +       m.SetBytes(em)
> > +       c :=3D encrypt(new(big.Int), pub, m)
> > +-      out :=3D c.Bytes()
> > +
> > +-      if len(out) < k {
> > +-              // If the output is too small, we need to left-pad with
> zeros.
> > +-              t :=3D make([]byte, k)
> > +-              copy(t[k-len(out):], out)
> > +-              out =3D t
> > +-      }
> > +-
> > +-      return out, nil
> > ++      out :=3D make([]byte, k)
> > ++      return c.FillBytes(out), nil
> > + }
> > +
> > + // ErrDecryption represents a failure to decrypt a message.
> > +@@ -597,12 +590,9 @@ func DecryptOAEP(hash hash.Hash, random io.Reader=
,
> priv *PrivateKey, ciphertext
> > +       lHash :=3D hash.Sum(nil)
> > +       hash.Reset()
> > +
> > +-      // Converting the plaintext number to bytes will strip any
> > +-      // leading zeros so we may have to left pad. We do this
> unconditionally
> > +-      // to avoid leaking timing information. (Although we still
> probably
> > +-      // leak the number of leading zeros. It's not clear that we can
> do
> > +-      // anything about this.)
> > +-      em :=3D leftPad(m.Bytes(), k)
> > ++      // We probably leak the number of leading zeros.
> > ++      // It's not clear that we can do anything about this.
> > ++      em :=3D m.FillBytes(make([]byte, k))
> > +
> > +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> > +
> > +@@ -643,15 +633,3 @@ func DecryptOAEP(hash hash.Hash, random io.Reader=
,
> priv *PrivateKey, ciphertext
> > +
> > +       return rest[index+1:], nil
> > + }
> > +-
> > +-// leftPad returns a new slice of length size. The contents of input
> are right
> > +-// aligned in the new slice.
> > +-func leftPad(input []byte, size int) (out []byte) {
> > +-      n :=3D len(input)
> > +-      if n > size {
> > +-              n =3D size
> > +-      }
> > +-      out =3D make([]byte, size)
> > +-      copy(out[len(out)-n:], input)
> > +-      return
> > +-}
> > +diff --git a/src/crypto/tls/key_schedule.go
> b/src/crypto/tls/key_schedule.go
> > +index 2aab323202f7d..314016979afb8 100644
> > +--- a/src/crypto/tls/key_schedule.go
> > ++++ b/src/crypto/tls/key_schedule.go
> > +@@ -173,11 +173,8 @@ func (p *nistParameters) SharedKey(peerPublicKey
> []byte) []byte {
> > +       }
> > +
> > +       xShared, _ :=3D curve.ScalarMult(x, y, p.privateKey)
> > +-      sharedKey :=3D make([]byte, (curve.Params().BitSize+7)>>3)
> > +-      xBytes :=3D xShared.Bytes()
> > +-      copy(sharedKey[len(sharedKey)-len(xBytes):], xBytes)
> > +-
> > +-      return sharedKey
> > ++      sharedKey :=3D make([]byte, (curve.Params().BitSize+7)/8)
> > ++      return xShared.FillBytes(sharedKey)
> > + }
> > +
> > + type x25519Parameters struct {
> > +diff --git a/src/crypto/x509/sec1.go b/src/crypto/x509/sec1.go
> > +index 0bfb90cd5464a..52c108ff1d624 100644
> > +--- a/src/crypto/x509/sec1.go
> > ++++ b/src/crypto/x509/sec1.go
> > +@@ -52,13 +52,10 @@ func MarshalECPrivateKey(key *ecdsa.PrivateKey)
> ([]byte, error) {
> > + // marshalECPrivateKey marshals an EC private key into ASN.1, DER
> format and
> > + // sets the curve ID to the given OID, or omits it if OID is nil.
> > + func marshalECPrivateKeyWithOID(key *ecdsa.PrivateKey, oid
> asn1.ObjectIdentifier) ([]byte, error) {
> > +-      privateKeyBytes :=3D key.D.Bytes()
> > +-      paddedPrivateKey :=3D make([]byte,
> (key.Curve.Params().N.BitLen()+7)/8)
> > +-
> copy(paddedPrivateKey[len(paddedPrivateKey)-len(privateKeyBytes):],
> privateKeyBytes)
> > +-
> > ++      privateKey :=3D make([]byte, (key.Curve.Params().N.BitLen()+7)/=
8)
> > +       return asn1.Marshal(ecPrivateKey{
> > +               Version:       1,
> > +-              PrivateKey:    paddedPrivateKey,
> > ++              PrivateKey:    key.D.FillBytes(privateKey),
> > +               NamedCurveOID: oid,
> > +               PublicKey:     asn1.BitString{Bytes:
> elliptic.Marshal(key.Curve, key.X, key.Y)},
> > +       })
> > +diff --git a/src/math/big/int.go b/src/math/big/int.go
> > +index 8816cf5266cc4..65f32487b58c0 100644
> > +--- a/src/math/big/int.go
> > ++++ b/src/math/big/int.go
> > +@@ -447,11 +447,26 @@ func (z *Int) SetBytes(buf []byte) *Int {
> > + }
> > +
> > + // Bytes returns the absolute value of x as a big-endian byte slice.
> > ++//
> > ++// To use a fixed length slice, or a preallocated one, use FillBytes.
> > + func (x *Int) Bytes() []byte {
> > +       buf :=3D make([]byte, len(x.abs)*_S)
> > +       return buf[x.abs.bytes(buf):]
> > + }
> > +
> > ++// FillBytes sets buf to the absolute value of x, storing it as a
> zero-extended
> > ++// big-endian byte slice, and returns buf.
> > ++//
> > ++// If the absolute value of x doesn't fit in buf, FillBytes will pani=
c.
> > ++func (x *Int) FillBytes(buf []byte) []byte {
> > ++      // Clear whole buffer. (This gets optimized into a memclr.)
> > ++      for i :=3D range buf {
> > ++              buf[i] =3D 0
> > ++      }
> > ++      x.abs.bytes(buf)
> > ++      return buf
> > ++}
> > ++
> > + // BitLen returns the length of the absolute value of x in bits.
> > + // The bit length of 0 is 0.
> > + func (x *Int) BitLen() int {
> > +diff --git a/src/math/big/int_test.go b/src/math/big/int_test.go
> > +index e3a1587b3f0ad..3c8557323a032 100644
> > +--- a/src/math/big/int_test.go
> > ++++ b/src/math/big/int_test.go
> > +@@ -1840,3 +1840,57 @@ func BenchmarkDiv(b *testing.B) {
> > +               })
> > +       }
> > + }
> > ++
> > ++func TestFillBytes(t *testing.T) {
> > ++      checkResult :=3D func(t *testing.T, buf []byte, want *Int) {
> > ++              t.Helper()
> > ++              got :=3D new(Int).SetBytes(buf)
> > ++              if got.CmpAbs(want) !=3D 0 {
> > ++                      t.Errorf("got 0x%x, want 0x%x: %x", got, want,
> buf)
> > ++              }
> > ++      }
> > ++      panics :=3D func(f func()) (panic bool) {
> > ++              defer func() { panic =3D recover() !=3D nil }()
> > ++              f()
> > ++              return
> > ++      }
> > ++
> > ++      for _, n :=3D range []string{
> > ++              "0",
> > ++              "1000",
> > ++              "0xffffffff",
> > ++              "-0xffffffff",
> > ++              "0xffffffffffffffff",
> > ++              "0x10000000000000000",
> > ++              "0xabababababababababababababababababababababababababa"=
,
> > ++
> "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
> > ++      } {
> > ++              t.Run(n, func(t *testing.T) {
> > ++                      t.Logf(n)
> > ++                      x, ok :=3D new(Int).SetString(n, 0)
> > ++                      if !ok {
> > ++                              panic("invalid test entry")
> > ++                      }
> > ++
> > ++                      // Perfectly sized buffer.
> > ++                      byteLen :=3D (x.BitLen() + 7) / 8
> > ++                      buf :=3D make([]byte, byteLen)
> > ++                      checkResult(t, x.FillBytes(buf), x)
> > ++
> > ++                      // Way larger, checking all bytes get zeroed.
> > ++                      buf =3D make([]byte, 100)
> > ++                      for i :=3D range buf {
> > ++                              buf[i] =3D 0xff
> > ++                      }
> > ++                      checkResult(t, x.FillBytes(buf), x)
> > ++
> > ++                      // Too small.
> > ++                      if byteLen > 0 {
> > ++                              buf =3D make([]byte, byteLen-1)
> > ++                              if !panics(func() { x.FillBytes(buf) })=
 {
> > ++                                      t.Errorf("expected panic for
> small buffer and value %x", x)
> > ++                              }
> > ++                      }
> > ++              })
> > ++      }
> > ++}
> > +diff --git a/src/math/big/nat.go b/src/math/big/nat.go
> > +index c31ec5156b81d..6a3989bf9d82b 100644
> > +--- a/src/math/big/nat.go
> > ++++ b/src/math/big/nat.go
> > +@@ -1476,19 +1476,26 @@ func (z nat) expNNMontgomery(x, y, m nat) nat =
{
> > + }
> > +
> > + // bytes writes the value of z into buf using big-endian encoding.
> > +-// len(buf) must be >=3D len(z)*_S. The value of z is encoded in the
> > +-// slice buf[i:]. The number i of unused bytes at the beginning of
> > +-// buf is returned as result.
> > ++// The value of z is encoded in the slice buf[i:]. If the value of z
> > ++// cannot be represented in buf, bytes panics. The number i of unused
> > ++// bytes at the beginning of buf is returned as result.
> > + func (z nat) bytes(buf []byte) (i int) {
> > +       i =3D len(buf)
> > +       for _, d :=3D range z {
> > +               for j :=3D 0; j < _S; j++ {
> > +                       i--
> > +-                      buf[i] =3D byte(d)
> > ++                      if i >=3D 0 {
> > ++                              buf[i] =3D byte(d)
> > ++                      } else if byte(d) !=3D 0 {
> > ++                              panic("math/big: buffer too small to fi=
t
> value")
> > ++                      }
> > +                       d >>=3D 8
> > +               }
> > +       }
> > +
> > ++      if i < 0 {
> > ++              i =3D 0
> > ++      }
> > +       for i < len(buf) && buf[i] =3D=3D 0 {
> > +               i++
> > +       }
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
> > new file mode 100644
> > index 0000000000..ae9fcc170c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch
> > @@ -0,0 +1,86 @@
> > +From 8f676144ad7b7c91adb0c6e1ec89aaa6283c6807 Mon Sep 17 00:00:00 2001
> > +From: Himanshu Kishna Srivastava <28himanshu@gmail.com>
> > +Date: Tue, 16 Mar 2021 22:37:46 +0530
> > +Subject: [PATCH] crypto/rsa: fix salt length calculation with
> > + PSSSaltLengthAuto
> > +
> > +When PSSSaltLength is set, the maximum salt length must equal:
> > +
> > +    (modulus_key_size - 1 + 7)/8 - hash_length - 2
> > +and for example, with a 4096 bit modulus key, and a SHA-1 hash,
> > +it should be:
> > +
> > +     (4096 -1 + 7)/8 - 20 - 2 =3D 490
> > +Previously we'd encounter this error:
> > +
> > +     crypto/rsa: key size too small for PSS signature
> > +
> > +Fixes #42741
> > +
> > +Change-Id: I18bb82c41c511d564b3f4c443f4b3a38ab010ac5
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/302230
> > +Reviewed-by: Emmanuel Odeke <emmanuel@orijtech.com>
> > +Reviewed-by: Filippo Valsorda <filippo@golang.org>
> > +Trust: Emmanuel Odeke <emmanuel@orijtech.com>
> > +Run-TryBot: Emmanuel Odeke <emmanuel@orijtech.com>
> > +TryBot-Result: Go Bot <gobot@golang.org>
> > +
> > +Upstream-Status: Backport [
> https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6=
807
> ]
> > +CVE: CVE-2023-45287 #Dependency Patch3
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/crypto/rsa/pss.go      |  2 +-
> > + src/crypto/rsa/pss_test.go | 20 +++++++++++++++++++-
> > + 2 files changed, 20 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> > +index b2adbedb28fa8..814522de8181f 100644
> > +--- a/src/crypto/rsa/pss.go
> > ++++ b/src/crypto/rsa/pss.go
> > +@@ -269,7 +269,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, has=
h
> crypto.Hash, digest []byte,
> > +       saltLength :=3D opts.saltLength()
> > +       switch saltLength {
> > +       case PSSSaltLengthAuto:
> > +-              saltLength =3D priv.Size() - 2 - hash.Size()
> > ++              saltLength =3D (priv.N.BitLen()-1+7)/8 - 2 - hash.Size(=
)
> > +       case PSSSaltLengthEqualsHash:
> > +               saltLength =3D hash.Size()
> > +       }
> > +diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
> > +index dfa8d8bb5ad02..c3a6d468497cd 100644
> > +--- a/src/crypto/rsa/pss_test.go
> > ++++ b/src/crypto/rsa/pss_test.go
> > +@@ -12,7 +12,7 @@ import (
> > +       _ "crypto/md5"
> > +       "crypto/rand"
> > +       "crypto/sha1"
> > +-      _ "crypto/sha256"
> > ++      "crypto/sha256"
> > +       "encoding/hex"
> > +       "math/big"
> > +       "os"
> > +@@ -233,6 +233,24 @@ func TestPSSSigning(t *testing.T) {
> > +       }
> > + }
> > +
> > ++func TestSignWithPSSSaltLengthAuto(t *testing.T) {
> > ++      key, err :=3D GenerateKey(rand.Reader, 513)
> > ++      if err !=3D nil {
> > ++              t.Fatal(err)
> > ++      }
> > ++      digest :=3D sha256.Sum256([]byte("message"))
> > ++      signature, err :=3D key.Sign(rand.Reader, digest[:], &PSSOption=
s{
> > ++              SaltLength: PSSSaltLengthAuto,
> > ++              Hash:       crypto.SHA256,
> > ++      })
> > ++      if err !=3D nil {
> > ++              t.Fatal(err)
> > ++      }
> > ++      if len(signature) =3D=3D 0 {
> > ++              t.Fatal("empty signature returned")
> > ++      }
> > ++}
> > ++
> > + func bigFromHex(hex string) *big.Int {
> > +       n, ok :=3D new(big.Int).SetString(hex, 16)
> > +       if !ok {
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
> > new file mode 100644
> > index 0000000000..a62c1258f8
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch
> > @@ -0,0 +1,1697 @@
> > +From 8a81fdf165facdcefa06531de5af98a4db343035 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?L=3DC3=3DBAc=3DC3=3DA1s=3D20Meier?=3D <cronokirby@gm=
ail.com>
> > +Date: Tue, 8 Jun 2021 21:36:06 +0200
> > +Subject: [PATCH] crypto/rsa: replace big.Int for encryption and
> decryption
> > +
> > +Infamously, big.Int does not provide constant-time arithmetic, making
> > +its use in cryptographic code quite tricky. RSA uses big.Int
> > +pervasively, in its public API, for key generation, precomputation, an=
d
> > +for encryption and decryption. This is a known problem. One mitigation=
,
> > +blinding, is already in place during decryption. This helps mitigate t=
he
> > +very leaky exponentiation operation. Because big.Int is fundamentally
> > +not constant-time, it's unfortunately difficult to guarantee that
> > +mitigations like these are completely effective.
> > +
> > +This patch removes the use of big.Int for encryption and decryption,
> > +replacing it with an internal nat type instead. Signing and verificati=
on
> > +are also affected, because they depend on encryption and decryption.
> > +
> > +Overall, this patch degrades performance by 55% for private key
> > +operations, and 4-5x for (much faster) public key operations.
> > +(Signatures do both, so the slowdown is worse than decryption.)
> > +
> > +name                    old time/op  new time/op    delta
> > +DecryptPKCS1v15/2048-8  1.50ms =C2=B1 0%    2.34ms =C2=B1 0%    +56.44=
%  (p=3D0.000
> n=3D8+10)
> > +DecryptPKCS1v15/3072-8  4.40ms =C2=B1 0%    6.79ms =C2=B1 0%    +54.33=
%  (p=3D0.000
> n=3D10+9)
> > +DecryptPKCS1v15/4096-8  9.31ms =C2=B1 0%   15.14ms =C2=B1 0%    +62.60=
%  (p=3D0.000
> n=3D10+10)
> > +EncryptPKCS1v15/2048-8  8.16=C2=B5s =C2=B1 0%  355.58=C2=B5s =C2=B1 0%=
  +4258.90%  (p=3D0.000
> n=3D10+9)
> > +DecryptOAEP/2048-8      1.50ms =C2=B1 0%    2.34ms =C2=B1 0%    +55.68=
%  (p=3D0.000
> n=3D10+9)
> > +EncryptOAEP/2048-8      8.51=C2=B5s =C2=B1 0%  355.95=C2=B5s =C2=B1 0%=
  +4082.75%  (p=3D0.000
> n=3D10+9)
> > +SignPKCS1v15/2048-8     1.51ms =C2=B1 0%    2.69ms =C2=B1 0%    +77.94=
%  (p=3D0.000
> n=3D10+10)
> > +VerifyPKCS1v15/2048-8   7.25=C2=B5s =C2=B1 0%  354.34=C2=B5s =C2=B1 0%=
  +4789.52%  (p=3D0.000
> n=3D9+9)
> > +SignPSS/2048-8          1.51ms =C2=B1 0%    2.70ms =C2=B1 0%    +78.80=
%  (p=3D0.000
> n=3D9+10)
> > +VerifyPSS/2048-8        8.27=C2=B5s =C2=B1 1%  355.65=C2=B5s =C2=B1 0%=
  +4199.39%  (p=3D0.000
> n=3D10+10)
> > +
> > +Keep in mind that this is without any assembly at all, and that furthe=
r
> > +improvements are likely possible. I think having a review of the logic
> > +and the cryptography would be a good idea at this stage, before we
> > +complicate the code too much through optimization.
> > +
> > +The bulk of the work is in nat.go. This introduces two new types: nat,
> > +representing natural numbers, and modulus, representing moduli used in
> > +modular arithmetic.
> > +
> > +A nat has an "announced size", which may be larger than its "true size=
",
> > +the number of bits needed to represent this number. Operations on a na=
t
> > +will only ever leak its announced size, never its true size, or other
> > +information about its value. The size of a nat is always clear based o=
n
> > +how its value is set. For example, x.mod(y, m) will make the announced
> > +size of x match that of m, since x is reduced modulo m.
> > +
> > +Operations assume that the announced size of the operands match what's
> > +expected (with a few exceptions). For example, x.modAdd(y, m) assumes
> > +that x and y have the same announced size as m, and that they're reduc=
ed
> > +modulo m.
> > +
> > +Nats are represented over unsatured bits.UintSize - 1 bit limbs. This
> > +means that we can't reuse the assembly routines for big.Int, which use
> > +saturated bits.UintSize limbs. The advantage of unsaturated limbs is
> > +that it makes Montgomery multiplication faster, by needing fewer
> > +registers in a hot loop. This makes exponentiation faster, which
> > +consists of many Montgomery multiplications.
> > +
> > +Moduli use nat internally. Unlike nat, the true size of a modulus alwa=
ys
> > +matches its announced size. When creating a modulus, any zero padding =
is
> > +removed. Moduli will also precompute constants when created, which is
> > +another reason why having a separate type is desirable.
> > +
> > +Updates #20654
> > +
> > +Co-authored-by: Filippo Valsorda <filippo@golang.org>
> > +Change-Id: I73b61f87d58ab912e80a9644e255d552cbadcced
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/326012
> > +Run-TryBot: Filippo Valsorda <filippo@golang.org>
> > +TryBot-Result: Gopher Robot <gobot@golang.org>
> > +Reviewed-by: Roland Shoemaker <roland@golang.org>
> > +Reviewed-by: Joedian Reid <joedian@golang.org>
> > +
> > +Upstream-Status: Backport [
> https://github.com/golang/go/commit/8a81fdf165facdcefa06531de5af98a4db343=
035
> ]
> > +CVE: CVE-2023-45287
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/crypto/rsa/example_test.go |  21 +-
> > + src/crypto/rsa/nat.go          | 626 ++++++++++++++++++++++++++++++++=
+
> > + src/crypto/rsa/nat_test.go     | 384 ++++++++++++++++++++
> > + src/crypto/rsa/pkcs1v15.go     |  47 +--
> > + src/crypto/rsa/pss.go          |  50 ++-
> > + src/crypto/rsa/pss_test.go     |  10 +-
> > + src/crypto/rsa/rsa.go          | 174 ++++-----
> > + 7 files changed, 1143 insertions(+), 169 deletions(-)
> > + create mode 100644 src/crypto/rsa/nat.go
> > + create mode 100644 src/crypto/rsa/nat_test.go
> > +
> > +diff --git a/src/crypto/rsa/example_test.go
> b/src/crypto/rsa/example_test.go
> > +index 1435b70..1963609 100644
> > +--- a/src/crypto/rsa/example_test.go
> > ++++ b/src/crypto/rsa/example_test.go
> > +@@ -12,7 +12,6 @@ import (
> > +       "crypto/sha256"
> > +       "encoding/hex"
> > +       "fmt"
> > +-      "io"
> > +       "os"
> > + )
> > +
> > +@@ -36,21 +35,17 @@ import (
> > + // a buffer that contains a random key. Thus, if the RSA result isn't
> > + // well-formed, the implementation uses a random key in constant time=
.
> > + func ExampleDecryptPKCS1v15SessionKey() {
> > +-      // crypto/rand.Reader is a good source of entropy for blinding
> the RSA
> > +-      // operation.
> > +-      rng :=3D rand.Reader
> > +-
> > +       // The hybrid scheme should use at least a 16-byte symmetric
> key. Here
> > +       // we read the random key that will be used if the RSA
> decryption isn't
> > +       // well-formed.
> > +       key :=3D make([]byte, 32)
> > +-      if _, err :=3D io.ReadFull(rng, key); err !=3D nil {
> > ++      if _, err :=3D rand.Read(key); err !=3D nil {
> > +               panic("RNG failure")
> > +       }
> > +
> > +       rsaCiphertext, _ :=3D hex.DecodeString("aabbccddeeff")
> > +
> > +-      if err :=3D DecryptPKCS1v15SessionKey(rng, rsaPrivateKey,
> rsaCiphertext, key); err !=3D nil {
> > ++      if err :=3D DecryptPKCS1v15SessionKey(nil, rsaPrivateKey,
> rsaCiphertext, key); err !=3D nil {
> > +               // Any errors that result will be =E2=80=9Cpublic=E2=80=
=9D =E2=80=93 meaning
> that they
> > +               // can be determined without any secret information. (F=
or
> > +               // instance, if the length of key is impossible given
> the RSA
> > +@@ -86,10 +81,6 @@ func ExampleDecryptPKCS1v15SessionKey() {
> > + }
> > +
> > + func ExampleSignPKCS1v15() {
> > +-      // crypto/rand.Reader is a good source of entropy for blinding
> the RSA
> > +-      // operation.
> > +-      rng :=3D rand.Reader
> > +-
> > +       message :=3D []byte("message to be signed")
> > +
> > +       // Only small messages can be signed directly; thus the hash of=
 a
> > +@@ -99,7 +90,7 @@ func ExampleSignPKCS1v15() {
> > +       // of writing (2016).
> > +       hashed :=3D sha256.Sum256(message)
> > +
> > +-      signature, err :=3D SignPKCS1v15(rng, rsaPrivateKey,
> crypto.SHA256, hashed[:])
> > ++      signature, err :=3D SignPKCS1v15(nil, rsaPrivateKey,
> crypto.SHA256, hashed[:])
> > +       if err !=3D nil {
> > +               fmt.Fprintf(os.Stderr, "Error from signing: %s\n", err)
> > +               return
> > +@@ -151,11 +142,7 @@ func ExampleDecryptOAEP() {
> > +       ciphertext, _ :=3D
> hex.DecodeString("4d1ee10e8f286390258c51a5e80802844c3e6358ad6690b7285218a=
7c7ed7fc3a4c7b950fbd04d4b0239cc060dcc7065ca6f84c1756deb71ca5685cadbb82be025=
e16449b905c568a19c088a1abfad54bf7ecc67a7df39943ec511091a34c0f2348d04e058fcf=
f4d55644de3cd1d580791d4524b92f3e91695582e6e340a1c50b6c6d78e80b4e42c5b4d45e4=
79b492de42bbd39cc642ebb80226bb5200020d501b24a37bcc2ec7f34e596b4fd6b063de485=
8dbf5a4e3dd18e262eda0ec2d19dbd8e890d672b63d368768360b20c0b6b8592a438fa275e5=
fa7f60bef0dd39673fd3989cc54d2cb80c08fcd19dacbc265ee1c6014616b0e04ea0328c2a0=
4e73460")
> > +       label :=3D []byte("orders")
> > +
> > +-      // crypto/rand.Reader is a good source of entropy for blinding
> the RSA
> > +-      // operation.
> > +-      rng :=3D rand.Reader
> > +-
> > +-      plaintext, err :=3D DecryptOAEP(sha256.New(), rng, test2048Key,
> ciphertext, label)
> > ++      plaintext, err :=3D DecryptOAEP(sha256.New(), nil, test2048Key,
> ciphertext, label)
> > +       if err !=3D nil {
> > +               fmt.Fprintf(os.Stderr, "Error from decryption: %s\n",
> err)
> > +               return
> > +diff --git a/src/crypto/rsa/nat.go b/src/crypto/rsa/nat.go
> > +new file mode 100644
> > +index 0000000..da521c2
> > +--- /dev/null
> > ++++ b/src/crypto/rsa/nat.go
> > +@@ -0,0 +1,626 @@
> > ++// Copyright 2021 The Go Authors. All rights reserved.
> > ++// Use of this source code is governed by a BSD-style
> > ++// license that can be found in the LICENSE file.
> > ++
> > ++package rsa
> > ++
> > ++import (
> > ++      "math/big"
> > ++      "math/bits"
> > ++)
> > ++
> > ++const (
> > ++      // _W is the number of bits we use for our limbs.
> > ++      _W =3D bits.UintSize - 1
> > ++      // _MASK selects _W bits from a full machine word.
> > ++      _MASK =3D (1 << _W) - 1
> > ++)
> > ++
> > ++// choice represents a constant-time boolean. The value of choice is
> always
> > ++// either 1 or 0. We use an int instead of bool in order to make
> decisions in
> > ++// constant time by turning it into a mask.
> > ++type choice uint
> > ++
> > ++func not(c choice) choice { return 1 ^ c }
> > ++
> > ++const yes =3D choice(1)
> > ++const no =3D choice(0)
> > ++
> > ++// ctSelect returns x if on =3D=3D 1, and y if on =3D=3D 0. The execu=
tion time
> of this
> > ++// function does not depend on its inputs. If on is any value besides
> 1 or 0,
> > ++// the result is undefined.
> > ++func ctSelect(on choice, x, y uint) uint {
> > ++      // When on =3D=3D 1, mask is 0b111..., otherwise mask is 0b000.=
..
> > ++      mask :=3D -uint(on)
> > ++      // When mask is all zeros, we just have y, otherwise, y cancels
> with itself.
> > ++      return y ^ (mask & (y ^ x))
> > ++}
> > ++
> > ++// ctEq returns 1 if x =3D=3D y, and 0 otherwise. The execution time =
of
> this
> > ++// function does not depend on its inputs.
> > ++func ctEq(x, y uint) choice {
> > ++      // If x !=3D y, then either x - y or y - x will generate a carr=
y.
> > ++      _, c1 :=3D bits.Sub(x, y, 0)
> > ++      _, c2 :=3D bits.Sub(y, x, 0)
> > ++      return not(choice(c1 | c2))
> > ++}
> > ++
> > ++// ctGeq returns 1 if x >=3D y, and 0 otherwise. The execution time o=
f
> this
> > ++// function does not depend on its inputs.
> > ++func ctGeq(x, y uint) choice {
> > ++      // If x < y, then x - y generates a carry.
> > ++      _, carry :=3D bits.Sub(x, y, 0)
> > ++      return not(choice(carry))
> > ++}
> > ++
> > ++// nat represents an arbitrary natural number
> > ++//
> > ++// Each nat has an announced length, which is the number of limbs it
> has stored.
> > ++// Operations on this number are allowed to leak this length, but wil=
l
> not leak
> > ++// any information about the values contained in those limbs.
> > ++type nat struct {
> > ++      // limbs is a little-endian representation in base 2^W with
> > ++      // W =3D bits.UintSize - 1. The top bit is always unset between
> operations.
> > ++      //
> > ++      // The top bit is left unset to optimize Montgomery
> multiplication, in the
> > ++      // inner loop of exponentiation. Using fully saturated limbs
> would leave us
> > ++      // working with 129-bit numbers on 64-bit platforms, wasting a
> lot of space,
> > ++      // and thus time.
> > ++      limbs []uint
> > ++}
> > ++
> > ++// expand expands x to n limbs, leaving its value unchanged.
> > ++func (x *nat) expand(n int) *nat {
> > ++      for len(x.limbs) > n {
> > ++              if x.limbs[len(x.limbs)-1] !=3D 0 {
> > ++                      panic("rsa: internal error: shrinking nat")
> > ++              }
> > ++              x.limbs =3D x.limbs[:len(x.limbs)-1]
> > ++      }
> > ++      if cap(x.limbs) < n {
> > ++              newLimbs :=3D make([]uint, n)
> > ++              copy(newLimbs, x.limbs)
> > ++              x.limbs =3D newLimbs
> > ++              return x
> > ++      }
> > ++      extraLimbs :=3D x.limbs[len(x.limbs):n]
> > ++      for i :=3D range extraLimbs {
> > ++              extraLimbs[i] =3D 0
> > ++      }
> > ++      x.limbs =3D x.limbs[:n]
> > ++      return x
> > ++}
> > ++
> > ++// reset returns a zero nat of n limbs, reusing x's storage if n <=3D
> cap(x.limbs).
> > ++func (x *nat) reset(n int) *nat {
> > ++      if cap(x.limbs) < n {
> > ++              x.limbs =3D make([]uint, n)
> > ++              return x
> > ++      }
> > ++      for i :=3D range x.limbs {
> > ++              x.limbs[i] =3D 0
> > ++      }
> > ++      x.limbs =3D x.limbs[:n]
> > ++      return x
> > ++}
> > ++
> > ++// clone returns a new nat, with the same value and announced length
> as x.
> > ++func (x *nat) clone() *nat {
> > ++      out :=3D &nat{make([]uint, len(x.limbs))}
> > ++      copy(out.limbs, x.limbs)
> > ++      return out
> > ++}
> > ++
> > ++// natFromBig creates a new natural number from a big.Int.
> > ++//
> > ++// The announced length of the resulting nat is based on the actual
> bit size of
> > ++// the input, ignoring leading zeroes.
> > ++func natFromBig(x *big.Int) *nat {
> > ++      xLimbs :=3D x.Bits()
> > ++      bitSize :=3D bigBitLen(x)
> > ++      requiredLimbs :=3D (bitSize + _W - 1) / _W
> > ++
> > ++      out :=3D &nat{make([]uint, requiredLimbs)}
> > ++      outI :=3D 0
> > ++      shift :=3D 0
> > ++      for i :=3D range xLimbs {
> > ++              xi :=3D uint(xLimbs[i])
> > ++              out.limbs[outI] |=3D (xi << shift) & _MASK
> > ++              outI++
> > ++              if outI =3D=3D requiredLimbs {
> > ++                      return out
> > ++              }
> > ++              out.limbs[outI] =3D xi >> (_W - shift)
> > ++              shift++ // this assumes bits.UintSize - _W =3D 1
> > ++              if shift =3D=3D _W {
> > ++                      shift =3D 0
> > ++                      outI++
> > ++              }
> > ++      }
> > ++      return out
> > ++}
> > ++
> > ++// fillBytes sets bytes to x as a zero-extended big-endian byte slice=
.
> > ++//
> > ++// If bytes is not long enough to contain the number or at least
> len(x.limbs)-1
> > ++// limbs, or has zero length, fillBytes will panic.
> > ++func (x *nat) fillBytes(bytes []byte) []byte {
> > ++      if len(bytes) =3D=3D 0 {
> > ++              panic("nat: fillBytes invoked with too small buffer")
> > ++      }
> > ++      for i :=3D range bytes {
> > ++              bytes[i] =3D 0
> > ++      }
> > ++      shift :=3D 0
> > ++      outI :=3D len(bytes) - 1
> > ++      for i, limb :=3D range x.limbs {
> > ++              remainingBits :=3D _W
> > ++              for remainingBits >=3D 8 {
> > ++                      bytes[outI] |=3D byte(limb) << shift
> > ++                      consumed :=3D 8 - shift
> > ++                      limb >>=3D consumed
> > ++                      remainingBits -=3D consumed
> > ++                      shift =3D 0
> > ++                      outI--
> > ++                      if outI < 0 {
> > ++                              if limb !=3D 0 || i < len(x.limbs)-1 {
> > ++                                      panic("nat: fillBytes invoked
> with too small buffer")
> > ++                              }
> > ++                              return bytes
> > ++                      }
> > ++              }
> > ++              bytes[outI] =3D byte(limb)
> > ++              shift =3D remainingBits
> > ++      }
> > ++      return bytes
> > ++}
> > ++
> > ++// natFromBytes converts a slice of big-endian bytes into a nat.
> > ++//
> > ++// The announced length of the output depends on the length of bytes.
> Unlike
> > ++// big.Int, creating a nat will not remove leading zeros.
> > ++func natFromBytes(bytes []byte) *nat {
> > ++      bitSize :=3D len(bytes) * 8
> > ++      requiredLimbs :=3D (bitSize + _W - 1) / _W
> > ++
> > ++      out :=3D &nat{make([]uint, requiredLimbs)}
> > ++      outI :=3D 0
> > ++      shift :=3D 0
> > ++      for i :=3D len(bytes) - 1; i >=3D 0; i-- {
> > ++              bi :=3D bytes[i]
> > ++              out.limbs[outI] |=3D uint(bi) << shift
> > ++              shift +=3D 8
> > ++              if shift >=3D _W {
> > ++                      shift -=3D _W
> > ++                      out.limbs[outI] &=3D _MASK
> > ++                      outI++
> > ++                      if shift > 0 {
> > ++                              out.limbs[outI] =3D uint(bi) >> (8 - sh=
ift)
> > ++                      }
> > ++              }
> > ++      }
> > ++      return out
> > ++}
> > ++
> > ++// cmpEq returns 1 if x =3D=3D y, and 0 otherwise.
> > ++//
> > ++// Both operands must have the same announced length.
> > ++func (x *nat) cmpEq(y *nat) choice {
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(x.limbs)
> > ++      xLimbs :=3D x.limbs[:size]
> > ++      yLimbs :=3D y.limbs[:size]
> > ++
> > ++      equal :=3D yes
> > ++      for i :=3D 0; i < size; i++ {
> > ++              equal &=3D ctEq(xLimbs[i], yLimbs[i])
> > ++      }
> > ++      return equal
> > ++}
> > ++
> > ++// cmpGeq returns 1 if x >=3D y, and 0 otherwise.
> > ++//
> > ++// Both operands must have the same announced length.
> > ++func (x *nat) cmpGeq(y *nat) choice {
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(x.limbs)
> > ++      xLimbs :=3D x.limbs[:size]
> > ++      yLimbs :=3D y.limbs[:size]
> > ++
> > ++      var c uint
> > ++      for i :=3D 0; i < size; i++ {
> > ++              c =3D (xLimbs[i] - yLimbs[i] - c) >> _W
> > ++      }
> > ++      // If there was a carry, then subtracting y underflowed, so
> > ++      // x is not greater than or equal to y.
> > ++      return not(choice(c))
> > ++}
> > ++
> > ++// assign sets x <- y if on =3D=3D 1, and does nothing otherwise.
> > ++//
> > ++// Both operands must have the same announced length.
> > ++func (x *nat) assign(on choice, y *nat) *nat {
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(x.limbs)
> > ++      xLimbs :=3D x.limbs[:size]
> > ++      yLimbs :=3D y.limbs[:size]
> > ++
> > ++      for i :=3D 0; i < size; i++ {
> > ++              xLimbs[i] =3D ctSelect(on, yLimbs[i], xLimbs[i])
> > ++      }
> > ++      return x
> > ++}
> > ++
> > ++// add computes x +=3D y if on =3D=3D 1, and does nothing otherwise. =
It
> returns the
> > ++// carry of the addition regardless of on.
> > ++//
> > ++// Both operands must have the same announced length.
> > ++func (x *nat) add(on choice, y *nat) (c uint) {
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(x.limbs)
> > ++      xLimbs :=3D x.limbs[:size]
> > ++      yLimbs :=3D y.limbs[:size]
> > ++
> > ++      for i :=3D 0; i < size; i++ {
> > ++              res :=3D xLimbs[i] + yLimbs[i] + c
> > ++              xLimbs[i] =3D ctSelect(on, res&_MASK, xLimbs[i])
> > ++              c =3D res >> _W
> > ++      }
> > ++      return
> > ++}
> > ++
> > ++// sub computes x -=3D y if on =3D=3D 1, and does nothing otherwise. =
It
> returns the
> > ++// borrow of the subtraction regardless of on.
> > ++//
> > ++// Both operands must have the same announced length.
> > ++func (x *nat) sub(on choice, y *nat) (c uint) {
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(x.limbs)
> > ++      xLimbs :=3D x.limbs[:size]
> > ++      yLimbs :=3D y.limbs[:size]
> > ++
> > ++      for i :=3D 0; i < size; i++ {
> > ++              res :=3D xLimbs[i] - yLimbs[i] - c
> > ++              xLimbs[i] =3D ctSelect(on, res&_MASK, xLimbs[i])
> > ++              c =3D res >> _W
> > ++      }
> > ++      return
> > ++}
> > ++
> > ++// modulus is used for modular arithmetic, precomputing relevant
> constants.
> > ++//
> > ++// Moduli are assumed to be odd numbers. Moduli can also leak the exa=
ct
> > ++// number of bits needed to store their value, and are stored without
> padding.
> > ++//
> > ++// Their actual value is still kept secret.
> > ++type modulus struct {
> > ++      // The underlying natural number for this modulus.
> > ++      //
> > ++      // This will be stored without any padding, and shouldn't alias
> with any
> > ++      // other natural number being used.
> > ++      nat     *nat
> > ++      leading int  // number of leading zeros in the modulus
> > ++      m0inv   uint // -nat.limbs[0]=E2=81=BB=C2=B9 mod _W
> > ++}
> > ++
> > ++// minusInverseModW computes -x=E2=81=BB=C2=B9 mod _W with x odd.
> > ++//
> > ++// This operation is used to precompute a constant involved in
> Montgomery
> > ++// multiplication.
> > ++func minusInverseModW(x uint) uint {
> > ++      // Every iteration of this loop doubles the least-significant
> bits of
> > ++      // correct inverse in y. The first three bits are already
> correct (1=E2=81=BB=C2=B9 =3D 1,
> > ++      // 3=E2=81=BB=C2=B9 =3D 3, 5=E2=81=BB=C2=B9 =3D 5, and 7=E2=81=
=BB=C2=B9 =3D 7 mod 8), so doubling five times
> is enough
> > ++      // for 61 bits (and wastes only one iteration for 31 bits).
> > ++      //
> > ++      // See https://crypto.stackexchange.com/a/47496.
> > ++      y :=3D x
> > ++      for i :=3D 0; i < 5; i++ {
> > ++              y =3D y * (2 - x*y)
> > ++      }
> > ++      return (1 << _W) - (y & _MASK)
> > ++}
> > ++
> > ++// modulusFromNat creates a new modulus from a nat.
> > ++//
> > ++// The nat should be odd, nonzero, and the number of significant bits
> in the
> > ++// number should be leakable. The nat shouldn't be reused.
> > ++func modulusFromNat(nat *nat) *modulus {
> > ++      m :=3D &modulus{}
> > ++      m.nat =3D nat
> > ++      size :=3D len(m.nat.limbs)
> > ++      for m.nat.limbs[size-1] =3D=3D 0 {
> > ++              size--
> > ++      }
> > ++      m.nat.limbs =3D m.nat.limbs[:size]
> > ++      m.leading =3D _W - bitLen(m.nat.limbs[size-1])
> > ++      m.m0inv =3D minusInverseModW(m.nat.limbs[0])
> > ++      return m
> > ++}
> > ++
> > ++// bitLen is a version of bits.Len that only leaks the bit length of
> n, but not
> > ++// its value. bits.Len and bits.LeadingZeros use a lookup table for t=
he
> > ++// low-order bits on some architectures.
> > ++func bitLen(n uint) int {
> > ++      var len int
> > ++      // We assume, here and elsewhere, that comparison to zero is
> constant time
> > ++      // with respect to different non-zero values.
> > ++      for n !=3D 0 {
> > ++              len++
> > ++              n >>=3D 1
> > ++      }
> > ++      return len
> > ++}
> > ++
> > ++// bigBitLen is a version of big.Int.BitLen that only leaks the bit
> length of x,
> > ++// but not its value. big.Int.BitLen uses bits.Len.
> > ++func bigBitLen(x *big.Int) int {
> > ++      xLimbs :=3D x.Bits()
> > ++      fullLimbs :=3D len(xLimbs) - 1
> > ++      topLimb :=3D uint(xLimbs[len(xLimbs)-1])
> > ++      return fullLimbs*bits.UintSize + bitLen(topLimb)
> > ++}
> > ++
> > ++// modulusSize returns the size of m in bytes.
> > ++func modulusSize(m *modulus) int {
> > ++      bits :=3D len(m.nat.limbs)*_W - int(m.leading)
> > ++      return (bits + 7) / 8
> > ++}
> > ++
> > ++// shiftIn calculates x =3D x << _W + y mod m.
> > ++//
> > ++// This assumes that x is already reduced mod m, and that y < 2^_W.
> > ++func (x *nat) shiftIn(y uint, m *modulus) *nat {
> > ++      d :=3D new(nat).resetFor(m)
> > ++
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(m.nat.limbs)
> > ++      xLimbs :=3D x.limbs[:size]
> > ++      dLimbs :=3D d.limbs[:size]
> > ++      mLimbs :=3D m.nat.limbs[:size]
> > ++
> > ++      // Each iteration of this loop computes x =3D 2x + b mod m, whe=
re
> b is a bit
> > ++      // from y. Effectively, it left-shifts x and adds y one bit at =
a
> time,
> > ++      // reducing it every time.
> > ++      //
> > ++      // To do the reduction, each iteration computes both 2x + b and
> 2x + b - m.
> > ++      // The next iteration (and finally the return line) will use
> either result
> > ++      // based on whether the subtraction underflowed.
> > ++      needSubtraction :=3D no
> > ++      for i :=3D _W - 1; i >=3D 0; i-- {
> > ++              carry :=3D (y >> i) & 1
> > ++              var borrow uint
> > ++              for i :=3D 0; i < size; i++ {
> > ++                      l :=3D ctSelect(needSubtraction, dLimbs[i],
> xLimbs[i])
> > ++
> > ++                      res :=3D l<<1 + carry
> > ++                      xLimbs[i] =3D res & _MASK
> > ++                      carry =3D res >> _W
> > ++
> > ++                      res =3D xLimbs[i] - mLimbs[i] - borrow
> > ++                      dLimbs[i] =3D res & _MASK
> > ++                      borrow =3D res >> _W
> > ++              }
> > ++              // See modAdd for how carry (aka overflow), borrow (aka
> underflow), and
> > ++              // needSubtraction relate.
> > ++              needSubtraction =3D ctEq(carry, borrow)
> > ++      }
> > ++      return x.assign(needSubtraction, d)
> > ++}
> > ++
> > ++// mod calculates out =3D x mod m.
> > ++//
> > ++// This works regardless how large the value of x is.
> > ++//
> > ++// The output will be resized to the size of m and overwritten.
> > ++func (out *nat) mod(x *nat, m *modulus) *nat {
> > ++      out.resetFor(m)
> > ++      // Working our way from the most significant to the least
> significant limb,
> > ++      // we can insert each limb at the least significant position,
> shifting all
> > ++      // previous limbs left by _W. This way each limb will get
> shifted by the
> > ++      // correct number of bits. We can insert at least N - 1 limbs
> without
> > ++      // overflowing m. After that, we need to reduce every time we
> shift.
> > ++      i :=3D len(x.limbs) - 1
> > ++      // For the first N - 1 limbs we can skip the actual shifting an=
d
> position
> > ++      // them at the shifted position, which starts at min(N - 2, i).
> > ++      start :=3D len(m.nat.limbs) - 2
> > ++      if i < start {
> > ++              start =3D i
> > ++      }
> > ++      for j :=3D start; j >=3D 0; j-- {
> > ++              out.limbs[j] =3D x.limbs[i]
> > ++              i--
> > ++      }
> > ++      // We shift in the remaining limbs, reducing modulo m each time=
.
> > ++      for i >=3D 0 {
> > ++              out.shiftIn(x.limbs[i], m)
> > ++              i--
> > ++      }
> > ++      return out
> > ++}
> > ++
> > ++// expandFor ensures out has the right size to work with operations
> modulo m.
> > ++//
> > ++// This assumes that out has as many or fewer limbs than m, or that
> the extra
> > ++// limbs are all zero (which may happen when decoding a value that ha=
s
> leading
> > ++// zeroes in its bytes representation that spill over the limb
> threshold).
> > ++func (out *nat) expandFor(m *modulus) *nat {
> > ++      return out.expand(len(m.nat.limbs))
> > ++}
> > ++
> > ++// resetFor ensures out has the right size to work with operations
> modulo m.
> > ++//
> > ++// out is zeroed and may start at any size.
> > ++func (out *nat) resetFor(m *modulus) *nat {
> > ++      return out.reset(len(m.nat.limbs))
> > ++}
> > ++
> > ++// modSub computes x =3D x - y mod m.
> > ++//
> > ++// The length of both operands must be the same as the modulus. Both
> operands
> > ++// must already be reduced modulo m.
> > ++func (x *nat) modSub(y *nat, m *modulus) *nat {
> > ++      underflow :=3D x.sub(yes, y)
> > ++      // If the subtraction underflowed, add m.
> > ++      x.add(choice(underflow), m.nat)
> > ++      return x
> > ++}
> > ++
> > ++// modAdd computes x =3D x + y mod m.
> > ++//
> > ++// The length of both operands must be the same as the modulus. Both
> operands
> > ++// must already be reduced modulo m.
> > ++func (x *nat) modAdd(y *nat, m *modulus) *nat {
> > ++      overflow :=3D x.add(yes, y)
> > ++      underflow :=3D not(x.cmpGeq(m.nat)) // x < m
> > ++
> > ++      // Three cases are possible:
> > ++      //
> > ++      //   - overflow =3D 0, underflow =3D 0
> > ++      //
> > ++      // In this case, addition fits in our limbs, but we can still
> subtract away
> > ++      // m without an underflow, so we need to perform the subtractio=
n
> to reduce
> > ++      // our result.
> > ++      //
> > ++      //   - overflow =3D 0, underflow =3D 1
> > ++      //
> > ++      // The addition fits in our limbs, but we can't subtract m
> without
> > ++      // underflowing. The result is already reduced.
> > ++      //
> > ++      //   - overflow =3D 1, underflow =3D 1
> > ++      //
> > ++      // The addition does not fit in our limbs, and the subtraction'=
s
> borrow
> > ++      // would cancel out with the addition's carry. We need to
> subtract m to
> > ++      // reduce our result.
> > ++      //
> > ++      // The overflow =3D 1, underflow =3D 0 case is not possible, be=
cause
> y is at
> > ++      // most m - 1, and if adding m - 1 overflows, then subtracting =
m
> must
> > ++      // necessarily underflow.
> > ++      needSubtraction :=3D ctEq(overflow, uint(underflow))
> > ++
> > ++      x.sub(needSubtraction, m.nat)
> > ++      return x
> > ++}
> > ++
> > ++// montgomeryRepresentation calculates x =3D x * R mod m, with R =3D =
2^(_W
> * n) and
> > ++// n =3D len(m.nat.limbs).
> > ++//
> > ++// Faster Montgomery multiplication replaces standard modular
> multiplication for
> > ++// numbers in this representation.
> > ++//
> > ++// This assumes that x is already reduced mod m.
> > ++func (x *nat) montgomeryRepresentation(m *modulus) *nat {
> > ++      for i :=3D 0; i < len(m.nat.limbs); i++ {
> > ++              x.shiftIn(0, m) // x =3D x * 2^_W mod m
> > ++      }
> > ++      return x
> > ++}
> > ++
> > ++// montgomeryMul calculates d =3D a * b / R mod m, with R =3D 2^(_W *=
 n)
> and
> > ++// n =3D len(m.nat.limbs), using the Montgomery Multiplication techni=
que.
> > ++//
> > ++// All inputs should be the same length, not aliasing d, and already
> > ++// reduced modulo m. d will be resized to the size of m and
> overwritten.
> > ++func (d *nat) montgomeryMul(a *nat, b *nat, m *modulus) *nat {
> > ++      // See
> https://bearssl.org/bigint.html#montgomery-reduction-and-multiplication
> > ++      // for a description of the algorithm.
> > ++
> > ++      // Eliminate bounds checks in the loop.
> > ++      size :=3D len(m.nat.limbs)
> > ++      aLimbs :=3D a.limbs[:size]
> > ++      bLimbs :=3D b.limbs[:size]
> > ++      dLimbs :=3D d.resetFor(m).limbs[:size]
> > ++      mLimbs :=3D m.nat.limbs[:size]
> > ++
> > ++      var overflow uint
> > ++      for i :=3D 0; i < size; i++ {
> > ++              f :=3D ((dLimbs[0] + aLimbs[i]*bLimbs[0]) * m.m0inv) &
> _MASK
> > ++              carry :=3D uint(0)
> > ++              for j :=3D 0; j < size; j++ {
> > ++                      // z =3D d[j] + a[i] * b[j] + f * m[j] + carry =
<=3D
> 2^(2W+1) - 2^(W+1) + 2^W
> > ++                      hi, lo :=3D bits.Mul(aLimbs[i], bLimbs[j])
> > ++                      z_lo, c :=3D bits.Add(dLimbs[j], lo, 0)
> > ++                      z_hi, _ :=3D bits.Add(0, hi, c)
> > ++                      hi, lo =3D bits.Mul(f, mLimbs[j])
> > ++                      z_lo, c =3D bits.Add(z_lo, lo, 0)
> > ++                      z_hi, _ =3D bits.Add(z_hi, hi, c)
> > ++                      z_lo, c =3D bits.Add(z_lo, carry, 0)
> > ++                      z_hi, _ =3D bits.Add(z_hi, 0, c)
> > ++                      if j > 0 {
> > ++                              dLimbs[j-1] =3D z_lo & _MASK
> > ++                      }
> > ++                      carry =3D z_hi<<1 | z_lo>>_W // carry <=3D 2^(W=
+1) -
> 2
> > ++              }
> > ++              z :=3D overflow + carry // z <=3D 2^(W+1) - 1
> > ++              dLimbs[size-1] =3D z & _MASK
> > ++              overflow =3D z >> _W // overflow <=3D 1
> > ++      }
> > ++      // See modAdd for how overflow, underflow, and needSubtraction
> relate.
> > ++      underflow :=3D not(d.cmpGeq(m.nat)) // d < m
> > ++      needSubtraction :=3D ctEq(overflow, uint(underflow))
> > ++      d.sub(needSubtraction, m.nat)
> > ++
> > ++      return d
> > ++}
> > ++
> > ++// modMul calculates x *=3D y mod m.
> > ++//
> > ++// x and y must already be reduced modulo m, they must share its
> announced
> > ++// length, and they may not alias.
> > ++func (x *nat) modMul(y *nat, m *modulus) *nat {
> > ++      // A Montgomery multiplication by a value out of the Montgomery
> domain
> > ++      // takes the result out of Montgomery representation.
> > ++      xR :=3D x.clone().montgomeryRepresentation(m) // xR =3D x * R m=
od m
> > ++      return x.montgomeryMul(xR, y, m)            // x =3D xR * y / R
> mod m
> > ++}
> > ++
> > ++// exp calculates out =3D x^e mod m.
> > ++//
> > ++// The exponent e is represented in big-endian order. The output will
> be resized
> > ++// to the size of m and overwritten. x must already be reduced modulo
> m.
> > ++func (out *nat) exp(x *nat, e []byte, m *modulus) *nat {
> > ++      // We use a 4 bit window. For our RSA workload, 4 bit windows
> are faster
> > ++      // than 2 bit windows, but use an extra 12 nats worth of scratc=
h
> space.
> > ++      // Using bit sizes that don't divide 8 are more complex to
> implement.
> > ++      table :=3D make([]*nat, (1<<4)-1) // table[i] =3D x ^ (i+1)
> > ++      table[0] =3D x.clone().montgomeryRepresentation(m)
> > ++      for i :=3D 1; i < len(table); i++ {
> > ++              table[i] =3D new(nat).expandFor(m)
> > ++              table[i].montgomeryMul(table[i-1], table[0], m)
> > ++      }
> > ++
> > ++      out.resetFor(m)
> > ++      out.limbs[0] =3D 1
> > ++      out.montgomeryRepresentation(m)
> > ++      t0 :=3D new(nat).expandFor(m)
> > ++      t1 :=3D new(nat).expandFor(m)
> > ++      for _, b :=3D range e {
> > ++              for _, j :=3D range []int{4, 0} {
> > ++                      // Square four times.
> > ++                      t1.montgomeryMul(out, out, m)
> > ++                      out.montgomeryMul(t1, t1, m)
> > ++                      t1.montgomeryMul(out, out, m)
> > ++                      out.montgomeryMul(t1, t1, m)
> > ++
> > ++                      // Select x^k in constant time from the table.
> > ++                      k :=3D uint((b >> j) & 0b1111)
> > ++                      for i :=3D range table {
> > ++                              t0.assign(ctEq(k, uint(i+1)), table[i])
> > ++                      }
> > ++
> > ++                      // Multiply by x^k, discarding the result if k =
=3D
> 0.
> > ++                      t1.montgomeryMul(out, t0, m)
> > ++                      out.assign(not(ctEq(k, 0)), t1)
> > ++              }
> > ++      }
> > ++
> > ++      // By Montgomery multiplying with 1 not in Montgomery
> representation, we
> > ++      // convert out back from Montgomery representation, because it
> works out to
> > ++      // dividing by R.
> > ++      t0.assign(yes, out)
> > ++      t1.resetFor(m)
> > ++      t1.limbs[0] =3D 1
> > ++      out.montgomeryMul(t0, t1, m)
> > ++
> > ++      return out
> > ++}
> > +diff --git a/src/crypto/rsa/nat_test.go b/src/crypto/rsa/nat_test.go
> > +new file mode 100644
> > +index 0000000..3e6eb10
> > +--- /dev/null
> > ++++ b/src/crypto/rsa/nat_test.go
> > +@@ -0,0 +1,384 @@
> > ++// Copyright 2021 The Go Authors. All rights reserved.
> > ++// Use of this source code is governed by a BSD-style
> > ++// license that can be found in the LICENSE file.
> > ++
> > ++package rsa
> > ++
> > ++import (
> > ++      "bytes"
> > ++      "math/big"
> > ++      "math/bits"
> > ++      "math/rand"
> > ++      "reflect"
> > ++      "testing"
> > ++      "testing/quick"
> > ++)
> > ++
> > ++// Generate generates an even nat. It's used by testing/quick to
> produce random
> > ++// *nat values for quick.Check invocations.
> > ++func (*nat) Generate(r *rand.Rand, size int) reflect.Value {
> > ++      limbs :=3D make([]uint, size)
> > ++      for i :=3D 0; i < size; i++ {
> > ++              limbs[i] =3D uint(r.Uint64()) & ((1 << _W) - 2)
> > ++      }
> > ++      return reflect.ValueOf(&nat{limbs})
> > ++}
> > ++
> > ++func testModAddCommutative(a *nat, b *nat) bool {
> > ++      mLimbs :=3D make([]uint, len(a.limbs))
> > ++      for i :=3D 0; i < len(mLimbs); i++ {
> > ++              mLimbs[i] =3D _MASK
> > ++      }
> > ++      m :=3D modulusFromNat(&nat{mLimbs})
> > ++      aPlusB :=3D a.clone()
> > ++      aPlusB.modAdd(b, m)
> > ++      bPlusA :=3D b.clone()
> > ++      bPlusA.modAdd(a, m)
> > ++      return aPlusB.cmpEq(bPlusA) =3D=3D 1
> > ++}
> > ++
> > ++func TestModAddCommutative(t *testing.T) {
> > ++      err :=3D quick.Check(testModAddCommutative, &quick.Config{})
> > ++      if err !=3D nil {
> > ++              t.Error(err)
> > ++      }
> > ++}
> > ++
> > ++func testModSubThenAddIdentity(a *nat, b *nat) bool {
> > ++      mLimbs :=3D make([]uint, len(a.limbs))
> > ++      for i :=3D 0; i < len(mLimbs); i++ {
> > ++              mLimbs[i] =3D _MASK
> > ++      }
> > ++      m :=3D modulusFromNat(&nat{mLimbs})
> > ++      original :=3D a.clone()
> > ++      a.modSub(b, m)
> > ++      a.modAdd(b, m)
> > ++      return a.cmpEq(original) =3D=3D 1
> > ++}
> > ++
> > ++func TestModSubThenAddIdentity(t *testing.T) {
> > ++      err :=3D quick.Check(testModSubThenAddIdentity, &quick.Config{}=
)
> > ++      if err !=3D nil {
> > ++              t.Error(err)
> > ++      }
> > ++}
> > ++
> > ++func testMontgomeryRoundtrip(a *nat) bool {
> > ++      one :=3D &nat{make([]uint, len(a.limbs))}
> > ++      one.limbs[0] =3D 1
> > ++      aPlusOne :=3D a.clone()
> > ++      aPlusOne.add(1, one)
> > ++      m :=3D modulusFromNat(aPlusOne)
> > ++      monty :=3D a.clone()
> > ++      monty.montgomeryRepresentation(m)
> > ++      aAgain :=3D monty.clone()
> > ++      aAgain.montgomeryMul(monty, one, m)
> > ++      return a.cmpEq(aAgain) =3D=3D 1
> > ++}
> > ++
> > ++func TestMontgomeryRoundtrip(t *testing.T) {
> > ++      err :=3D quick.Check(testMontgomeryRoundtrip, &quick.Config{})
> > ++      if err !=3D nil {
> > ++              t.Error(err)
> > ++      }
> > ++}
> > ++
> > ++func TestFromBig(t *testing.T) {
> > ++      expected :=3D []byte{0x01, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
> > ++      theBig :=3D new(big.Int).SetBytes(expected)
> > ++      actual :=3D natFromBig(theBig).fillBytes(make([]byte,
> len(expected)))
> > ++      if !bytes.Equal(actual, expected) {
> > ++              t.Errorf("%+x !=3D %+x", actual, expected)
> > ++      }
> > ++}
> > ++
> > ++func TestFillBytes(t *testing.T) {
> > ++      xBytes :=3D []byte{0xAA, 0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x=
77,
> 0x88}
> > ++      x :=3D natFromBytes(xBytes)
> > ++      for l :=3D 20; l >=3D len(xBytes); l-- {
> > ++              buf :=3D make([]byte, l)
> > ++              rand.Read(buf)
> > ++              actual :=3D x.fillBytes(buf)
> > ++              expected :=3D make([]byte, l)
> > ++              copy(expected[l-len(xBytes):], xBytes)
> > ++              if !bytes.Equal(actual, expected) {
> > ++                      t.Errorf("%d: %+v !=3D %+v", l, actual, expecte=
d)
> > ++              }
> > ++      }
> > ++      for l :=3D len(xBytes) - 1; l >=3D 0; l-- {
> > ++              (func() {
> > ++                      defer func() {
> > ++                              if recover() =3D=3D nil {
> > ++                                      t.Errorf("%d: expected panic", =
l)
> > ++                              }
> > ++                      }()
> > ++                      x.fillBytes(make([]byte, l))
> > ++              })()
> > ++      }
> > ++}
> > ++
> > ++func TestFromBytes(t *testing.T) {
> > ++      f :=3D func(xBytes []byte) bool {
> > ++              if len(xBytes) =3D=3D 0 {
> > ++                      return true
> > ++              }
> > ++              actual :=3D natFromBytes(xBytes).fillBytes(make([]byte,
> len(xBytes)))
> > ++              if !bytes.Equal(actual, xBytes) {
> > ++                      t.Errorf("%+x !=3D %+x", actual, xBytes)
> > ++                      return false
> > ++              }
> > ++              return true
> > ++      }
> > ++
> > ++      err :=3D quick.Check(f, &quick.Config{})
> > ++      if err !=3D nil {
> > ++              t.Error(err)
> > ++      }
> > ++
> > ++      f([]byte{0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88})
> > ++      f(bytes.Repeat([]byte{0xFF}, _W))
> > ++}
> > ++
> > ++func TestShiftIn(t *testing.T) {
> > ++      if bits.UintSize !=3D 64 {
> > ++              t.Skip("examples are only valid in 64 bit")
> > ++      }
> > ++      examples :=3D []struct {
> > ++              m, x, expected []byte
> > ++              y              uint64
> > ++      }{{
> > ++              m:        []byte{13},
> > ++              x:        []byte{0},
> > ++              y:        0x7FFF_FFFF_FFFF_FFFF,
> > ++              expected: []byte{7},
> > ++      }, {
> > ++              m:        []byte{13},
> > ++              x:        []byte{7},
> > ++              y:        0x7FFF_FFFF_FFFF_FFFF,
> > ++              expected: []byte{11},
> > ++      }, {
> > ++              m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00, 0x0d},
> > ++              x:        make([]byte, 9),
> > ++              y:        0x7FFF_FFFF_FFFF_FFFF,
> > ++              expected: []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff,
> 0xff, 0xff, 0xff},
> > ++      }, {
> > ++              m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00, 0x0d},
> > ++              x:        []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff,
> 0xff, 0xff, 0xff},
> > ++              y:        0,
> > ++              expected: []byte{0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00, 0x08},
> > ++      }}
> > ++
> > ++      for i, tt :=3D range examples {
> > ++              m :=3D modulusFromNat(natFromBytes(tt.m))
> > ++              got :=3D
> natFromBytes(tt.x).expandFor(m).shiftIn(uint(tt.y), m)
> > ++              if got.cmpEq(natFromBytes(tt.expected).expandFor(m)) !=
=3D
> 1 {
> > ++                      t.Errorf("%d: got %x, expected %x", i, got,
> tt.expected)
> > ++              }
> > ++      }
> > ++}
> > ++
> > ++func TestModulusAndNatSizes(t *testing.T) {
> > ++      // These are 126 bit (2 * _W on 64-bit architectures) values,
> serialized as
> > ++      // 128 bits worth of bytes. If leading zeroes are stripped, the=
y
> fit in two
> > ++      // limbs, if they are not, they fit in three. This can be a
> problem because
> > ++      // modulus strips leading zeroes and nat does not.
> > ++      m :=3D modulusFromNat(natFromBytes([]byte{
> > ++              0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > ++              0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}))
> > ++      x :=3D natFromBytes([]byte{
> > ++              0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > ++              0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe})
> > ++      x.expandFor(m) // must not panic for shrinking
> > ++}
> > ++
> > ++func TestExpand(t *testing.T) {
> > ++      sliced :=3D []uint{1, 2, 3, 4}
> > ++      examples :=3D []struct {
> > ++              in  []uint
> > ++              n   int
> > ++              out []uint
> > ++      }{{
> > ++              []uint{1, 2},
> > ++              4,
> > ++              []uint{1, 2, 0, 0},
> > ++      }, {
> > ++              sliced[:2],
> > ++              4,
> > ++              []uint{1, 2, 0, 0},
> > ++      }, {
> > ++              []uint{1, 2},
> > ++              2,
> > ++              []uint{1, 2},
> > ++      }, {
> > ++              []uint{1, 2, 0},
> > ++              2,
> > ++              []uint{1, 2},
> > ++      }}
> > ++
> > ++      for i, tt :=3D range examples {
> > ++              got :=3D (&nat{tt.in}).expand(tt.n)
> > ++              if len(got.limbs) !=3D len(tt.out) ||
> got.cmpEq(&nat{tt.out}) !=3D 1 {
> > ++                      t.Errorf("%d: got %x, expected %x", i, got,
> tt.out)
> > ++              }
> > ++      }
> > ++}
> > ++
> > ++func TestMod(t *testing.T) {
> > ++      m :=3D modulusFromNat(natFromBytes([]byte{0x06, 0x80, 0x00, 0x0=
0,
> 0x00, 0x00, 0x00, 0x00, 0x0d}))
> > ++      x :=3D natFromBytes([]byte{0x40, 0x00, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01})
> > ++      out :=3D new(nat)
> > ++      out.mod(x, m)
> > ++      expected :=3D natFromBytes([]byte{0x04, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00, 0x00, 0x09})
> > ++      if out.cmpEq(expected) !=3D 1 {
> > ++              t.Errorf("%+v !=3D %+v", out, expected)
> > ++      }
> > ++}
> > ++
> > ++func TestModSub(t *testing.T) {
> > ++      m :=3D modulusFromNat(&nat{[]uint{13}})
> > ++      x :=3D &nat{[]uint{6}}
> > ++      y :=3D &nat{[]uint{7}}
> > ++      x.modSub(y, m)
> > ++      expected :=3D &nat{[]uint{12}}
> > ++      if x.cmpEq(expected) !=3D 1 {
> > ++              t.Errorf("%+v !=3D %+v", x, expected)
> > ++      }
> > ++      x.modSub(y, m)
> > ++      expected =3D &nat{[]uint{5}}
> > ++      if x.cmpEq(expected) !=3D 1 {
> > ++              t.Errorf("%+v !=3D %+v", x, expected)
> > ++      }
> > ++}
> > ++
> > ++func TestModAdd(t *testing.T) {
> > ++      m :=3D modulusFromNat(&nat{[]uint{13}})
> > ++      x :=3D &nat{[]uint{6}}
> > ++      y :=3D &nat{[]uint{7}}
> > ++      x.modAdd(y, m)
> > ++      expected :=3D &nat{[]uint{0}}
> > ++      if x.cmpEq(expected) !=3D 1 {
> > ++              t.Errorf("%+v !=3D %+v", x, expected)
> > ++      }
> > ++      x.modAdd(y, m)
> > ++      expected =3D &nat{[]uint{7}}
> > ++      if x.cmpEq(expected) !=3D 1 {
> > ++              t.Errorf("%+v !=3D %+v", x, expected)
> > ++      }
> > ++}
> > ++
> > ++func TestExp(t *testing.T) {
> > ++      m :=3D modulusFromNat(&nat{[]uint{13}})
> > ++      x :=3D &nat{[]uint{3}}
> > ++      out :=3D &nat{[]uint{0}}
> > ++      out.exp(x, []byte{12}, m)
> > ++      expected :=3D &nat{[]uint{1}}
> > ++      if out.cmpEq(expected) !=3D 1 {
> > ++              t.Errorf("%+v !=3D %+v", out, expected)
> > ++      }
> > ++}
> > ++
> > ++func makeBenchmarkModulus() *modulus {
> > ++      m :=3D make([]uint, 32)
> > ++      for i :=3D 0; i < 32; i++ {
> > ++              m[i] =3D _MASK
> > ++      }
> > ++      return modulusFromNat(&nat{limbs: m})
> > ++}
> > ++
> > ++func makeBenchmarkValue() *nat {
> > ++      x :=3D make([]uint, 32)
> > ++      for i :=3D 0; i < 32; i++ {
> > ++              x[i] =3D _MASK - 1
> > ++      }
> > ++      return &nat{limbs: x}
> > ++}
> > ++
> > ++func makeBenchmarkExponent() []byte {
> > ++      e :=3D make([]byte, 256)
> > ++      for i :=3D 0; i < 32; i++ {
> > ++              e[i] =3D 0xFF
> > ++      }
> > ++      return e
> > ++}
> > ++
> > ++func BenchmarkModAdd(b *testing.B) {
> > ++      x :=3D makeBenchmarkValue()
> > ++      y :=3D makeBenchmarkValue()
> > ++      m :=3D makeBenchmarkModulus()
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              x.modAdd(y, m)
> > ++      }
> > ++}
> > ++
> > ++func BenchmarkModSub(b *testing.B) {
> > ++      x :=3D makeBenchmarkValue()
> > ++      y :=3D makeBenchmarkValue()
> > ++      m :=3D makeBenchmarkModulus()
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              x.modSub(y, m)
> > ++      }
> > ++}
> > ++
> > ++func BenchmarkMontgomeryRepr(b *testing.B) {
> > ++      x :=3D makeBenchmarkValue()
> > ++      m :=3D makeBenchmarkModulus()
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              x.montgomeryRepresentation(m)
> > ++      }
> > ++}
> > ++
> > ++func BenchmarkMontgomeryMul(b *testing.B) {
> > ++      x :=3D makeBenchmarkValue()
> > ++      y :=3D makeBenchmarkValue()
> > ++      out :=3D makeBenchmarkValue()
> > ++      m :=3D makeBenchmarkModulus()
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              out.montgomeryMul(x, y, m)
> > ++      }
> > ++}
> > ++
> > ++func BenchmarkModMul(b *testing.B) {
> > ++      x :=3D makeBenchmarkValue()
> > ++      y :=3D makeBenchmarkValue()
> > ++      m :=3D makeBenchmarkModulus()
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              x.modMul(y, m)
> > ++      }
> > ++}
> > ++
> > ++func BenchmarkExpBig(b *testing.B) {
> > ++      out :=3D new(big.Int)
> > ++      exponentBytes :=3D makeBenchmarkExponent()
> > ++      x :=3D new(big.Int).SetBytes(exponentBytes)
> > ++      e :=3D new(big.Int).SetBytes(exponentBytes)
> > ++      n :=3D new(big.Int).SetBytes(exponentBytes)
> > ++      one :=3D new(big.Int).SetUint64(1)
> > ++      n.Add(n, one)
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              out.Exp(x, e, n)
> > ++      }
> > ++}
> > ++
> > ++func BenchmarkExp(b *testing.B) {
> > ++      x :=3D makeBenchmarkValue()
> > ++      e :=3D makeBenchmarkExponent()
> > ++      out :=3D makeBenchmarkValue()
> > ++      m :=3D makeBenchmarkModulus()
> > ++
> > ++      b.ResetTimer()
> > ++      for i :=3D 0; i < b.N; i++ {
> > ++              out.exp(x, e, m)
> > ++      }
> > ++}
> > +diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
> > +index a216be3..4312f34 100644
> > +--- a/src/crypto/rsa/pkcs1v15.go
> > ++++ b/src/crypto/rsa/pkcs1v15.go
> > +@@ -9,7 +9,6 @@ import (
> > +       "crypto/subtle"
> > +       "errors"
> > +       "io"
> > +-      "math/big"
> > +
> > +       "crypto/internal/randutil"
> > + )
> > +@@ -58,14 +57,11 @@ func EncryptPKCS1v15(rand io.Reader, pub
> *PublicKey, msg []byte) ([]byte, error)
> > +       em[len(em)-len(msg)-1] =3D 0
> > +       copy(mm, msg)
> > +
> > +-      m :=3D new(big.Int).SetBytes(em)
> > +-      c :=3D encrypt(new(big.Int), pub, m)
> > +-
> > +-      return c.FillBytes(em), nil
> > ++      return encrypt(pub, em), nil
> > + }
> > +
> > + // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding
> scheme from PKCS#1 v1.5.
> > +-// If rand !=3D nil, it uses RSA blinding to avoid timing side-channe=
l
> attacks.
> > ++// The rand parameter is legacy and ignored, and it can be as nil.
> > + //
> > + // Note that whether this function returns an error or not discloses
> secret
> > + // information. If an attacker can cause this function to run
> repeatedly and
> > +@@ -76,7 +72,7 @@ func DecryptPKCS1v15(rand io.Reader, priv
> *PrivateKey, ciphertext []byte) ([]byt
> > +       if err :=3D checkPub(&priv.PublicKey); err !=3D nil {
> > +               return nil, err
> > +       }
> > +-      valid, out, index, err :=3D decryptPKCS1v15(rand, priv, ciphert=
ext)
> > ++      valid, out, index, err :=3D decryptPKCS1v15(priv, ciphertext)
> > +       if err !=3D nil {
> > +               return nil, err
> > +       }
> > +@@ -87,7 +83,7 @@ func DecryptPKCS1v15(rand io.Reader, priv
> *PrivateKey, ciphertext []byte) ([]byt
> > + }
> > +
> > + // DecryptPKCS1v15SessionKey decrypts a session key using RSA and the
> padding scheme from PKCS#1 v1.5.
> > +-// If rand !=3D nil, it uses RSA blinding to avoid timing side-channe=
l
> attacks.
> > ++// The rand parameter is legacy and ignored, and it can be as nil.
> > + // It returns an error if the ciphertext is the wrong length or if th=
e
> > + // ciphertext is greater than the public modulus. Otherwise, no error
> is
> > + // returned. If the padding is valid, the resulting plaintext message
> is copied
> > +@@ -114,7 +110,7 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, pri=
v
> *PrivateKey, ciphertext []by
> > +               return ErrDecryption
> > +       }
> > +
> > +-      valid, em, index, err :=3D decryptPKCS1v15(rand, priv, cipherte=
xt)
> > ++      valid, em, index, err :=3D decryptPKCS1v15(priv, ciphertext)
> > +       if err !=3D nil {
> > +               return err
> > +       }
> > +@@ -130,26 +126,24 @@ func DecryptPKCS1v15SessionKey(rand io.Reader,
> priv *PrivateKey, ciphertext []by
> > +       return nil
> > + }
> > +
> > +-// decryptPKCS1v15 decrypts ciphertext using priv and blinds the
> operation if
> > +-// rand is not nil. It returns one or zero in valid that indicates
> whether the
> > +-// plaintext was correctly structured. In either case, the plaintext =
is
> > +-// returned in em so that it may be read independently of whether it
> was valid
> > +-// in order to maintain constant memory access patterns. If the
> plaintext was
> > +-// valid then index contains the index of the original message in em.
> > +-func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext
> []byte) (valid int, em []byte, index int, err error) {
> > ++// decryptPKCS1v15 decrypts ciphertext using priv. It returns one or
> zero in
> > ++// valid that indicates whether the plaintext was correctly structure=
d.
> > ++// In either case, the plaintext is returned in em so that it may be
> read
> > ++// independently of whether it was valid in order to maintain constan=
t
> memory
> > ++// access patterns. If the plaintext was valid then index contains th=
e
> index of
> > ++// the original message in em, to allow constant time padding removal=
.
> > ++func decryptPKCS1v15(priv *PrivateKey, ciphertext []byte) (valid int,
> em []byte, index int, err error) {
> > +       k :=3D priv.Size()
> > +       if k < 11 {
> > +               err =3D ErrDecryption
> > +               return
> > +       }
> > +
> > +-      c :=3D new(big.Int).SetBytes(ciphertext)
> > +-      m, err :=3D decrypt(rand, priv, c)
> > ++      em, err =3D decrypt(priv, ciphertext)
> > +       if err !=3D nil {
> > +               return
> > +       }
> > +
> > +-      em =3D m.FillBytes(make([]byte, k))
> > +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> > +       secondByteIsTwo :=3D subtle.ConstantTimeByteEq(em[1], 2)
> > +
> > +@@ -221,8 +215,7 @@ var hashPrefixes =3D map[crypto.Hash][]byte{
> > + // function. If hash is zero, hashed is signed directly. This isn't
> > + // advisable except for interoperability.
> > + //
> > +-// If rand is not nil then RSA blinding will be used to avoid timing
> > +-// side-channel attacks.
> > ++// The rand parameter is legacy and ignored, and it can be as nil.
> > + //
> > + // This function is deterministic. Thus, if the set of possible
> > + // messages is small, an attacker may be able to build a map from
> > +@@ -249,13 +242,7 @@ func SignPKCS1v15(rand io.Reader, priv
> *PrivateKey, hash crypto.Hash, hashed []b
> > +       copy(em[k-tLen:k-hashLen], prefix)
> > +       copy(em[k-hashLen:k], hashed)
> > +
> > +-      m :=3D new(big.Int).SetBytes(em)
> > +-      c, err :=3D decryptAndCheck(rand, priv, m)
> > +-      if err !=3D nil {
> > +-              return nil, err
> > +-      }
> > +-
> > +-      return c.FillBytes(em), nil
> > ++      return decryptAndCheck(priv, em)
> > + }
> > +
> > + // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.
> > +@@ -275,9 +262,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash
> crypto.Hash, hashed []byte, sig []byte)
> > +               return ErrVerification
> > +       }
> > +
> > +-      c :=3D new(big.Int).SetBytes(sig)
> > +-      m :=3D encrypt(new(big.Int), pub, c)
> > +-      em :=3D m.FillBytes(make([]byte, k))
> > ++      em :=3D encrypt(pub, sig)
> > +       // EM =3D 0x00 || 0x01 || PS || 0x00 || T
> > +
> > +       ok :=3D subtle.ConstantTimeByteEq(em[0], 0)
> > +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
> > +index 814522d..eaba4be 100644
> > +--- a/src/crypto/rsa/pss.go
> > ++++ b/src/crypto/rsa/pss.go
> > +@@ -12,7 +12,6 @@ import (
> > +       "errors"
> > +       "hash"
> > +       "io"
> > +-      "math/big"
> > + )
> > +
> > + // Per RFC 8017, Section 9.1
> > +@@ -207,19 +206,27 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLe=
n
> int, hash hash.Hash) error {
> > + // Note that hashed must be the result of hashing the input message
> using the
> > + // given hash function. salt is a random sequence of bytes whose
> length will be
> > + // later used to verify the signature.
> > +-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash
> crypto.Hash, hashed, salt []byte) ([]byte, error) {
> > +-      emBits :=3D priv.N.BitLen() - 1
> > ++func signPSSWithSalt(priv *PrivateKey, hash crypto.Hash, hashed, salt
> []byte) ([]byte, error) {
> > ++      emBits :=3D bigBitLen(priv.N) - 1
> > +       em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
> > +       if err !=3D nil {
> > +               return nil, err
> > +       }
> > +-      m :=3D new(big.Int).SetBytes(em)
> > +-      c, err :=3D decryptAndCheck(rand, priv, m)
> > +-      if err !=3D nil {
> > +-              return nil, err
> > ++
> > ++      // RFC 8017: "Note that the octet length of EM will be one less
> than k if
> > ++      // modBits - 1 is divisible by 8 and equal to k otherwise, wher=
e
> k is the
> > ++      // length in octets of the RSA modulus n." =F0=9F=99=84
> > ++      //
> > ++      // This is extremely annoying, as all other encrypt and decrypt
> inputs are
> > ++      // always the exact same size as the modulus. Since it only
> happens for
> > ++      // weird modulus sizes, fix it by padding inefficiently.
> > ++      if emLen, k :=3D len(em), priv.Size(); emLen < k {
> > ++              emNew :=3D make([]byte, k)
> > ++              copy(emNew[k-emLen:], em)
> > ++              em =3D emNew
> > +       }
> > +-      s :=3D make([]byte, priv.Size())
> > +-      return c.FillBytes(s), nil
> > ++
> > ++      return decryptAndCheck(priv, em)
> > + }
> > +
> > + const (
> > +@@ -269,7 +276,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, has=
h
> crypto.Hash, digest []byte,
> > +       saltLength :=3D opts.saltLength()
> > +       switch saltLength {
> > +       case PSSSaltLengthAuto:
> > +-              saltLength =3D (priv.N.BitLen()-1+7)/8 - 2 - hash.Size(=
)
> > ++              saltLength =3D (bigBitLen(priv.N)-1+7)/8 - 2 - hash.Siz=
e()
> > +       case PSSSaltLengthEqualsHash:
> > +               saltLength =3D hash.Size()
> > +       }
> > +@@ -278,7 +285,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, has=
h
> crypto.Hash, digest []byte,
> > +       if _, err :=3D io.ReadFull(rand, salt); err !=3D nil {
> > +               return nil, err
> > +       }
> > +-      return signPSSWithSalt(rand, priv, hash, digest, salt)
> > ++      return signPSSWithSalt(priv, hash, digest, salt)
> > + }
> > +
> > + // VerifyPSS verifies a PSS signature.
> > +@@ -291,13 +298,22 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash,
> digest []byte, sig []byte, opts
> > +       if len(sig) !=3D pub.Size() {
> > +               return ErrVerification
> > +       }
> > +-      s :=3D new(big.Int).SetBytes(sig)
> > +-      m :=3D encrypt(new(big.Int), pub, s)
> > +-      emBits :=3D pub.N.BitLen() - 1
> > ++
> > ++      emBits :=3D bigBitLen(pub.N) - 1
> > +       emLen :=3D (emBits + 7) / 8
> > +-      if m.BitLen() > emLen*8 {
> > +-              return ErrVerification
> > ++      em :=3D encrypt(pub, sig)
> > ++
> > ++      // Like in signPSSWithSalt, deal with mismatches between emLen
> and the size
> > ++      // of the modulus. The spec would have us wire emLen into the
> encoding
> > ++      // function, but we'd rather always encode to the size of the
> modulus and
> > ++      // then strip leading zeroes if necessary. This only happens fo=
r
> weird
> > ++      // modulus sizes anyway.
> > ++      for len(em) > emLen && len(em) > 0 {
> > ++              if em[0] !=3D 0 {
> > ++                      return ErrVerification
> > ++              }
> > ++              em =3D em[1:]
> > +       }
> > +-      em :=3D m.FillBytes(make([]byte, emLen))
> > ++
> > +       return emsaPSSVerify(digest, em, emBits, opts.saltLength(),
> hash.New())
> > + }
> > +diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
> > +index c3a6d46..d018b43 100644
> > +--- a/src/crypto/rsa/pss_test.go
> > ++++ b/src/crypto/rsa/pss_test.go
> > +@@ -233,7 +233,10 @@ func TestPSSSigning(t *testing.T) {
> > +       }
> > + }
> > +
> > +-func TestSignWithPSSSaltLengthAuto(t *testing.T) {
> > ++func TestPSS513(t *testing.T) {
> > ++      // See Issue 42741, and separately, RFC 8017: "Note that the
> octet length of
> > ++      // EM will be one less than k if modBits - 1 is divisible by 8
> and equal to
> > ++      // k otherwise, where k is the length in octets of the RSA
> modulus n."
> > +       key, err :=3D GenerateKey(rand.Reader, 513)
> > +       if err !=3D nil {
> > +               t.Fatal(err)
> > +@@ -246,8 +249,9 @@ func TestSignWithPSSSaltLengthAuto(t *testing.T) {
> > +       if err !=3D nil {
> > +               t.Fatal(err)
> > +       }
> > +-      if len(signature) =3D=3D 0 {
> > +-              t.Fatal("empty signature returned")
> > ++      err =3D VerifyPSS(&key.PublicKey, crypto.SHA256, digest[:],
> signature, nil)
> > ++      if err !=3D nil {
> > ++              t.Error(err)
> > +       }
> > + }
> > +
> > +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
> > +index 5a00ed2..29d9d31 100644
> > +--- a/src/crypto/rsa/rsa.go
> > ++++ b/src/crypto/rsa/rsa.go
> > +@@ -19,13 +19,17 @@
> > + // over the public key primitive, the PrivateKey type implements the
> > + // Decrypter and Signer interfaces from the crypto package.
> > + //
> > +-// The RSA operations in this package are not implemented using
> constant-time algorithms.
> > ++// Operations in this package are implemented using constant-time
> algorithms,
> > ++// except for [GenerateKey], [PrivateKey.Precompute], and
> [PrivateKey.Validate].
> > ++// Every other operation only leaks the bit size of the involved
> values, which
> > ++// all depend on the selected key size.
> > + package rsa
> > +
> > + import (
> > +       "crypto"
> > +       "crypto/rand"
> > +       "crypto/subtle"
> > ++      "encoding/binary"
> > +       "errors"
> > +       "hash"
> > +       "io"
> > +@@ -35,7 +39,6 @@ import (
> > +       "crypto/internal/randutil"
> > + )
> > +
> > +-var bigZero =3D big.NewInt(0)
> > + var bigOne =3D big.NewInt(1)
> > +
> > + // A PublicKey represents the public part of an RSA key.
> > +@@ -47,7 +50,7 @@ type PublicKey struct {
> > + // Size returns the modulus size in bytes. Raw signatures and
> ciphertexts
> > + // for or by this public key will have the same size.
> > + func (pub *PublicKey) Size() int {
> > +-      return (pub.N.BitLen() + 7) / 8
> > ++      return (bigBitLen(pub.N) + 7) / 8
> > + }
> > +
> > + // OAEPOptions is an interface for passing options to OAEP decryption
> using the
> > +@@ -351,10 +354,19 @@ func mgf1XOR(out []byte, hash hash.Hash, seed
> []byte) {
> > + // too large for the size of the public key.
> > + var ErrMessageTooLong =3D errors.New("crypto/rsa: message too long fo=
r
> RSA public key size")
> > +
> > +-func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int {
> > +-      e :=3D big.NewInt(int64(pub.E))
> > +-      c.Exp(m, e, pub.N)
> > +-      return c
> > ++func encrypt(pub *PublicKey, plaintext []byte) []byte {
> > ++
> > ++      N :=3D modulusFromNat(natFromBig(pub.N))
> > ++      m :=3D natFromBytes(plaintext).expandFor(N)
> > ++
> > ++      e :=3D make([]byte, 8)
> > ++      binary.BigEndian.PutUint64(e, uint64(pub.E))
> > ++      for len(e) > 1 && e[0] =3D=3D 0 {
> > ++              e =3D e[1:]
> > ++      }
> > ++
> > ++      out :=3D make([]byte, modulusSize(N))
> > ++      return new(nat).exp(m, e, N).fillBytes(out)
> > + }
> > +
> > + // EncryptOAEP encrypts the given message with RSA-OAEP.
> > +@@ -404,12 +416,7 @@ func EncryptOAEP(hash hash.Hash, random io.Reader=
,
> pub *PublicKey, msg []byte, l
> > +       mgf1XOR(db, hash, seed)
> > +       mgf1XOR(seed, hash, db)
> > +
> > +-      m :=3D new(big.Int)
> > +-      m.SetBytes(em)
> > +-      c :=3D encrypt(new(big.Int), pub, m)
> > +-
> > +-      out :=3D make([]byte, k)
> > +-      return c.FillBytes(out), nil
> > ++      return encrypt(pub, em), nil
> > + }
> > +
> > + // ErrDecryption represents a failure to decrypt a message.
> > +@@ -451,98 +458,71 @@ func (priv *PrivateKey) Precompute() {
> > +       }
> > + }
> > +
> > +-// decrypt performs an RSA decryption, resulting in a plaintext
> integer. If a
> > +-// random source is given, RSA blinding is used.
> > +-func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m
> *big.Int, err error) {
> > +-      // TODO(agl): can we get away with reusing blinds?
> > +-      if c.Cmp(priv.N) > 0 {
> > +-              err =3D ErrDecryption
> > +-              return
> > ++// decrypt performs an RSA decryption of ciphertext into out.
> > ++func decrypt(priv *PrivateKey, ciphertext []byte) ([]byte, error) {
> > ++
> > ++      N :=3D modulusFromNat(natFromBig(priv.N))
> > ++      c :=3D natFromBytes(ciphertext).expandFor(N)
> > ++      if c.cmpGeq(N.nat) =3D=3D 1 {
> > ++              return nil, ErrDecryption
> > +       }
> > +       if priv.N.Sign() =3D=3D 0 {
> > +               return nil, ErrDecryption
> > +       }
> > +
> > +-      var ir *big.Int
> > +-      if random !=3D nil {
> > +-              randutil.MaybeReadByte(random)
> > +-
> > +-              // Blinding enabled. Blinding involves multiplying c by
> r^e.
> > +-              // Then the decryption operation performs (m^e * r^e)^d
> mod n
> > +-              // which equals mr mod n. The factor of r can then be
> removed
> > +-              // by multiplying by the multiplicative inverse of r.
> > +-
> > +-              var r *big.Int
> > +-              ir =3D new(big.Int)
> > +-              for {
> > +-                      r, err =3D rand.Int(random, priv.N)
> > +-                      if err !=3D nil {
> > +-                              return
> > +-                      }
> > +-                      if r.Cmp(bigZero) =3D=3D 0 {
> > +-                              r =3D bigOne
> > +-                      }
> > +-                      ok :=3D ir.ModInverse(r, priv.N)
> > +-                      if ok !=3D nil {
> > +-                              break
> > +-                      }
> > +-              }
> > +-              bigE :=3D big.NewInt(int64(priv.E))
> > +-              rpowe :=3D new(big.Int).Exp(r, bigE, priv.N) // N !=3D =
0
> > +-              cCopy :=3D new(big.Int).Set(c)
> > +-              cCopy.Mul(cCopy, rpowe)
> > +-              cCopy.Mod(cCopy, priv.N)
> > +-              c =3D cCopy
> > +-      }
> > +-
> > ++      // Note that because our private decryption exponents are store=
d
> as big.Int,
> > ++      // we potentially leak the exact number of bits of these
> exponents. This
> > ++      // isn't great, but should be fine.
> > +       if priv.Precomputed.Dp =3D=3D nil {
> > +-              m =3D new(big.Int).Exp(c, priv.D, priv.N)
> > +-      } else {
> > +-              // We have the precalculated values needed for the CRT.
> > +-              m =3D new(big.Int).Exp(c, priv.Precomputed.Dp,
> priv.Primes[0])
> > +-              m2 :=3D new(big.Int).Exp(c, priv.Precomputed.Dq,
> priv.Primes[1])
> > +-              m.Sub(m, m2)
> > +-              if m.Sign() < 0 {
> > +-                      m.Add(m, priv.Primes[0])
> > +-              }
> > +-              m.Mul(m, priv.Precomputed.Qinv)
> > +-              m.Mod(m, priv.Primes[0])
> > +-              m.Mul(m, priv.Primes[1])
> > +-              m.Add(m, m2)
> > +-
> > +-              for i, values :=3D range priv.Precomputed.CRTValues {
> > +-                      prime :=3D priv.Primes[2+i]
> > +-                      m2.Exp(c, values.Exp, prime)
> > +-                      m2.Sub(m2, m)
> > +-                      m2.Mul(m2, values.Coeff)
> > +-                      m2.Mod(m2, prime)
> > +-                      if m2.Sign() < 0 {
> > +-                              m2.Add(m2, prime)
> > +-                      }
> > +-                      m2.Mul(m2, values.R)
> > +-                      m.Add(m, m2)
> > +-              }
> > +-      }
> > +-
> > +-      if ir !=3D nil {
> > +-              // Unblind.
> > +-              m.Mul(m, ir)
> > +-              m.Mod(m, priv.N)
> > +-      }
> > +-
> > +-      return
> > ++              out :=3D make([]byte, modulusSize(N))
> > ++              return new(nat).exp(c, priv.D.Bytes(),
> N).fillBytes(out), nil
> > ++      }
> > ++
> > ++      t0 :=3D new(nat)
> > ++      P :=3D modulusFromNat(natFromBig(priv.Primes[0]))
> > ++      Q :=3D modulusFromNat(natFromBig(priv.Primes[1]))
> > ++      // m =3D c ^ Dp mod p
> > ++      m :=3D new(nat).exp(t0.mod(c, P), priv.Precomputed.Dp.Bytes(), =
P)
> > ++      // m2 =3D c ^ Dq mod q
> > ++      m2 :=3D new(nat).exp(t0.mod(c, Q), priv.Precomputed.Dq.Bytes(),=
 Q)
> > ++      // m =3D m - m2 mod p
> > ++      m.modSub(t0.mod(m2, P), P)
> > ++      // m =3D m * Qinv mod p
> > ++      m.modMul(natFromBig(priv.Precomputed.Qinv).expandFor(P), P)
> > ++      // m =3D m * q mod N
> > ++      m.expandFor(N).modMul(t0.mod(Q.nat, N), N)
> > ++      // m =3D m + m2 mod N
> > ++      m.modAdd(m2.expandFor(N), N)
> > ++
> > ++      for i, values :=3D range priv.Precomputed.CRTValues {
> > ++              p :=3D modulusFromNat(natFromBig(priv.Primes[2+i]))
> > ++              // m2 =3D c ^ Exp mod p
> > ++              m2.exp(t0.mod(c, p), values.Exp.Bytes(), p)
> > ++              // m2 =3D m2 - m mod p
> > ++              m2.modSub(t0.mod(m, p), p)
> > ++              // m2 =3D m2 * Coeff mod p
> > ++              m2.modMul(natFromBig(values.Coeff).expandFor(p), p)
> > ++              // m2 =3D m2 * R mod N
> > ++              R :=3D natFromBig(values.R).expandFor(N)
> > ++              m2.expandFor(N).modMul(R, N)
> > ++              // m =3D m + m2 mod N
> > ++              m.modAdd(m2, N)
> > ++      }
> > ++
> > ++      out :=3D make([]byte, modulusSize(N))
> > ++      return m.fillBytes(out), nil
> > + }
> > +
> > +-func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int)
> (m *big.Int, err error) {
> > +-      m, err =3D decrypt(random, priv, c)
> > ++func decryptAndCheck(priv *PrivateKey, ciphertext []byte) (m []byte,
> err error) {
> > ++      m, err =3D decrypt(priv, ciphertext)
> > +       if err !=3D nil {
> > +               return nil, err
> > +       }
> > +
> > +       // In order to defend against errors in the CRT computation, m^=
e
> is
> > +       // calculated, which should match the original ciphertext.
> > +-      check :=3D encrypt(new(big.Int), &priv.PublicKey, m)
> > +-      if c.Cmp(check) !=3D 0 {
> > ++      check :=3D encrypt(&priv.PublicKey, m)
> > ++      if subtle.ConstantTimeCompare(ciphertext, check) !=3D 1 {
> > +               return nil, errors.New("rsa: internal error")
> > +       }
> > +       return m, nil
> > +@@ -554,9 +534,7 @@ func decryptAndCheck(random io.Reader, priv
> *PrivateKey, c *big.Int) (m *big.Int
> > + // Encryption and decryption of a given message must use the same has=
h
> function
> > + // and sha256.New() is a reasonable choice.
> > + //
> > +-// The random parameter, if not nil, is used to blind the private-key
> operation
> > +-// and avoid timing side-channel attacks. Blinding is purely internal
> to this
> > +-// function =E2=80=93 the random data need not match that used when e=
ncrypting.
> > ++// The random parameter is legacy and ignored, and it can be as nil.
> > + //
> > + // The label parameter must match the value given when encrypting. Se=
e
> > + // EncryptOAEP for details.
> > +@@ -570,9 +548,7 @@ func DecryptOAEP(hash hash.Hash, random io.Reader,
> priv *PrivateKey, ciphertext
> > +               return nil, ErrDecryption
> > +       }
> > +
> > +-      c :=3D new(big.Int).SetBytes(ciphertext)
> > +-
> > +-      m, err :=3D decrypt(random, priv, c)
> > ++      em, err :=3D decrypt(priv, ciphertext)
> > +       if err !=3D nil {
> > +               return nil, err
> > +       }
> > +@@ -581,10 +557,6 @@ func DecryptOAEP(hash hash.Hash, random io.Reader=
,
> priv *PrivateKey, ciphertext
> > +       lHash :=3D hash.Sum(nil)
> > +       hash.Reset()
> > +
> > +-      // We probably leak the number of leading zeros.
> > +-      // It's not clear that we can do anything about this.
> > +-      em :=3D m.FillBytes(make([]byte, k))
> > +-
> > +       firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
> > +
> > +       seed :=3D em[1 : hash.Size()+1]
> > +--
> > +2.25.1
> > +
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193344):
> https://lists.openembedded.org/g/openembedded-core/message/193344
> > Mute This Topic: https://lists.openembedded.org/mt/103539124/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000028fed9060e335375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Steve for testing. <br><div><br></div><div>I will a=
gain create patch from scratch and send V3 to you.<br><br></div><div>Thanks=
 &amp; Regards,</div><div>Vijay<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 5, 2024 at 7:29=E2=80=
=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">V2 also has issues, as flagged by patchtest and my local testing:<br>
<br>
Applying: go: Backport fix for CVE-2023-45287<br>
error: corrupt patch at line 2273<br>
error: could not build fake ancestor<br>
Patch failed at 0001 go: Backport fix for CVE-2023-45287<br>
<br>
Steve<br>
<br>
On Thu, Jan 4, 2024 at 9:33=E2=80=AFPM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/golang/go/commit/9baafabac9a84813a336f0=
68862207d2bb06d255" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/golang/go/commit/9baafabac9a84813a336f068862207d2bb06d255</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878=
d55b4c6a12843f2f3" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e=
1ec89aaa6283c6807" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6807</a><br>
&gt; &amp;<br>
&gt; <a href=3D"https://github.com/golang/go/commit/8a81fdf165facdcefa06531=
de5af98a4db343035" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
golang/go/commit/8a81fdf165facdcefa06531de5af98a4db343035</a>]<br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-45287-pre1.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 393 ++++<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-45287-pre2.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 401 ++++<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-45287-pre3.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A086 +<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-45287.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1697 +++++++++++++++++<br>
&gt;=C2=A0 5 files changed, 2581 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-452=
87-pre1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-452=
87-pre2.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-452=
87-pre3.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-452=
87.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devto=
ols/go/go-1.14.inc<br>
&gt; index b827a3606d..42a9ac8435 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; @@ -83,6 +83,10 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-39318.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-39319.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-39326.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-45287-pre1.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-45287-pre2.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-45287-pre3.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-45287.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc=
-dynamic-linker-with-musl.patch&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patc=
h b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4d65180253<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre1.patch<br>
&gt; @@ -0,0 +1,393 @@<br>
&gt; +From 9baafabac9a84813a336f068862207d2bb06d255 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" targ=
et=3D"_blank">filippo@golang.org</a>&gt;<br>
&gt; +Date: Wed, 1 Apr 2020 17:25:40 -0400<br>
&gt; +Subject: [PATCH] crypto/rsa: refactor RSA-PSS signing and verificatio=
n<br>
&gt; +<br>
&gt; +Cleaned up for readability and consistency.<br>
&gt; +<br>
&gt; +There is one tiny behavioral change: when PSSSaltLengthEqualsHash is<=
br>
&gt; +used and both hash and opts.Hash were set, hash.Size() was used for t=
he<br>
&gt; +salt length instead of opts.Hash.Size(). That&#39;s clearly wrong bec=
ause<br>
&gt; +opts.Hash is documented to override hash.<br>
&gt; +<br>
&gt; +Change-Id: I3e25dad933961eac827c6d2e3bbfe45fc5a6fb0e<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/226=
937" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/226937</a><br>
&gt; +Run-TryBot: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org=
" target=3D"_blank">filippo@golang.org</a>&gt;<br>
&gt; +TryBot-Result: Gobot Gobot &lt;<a href=3D"mailto:gobot@golang.org" ta=
rget=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Reviewed-by: Katie Hockman &lt;<a href=3D"mailto:katie@golang.org" ta=
rget=3D"_blank">katie@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/9baafabac9a84813a336f068862207d2bb06d255" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/9baafabac9a84813a336f068862207=
d2bb06d255</a>]<br>
&gt; +CVE: CVE-2023-45287 #Dependency Patch1<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/crypto/rsa/pss.go | 173 ++++++++++++++++++++++------------------=
--<br>
&gt; + src/crypto/rsa/rsa.go |=C2=A0 =C2=A09 ++-<br>
&gt; + 2 files changed, 96 insertions(+), 86 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go<br>
&gt; +index 3ff0c2f4d0076..f9844d87329a8 100644<br>
&gt; +--- a/src/crypto/rsa/pss.go<br>
&gt; ++++ b/src/crypto/rsa/pss.go<br>
&gt; +@@ -4,9 +4,7 @@<br>
&gt; +<br>
&gt; + package rsa<br>
&gt; +<br>
&gt; +-// This file implements the PSS signature scheme [1].<br>
&gt; +-//<br>
&gt; +-// [1] <a href=3D"https://www.emc.com/collateral/white-papers/h11300=
-pkcs-1v2-2-rsa-cryptography-standard-wp.pdf" rel=3D"noreferrer" target=3D"=
_blank">https://www.emc.com/collateral/white-papers/h11300-pkcs-1v2-2-rsa-c=
ryptography-standard-wp.pdf</a><br>
&gt; ++// This file implements the RSASSA-PSS signature scheme according to=
 RFC 8017.<br>
&gt; +<br>
&gt; + import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
&gt; +@@ -17,8 +15,22 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;math/big&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; ++// Per RFC 8017, Section 9.1<br>
&gt; ++//<br>
&gt; ++//=C2=A0 =C2=A0 =C2=A0EM =3D MGF1 xor DB || H( 8*0x00 || mHash || sa=
lt ) || 0xbc<br>
&gt; ++//<br>
&gt; ++// where<br>
&gt; ++//<br>
&gt; ++//=C2=A0 =C2=A0 =C2=A0DB =3D PS || 0x01 || salt<br>
&gt; ++//<br>
&gt; ++// and PS can be empty so<br>
&gt; ++//<br>
&gt; ++//=C2=A0 =C2=A0 =C2=A0emLen =3D dbLen + hLen + 1 =3D psLen + sLen + =
hLen + 2<br>
&gt; ++//<br>
&gt; ++<br>
&gt; + func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.=
Hash) ([]byte, error) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // See [1], section 9.1.1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See RFC 8017, Section 9.1.1.<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hLen :=3D hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sLen :=3D len(salt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0emLen :=3D (emBits + 7) / 8<br>
&gt; +@@ -30,7 +42,7 @@ func emsaPSSEncode(mHash []byte, emBits int, salt [=
]byte, hash hash.Hash) ([]byt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 2.=C2=A0 Let mHash =3D Hash(M), an octe=
t string of length hLen.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(mHash) !=3D hLen {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, errors.=
New(&quot;crypto/rsa: input must be hashed message&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, errors.=
New(&quot;crypto/rsa: input must be hashed with given hash&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 3.=C2=A0 If emLen &lt; hLen + sLen + 2,=
 output &quot;encoding error&quot; and stop.<br>
&gt; +@@ -40,8 +52,9 @@ func emsaPSSEncode(mHash []byte, emBits int, salt [=
]byte, hash hash.Hash) ([]byt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0em :=3D make([]byte, emLen)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 db :=3D em[:emLen-sLen-hLen-2+1+sLen]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 h :=3D em[emLen-sLen-hLen-2+1+sLen : emLen-1]<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 psLen :=3D emLen - sLen - hLen - 2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 db :=3D em[:psLen+1+sLen]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 h :=3D em[psLen+1+sLen : emLen-1]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 4.=C2=A0 Generate a random octet string=
 salt of length sLen; if sLen =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0then salt is the emp=
ty string.<br>
&gt; +@@ -69,8 +82,8 @@ func emsaPSSEncode(mHash []byte, emBits int, salt [=
]byte, hash hash.Hash) ([]byt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 8.=C2=A0 Let DB =3D PS || 0x01 || salt;=
 DB is an octet string of length<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0emLen - hLen - 1.<br=
>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 db[emLen-sLen-hLen-2] =3D 0x01<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(db[emLen-sLen-hLen-1:], salt)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 db[psLen] =3D 0x01<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 copy(db[psLen+1:], salt)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 9.=C2=A0 Let dbMask =3D MGF(H, emLen - =
hLen - 1).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; +@@ -81,47 +94,57 @@ func emsaPSSEncode(mHash []byte, emBits int, salt=
 []byte, hash hash.Hash) ([]byt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 11. Set the leftmost 8 * emLen - emBits=
 bits of the leftmost octet in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0maskedDB to zero.<br=
>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 db[0] &amp;=3D (0xFF &gt;&gt; uint(8*emLen-emBi=
ts))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 db[0] &amp;=3D 0xff &gt;&gt; (8*emLen - emBits)=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 12. Let EM =3D maskedDB || H || 0xbc.<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em[emLen-1] =3D 0xBC<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em[emLen-1] =3D 0xbc<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 13. Output EM.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return em, nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Has=
h) error {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See RFC 8017, Section 9.1.2.<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 hLen :=3D hash.Size()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if sLen =3D=3D PSSSaltLengthEqualsHash {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sLen =3D hLen<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emLen :=3D (emBits + 7) / 8<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if emLen !=3D len(em) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errors.New(&=
quot;rsa: internal error: inconsistent length&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 1.=C2=A0 If the length of M is greater =
than the input limitation for the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0hash function (2^61 =
- 1 octets for SHA-1), output &quot;inconsistent&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0and stop.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 2.=C2=A0 Let mHash =3D Hash(M), an octe=
t string of length hLen.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 hLen :=3D hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if hLen !=3D len(mHash) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 3.=C2=A0 If emLen &lt; hLen + sLen + 2,=
 output &quot;inconsistent&quot; and stop.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 emLen :=3D (emBits + 7) / 8<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if emLen &lt; hLen+sLen+2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 4.=C2=A0 If the rightmost octet of EM d=
oes not have hexadecimal value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A00xbc, output &quot;i=
nconsistent&quot; and stop.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if em[len(em)-1] !=3D 0xBC {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if em[emLen-1] !=3D 0xbc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 5.=C2=A0 Let maskedDB be the leftmost e=
mLen - hLen - 1 octets of EM, and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0let H be the next hL=
en octets.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0db :=3D em[:emLen-hLen-1]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 h :=3D em[emLen-hLen-1 : len(em)-1]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 h :=3D em[emLen-hLen-1 : emLen-1]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 6.=C2=A0 If the leftmost 8 * emLen - em=
Bits bits of the leftmost octet in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0maskedDB are not all=
 equal to zero, output &quot;inconsistent&quot; and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0stop.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if em[0]&amp;(0xFF&lt;&lt;uint(8-(8*emLen-emBit=
s))) !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 var bitMask byte =3D 0xff &gt;&gt; (8*emLen - e=
mBits)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if em[0] &amp; ^bitMask !=3D 0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +@@ -132,37 +155,30 @@ func emsaPSSVerify(mHash, em []byte, emBits, sL=
en int, hash hash.Hash) error {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 9.=C2=A0 Set the leftmost 8 * emLen - e=
mBits bits of the leftmost octet in DB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0 =C2=A0to zero.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 db[0] &amp;=3D (0xFF &gt;&gt; uint(8*emLen-emBi=
ts))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 db[0] &amp;=3D bitMask<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // If we don&#39;t know the salt length, look f=
or the 0x01 delimiter.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if sLen =3D=3D PSSSaltLengthAuto {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 FindSaltLength:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for sLen =3D emLen =
- (hLen + 2); sLen &gt;=3D 0; sLen-- {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 switch db[emLen-hLen-sLen-2] {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 case 1:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break FindSaltLength<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 case 0:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 default:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ErrVerification<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sLen &lt; 0 {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 psLen :=3D bytes.In=
dexByte(db, 0x01)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if psLen &lt; 0 {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ErrVerification<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // 10. If the emLen=
 - hLen - sLen - 2 leftmost octets of DB are not zero<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=
=A0or if the octet at position emLen - hLen - sLen - 1 (the leftmost<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=
=A0position is &quot;position 1&quot;) does not have hexadecimal value 0x01=
,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=
=A0output &quot;inconsistent&quot; and stop.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, e :=3D range=
 db[:emLen-hLen-sLen-2] {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if e !=3D 0x00 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ErrVerification<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if db[emLen-hLen-sL=
en-2] !=3D 0x01 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sLen =3D len(db) - =
psLen - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // 10. If the emLen - hLen - sLen - 2 leftmost =
octets of DB are not zero<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0or if the octet at positi=
on emLen - hLen - sLen - 1 (the leftmost<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0position is &quot;positio=
n 1&quot;) does not have hexadecimal value 0x01,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0output &quot;inconsistent=
&quot; and stop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 psLen :=3D emLen - hLen - sLen - 2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, e :=3D range db[:psLen] {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e !=3D 0x00 {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ErrVerification<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if db[psLen] !=3D 0x01 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ErrVerificat=
ion<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 11.=C2=A0 Let salt be the last sLen oct=
ets of DB.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0salt :=3D db[len(db)-sLen:]<br>
&gt; +@@ -181,19 +197,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sL=
en int, hash hash.Hash) error {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0h0 :=3D hash.Sum(nil)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// 14. If H =3D H&#39;, output &quot;consi=
stent.&quot; Otherwise, output &quot;inconsistent.&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(h0, h) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(h0, h) { // TODO: constant time=
?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// signPSSWithSalt calculates the signature of hashed using PSS [1] =
with specified salt.<br>
&gt; ++// signPSSWithSalt calculates the signature of hashed using PSS with=
 specified salt.<br>
&gt; + // Note that hashed must be the result of hashing the input message =
using the<br>
&gt; + // given hash function. salt is a random sequence of bytes whose len=
gth will be<br>
&gt; + // later used to verify the signature.<br>
&gt; + func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.H=
ash, hashed, salt []byte) (s []byte, err error) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 nBits :=3D priv.N.BitLen()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em, err :=3D emsaPSSEncode(hashed, nBits-1, sal=
t, hash.New())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emBits :=3D priv.N.BitLen() - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em, err :=3D emsaPSSEncode(hashed, emBits, salt=
, hash.New())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -202,7 +218,7 @@ func signPSSWithSalt(rand io.Reader, priv *Privat=
eKey, hash crypto.Hash, hashed,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 s =3D make([]byte, (nBits+7)/8)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 s =3D make([]byte, priv.Size())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0copyWithLeftPad(s, c.Bytes())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; + }<br>
&gt; +@@ -223,16 +239,15 @@ type PSSOptions struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// PSSSaltLength constants.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SaltLength int<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // Hash, if not zero, overrides the hash functi=
on passed to SignPSS.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // This is the only way to specify the hash fun=
ction when using the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // crypto.Signer interface.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Hash is the hash function used to generate t=
he message digest. If not<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // zero, it overrides the hash function passed =
to SignPSS. It&#39;s required<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // when using PrivateKey.Sign.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Hash crypto.Hash<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// HashFunc returns pssOpts.Hash so that PSSOptions implements<br>
&gt; +-// crypto.SignerOpts.<br>
&gt; +-func (pssOpts *PSSOptions) HashFunc() crypto.Hash {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return pssOpts.Hash<br>
&gt; ++// HashFunc returns opts.Hash so that PSSOptions implements crypto.S=
ignerOpts.<br>
&gt; ++func (opts *PSSOptions) HashFunc() crypto.Hash {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return opts.Hash<br>
&gt; + }<br>
&gt; +<br>
&gt; + func (opts *PSSOptions) saltLength() int {<br>
&gt; +@@ -242,56 +257,50 @@ func (opts *PSSOptions) saltLength() int {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return opts.SaltLength<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// SignPSS calculates the signature of hashed using RSASSA-PSS [1].<=
br>
&gt; +-// Note that hashed must be the result of hashing the input message =
using the<br>
&gt; +-// given hash function. The opts argument may be nil, in which case =
sensible<br>
&gt; +-// defaults are used.<br>
&gt; +-func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, has=
hed []byte, opts *PSSOptions) ([]byte, error) {<br>
&gt; ++// SignPSS calculates the signature of digest using PSS.<br>
&gt; ++//<br>
&gt; ++// digest must be the result of hashing the input message using the =
given hash<br>
&gt; ++// function. The opts argument may be nil, in which case sensible de=
faults are<br>
&gt; ++// used. If opts.Hash is set, it overrides hash.<br>
&gt; ++func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, dig=
est []byte, opts *PSSOptions) ([]byte, error) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if opts !=3D nil &amp;&amp; opts.Hash !=3D 0 {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hash =3D opts.Hash<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0saltLength :=3D opts.saltLength()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch saltLength {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSSSaltLengthAuto:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLength =3D (pri=
v.N.BitLen()+7)/8 - 2 - hash.Size()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLength =3D priv=
.Size() - 2 - hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSSSaltLengthEqualsHash:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saltLength =3D=
 hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if opts !=3D nil &amp;&amp; opts.Hash !=3D 0 {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hash =3D opts.Hash<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0salt :=3D make([]byte, saltLength)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if _, err :=3D io.ReadFull(rand, salt); er=
r !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return signPSSWithSalt(rand, priv, hash, hashed=
, salt)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return signPSSWithSalt(rand, priv, hash, digest=
, salt)<br>
&gt; + }<br>
&gt; +<br>
&gt; + // VerifyPSS verifies a PSS signature.<br>
&gt; +-// hashed is the result of hashing the input message using the given=
 hash<br>
&gt; +-// function and sig is the signature. A valid signature is indicated=
 by<br>
&gt; +-// returning a nil error. The opts argument may be nil, in which cas=
e sensible<br>
&gt; +-// defaults are used.<br>
&gt; +-func VerifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig =
[]byte, opts *PSSOptions) error {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return verifyPSS(pub, hash, hashed, sig, opts.s=
altLength())<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-// verifyPSS verifies a PSS signature with the given salt length.<br=
>
&gt; +-func verifyPSS(pub *PublicKey, hash crypto.Hash, hashed []byte, sig =
[]byte, saltLen int) error {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 nBits :=3D pub.N.BitLen()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if len(sig) !=3D (nBits+7)/8 {<br>
&gt; ++//<br>
&gt; ++// A valid signature is indicated by returning a nil error. digest m=
ust be the<br>
&gt; ++// result of hashing the input message using the given hash function=
. The opts<br>
&gt; ++// argument may be nil, in which case sensible defaults are used. op=
ts.Hash is<br>
&gt; ++// ignored.<br>
&gt; ++func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig =
[]byte, opts *PSSOptions) error {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if len(sig) !=3D pub.Size() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s :=3D new(big.Int).SetBytes(sig)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m :=3D encrypt(new(big.Int), pub, s)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 emBits :=3D nBits - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emBits :=3D pub.N.BitLen() - 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0emLen :=3D (emBits + 7) / 8<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if emLen &lt; len(m.Bytes()) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emBytes :=3D m.Bytes()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if emLen &lt; len(emBytes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0em :=3D make([]byte, emLen)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copyWithLeftPad(em, m.Bytes())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if saltLen =3D=3D PSSSaltLengthEqualsHash {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLen =3D hash.Si=
ze()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return emsaPSSVerify(hashed, em, emBits, saltLe=
n, hash.New())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 copyWithLeftPad(em, emBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return emsaPSSVerify(digest, em, emBits, opts.s=
altLength(), hash.New())<br>
&gt; + }<br>
&gt; +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go<br>
&gt; +index 5a42990640164..b4bfa13defbdf 100644<br>
&gt; +--- a/src/crypto/rsa/rsa.go<br>
&gt; ++++ b/src/crypto/rsa/rsa.go<br>
&gt; +@@ -2,7 +2,7 @@<br>
&gt; + // Use of this source code is governed by a BSD-style<br>
&gt; + // license that can be found in the LICENSE file.<br>
&gt; +<br>
&gt; +-// Package rsa implements RSA encryption as specified in PKCS#1.<br>
&gt; ++// Package rsa implements RSA encryption as specified in PKCS#1 and =
RFC 8017.<br>
&gt; + //<br>
&gt; + // RSA is a single, fundamental operation that is used in this packa=
ge to<br>
&gt; + // implement either public-key encryption or public-key signatures.<=
br>
&gt; +@@ -10,13 +10,13 @@<br>
&gt; + // The original specification for encryption and signatures with RSA=
 is PKCS#1<br>
&gt; + // and the terms &quot;RSA encryption&quot; and &quot;RSA signatures=
&quot; by default refer to<br>
&gt; + // PKCS#1 version 1.5. However, that specification has flaws and new=
 designs<br>
&gt; +-// should use version two, usually called by just OAEP and PSS, wher=
e<br>
&gt; ++// should use version 2, usually called by just OAEP and PSS, where<=
br>
&gt; + // possible.<br>
&gt; + //<br>
&gt; + // Two sets of interfaces are included in this package. When a more =
abstract<br>
&gt; + // interface isn&#39;t necessary, there are functions for encrypting=
/decrypting<br>
&gt; + // with v1.5/OAEP and signing/verifying with v1.5/PSS. If one needs =
to abstract<br>
&gt; +-// over the public-key primitive, the PrivateKey struct implements t=
he<br>
&gt; ++// over the public key primitive, the PrivateKey type implements the=
<br>
&gt; + // Decrypter and Signer interfaces from the crypto package.<br>
&gt; + //<br>
&gt; + // The RSA operations in this package are not implemented using cons=
tant-time algorithms.<br>
&gt; +@@ -111,7 +111,8 @@ func (priv *PrivateKey) Public() crypto.PublicKey=
 {<br>
&gt; +<br>
&gt; + // Sign signs digest with priv, reading randomness from rand. If opt=
s is a<br>
&gt; + // *PSSOptions then the PSS algorithm will be used, otherwise PKCS#1=
 v1.5 will<br>
&gt; +-// be used.<br>
&gt; ++// be used. digest must be the result of hashing the input message u=
sing<br>
&gt; ++// opts.HashFunc().<br>
&gt; + //<br>
&gt; + // This method implements crypto.Signer, which is an interface to su=
pport keys<br>
&gt; + // where the private part is kept in, for example, a hardware module=
. Common<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patc=
h b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1327b44545<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre2.patch<br>
&gt; @@ -0,0 +1,401 @@<br>
&gt; +From c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org" targ=
et=3D"_blank">filippo@golang.org</a>&gt;<br>
&gt; +Date: Mon, 27 Apr 2020 21:52:38 -0400<br>
&gt; +Subject: [PATCH] math/big: add (*Int).FillBytes<br>
&gt; +<br>
&gt; +Replaced almost every use of Bytes with FillBytes.<br>
&gt; +<br>
&gt; +Note that the approved proposal was for<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 func (*Int) FillBytes(buf []byte)<br>
&gt; +<br>
&gt; +while this implements<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 func (*Int) FillBytes(buf []byte) []byte<br>
&gt; +<br>
&gt; +because the latter was far nicer to use in all callsites.<br>
&gt; +<br>
&gt; +Fixes #35833<br>
&gt; +<br>
&gt; +Change-Id: Ia912df123e5d79b763845312ea3d9a8051343c0a<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/230=
397" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/230397</a><br>
&gt; +Reviewed-by: Robert Griesemer &lt;<a href=3D"mailto:gri@golang.org" t=
arget=3D"_blank">gri@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/c9d5f60eaa4450ccf1ce878d55b4c6a12843f2f3" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/c9d5f60eaa4450ccf1ce878d55b4c6=
a12843f2f3</a>]<br>
&gt; +CVE: CVE-2023-45287 #Dependency Patch2<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/crypto/elliptic/elliptic.go | 13 ++++----<br>
&gt; + src/crypto/rsa/pkcs1v15.go=C2=A0 =C2=A0 =C2=A0 | 20 +++---------<br>
&gt; + src/crypto/rsa/pss.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +=
++++------<br>
&gt; + src/crypto/rsa/rsa.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 +=
++----------------<br>
&gt; + src/crypto/tls/key_schedule.go=C2=A0 |=C2=A0 7 ++---<br>
&gt; + src/crypto/x509/sec1.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +=
+---<br>
&gt; + src/math/big/int.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 15 +++++++++<br>
&gt; + src/math/big/int_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 54 +++++++++++=
++++++++++++++++++++++<br>
&gt; + src/math/big/nat.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 15 ++++++---<br>
&gt; + 9 files changed, 106 insertions(+), 74 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/crypto/elliptic/elliptic.go b/src/crypto/elliptic/el=
liptic.go<br>
&gt; +index e2f71cdb63bab..bd5168c5fd842 100644<br>
&gt; +--- a/src/crypto/elliptic/elliptic.go<br>
&gt; ++++ b/src/crypto/elliptic/elliptic.go<br>
&gt; +@@ -277,7 +277,7 @@ var mask =3D []byte{0xff, 0x1, 0x3, 0x7, 0xf, 0x1=
f, 0x3f, 0x7f}<br>
&gt; + func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *bi=
g.Int, err error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0N :=3D curve.Params().N<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bitSize :=3D N.BitLen()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 byteLen :=3D (bitSize + 7) &gt;&gt; 3<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 byteLen :=3D (bitSize + 7) / 8<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv =3D make([]byte, byteLen)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for x =3D=3D nil {<br>
&gt; +@@ -304,15 +304,14 @@ func GenerateKey(curve Curve, rand io.Reader) (=
priv []byte, x, y *big.Int, err e<br>
&gt; +<br>
&gt; + // Marshal converts a point into the uncompressed form specified in =
section 4.3.6 of ANSI X9.62.<br>
&gt; + func Marshal(curve Curve, x, y *big.Int) []byte {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 byteLen :=3D (curve.Params().BitSize + 7) &gt;&=
gt; 3<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 byteLen :=3D (curve.Params().BitSize + 7) / 8<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret :=3D make([]byte, 1+2*byteLen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret[0] =3D 4 // uncompressed point<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 xBytes :=3D x.Bytes()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(ret[1+byteLen-len(xBytes):], xBytes)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 yBytes :=3D y.Bytes()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(ret[1+2*byteLen-len(yBytes):], yBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.FillBytes(ret[1 : 1+byteLen])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y.FillBytes(ret[1+byteLen : 1+2*byteLen])<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -320,7 +319,7 @@ func Marshal(curve Curve, x, y *big.Int) []byte {=
<br>
&gt; + // It is an error if the point is not in uncompressed form or is not=
 on the curve.<br>
&gt; + // On error, x =3D nil.<br>
&gt; + func Unmarshal(curve Curve, data []byte) (x, y *big.Int) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 byteLen :=3D (curve.Params().BitSize + 7) &gt;&=
gt; 3<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 byteLen :=3D (curve.Params().BitSize + 7) / 8<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(data) !=3D 1+2*byteLen {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go<=
br>
&gt; +index 499242ffc5b57..3208119ae1ff4 100644<br>
&gt; +--- a/src/crypto/rsa/pkcs1v15.go<br>
&gt; ++++ b/src/crypto/rsa/pkcs1v15.go<br>
&gt; +@@ -61,8 +61,7 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey=
, msg []byte) ([]byte, error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m :=3D new(big.Int).SetBytes(em)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c :=3D encrypt(new(big.Int), pub, m)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copyWithLeftPad(em, c.Bytes())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return em, nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(em), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding sc=
heme from PKCS#1 v1.5.<br>
&gt; +@@ -150,7 +149,7 @@ func decryptPKCS1v15(rand io.Reader, priv *Privat=
eKey, ciphertext []byte) (valid<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em =3D leftPad(m.Bytes(), k)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em =3D m.FillBytes(make([]byte, k))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0firstByteIsZero :=3D subtle.ConstantTimeBy=
teEq(em[0], 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0secondByteIsTwo :=3D subtle.ConstantTimeBy=
teEq(em[1], 2)<br>
&gt; +<br>
&gt; +@@ -256,8 +255,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKe=
y, hash crypto.Hash, hashed []b<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copyWithLeftPad(em, c.Bytes())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return em, nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(em), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.<br>
&gt; +@@ -286,7 +284,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.H=
ash, hashed []byte, sig []byte)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c :=3D new(big.Int).SetBytes(sig)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m :=3D encrypt(new(big.Int), pub, c)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em :=3D leftPad(m.Bytes(), k)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em :=3D m.FillBytes(make([]byte, k))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// EM =3D 0x00 || 0x01 || PS || 0x00 || T<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ok :=3D subtle.ConstantTimeByteEq(em[0], 0=
)<br>
&gt; +@@ -323,13 +321,3 @@ func pkcs1v15HashInfo(hash crypto.Hash, inLen in=
t) (hashLen int, prefix []byte,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; + }<br>
&gt; +-<br>
&gt; +-// copyWithLeftPad copies src to the end of dest, padding with zero =
bytes as<br>
&gt; +-// needed.<br>
&gt; +-func copyWithLeftPad(dest, src []byte) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 numPaddingBytes :=3D len(dest) - len(src)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; numPaddingBytes; i++ {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[i] =3D 0<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(dest[numPaddingBytes:], src)<br>
&gt; +-}<br>
&gt; +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go<br>
&gt; +index f9844d87329a8..b2adbedb28fa8 100644<br>
&gt; +--- a/src/crypto/rsa/pss.go<br>
&gt; ++++ b/src/crypto/rsa/pss.go<br>
&gt; +@@ -207,20 +207,19 @@ func emsaPSSVerify(mHash, em []byte, emBits, sL=
en int, hash hash.Hash) error {<br>
&gt; + // Note that hashed must be the result of hashing the input message =
using the<br>
&gt; + // given hash function. salt is a random sequence of bytes whose len=
gth will be<br>
&gt; + // later used to verify the signature.<br>
&gt; +-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.H=
ash, hashed, salt []byte) (s []byte, err error) {<br>
&gt; ++func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.H=
ash, hashed, salt []byte) ([]byte, error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0emBits :=3D priv.N.BitLen() - 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0em, err :=3D emsaPSSEncode(hashed, emBits,=
 salt, hash.New())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, err<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m :=3D new(big.Int).SetBytes(em)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c, err :=3D decryptAndCheck(rand, priv, m)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, err<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 s =3D make([]byte, priv.Size())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copyWithLeftPad(s, c.Bytes())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 s :=3D make([]byte, priv.Size())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(s), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + const (<br>
&gt; +@@ -296,11 +295,9 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash,=
 digest []byte, sig []byte, opts<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m :=3D encrypt(new(big.Int), pub, s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0emBits :=3D pub.N.BitLen() - 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0emLen :=3D (emBits + 7) / 8<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 emBytes :=3D m.Bytes()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if emLen &lt; len(emBytes) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if m.BitLen() &gt; emLen*8 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em :=3D make([]byte, emLen)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copyWithLeftPad(em, emBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em :=3D m.FillBytes(make([]byte, emLen))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return emsaPSSVerify(digest, em, emBits, o=
pts.saltLength(), hash.New())<br>
&gt; + }<br>
&gt; +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go<br>
&gt; +index b4bfa13defbdf..28eb5926c1a54 100644<br>
&gt; +--- a/src/crypto/rsa/rsa.go<br>
&gt; ++++ b/src/crypto/rsa/rsa.go<br>
&gt; +@@ -416,16 +416,9 @@ func EncryptOAEP(hash hash.Hash, random io.Reade=
r, pub *PublicKey, msg []byte, l<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m :=3D new(big.Int)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0m.SetBytes(em)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c :=3D encrypt(new(big.Int), pub, m)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 out :=3D c.Bytes()<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if len(out) &lt; k {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // If the output is=
 too small, we need to left-pad with zeros.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t :=3D make([]byte,=
 k)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy(t[k-len(out):]=
, out)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D t<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return out, nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D make([]byte, k)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(out), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + // ErrDecryption represents a failure to decrypt a message.<br>
&gt; +@@ -597,12 +590,9 @@ func DecryptOAEP(hash hash.Hash, random io.Reade=
r, priv *PrivateKey, ciphertext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lHash :=3D hash.Sum(nil)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hash.Reset()<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // Converting the plaintext number to bytes wil=
l strip any<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // leading zeros so we may have to left pad. We=
 do this unconditionally<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // to avoid leaking timing information. (Althou=
gh we still probably<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // leak the number of leading zeros. It&#39;s n=
ot clear that we can do<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // anything about this.)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em :=3D leftPad(m.Bytes(), k)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // We probably leak the number of leading zeros=
.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // It&#39;s not clear that we can do anything a=
bout this.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em :=3D m.FillBytes(make([]byte, k))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0firstByteIsZero :=3D subtle.ConstantTimeBy=
teEq(em[0], 0)<br>
&gt; +<br>
&gt; +@@ -643,15 +633,3 @@ func DecryptOAEP(hash hash.Hash, random io.Reade=
r, priv *PrivateKey, ciphertext<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return rest[index+1:], nil<br>
&gt; + }<br>
&gt; +-<br>
&gt; +-// leftPad returns a new slice of length size. The contents of input=
 are right<br>
&gt; +-// aligned in the new slice.<br>
&gt; +-func leftPad(input []byte, size int) (out []byte) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 n :=3D len(input)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if n &gt; size {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D size<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 out =3D make([]byte, size)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(out[len(out)-n:], input)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +-}<br>
&gt; +diff --git a/src/crypto/tls/key_schedule.go b/src/crypto/tls/key_sche=
dule.go<br>
&gt; +index 2aab323202f7d..314016979afb8 100644<br>
&gt; +--- a/src/crypto/tls/key_schedule.go<br>
&gt; ++++ b/src/crypto/tls/key_schedule.go<br>
&gt; +@@ -173,11 +173,8 @@ func (p *nistParameters) SharedKey(peerPublicKey=
 []byte) []byte {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xShared, _ :=3D curve.ScalarMult(x, y, p.p=
rivateKey)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 sharedKey :=3D make([]byte, (curve.Params().Bit=
Size+7)&gt;&gt;3)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 xBytes :=3D xShared.Bytes()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(sharedKey[len(sharedKey)-len(xBytes):], xB=
ytes)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return sharedKey<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sharedKey :=3D make([]byte, (curve.Params().Bit=
Size+7)/8)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return xShared.FillBytes(sharedKey)<br>
&gt; + }<br>
&gt; +<br>
&gt; + type x25519Parameters struct {<br>
&gt; +diff --git a/src/crypto/x509/sec1.go b/src/crypto/x509/sec1.go<br>
&gt; +index 0bfb90cd5464a..52c108ff1d624 100644<br>
&gt; +--- a/src/crypto/x509/sec1.go<br>
&gt; ++++ b/src/crypto/x509/sec1.go<br>
&gt; +@@ -52,13 +52,10 @@ func MarshalECPrivateKey(key *ecdsa.PrivateKey) (=
[]byte, error) {<br>
&gt; + // marshalECPrivateKey marshals an EC private key into ASN.1, DER fo=
rmat and<br>
&gt; + // sets the curve ID to the given OID, or omits it if OID is nil.<br=
>
&gt; + func marshalECPrivateKeyWithOID(key *ecdsa.PrivateKey, oid asn1.Obje=
ctIdentifier) ([]byte, error) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 privateKeyBytes :=3D key.D.Bytes()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 paddedPrivateKey :=3D make([]byte, (key.Curve.P=
arams().N.BitLen()+7)/8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 copy(paddedPrivateKey[len(paddedPrivateKey)-len=
(privateKeyBytes):], privateKeyBytes)<br>
&gt; +-<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 privateKey :=3D make([]byte, (key.Curve.Params(=
).N.BitLen()+7)/8)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return asn1.Marshal(ecPrivateKey{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Version:=C2=A0=
 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PrivateKey:=C2=A0 =
=C2=A0 paddedPrivateKey,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PrivateKey:=C2=A0 =
=C2=A0 key.D.FillBytes(privateKey),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NamedCurveOID:=
 oid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PublicKey:=C2=
=A0 =C2=A0 =C2=A0asn1.BitString{Bytes: elliptic.Marshal(key.Curve, key.X, k=
ey.Y)},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
&gt; +diff --git a/src/math/big/int.go b/src/math/big/int.go<br>
&gt; +index 8816cf5266cc4..65f32487b58c0 100644<br>
&gt; +--- a/src/math/big/int.go<br>
&gt; ++++ b/src/math/big/int.go<br>
&gt; +@@ -447,11 +447,26 @@ func (z *Int) SetBytes(buf []byte) *Int {<br>
&gt; + }<br>
&gt; +<br>
&gt; + // Bytes returns the absolute value of x as a big-endian byte slice.=
<br>
&gt; ++//<br>
&gt; ++// To use a fixed length slice, or a preallocated one, use FillBytes=
.<br>
&gt; + func (x *Int) Bytes() []byte {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0buf :=3D make([]byte, len(x.abs)*_S)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return buf[x.abs.bytes(buf):]<br>
&gt; + }<br>
&gt; +<br>
&gt; ++// FillBytes sets buf to the absolute value of x, storing it as a ze=
ro-extended<br>
&gt; ++// big-endian byte slice, and returns buf.<br>
&gt; ++//<br>
&gt; ++// If the absolute value of x doesn&#39;t fit in buf, FillBytes will=
 panic.<br>
&gt; ++func (x *Int) FillBytes(buf []byte) []byte {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Clear whole buffer. (This gets optimized int=
o a memclr.)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D range buf {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i] =3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.abs.bytes(buf)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return buf<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + // BitLen returns the length of the absolute value of x in bits.<br>
&gt; + // The bit length of 0 is 0.<br>
&gt; + func (x *Int) BitLen() int {<br>
&gt; +diff --git a/src/math/big/int_test.go b/src/math/big/int_test.go<br>
&gt; +index e3a1587b3f0ad..3c8557323a032 100644<br>
&gt; +--- a/src/math/big/int_test.go<br>
&gt; ++++ b/src/math/big/int_test.go<br>
&gt; +@@ -1840,3 +1840,57 @@ func BenchmarkDiv(b *testing.B) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++func TestFillBytes(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 checkResult :=3D func(t *testing.T, buf []byte,=
 want *Int) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Helper()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got :=3D new(Int).S=
etBytes(buf)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if got.CmpAbs(want)=
 !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;got 0x%x, want 0x%x: %x&quot;, got, want, buf)<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 panics :=3D func(f func()) (panic bool) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer func() { pani=
c =3D recover() !=3D nil }()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, n :=3D range []string{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1000&quot;,<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0xffffffff&qu=
ot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-0xffffffff&q=
uot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0xfffffffffff=
fffff&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0x10000000000=
000000&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0xabababababa=
babababababababababababababababababababa&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;0xfffffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffffff&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(n, func(t *te=
sting.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Logf(n)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 x, ok :=3D new(Int).SetString(n, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if !ok {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;invalid test entry&quot;=
)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Perfectly sized buffer.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 byteLen :=3D (x.BitLen() + 7) / 8<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 buf :=3D make([]byte, byteLen)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 checkResult(t, x.FillBytes(buf), x)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Way larger, checking all bytes get zeroed.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 buf =3D make([]byte, 100)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for i :=3D range buf {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i] =3D 0xff<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 checkResult(t, x.FillBytes(buf), x)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Too small.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if byteLen &gt; 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D make([]byte, byteLen-1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !panics(func() { x.FillBytes(buf)=
 }) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf=
(&quot;expected panic for small buffer and value %x&quot;, x)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; +diff --git a/src/math/big/nat.go b/src/math/big/nat.go<br>
&gt; +index c31ec5156b81d..6a3989bf9d82b 100644<br>
&gt; +--- a/src/math/big/nat.go<br>
&gt; ++++ b/src/math/big/nat.go<br>
&gt; +@@ -1476,19 +1476,26 @@ func (z nat) expNNMontgomery(x, y, m nat) nat=
 {<br>
&gt; + }<br>
&gt; +<br>
&gt; + // bytes writes the value of z into buf using big-endian encoding.<b=
r>
&gt; +-// len(buf) must be &gt;=3D len(z)*_S. The value of z is encoded in =
the<br>
&gt; +-// slice buf[i:]. The number i of unused bytes at the beginning of<b=
r>
&gt; +-// buf is returned as result.<br>
&gt; ++// The value of z is encoded in the slice buf[i:]. If the value of z=
<br>
&gt; ++// cannot be represented in buf, bytes panics. The number i of unuse=
d<br>
&gt; ++// bytes at the beginning of buf is returned as result.<br>
&gt; + func (z nat) bytes(buf []byte) (i int) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D len(buf)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, d :=3D range z {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for j :=3D 0; =
j &lt; _S; j++ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0i--<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 buf[i] =3D byte(d)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if i &gt;=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i] =3D byte(d)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else if byte(d) !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;math/big: buffer too sma=
ll to fit value&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0d &gt;&gt;=3D 8<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if i &lt; 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for i &lt; len(buf) &amp;&amp; buf[i] =3D=
=3D 0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patc=
h b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ae9fcc170c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287-pre3.patch<br>
&gt; @@ -0,0 +1,86 @@<br>
&gt; +From 8f676144ad7b7c91adb0c6e1ec89aaa6283c6807 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Himanshu Kishna Srivastava &lt;<a href=3D"mailto:28himanshu@gma=
il.com" target=3D"_blank">28himanshu@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 16 Mar 2021 22:37:46 +0530<br>
&gt; +Subject: [PATCH] crypto/rsa: fix salt length calculation with<br>
&gt; + PSSSaltLengthAuto<br>
&gt; +<br>
&gt; +When PSSSaltLength is set, the maximum salt length must equal:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 (modulus_key_size - 1 + 7)/8 - hash_length - 2<br>
&gt; +and for example, with a 4096 bit modulus key, and a SHA-1 hash,<br>
&gt; +it should be:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(4096 -1 + 7)/8 - 20 - 2 =3D 490<br>
&gt; +Previously we&#39;d encounter this error:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crypto/rsa: key size too small for PSS signature<=
br>
&gt; +<br>
&gt; +Fixes #42741<br>
&gt; +<br>
&gt; +Change-Id: I18bb82c41c511d564b3f4c443f4b3a38ab010ac5<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/302=
230" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/302230</a><br>
&gt; +Reviewed-by: Emmanuel Odeke &lt;<a href=3D"mailto:emmanuel@orijtech.c=
om" target=3D"_blank">emmanuel@orijtech.com</a>&gt;<br>
&gt; +Reviewed-by: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.or=
g" target=3D"_blank">filippo@golang.org</a>&gt;<br>
&gt; +Trust: Emmanuel Odeke &lt;<a href=3D"mailto:emmanuel@orijtech.com" ta=
rget=3D"_blank">emmanuel@orijtech.com</a>&gt;<br>
&gt; +Run-TryBot: Emmanuel Odeke &lt;<a href=3D"mailto:emmanuel@orijtech.co=
m" target=3D"_blank">emmanuel@orijtech.com</a>&gt;<br>
&gt; +TryBot-Result: Go Bot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/8f676144ad7b7c91adb0c6e1ec89aaa6283c6807" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/8f676144ad7b7c91adb0c6e1ec89aa=
a6283c6807</a>]<br>
&gt; +CVE: CVE-2023-45287 #Dependency Patch3<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/crypto/rsa/pss.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + src/crypto/rsa/pss_test.go | 20 +++++++++++++++++++-<br>
&gt; + 2 files changed, 20 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go<br>
&gt; +index b2adbedb28fa8..814522de8181f 100644<br>
&gt; +--- a/src/crypto/rsa/pss.go<br>
&gt; ++++ b/src/crypto/rsa/pss.go<br>
&gt; +@@ -269,7 +269,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, ha=
sh crypto.Hash, digest []byte,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0saltLength :=3D opts.saltLength()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch saltLength {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSSSaltLengthAuto:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLength =3D priv=
.Size() - 2 - hash.Size()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLength =3D (pri=
v.N.BitLen()-1+7)/8 - 2 - hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSSSaltLengthEqualsHash:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saltLength =3D=
 hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go<=
br>
&gt; +index dfa8d8bb5ad02..c3a6d468497cd 100644<br>
&gt; +--- a/src/crypto/rsa/pss_test.go<br>
&gt; ++++ b/src/crypto/rsa/pss_test.go<br>
&gt; +@@ -12,7 +12,7 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ &quot;crypto/md5&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/rand&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/sha1&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ &quot;crypto/sha256&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;crypto/sha256&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;encoding/hex&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;math/big&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
&gt; +@@ -233,6 +233,24 @@ func TestPSSSigning(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; ++func TestSignWithPSSSaltLengthAuto(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 key, err :=3D GenerateKey(rand.Reader, 513)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 digest :=3D sha256.Sum256([]byte(&quot;message&=
quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 signature, err :=3D key.Sign(rand.Reader, diges=
t[:], &amp;PSSOptions{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SaltLength: PSSSalt=
LengthAuto,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0crypto.SHA256,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 })<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if len(signature) =3D=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(&quot;empty=
 signature returned&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + func bigFromHex(hex string) *big.Int {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0n, ok :=3D new(big.Int).SetString(hex, 16)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if !ok {<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch b/m=
eta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a62c1258f8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45287.patch<br>
&gt; @@ -0,0 +1,1697 @@<br>
&gt; +From 8a81fdf165facdcefa06531de5af98a4db343035 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?L=3DC3=3DBAc=3DC3=3DA1s=3D20Meier?=3D &lt;<a href=
=3D"mailto:cronokirby@gmail.com" target=3D"_blank">cronokirby@gmail.com</a>=
&gt;<br>
&gt; +Date: Tue, 8 Jun 2021 21:36:06 +0200<br>
&gt; +Subject: [PATCH] crypto/rsa: replace big.Int for encryption and decry=
ption<br>
&gt; +<br>
&gt; +Infamously, big.Int does not provide constant-time arithmetic, making=
<br>
&gt; +its use in cryptographic code quite tricky. RSA uses big.Int<br>
&gt; +pervasively, in its public API, for key generation, precomputation, a=
nd<br>
&gt; +for encryption and decryption. This is a known problem. One mitigatio=
n,<br>
&gt; +blinding, is already in place during decryption. This helps mitigate =
the<br>
&gt; +very leaky exponentiation operation. Because big.Int is fundamentally=
<br>
&gt; +not constant-time, it&#39;s unfortunately difficult to guarantee that=
<br>
&gt; +mitigations like these are completely effective.<br>
&gt; +<br>
&gt; +This patch removes the use of big.Int for encryption and decryption,<=
br>
&gt; +replacing it with an internal nat type instead. Signing and verificat=
ion<br>
&gt; +are also affected, because they depend on encryption and decryption.<=
br>
&gt; +<br>
&gt; +Overall, this patch degrades performance by 55% for private key<br>
&gt; +operations, and 4-5x for (much faster) public key operations.<br>
&gt; +(Signatures do both, so the slowdown is worse than decryption.)<br>
&gt; +<br>
&gt; +name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 old time/op=C2=A0 new time/op=C2=A0 =C2=A0 delta<br>
&gt; +DecryptPKCS1v15/2048-8=C2=A0 1.50ms =C2=B1 0%=C2=A0 =C2=A0 2.34ms =C2=
=B1 0%=C2=A0 =C2=A0 +56.44%=C2=A0 (p=3D0.000 n=3D8+10)<br>
&gt; +DecryptPKCS1v15/3072-8=C2=A0 4.40ms =C2=B1 0%=C2=A0 =C2=A0 6.79ms =C2=
=B1 0%=C2=A0 =C2=A0 +54.33%=C2=A0 (p=3D0.000 n=3D10+9)<br>
&gt; +DecryptPKCS1v15/4096-8=C2=A0 9.31ms =C2=B1 0%=C2=A0 =C2=A015.14ms =C2=
=B1 0%=C2=A0 =C2=A0 +62.60%=C2=A0 (p=3D0.000 n=3D10+10)<br>
&gt; +EncryptPKCS1v15/2048-8=C2=A0 8.16=C2=B5s =C2=B1 0%=C2=A0 355.58=C2=B5=
s =C2=B1 0%=C2=A0 +4258.90%=C2=A0 (p=3D0.000 n=3D10+9)<br>
&gt; +DecryptOAEP/2048-8=C2=A0 =C2=A0 =C2=A0 1.50ms =C2=B1 0%=C2=A0 =C2=A0 =
2.34ms =C2=B1 0%=C2=A0 =C2=A0 +55.68%=C2=A0 (p=3D0.000 n=3D10+9)<br>
&gt; +EncryptOAEP/2048-8=C2=A0 =C2=A0 =C2=A0 8.51=C2=B5s =C2=B1 0%=C2=A0 35=
5.95=C2=B5s =C2=B1 0%=C2=A0 +4082.75%=C2=A0 (p=3D0.000 n=3D10+9)<br>
&gt; +SignPKCS1v15/2048-8=C2=A0 =C2=A0 =C2=A01.51ms =C2=B1 0%=C2=A0 =C2=A0 =
2.69ms =C2=B1 0%=C2=A0 =C2=A0 +77.94%=C2=A0 (p=3D0.000 n=3D10+10)<br>
&gt; +VerifyPKCS1v15/2048-8=C2=A0 =C2=A07.25=C2=B5s =C2=B1 0%=C2=A0 354.34=
=C2=B5s =C2=B1 0%=C2=A0 +4789.52%=C2=A0 (p=3D0.000 n=3D9+9)<br>
&gt; +SignPSS/2048-8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.51ms =C2=B1 0%=C2=
=A0 =C2=A0 2.70ms =C2=B1 0%=C2=A0 =C2=A0 +78.80%=C2=A0 (p=3D0.000 n=3D9+10)=
<br>
&gt; +VerifyPSS/2048-8=C2=A0 =C2=A0 =C2=A0 =C2=A0 8.27=C2=B5s =C2=B1 1%=C2=
=A0 355.65=C2=B5s =C2=B1 0%=C2=A0 +4199.39%=C2=A0 (p=3D0.000 n=3D10+10)<br>
&gt; +<br>
&gt; +Keep in mind that this is without any assembly at all, and that furth=
er<br>
&gt; +improvements are likely possible. I think having a review of the logi=
c<br>
&gt; +and the cryptography would be a good idea at this stage, before we<br=
>
&gt; +complicate the code too much through optimization.<br>
&gt; +<br>
&gt; +The bulk of the work is in nat.go. This introduces two new types: nat=
,<br>
&gt; +representing natural numbers, and modulus, representing moduli used i=
n<br>
&gt; +modular arithmetic.<br>
&gt; +<br>
&gt; +A nat has an &quot;announced size&quot;, which may be larger than its=
 &quot;true size&quot;,<br>
&gt; +the number of bits needed to represent this number. Operations on a n=
at<br>
&gt; +will only ever leak its announced size, never its true size, or other=
<br>
&gt; +information about its value. The size of a nat is always clear based =
on<br>
&gt; +how its value is set. For example, x.mod(y, m) will make the announce=
d<br>
&gt; +size of x match that of m, since x is reduced modulo m.<br>
&gt; +<br>
&gt; +Operations assume that the announced size of the operands match what&=
#39;s<br>
&gt; +expected (with a few exceptions). For example, x.modAdd(y, m) assumes=
<br>
&gt; +that x and y have the same announced size as m, and that they&#39;re =
reduced<br>
&gt; +modulo m.<br>
&gt; +<br>
&gt; +Nats are represented over unsatured bits.UintSize - 1 bit limbs. This=
<br>
&gt; +means that we can&#39;t reuse the assembly routines for big.Int, whic=
h use<br>
&gt; +saturated bits.UintSize limbs. The advantage of unsaturated limbs is<=
br>
&gt; +that it makes Montgomery multiplication faster, by needing fewer<br>
&gt; +registers in a hot loop. This makes exponentiation faster, which<br>
&gt; +consists of many Montgomery multiplications.<br>
&gt; +<br>
&gt; +Moduli use nat internally. Unlike nat, the true size of a modulus alw=
ays<br>
&gt; +matches its announced size. When creating a modulus, any zero padding=
 is<br>
&gt; +removed. Moduli will also precompute constants when created, which is=
<br>
&gt; +another reason why having a separate type is desirable.<br>
&gt; +<br>
&gt; +Updates #20654<br>
&gt; +<br>
&gt; +Co-authored-by: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang=
.org" target=3D"_blank">filippo@golang.org</a>&gt;<br>
&gt; +Change-Id: I73b61f87d58ab912e80a9644e255d552cbadcced<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/326=
012" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/326012</a><br>
&gt; +Run-TryBot: Filippo Valsorda &lt;<a href=3D"mailto:filippo@golang.org=
" target=3D"_blank">filippo@golang.org</a>&gt;<br>
&gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" t=
arget=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:roland@golang.org=
" target=3D"_blank">roland@golang.org</a>&gt;<br>
&gt; +Reviewed-by: Joedian Reid &lt;<a href=3D"mailto:joedian@golang.org" t=
arget=3D"_blank">joedian@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/8a81fdf165facdcefa06531de5af98a4db343035" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/8a81fdf165facdcefa06531de5af98=
a4db343035</a>]<br>
&gt; +CVE: CVE-2023-45287<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/crypto/rsa/example_test.go |=C2=A0 21 +-<br>
&gt; + src/crypto/rsa/nat.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 626 ++++++=
+++++++++++++++++++++++++++<br>
&gt; + src/crypto/rsa/nat_test.go=C2=A0 =C2=A0 =C2=A0| 384 ++++++++++++++++=
++++<br>
&gt; + src/crypto/rsa/pkcs1v15.go=C2=A0 =C2=A0 =C2=A0|=C2=A0 47 +--<br>
&gt; + src/crypto/rsa/pss.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 +=
+-<br>
&gt; + src/crypto/rsa/pss_test.go=C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt; + src/crypto/rsa/rsa.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 174 ++++--=
---<br>
&gt; + 7 files changed, 1143 insertions(+), 169 deletions(-)<br>
&gt; + create mode 100644 src/crypto/rsa/nat.go<br>
&gt; + create mode 100644 src/crypto/rsa/nat_test.go<br>
&gt; +<br>
&gt; +diff --git a/src/crypto/rsa/example_test.go b/src/crypto/rsa/example_=
test.go<br>
&gt; +index 1435b70..1963609 100644<br>
&gt; +--- a/src/crypto/rsa/example_test.go<br>
&gt; ++++ b/src/crypto/rsa/example_test.go<br>
&gt; +@@ -12,7 +12,6 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/sha256&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;encoding/hex&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &quot;io&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; +@@ -36,21 +35,17 @@ import (<br>
&gt; + // a buffer that contains a random key. Thus, if the RSA result isn&=
#39;t<br>
&gt; + // well-formed, the implementation uses a random key in constant tim=
e.<br>
&gt; + func ExampleDecryptPKCS1v15SessionKey() {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // crypto/rand.Reader is a good source of entro=
py for blinding the RSA<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // operation.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rng :=3D rand.Reader<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// The hybrid scheme should use at least a=
 16-byte symmetric key. Here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// we read the random key that will be use=
d if the RSA decryption isn&#39;t<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// well-formed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0key :=3D make([]byte, 32)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if _, err :=3D io.ReadFull(rng, key); err !=3D =
nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if _, err :=3D rand.Read(key); err !=3D nil {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic(&quot;RN=
G failure&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rsaCiphertext, _ :=3D hex.DecodeString(&qu=
ot;aabbccddeeff&quot;)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if err :=3D DecryptPKCS1v15SessionKey(rng, rsaP=
rivateKey, rsaCiphertext, key); err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err :=3D DecryptPKCS1v15SessionKey(nil, rsaP=
rivateKey, rsaCiphertext, key); err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Any errors =
that result will be =E2=80=9Cpublic=E2=80=9D =E2=80=93 meaning that they<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// can be dete=
rmined without any secret information. (For<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// instance, i=
f the length of key is impossible given the RSA<br>
&gt; +@@ -86,10 +81,6 @@ func ExampleDecryptPKCS1v15SessionKey() {<br>
&gt; + }<br>
&gt; +<br>
&gt; + func ExampleSignPKCS1v15() {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // crypto/rand.Reader is a good source of entro=
py for blinding the RSA<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // operation.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rng :=3D rand.Reader<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0message :=3D []byte(&quot;message to be si=
gned&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Only small messages can be signed direc=
tly; thus the hash of a<br>
&gt; +@@ -99,7 +90,7 @@ func ExampleSignPKCS1v15() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// of writing (2016).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hashed :=3D sha256.Sum256(message)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 signature, err :=3D SignPKCS1v15(rng, rsaPrivat=
eKey, crypto.SHA256, hashed[:])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 signature, err :=3D SignPKCS1v15(nil, rsaPrivat=
eKey, crypto.SHA256, hashed[:])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(os=
.Stderr, &quot;Error from signing: %s\n&quot;, err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +@@ -151,11 +142,7 @@ func ExampleDecryptOAEP() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ciphertext, _ :=3D hex.DecodeString(&quot;=
4d1ee10e8f286390258c51a5e80802844c3e6358ad6690b7285218a7c7ed7fc3a4c7b950fbd=
04d4b0239cc060dcc7065ca6f84c1756deb71ca5685cadbb82be025e16449b905c568a19c08=
8a1abfad54bf7ecc67a7df39943ec511091a34c0f2348d04e058fcff4d55644de3cd1d58079=
1d4524b92f3e91695582e6e340a1c50b6c6d78e80b4e42c5b4d45e479b492de42bbd39cc642=
ebb80226bb5200020d501b24a37bcc2ec7f34e596b4fd6b063de4858dbf5a4e3dd18e262eda=
0ec2d19dbd8e890d672b63d368768360b20c0b6b8592a438fa275e5fa7f60bef0dd39673fd3=
989cc54d2cb80c08fcd19dacbc265ee1c6014616b0e04ea0328c2a04e73460&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0label :=3D []byte(&quot;orders&quot;)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // crypto/rand.Reader is a good source of entro=
py for blinding the RSA<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // operation.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rng :=3D rand.Reader<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 plaintext, err :=3D DecryptOAEP(sha256.New(), r=
ng, test2048Key, ciphertext, label)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 plaintext, err :=3D DecryptOAEP(sha256.New(), n=
il, test2048Key, ciphertext, label)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(os=
.Stderr, &quot;Error from decryption: %s\n&quot;, err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +diff --git a/src/crypto/rsa/nat.go b/src/crypto/rsa/nat.go<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..da521c2<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/src/crypto/rsa/nat.go<br>
&gt; +@@ -0,0 +1,626 @@<br>
&gt; ++// Copyright 2021 The Go Authors. All rights reserved.<br>
&gt; ++// Use of this source code is governed by a BSD-style<br>
&gt; ++// license that can be found in the LICENSE file.<br>
&gt; ++<br>
&gt; ++package rsa<br>
&gt; ++<br>
&gt; ++import (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;math/big&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;math/bits&quot;<br>
&gt; ++)<br>
&gt; ++<br>
&gt; ++const (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // _W is the number of bits we use for our limb=
s.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _W =3D bits.UintSize - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // _MASK selects _W bits from a full machine wo=
rd.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _MASK =3D (1 &lt;&lt; _W) - 1<br>
&gt; ++)<br>
&gt; ++<br>
&gt; ++// choice represents a constant-time boolean. The value of choice is=
 always<br>
&gt; ++// either 1 or 0. We use an int instead of bool in order to make dec=
isions in<br>
&gt; ++// constant time by turning it into a mask.<br>
&gt; ++type choice uint<br>
&gt; ++<br>
&gt; ++func not(c choice) choice { return 1 ^ c }<br>
&gt; ++<br>
&gt; ++const yes =3D choice(1)<br>
&gt; ++const no =3D choice(0)<br>
&gt; ++<br>
&gt; ++// ctSelect returns x if on =3D=3D 1, and y if on =3D=3D 0. The exec=
ution time of this<br>
&gt; ++// function does not depend on its inputs. If on is any value beside=
s 1 or 0,<br>
&gt; ++// the result is undefined.<br>
&gt; ++func ctSelect(on choice, x, y uint) uint {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // When on =3D=3D 1, mask is 0b111..., otherwis=
e mask is 0b000...<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mask :=3D -uint(on)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // When mask is all zeros, we just have y, othe=
rwise, y cancels with itself.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return y ^ (mask &amp; (y ^ x))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// ctEq returns 1 if x =3D=3D y, and 0 otherwise. The execution time=
 of this<br>
&gt; ++// function does not depend on its inputs.<br>
&gt; ++func ctEq(x, y uint) choice {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // If x !=3D y, then either x - y or y - x will=
 generate a carry.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _, c1 :=3D bits.Sub(x, y, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _, c2 :=3D bits.Sub(y, x, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return not(choice(c1 | c2))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// ctGeq returns 1 if x &gt;=3D y, and 0 otherwise. The execution ti=
me of this<br>
&gt; ++// function does not depend on its inputs.<br>
&gt; ++func ctGeq(x, y uint) choice {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // If x &lt; y, then x - y generates a carry.<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _, carry :=3D bits.Sub(x, y, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return not(choice(carry))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// nat represents an arbitrary natural number<br>
&gt; ++//<br>
&gt; ++// Each nat has an announced length, which is the number of limbs it=
 has stored.<br>
&gt; ++// Operations on this number are allowed to leak this length, but wi=
ll not leak<br>
&gt; ++// any information about the values contained in those limbs.<br>
&gt; ++type nat struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // limbs is a little-endian representation in b=
ase 2^W with<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // W =3D bits.UintSize - 1. The top bit is alwa=
ys unset between operations.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // The top bit is left unset to optimize Montgo=
mery multiplication, in the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // inner loop of exponentiation. Using fully sa=
turated limbs would leave us<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // working with 129-bit numbers on 64-bit platf=
orms, wasting a lot of space,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // and thus time.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 limbs []uint<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// expand expands x to n limbs, leaving its value unchanged.<br>
&gt; ++func (x *nat) expand(n int) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for len(x.limbs) &gt; n {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if x.limbs[len(x.li=
mbs)-1] !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 panic(&quot;rsa: internal error: shrinking nat&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.limbs =3D x.limbs=
[:len(x.limbs)-1]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if cap(x.limbs) &lt; n {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newLimbs :=3D make(=
[]uint, n)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy(newLimbs, x.li=
mbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.limbs =3D newLimb=
s<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 extraLimbs :=3D x.limbs[len(x.limbs):n]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D range extraLimbs {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extraLimbs[i] =3D 0=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.limbs =3D x.limbs[:n]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// reset returns a zero nat of n limbs, reusing x&#39;s storage if n=
 &lt;=3D cap(x.limbs).<br>
&gt; ++func (x *nat) reset(n int) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if cap(x.limbs) &lt; n {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.limbs =3D make([]=
uint, n)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D range x.limbs {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.limbs[i] =3D 0<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.limbs =3D x.limbs[:n]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// clone returns a new nat, with the same value and announced length=
 as x.<br>
&gt; ++func (x *nat) clone() *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D &amp;nat{make([]uint, len(x.limbs))}<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 copy(out.limbs, x.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// natFromBig creates a new natural number from a big.Int.<br>
&gt; ++//<br>
&gt; ++// The announced length of the resulting nat is based on the actual =
bit size of<br>
&gt; ++// the input, ignoring leading zeroes.<br>
&gt; ++func natFromBig(x *big.Int) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.Bits()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 bitSize :=3D bigBitLen(x)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 requiredLimbs :=3D (bitSize + _W - 1) / _W<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D &amp;nat{make([]uint, requiredLimbs)}<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 outI :=3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 shift :=3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D range xLimbs {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xi :=3D uint(xLimbs=
[i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.limbs[outI] |=
=3D (xi &lt;&lt; shift) &amp; _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outI++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if outI =3D=3D requ=
iredLimbs {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return out<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.limbs[outI] =3D=
 xi &gt;&gt; (_W - shift)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift++ // this ass=
umes bits.UintSize - _W =3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if shift =3D=3D _W =
{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shift =3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 outI++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// fillBytes sets bytes to x as a zero-extended big-endian byte slic=
e.<br>
&gt; ++//<br>
&gt; ++// If bytes is not long enough to contain the number or at least len=
(x.limbs)-1<br>
&gt; ++// limbs, or has zero length, fillBytes will panic.<br>
&gt; ++func (x *nat) fillBytes(bytes []byte) []byte {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if len(bytes) =3D=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;nat: fi=
llBytes invoked with too small buffer&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D range bytes {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[i] =3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 shift :=3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 outI :=3D len(bytes) - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i, limb :=3D range x.limbs {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remainingBits :=3D =
_W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for remainingBits &=
gt;=3D 8 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bytes[outI] |=3D byte(limb) &lt;&lt; shift<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 consumed :=3D 8 - shift<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 limb &gt;&gt;=3D consumed<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 remainingBits -=3D consumed<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shift =3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 outI--<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if outI &lt; 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if limb !=3D 0 || i &lt; len(x.limbs=
)-1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&q=
uot;nat: fillBytes invoked with too small buffer&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bytes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[outI] =3D byt=
e(limb)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift =3D remaining=
Bits<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return bytes<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// natFromBytes converts a slice of big-endian bytes into a nat.<br>
&gt; ++//<br>
&gt; ++// The announced length of the output depends on the length of bytes=
. Unlike<br>
&gt; ++// big.Int, creating a nat will not remove leading zeros.<br>
&gt; ++func natFromBytes(bytes []byte) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 bitSize :=3D len(bytes) * 8<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 requiredLimbs :=3D (bitSize + _W - 1) / _W<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D &amp;nat{make([]uint, requiredLimbs)}<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 outI :=3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 shift :=3D 0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D len(bytes) - 1; i &gt;=3D 0; i-- {<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bi :=3D bytes[i]<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.limbs[outI] |=
=3D uint(bi) &lt;&lt; shift<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift +=3D 8<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if shift &gt;=3D _W=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shift -=3D _W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 out.limbs[outI] &amp;=3D _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 outI++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if shift &gt; 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.limbs[outI] =3D uint(bi) &gt;&gt=
; (8 - shift)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// cmpEq returns 1 if x =3D=3D y, and 0 otherwise.<br>
&gt; ++//<br>
&gt; ++// Both operands must have the same announced length.<br>
&gt; ++func (x *nat) cmpEq(y *nat) choice {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(x.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 yLimbs :=3D y.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 equal :=3D yes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 equal &amp;=3D ctEq=
(xLimbs[i], yLimbs[i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return equal<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// cmpGeq returns 1 if x &gt;=3D y, and 0 otherwise.<br>
&gt; ++//<br>
&gt; ++// Both operands must have the same announced length.<br>
&gt; ++func (x *nat) cmpGeq(y *nat) choice {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(x.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 yLimbs :=3D y.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 var c uint<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D (xLimbs[i] - =
yLimbs[i] - c) &gt;&gt; _W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // If there was a carry, then subtracting y und=
erflowed, so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // x is not greater than or equal to y.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return not(choice(c))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// assign sets x &lt;- y if on =3D=3D 1, and does nothing otherwise.=
<br>
&gt; ++//<br>
&gt; ++// Both operands must have the same announced length.<br>
&gt; ++func (x *nat) assign(on choice, y *nat) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(x.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 yLimbs :=3D y.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xLimbs[i] =3D ctSel=
ect(on, yLimbs[i], xLimbs[i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// add computes x +=3D y if on =3D=3D 1, and does nothing otherwise.=
 It returns the<br>
&gt; ++// carry of the addition regardless of on.<br>
&gt; ++//<br>
&gt; ++// Both operands must have the same announced length.<br>
&gt; ++func (x *nat) add(on choice, y *nat) (c uint) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(x.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 yLimbs :=3D y.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res :=3D xLimbs[i] =
+ yLimbs[i] + c<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xLimbs[i] =3D ctSel=
ect(on, res&amp;_MASK, xLimbs[i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D res &gt;&gt; =
_W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// sub computes x -=3D y if on =3D=3D 1, and does nothing otherwise.=
 It returns the<br>
&gt; ++// borrow of the subtraction regardless of on.<br>
&gt; ++//<br>
&gt; ++// Both operands must have the same announced length.<br>
&gt; ++func (x *nat) sub(on choice, y *nat) (c uint) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(x.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 yLimbs :=3D y.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res :=3D xLimbs[i] =
- yLimbs[i] - c<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xLimbs[i] =3D ctSel=
ect(on, res&amp;_MASK, xLimbs[i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D res &gt;&gt; =
_W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// modulus is used for modular arithmetic, precomputing relevant con=
stants.<br>
&gt; ++//<br>
&gt; ++// Moduli are assumed to be odd numbers. Moduli can also leak the ex=
act<br>
&gt; ++// number of bits needed to store their value, and are stored withou=
t padding.<br>
&gt; ++//<br>
&gt; ++// Their actual value is still kept secret.<br>
&gt; ++type modulus struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // The underlying natural number for this modul=
us.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // This will be stored without any padding, and=
 shouldn&#39;t alias with any<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // other natural number being used.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 nat=C2=A0 =C2=A0 =C2=A0*nat<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 leading int=C2=A0 // number of leading zeros in=
 the modulus<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m0inv=C2=A0 =C2=A0uint // -nat.limbs[0]=E2=81=
=BB=C2=B9 mod _W<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// minusInverseModW computes -x=E2=81=BB=C2=B9 mod _W with x odd.<br=
>
&gt; ++//<br>
&gt; ++// This operation is used to precompute a constant involved in Montg=
omery<br>
&gt; ++// multiplication.<br>
&gt; ++func minusInverseModW(x uint) uint {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Every iteration of this loop doubles the lea=
st-significant bits of<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // correct inverse in y. The first three bits a=
re already correct (1=E2=81=BB=C2=B9 =3D 1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // 3=E2=81=BB=C2=B9 =3D 3, 5=E2=81=BB=C2=B9 =3D=
 5, and 7=E2=81=BB=C2=B9 =3D 7 mod 8), so doubling five times is enough<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // for 61 bits (and wastes only one iteration f=
or 31 bits).<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See <a href=3D"https://crypto.stackexchange.=
com/a/47496" rel=3D"noreferrer" target=3D"_blank">https://crypto.stackexcha=
nge.com/a/47496</a>.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D x<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; 5; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y =3D y * (2 - x*y)=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return (1 &lt;&lt; _W) - (y &amp; _MASK)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// modulusFromNat creates a new modulus from a nat.<br>
&gt; ++//<br>
&gt; ++// The nat should be odd, nonzero, and the number of significant bit=
s in the<br>
&gt; ++// number should be leakable. The nat shouldn&#39;t be reused.<br>
&gt; ++func modulusFromNat(nat *nat) *modulus {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D &amp;modulus{}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.nat =3D nat<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(m.nat.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for m.nat.limbs[size-1] =3D=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size--<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.nat.limbs =3D m.nat.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.leading =3D _W - bitLen(m.nat.limbs[size-1])<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.m0inv =3D minusInverseModW(m.nat.limbs[0])<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return m<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// bitLen is a version of bits.Len that only leaks the bit length of=
 n, but not<br>
&gt; ++// its value. bits.Len and bits.LeadingZeros use a lookup table for =
the<br>
&gt; ++// low-order bits on some architectures.<br>
&gt; ++func bitLen(n uint) int {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 var len int<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // We assume, here and elsewhere, that comparis=
on to zero is constant time<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // with respect to different non-zero values.<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for n !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n &gt;&gt;=3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return len<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// bigBitLen is a version of big.Int.BitLen that only leaks the bit =
length of x,<br>
&gt; ++// but not its value. big.Int.BitLen uses bits.Len.<br>
&gt; ++func bigBitLen(x *big.Int) int {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.Bits()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fullLimbs :=3D len(xLimbs) - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 topLimb :=3D uint(xLimbs[len(xLimbs)-1])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return fullLimbs*bits.UintSize + bitLen(topLimb=
)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// modulusSize returns the size of m in bytes.<br>
&gt; ++func modulusSize(m *modulus) int {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 bits :=3D len(m.nat.limbs)*_W - int(m.leading)<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return (bits + 7) / 8<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// shiftIn calculates x =3D x &lt;&lt; _W + y mod m.<br>
&gt; ++//<br>
&gt; ++// This assumes that x is already reduced mod m, and that y &lt; 2^_=
W.<br>
&gt; ++func (x *nat) shiftIn(y uint, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 d :=3D new(nat).resetFor(m)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(m.nat.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xLimbs :=3D x.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dLimbs :=3D d.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mLimbs :=3D m.nat.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Each iteration of this loop computes x =3D 2=
x + b mod m, where b is a bit<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // from y. Effectively, it left-shifts x and ad=
ds y one bit at a time,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // reducing it every time.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // To do the reduction, each iteration computes=
 both 2x + b and 2x + b - m.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // The next iteration (and finally the return l=
ine) will use either result<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // based on whether the subtraction underflowed=
.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 needSubtraction :=3D no<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D _W - 1; i &gt;=3D 0; i-- {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 carry :=3D (y &gt;&=
gt; i) &amp; 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var borrow uint<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt=
; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 l :=3D ctSelect(needSubtraction, dLimbs[i], xLimbs[i])<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 res :=3D l&lt;&lt;1 + carry<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xLimbs[i] =3D res &amp; _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 carry =3D res &gt;&gt; _W<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 res =3D xLimbs[i] - mLimbs[i] - borrow<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dLimbs[i] =3D res &amp; _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 borrow =3D res &gt;&gt; _W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // See modAdd for h=
ow carry (aka overflow), borrow (aka underflow), and<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // needSubtraction =
relate.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 needSubtraction =3D=
 ctEq(carry, borrow)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x.assign(needSubtraction, d)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// mod calculates out =3D x mod m.<br>
&gt; ++//<br>
&gt; ++// This works regardless how large the value of x is.<br>
&gt; ++//<br>
&gt; ++// The output will be resized to the size of m and overwritten.<br>
&gt; ++func (out *nat) mod(x *nat, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.resetFor(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Working our way from the most significant to=
 the least significant limb,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // we can insert each limb at the least signifi=
cant position, shifting all<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // previous limbs left by _W. This way each lim=
b will get shifted by the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // correct number of bits. We can insert at lea=
st N - 1 limbs without<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // overflowing m. After that, we need to reduce=
 every time we shift.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 i :=3D len(x.limbs) - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // For the first N - 1 limbs we can skip the ac=
tual shifting and position<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // them at the shifted position, which starts a=
t min(N - 2, i).<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 start :=3D len(m.nat.limbs) - 2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if i &lt; start {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D i<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for j :=3D start; j &gt;=3D 0; j-- {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.limbs[j] =3D x.=
limbs[i]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i--<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // We shift in the remaining limbs, reducing mo=
dulo m each time.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i &gt;=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.shiftIn(x.limbs=
[i], m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i--<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// expandFor ensures out has the right size to work with operations =
modulo m.<br>
&gt; ++//<br>
&gt; ++// This assumes that out has as many or fewer limbs than m, or that =
the extra<br>
&gt; ++// limbs are all zero (which may happen when decoding a value that h=
as leading<br>
&gt; ++// zeroes in its bytes representation that spill over the limb thres=
hold).<br>
&gt; ++func (out *nat) expandFor(m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out.expand(len(m.nat.limbs))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// resetFor ensures out has the right size to work with operations m=
odulo m.<br>
&gt; ++//<br>
&gt; ++// out is zeroed and may start at any size.<br>
&gt; ++func (out *nat) resetFor(m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out.reset(len(m.nat.limbs))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// modSub computes x =3D x - y mod m.<br>
&gt; ++//<br>
&gt; ++// The length of both operands must be the same as the modulus. Both=
 operands<br>
&gt; ++// must already be reduced modulo m.<br>
&gt; ++func (x *nat) modSub(y *nat, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 underflow :=3D x.sub(yes, y)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // If the subtraction underflowed, add m.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.add(choice(underflow), m.nat)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// modAdd computes x =3D x + y mod m.<br>
&gt; ++//<br>
&gt; ++// The length of both operands must be the same as the modulus. Both=
 operands<br>
&gt; ++// must already be reduced modulo m.<br>
&gt; ++func (x *nat) modAdd(y *nat, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 overflow :=3D x.add(yes, y)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 underflow :=3D not(x.cmpGeq(m.nat)) // x &lt; m=
<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Three cases are possible:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0- overflow =3D 0, underflow =3D =
0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // In this case, addition fits in our limbs, bu=
t we can still subtract away<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m without an underflow, so we need to perfor=
m the subtraction to reduce<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // our result.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0- overflow =3D 0, underflow =3D =
1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // The addition fits in our limbs, but we can&#=
39;t subtract m without<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // underflowing. The result is already reduced.=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0- overflow =3D 1, underflow =3D =
1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // The addition does not fit in our limbs, and =
the subtraction&#39;s borrow<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // would cancel out with the addition&#39;s car=
ry. We need to subtract m to<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // reduce our result.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // The overflow =3D 1, underflow =3D 0 case is =
not possible, because y is at<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // most m - 1, and if adding m - 1 overflows, t=
hen subtracting m must<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // necessarily underflow.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 needSubtraction :=3D ctEq(overflow, uint(underf=
low))<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.sub(needSubtraction, m.nat)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// montgomeryRepresentation calculates x =3D x * R mod m, with R =3D=
 2^(_W * n) and<br>
&gt; ++// n =3D len(m.nat.limbs).<br>
&gt; ++//<br>
&gt; ++// Faster Montgomery multiplication replaces standard modular multip=
lication for<br>
&gt; ++// numbers in this representation.<br>
&gt; ++//<br>
&gt; ++// This assumes that x is already reduced mod m.<br>
&gt; ++func (x *nat) montgomeryRepresentation(m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; len(m.nat.limbs); i++ {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.shiftIn(0, m) // =
x =3D x * 2^_W mod m<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// montgomeryMul calculates d =3D a * b / R mod m, with R =3D 2^(_W =
* n) and<br>
&gt; ++// n =3D len(m.nat.limbs), using the Montgomery Multiplication techn=
ique.<br>
&gt; ++//<br>
&gt; ++// All inputs should be the same length, not aliasing d, and already=
<br>
&gt; ++// reduced modulo m. d will be resized to the size of m and overwrit=
ten.<br>
&gt; ++func (d *nat) montgomeryMul(a *nat, b *nat, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See <a href=3D"https://bearssl.org/bigint.ht=
ml#montgomery-reduction-and-multiplication" rel=3D"noreferrer" target=3D"_b=
lank">https://bearssl.org/bigint.html#montgomery-reduction-and-multiplicati=
on</a><br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // for a description of the algorithm.<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Eliminate bounds checks in the loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 size :=3D len(m.nat.limbs)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aLimbs :=3D a.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 bLimbs :=3D b.limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dLimbs :=3D d.resetFor(m).limbs[:size]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mLimbs :=3D m.nat.limbs[:size]<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 var overflow uint<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f :=3D ((dLimbs[0] =
+ aLimbs[i]*bLimbs[0]) * m.m0inv) &amp; _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 carry :=3D uint(0)<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for j :=3D 0; j &lt=
; size; j++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // z =3D d[j] + a[i] * b[j] + f * m[j] + carry &lt;=3D 2^(2W+1) =
- 2^(W+1) + 2^W<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 hi, lo :=3D bits.Mul(aLimbs[i], bLimbs[j])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 z_lo, c :=3D bits.Add(dLimbs[j], lo, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 z_hi, _ :=3D bits.Add(0, hi, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 hi, lo =3D bits.Mul(f, mLimbs[j])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 z_lo, c =3D bits.Add(z_lo, lo, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 z_hi, _ =3D bits.Add(z_hi, hi, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 z_lo, c =3D bits.Add(z_lo, carry, 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 z_hi, _ =3D bits.Add(z_hi, 0, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if j &gt; 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dLimbs[j-1] =3D z_lo &amp; _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 carry =3D z_hi&lt;&lt;1 | z_lo&gt;&gt;_W // carry &lt;=3D 2^(W+1=
) - 2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 z :=3D overflow + c=
arry // z &lt;=3D 2^(W+1) - 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dLimbs[size-1] =3D =
z &amp; _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow =3D z &gt;=
&gt; _W // overflow &lt;=3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See modAdd for how overflow, underflow, and =
needSubtraction relate.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 underflow :=3D not(d.cmpGeq(m.nat)) // d &lt; m=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 needSubtraction :=3D ctEq(overflow, uint(underf=
low))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 d.sub(needSubtraction, m.nat)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return d<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// modMul calculates x *=3D y mod m.<br>
&gt; ++//<br>
&gt; ++// x and y must already be reduced modulo m, they must share its ann=
ounced<br>
&gt; ++// length, and they may not alias.<br>
&gt; ++func (x *nat) modMul(y *nat, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // A Montgomery multiplication by a value out o=
f the Montgomery domain<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // takes the result out of Montgomery represent=
ation.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xR :=3D x.clone().montgomeryRepresentation(m) /=
/ xR =3D x * R mod m<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return x.montgomeryMul(xR, y, m)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // x =3D xR * y / R mod m<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// exp calculates out =3D x^e mod m.<br>
&gt; ++//<br>
&gt; ++// The exponent e is represented in big-endian order. The output wil=
l be resized<br>
&gt; ++// to the size of m and overwritten. x must already be reduced modul=
o m.<br>
&gt; ++func (out *nat) exp(x *nat, e []byte, m *modulus) *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // We use a 4 bit window. For our RSA workload,=
 4 bit windows are faster<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // than 2 bit windows, but use an extra 12 nats=
 worth of scratch space.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Using bit sizes that don&#39;t divide 8 are =
more complex to implement.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 table :=3D make([]*nat, (1&lt;&lt;4)-1) // tabl=
e[i] =3D x ^ (i+1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 table[0] =3D x.clone().montgomeryRepresentation=
(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 1; i &lt; len(table); i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 table[i] =3D new(na=
t).expandFor(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 table[i].montgomery=
Mul(table[i-1], table[0], m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.resetFor(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.limbs[0] =3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.montgomeryRepresentation(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t0 :=3D new(nat).expandFor(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1 :=3D new(nat).expandFor(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, b :=3D range e {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, j :=3D range=
 []int{4, 0} {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Square four times.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t1.montgomeryMul(out, out, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 out.montgomeryMul(t1, t1, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t1.montgomeryMul(out, out, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 out.montgomeryMul(t1, t1, m)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Select x^k in constant time from the table.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 k :=3D uint((b &gt;&gt; j) &amp; 0b1111)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for i :=3D range table {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t0.assign(ctEq(k, uint(i+1)), table[=
i])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Multiply by x^k, discarding the result if k =3D 0.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t1.montgomeryMul(out, t0, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 out.assign(not(ctEq(k, 0)), t1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // By Montgomery multiplying with 1 not in Mont=
gomery representation, we<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // convert out back from Montgomery representat=
ion, because it works out to<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // dividing by R.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t0.assign(yes, out)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1.resetFor(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t1.limbs[0] =3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.montgomeryMul(t0, t1, m)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return out<br>
&gt; ++}<br>
&gt; +diff --git a/src/crypto/rsa/nat_test.go b/src/crypto/rsa/nat_test.go<=
br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..3e6eb10<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/src/crypto/rsa/nat_test.go<br>
&gt; +@@ -0,0 +1,384 @@<br>
&gt; ++// Copyright 2021 The Go Authors. All rights reserved.<br>
&gt; ++// Use of this source code is governed by a BSD-style<br>
&gt; ++// license that can be found in the LICENSE file.<br>
&gt; ++<br>
&gt; ++package rsa<br>
&gt; ++<br>
&gt; ++import (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;bytes&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;math/big&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;math/bits&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;math/rand&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;reflect&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;testing&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;testing/quick&quot;<br>
&gt; ++)<br>
&gt; ++<br>
&gt; ++// Generate generates an even nat. It&#39;s used by testing/quick to=
 produce random<br>
&gt; ++// *nat values for quick.Check invocations.<br>
&gt; ++func (*nat) Generate(r *rand.Rand, size int) reflect.Value {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 limbs :=3D make([]uint, size)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; size; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limbs[i] =3D uint(r=
.Uint64()) &amp; ((1 &lt;&lt; _W) - 2)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return reflect.ValueOf(&amp;nat{limbs})<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func testModAddCommutative(a *nat, b *nat) bool {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mLimbs :=3D make([]uint, len(a.limbs))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; len(mLimbs); i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mLimbs[i] =3D _MASK=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(&amp;nat{mLimbs})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aPlusB :=3D a.clone()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aPlusB.modAdd(b, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 bPlusA :=3D b.clone()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 bPlusA.modAdd(a, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return aPlusB.cmpEq(bPlusA) =3D=3D 1<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestModAddCommutative(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 err :=3D quick.Check(testModAddCommutative, &am=
p;quick.Config{})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Error(err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func testModSubThenAddIdentity(a *nat, b *nat) bool {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mLimbs :=3D make([]uint, len(a.limbs))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; len(mLimbs); i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mLimbs[i] =3D _MASK=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(&amp;nat{mLimbs})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 original :=3D a.clone()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 a.modSub(b, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 a.modAdd(b, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return a.cmpEq(original) =3D=3D 1<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestModSubThenAddIdentity(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 err :=3D quick.Check(testModSubThenAddIdentity,=
 &amp;quick.Config{})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Error(err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func testMontgomeryRoundtrip(a *nat) bool {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 one :=3D &amp;nat{make([]uint, len(a.limbs))}<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 one.limbs[0] =3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aPlusOne :=3D a.clone()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aPlusOne.add(1, one)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(aPlusOne)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 monty :=3D a.clone()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 monty.montgomeryRepresentation(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aAgain :=3D monty.clone()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 aAgain.montgomeryMul(monty, one, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return a.cmpEq(aAgain) =3D=3D 1<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestMontgomeryRoundtrip(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 err :=3D quick.Check(testMontgomeryRoundtrip, &=
amp;quick.Config{})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Error(err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestFromBig(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected :=3D []byte{0x01, 0xff, 0xff, 0xff, 0x=
ff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 theBig :=3D new(big.Int).SetBytes(expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 actual :=3D natFromBig(theBig).fillBytes(make([=
]byte, len(expected)))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(actual, expected) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+x =
!=3D %+x&quot;, actual, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestFillBytes(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 xBytes :=3D []byte{0xAA, 0xFF, 0x22, 0x33, 0x44=
, 0x55, 0x66, 0x77, 0x88}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D natFromBytes(xBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for l :=3D 20; l &gt;=3D len(xBytes); l-- {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf :=3D make([]byt=
e, l)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rand.Read(buf)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual :=3D x.fillB=
ytes(buf)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected :=3D make(=
[]byte, l)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy(expected[l-len=
(xBytes):], xBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(act=
ual, expected) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%d: %+v !=3D %+v&quot;, l, actual, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for l :=3D len(xBytes) - 1; l &gt;=3D 0; l-- {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (func() {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 defer func() {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if recover() =3D=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf=
(&quot;%d: expected panic&quot;, l)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 x.fillBytes(make([]byte, l))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestFromBytes(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 f :=3D func(xBytes []byte) bool {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(xBytes) =3D=
=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return true<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual :=3D natFrom=
Bytes(xBytes).fillBytes(make([]byte, len(xBytes)))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !bytes.Equal(act=
ual, xBytes) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%+x !=3D %+x&quot;, actual, xBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return false<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 err :=3D quick.Check(f, &amp;quick.Config{})<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Error(err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 f([]byte{0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x=
77, 0x88})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 f(bytes.Repeat([]byte{0xFF}, _W))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestShiftIn(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if bits.UintSize !=3D 64 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Skip(&quot;exampl=
es are only valid in 64 bit&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 examples :=3D []struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m, x, expected []by=
te<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }{{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{13},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{0},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x7FFF_FFFF_FFFF_FFFF,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected: []byte{7}=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }, {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{13},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{7},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x7FFF_FFFF_FFFF_FFFF,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected: []byte{11=
},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }, {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d},<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 make([]byte, 9),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x7FFF_FFFF_FFFF_FFFF,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected: []byte{0x=
00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }, {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d},<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected: []byte{0x=
03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }}<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i, tt :=3D range examples {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromN=
at(natFromBytes(tt.m))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got :=3D natFromByt=
es(tt.x).expandFor(m).shiftIn(uint(tt.y), m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if got.cmpEq(natFro=
mBytes(tt.expected).expandFor(m)) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%d: got %x, expected %x&quot;, i, got, tt.expecte=
d)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestModulusAndNatSizes(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // These are 126 bit (2 * _W on 64-bit architec=
tures) values, serialized as<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // 128 bits worth of bytes. If leading zeroes a=
re stripped, they fit in two<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // limbs, if they are not, they fit in three. T=
his can be a problem because<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // modulus strips leading zeroes and nat does n=
ot.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(natFromBytes([]byte{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3f, 0xff, 0xff, 0=
xff, 0xff, 0xff, 0xff, 0xff,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xff, 0xff, 0xff, 0=
xff, 0xff, 0xff, 0xff, 0xff}))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D natFromBytes([]byte{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3f, 0xff, 0xff, 0=
xff, 0xff, 0xff, 0xff, 0xff,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xff, 0xff, 0xff, 0=
xff, 0xff, 0xff, 0xff, 0xfe})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.expandFor(m) // must not panic for shrinking<=
br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestExpand(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sliced :=3D []uint{1, 2, 3, 4}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 examples :=3D []struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in=C2=A0 []uint<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n=C2=A0 =C2=A0int<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out []uint<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }{{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2, 0, 0},=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }, {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sliced[:2],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2, 0, 0},=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }, {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }, {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2, 0},<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint{1, 2},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }}<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i, tt :=3D range examples {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got :=3D (&amp;nat{=
<a href=3D"http://tt.in" rel=3D"noreferrer" target=3D"_blank">tt.in</a>}).e=
xpand(tt.n)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(got.limbs) !=
=3D len(tt.out) || got.cmpEq(&amp;nat{tt.out}) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%d: got %x, expected %x&quot;, i, got, tt.out)<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestMod(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(natFromBytes([]byte{0x06,=
 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d}))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D natFromBytes([]byte{0x40, 0x00, 0x00, 0x=
00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01}=
)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D new(nat)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.mod(x, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected :=3D natFromBytes([]byte{0x04, 0x00, 0=
x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if out.cmpEq(expected) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+v =
!=3D %+v&quot;, out, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestModSub(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(&amp;nat{[]uint{13}})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D &amp;nat{[]uint{6}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D &amp;nat{[]uint{7}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.modSub(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected :=3D &amp;nat{[]uint{12}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if x.cmpEq(expected) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+v =
!=3D %+v&quot;, x, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.modSub(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected =3D &amp;nat{[]uint{5}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if x.cmpEq(expected) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+v =
!=3D %+v&quot;, x, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestModAdd(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(&amp;nat{[]uint{13}})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D &amp;nat{[]uint{6}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D &amp;nat{[]uint{7}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.modAdd(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected :=3D &amp;nat{[]uint{0}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if x.cmpEq(expected) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+v =
!=3D %+v&quot;, x, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x.modAdd(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected =3D &amp;nat{[]uint{7}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if x.cmpEq(expected) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+v =
!=3D %+v&quot;, x, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func TestExp(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D modulusFromNat(&amp;nat{[]uint{13}})<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D &amp;nat{[]uint{3}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D &amp;nat{[]uint{0}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out.exp(x, []byte{12}, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 expected :=3D &amp;nat{[]uint{1}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if out.cmpEq(expected) !=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%+v =
!=3D %+v&quot;, out, expected)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func makeBenchmarkModulus() *modulus {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D make([]uint, 32)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; 32; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m[i] =3D _MASK<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return modulusFromNat(&amp;nat{limbs: m})<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func makeBenchmarkValue() *nat {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D make([]uint, 32)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; 32; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x[i] =3D _MASK - 1<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;nat{limbs: x}<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func makeBenchmarkExponent() []byte {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 e :=3D make([]byte, 256)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; 32; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e[i] =3D 0xFF<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return e<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkModAdd(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D makeBenchmarkModulus()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.modAdd(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkModSub(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D makeBenchmarkModulus()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.modSub(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkMontgomeryRepr(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D makeBenchmarkModulus()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.montgomeryReprese=
ntation(m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkMontgomeryMul(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D makeBenchmarkModulus()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.montgomeryMul(x=
, y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkModMul(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 y :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D makeBenchmarkModulus()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.modMul(y, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkExpBig(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D new(big.Int)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 exponentBytes :=3D makeBenchmarkExponent()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D new(big.Int).SetBytes(exponentBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 e :=3D new(big.Int).SetBytes(exponentBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 n :=3D new(big.Int).SetBytes(exponentBytes)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 one :=3D new(big.Int).SetUint64(1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 n.Add(n, one)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.Exp(x, e, n)<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func BenchmarkExp(b *testing.B) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 x :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 e :=3D makeBenchmarkExponent()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D makeBenchmarkValue()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D makeBenchmarkModulus()<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 b.ResetTimer()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i :=3D 0; i &lt; b.N; i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.exp(x, e, m)<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; +diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go<=
br>
&gt; +index a216be3..4312f34 100644<br>
&gt; +--- a/src/crypto/rsa/pkcs1v15.go<br>
&gt; ++++ b/src/crypto/rsa/pkcs1v15.go<br>
&gt; +@@ -9,7 +9,6 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/subtle&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &quot;math/big&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/internal/randutil&quot;<br>
&gt; + )<br>
&gt; +@@ -58,14 +57,11 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicK=
ey, msg []byte) ([]byte, error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0em[len(em)-len(msg)-1] =3D 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0copy(mm, msg)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m :=3D new(big.Int).SetBytes(em)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c :=3D encrypt(new(big.Int), pub, m)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(em), nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return encrypt(pub, em), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding sc=
heme from PKCS#1 v1.5.<br>
&gt; +-// If rand !=3D nil, it uses RSA blinding to avoid timing side-chann=
el attacks.<br>
&gt; ++// The rand parameter is legacy and ignored, and it can be as nil.<b=
r>
&gt; + //<br>
&gt; + // Note that whether this function returns an error or not discloses=
 secret<br>
&gt; + // information. If an attacker can cause this function to run repeat=
edly and<br>
&gt; +@@ -76,7 +72,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateK=
ey, ciphertext []byte) ([]byt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D checkPub(&amp;priv.PublicKey);=
 err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 valid, out, index, err :=3D decryptPKCS1v15(ran=
d, priv, ciphertext)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 valid, out, index, err :=3D decryptPKCS1v15(pri=
v, ciphertext)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -87,7 +83,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateK=
ey, ciphertext []byte) ([]byt<br>
&gt; + }<br>
&gt; +<br>
&gt; + // DecryptPKCS1v15SessionKey decrypts a session key using RSA and th=
e padding scheme from PKCS#1 v1.5.<br>
&gt; +-// If rand !=3D nil, it uses RSA blinding to avoid timing side-chann=
el attacks.<br>
&gt; ++// The rand parameter is legacy and ignored, and it can be as nil.<b=
r>
&gt; + // It returns an error if the ciphertext is the wrong length or if t=
he<br>
&gt; + // ciphertext is greater than the public modulus. Otherwise, no erro=
r is<br>
&gt; + // returned. If the padding is valid, the resulting plaintext messag=
e is copied<br>
&gt; +@@ -114,7 +110,7 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, pr=
iv *PrivateKey, ciphertext []by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrDecr=
yption<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 valid, em, index, err :=3D decryptPKCS1v15(rand=
, priv, ciphertext)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 valid, em, index, err :=3D decryptPKCS1v15(priv=
, ciphertext)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -130,26 +126,24 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, =
priv *PrivateKey, ciphertext []by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// decryptPKCS1v15 decrypts ciphertext using priv and blinds the ope=
ration if<br>
&gt; +-// rand is not nil. It returns one or zero in valid that indicates w=
hether the<br>
&gt; +-// plaintext was correctly structured. In either case, the plaintext=
 is<br>
&gt; +-// returned in em so that it may be read independently of whether it=
 was valid<br>
&gt; +-// in order to maintain constant memory access patterns. If the plai=
ntext was<br>
&gt; +-// valid then index contains the index of the original message in em=
.<br>
&gt; +-func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []=
byte) (valid int, em []byte, index int, err error) {<br>
&gt; ++// decryptPKCS1v15 decrypts ciphertext using priv. It returns one or=
 zero in<br>
&gt; ++// valid that indicates whether the plaintext was correctly structur=
ed.<br>
&gt; ++// In either case, the plaintext is returned in em so that it may be=
 read<br>
&gt; ++// independently of whether it was valid in order to maintain consta=
nt memory<br>
&gt; ++// access patterns. If the plaintext was valid then index contains t=
he index of<br>
&gt; ++// the original message in em, to allow constant time padding remova=
l.<br>
&gt; ++func decryptPKCS1v15(priv *PrivateKey, ciphertext []byte) (valid int=
, em []byte, index int, err error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0k :=3D priv.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if k &lt; 11 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D ErrDec=
ryption<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c :=3D new(big.Int).SetBytes(ciphertext)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m, err :=3D decrypt(rand, priv, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em, err =3D decrypt(priv, ciphertext)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em =3D m.FillBytes(make([]byte, k))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0firstByteIsZero :=3D subtle.ConstantTimeBy=
teEq(em[0], 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0secondByteIsTwo :=3D subtle.ConstantTimeBy=
teEq(em[1], 2)<br>
&gt; +<br>
&gt; +@@ -221,8 +215,7 @@ var hashPrefixes =3D map[crypto.Hash][]byte{<br>
&gt; + // function. If hash is zero, hashed is signed directly. This isn&#3=
9;t<br>
&gt; + // advisable except for interoperability.<br>
&gt; + //<br>
&gt; +-// If rand is not nil then RSA blinding will be used to avoid timing=
<br>
&gt; +-// side-channel attacks.<br>
&gt; ++// The rand parameter is legacy and ignored, and it can be as nil.<b=
r>
&gt; + //<br>
&gt; + // This function is deterministic. Thus, if the set of possible<br>
&gt; + // messages is small, an attacker may be able to build a map from<br=
>
&gt; +@@ -249,13 +242,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateK=
ey, hash crypto.Hash, hashed []b<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0copy(em[k-tLen:k-hashLen], prefix)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0copy(em[k-hashLen:k], hashed)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m :=3D new(big.Int).SetBytes(em)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c, err :=3D decryptAndCheck(rand, priv, m)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, err<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(em), nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return decryptAndCheck(priv, em)<br>
&gt; + }<br>
&gt; +<br>
&gt; + // VerifyPKCS1v15 verifies an RSA PKCS#1 v1.5 signature.<br>
&gt; +@@ -275,9 +262,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.H=
ash, hashed []byte, sig []byte)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c :=3D new(big.Int).SetBytes(sig)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m :=3D encrypt(new(big.Int), pub, c)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em :=3D m.FillBytes(make([]byte, k))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em :=3D encrypt(pub, sig)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// EM =3D 0x00 || 0x01 || PS || 0x00 || T<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ok :=3D subtle.ConstantTimeByteEq(em[0], 0=
)<br>
&gt; +diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go<br>
&gt; +index 814522d..eaba4be 100644<br>
&gt; +--- a/src/crypto/rsa/pss.go<br>
&gt; ++++ b/src/crypto/rsa/pss.go<br>
&gt; +@@ -12,7 +12,6 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hash&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &quot;math/big&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; + // Per RFC 8017, Section 9.1<br>
&gt; +@@ -207,19 +206,27 @@ func emsaPSSVerify(mHash, em []byte, emBits, sL=
en int, hash hash.Hash) error {<br>
&gt; + // Note that hashed must be the result of hashing the input message =
using the<br>
&gt; + // given hash function. salt is a random sequence of bytes whose len=
gth will be<br>
&gt; + // later used to verify the signature.<br>
&gt; +-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.H=
ash, hashed, salt []byte) ([]byte, error) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 emBits :=3D priv.N.BitLen() - 1<br>
&gt; ++func signPSSWithSalt(priv *PrivateKey, hash crypto.Hash, hashed, sal=
t []byte) ([]byte, error) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emBits :=3D bigBitLen(priv.N) - 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0em, err :=3D emsaPSSEncode(hashed, emBits,=
 salt, hash.New())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m :=3D new(big.Int).SetBytes(em)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c, err :=3D decryptAndCheck(rand, priv, m)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, err<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // RFC 8017: &quot;Note that the octet length o=
f EM will be one less than k if<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // modBits - 1 is divisible by 8 and equal to k=
 otherwise, where k is the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // length in octets of the RSA modulus n.&quot;=
 =F0=9F=99=84<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // This is extremely annoying, as all other enc=
rypt and decrypt inputs are<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // always the exact same size as the modulus. S=
ince it only happens for<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // weird modulus sizes, fix it by padding ineff=
iciently.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if emLen, k :=3D len(em), priv.Size(); emLen &l=
t; k {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emNew :=3D make([]b=
yte, k)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy(emNew[k-emLen:=
], em)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 em =3D emNew<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 s :=3D make([]byte, priv.Size())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(s), nil<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return decryptAndCheck(priv, em)<br>
&gt; + }<br>
&gt; +<br>
&gt; + const (<br>
&gt; +@@ -269,7 +276,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, ha=
sh crypto.Hash, digest []byte,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0saltLength :=3D opts.saltLength()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch saltLength {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSSSaltLengthAuto:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLength =3D (pri=
v.N.BitLen()-1+7)/8 - 2 - hash.Size()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 saltLength =3D (big=
BitLen(priv.N)-1+7)/8 - 2 - hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSSSaltLengthEqualsHash:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saltLength =3D=
 hash.Size()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -278,7 +285,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, ha=
sh crypto.Hash, digest []byte,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if _, err :=3D io.ReadFull(rand, salt); er=
r !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return signPSSWithSalt(rand, priv, hash, digest=
, salt)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return signPSSWithSalt(priv, hash, digest, salt=
)<br>
&gt; + }<br>
&gt; +<br>
&gt; + // VerifyPSS verifies a PSS signature.<br>
&gt; +@@ -291,13 +298,22 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash=
, digest []byte, sig []byte, opts<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(sig) !=3D pub.Size() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ErrVeri=
fication<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 s :=3D new(big.Int).SetBytes(sig)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m :=3D encrypt(new(big.Int), pub, s)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 emBits :=3D pub.N.BitLen() - 1<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emBits :=3D bigBitLen(pub.N) - 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0emLen :=3D (emBits + 7) / 8<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if m.BitLen() &gt; emLen*8 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ErrVerificat=
ion<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em :=3D encrypt(pub, sig)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Like in signPSSWithSalt, deal with mismatche=
s between emLen and the size<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // of the modulus. The spec would have us wire =
emLen into the encoding<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // function, but we&#39;d rather always encode =
to the size of the modulus and<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // then strip leading zeroes if necessary. This=
 only happens for weird<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // modulus sizes anyway.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for len(em) &gt; emLen &amp;&amp; len(em) &gt; =
0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if em[0] !=3D 0 {<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ErrVerification<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 em =3D em[1:]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em :=3D m.FillBytes(make([]byte, emLen))<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return emsaPSSVerify(digest, em, emBits, o=
pts.saltLength(), hash.New())<br>
&gt; + }<br>
&gt; +diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go<=
br>
&gt; +index c3a6d46..d018b43 100644<br>
&gt; +--- a/src/crypto/rsa/pss_test.go<br>
&gt; ++++ b/src/crypto/rsa/pss_test.go<br>
&gt; +@@ -233,7 +233,10 @@ func TestPSSSigning(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +-func TestSignWithPSSSaltLengthAuto(t *testing.T) {<br>
&gt; ++func TestPSS513(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See Issue 42741, and separately, RFC 8017: &=
quot;Note that the octet length of<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // EM will be one less than k if modBits - 1 is=
 divisible by 8 and equal to<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // k otherwise, where k is the length in octets=
 of the RSA modulus n.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0key, err :=3D GenerateKey(rand.Reader, 513=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatal(err)<b=
r>
&gt; +@@ -246,8 +249,9 @@ func TestSignWithPSSSaltLengthAuto(t *testing.T) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatal(err)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if len(signature) =3D=3D 0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatal(&quot;empty=
 signature returned&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 err =3D VerifyPSS(&amp;key.PublicKey, crypto.SH=
A256, digest[:], signature, nil)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Error(err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go<br>
&gt; +index 5a00ed2..29d9d31 100644<br>
&gt; +--- a/src/crypto/rsa/rsa.go<br>
&gt; ++++ b/src/crypto/rsa/rsa.go<br>
&gt; +@@ -19,13 +19,17 @@<br>
&gt; + // over the public key primitive, the PrivateKey type implements the=
<br>
&gt; + // Decrypter and Signer interfaces from the crypto package.<br>
&gt; + //<br>
&gt; +-// The RSA operations in this package are not implemented using cons=
tant-time algorithms.<br>
&gt; ++// Operations in this package are implemented using constant-time al=
gorithms,<br>
&gt; ++// except for [GenerateKey], [PrivateKey.Precompute], and [PrivateKe=
y.Validate].<br>
&gt; ++// Every other operation only leaks the bit size of the involved val=
ues, which<br>
&gt; ++// all depend on the selected key size.<br>
&gt; + package rsa<br>
&gt; +<br>
&gt; + import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/rand&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/subtle&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;encoding/binary&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hash&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; +@@ -35,7 +39,6 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;crypto/internal/randutil&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; +-var bigZero =3D big.NewInt(0)<br>
&gt; + var bigOne =3D big.NewInt(1)<br>
&gt; +<br>
&gt; + // A PublicKey represents the public part of an RSA key.<br>
&gt; +@@ -47,7 +50,7 @@ type PublicKey struct {<br>
&gt; + // Size returns the modulus size in bytes. Raw signatures and cipher=
texts<br>
&gt; + // for or by this public key will have the same size.<br>
&gt; + func (pub *PublicKey) Size() int {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return (pub.N.BitLen() + 7) / 8<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return (bigBitLen(pub.N) + 7) / 8<br>
&gt; + }<br>
&gt; +<br>
&gt; + // OAEPOptions is an interface for passing options to OAEP decryptio=
n using the<br>
&gt; +@@ -351,10 +354,19 @@ func mgf1XOR(out []byte, hash hash.Hash, seed [=
]byte) {<br>
&gt; + // too large for the size of the public key.<br>
&gt; + var ErrMessageTooLong =3D errors.New(&quot;crypto/rsa: message too l=
ong for RSA public key size&quot;)<br>
&gt; +<br>
&gt; +-func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 e :=3D big.NewInt(int64(pub.E))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c.Exp(m, e, pub.N)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return c<br>
&gt; ++func encrypt(pub *PublicKey, plaintext []byte) []byte {<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 N :=3D modulusFromNat(natFromBig(pub.N))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D natFromBytes(plaintext).expandFor(N)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 e :=3D make([]byte, 8)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 binary.BigEndian.PutUint64(e, uint64(pub.E))<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for len(e) &gt; 1 &amp;&amp; e[0] =3D=3D 0 {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D e[1:]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D make([]byte, modulusSize(N))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return new(nat).exp(m, e, N).fillBytes(out)<br>
&gt; + }<br>
&gt; +<br>
&gt; + // EncryptOAEP encrypts the given message with RSA-OAEP.<br>
&gt; +@@ -404,12 +416,7 @@ func EncryptOAEP(hash hash.Hash, random io.Reade=
r, pub *PublicKey, msg []byte, l<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mgf1XOR(db, hash, seed)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mgf1XOR(seed, hash, db)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m :=3D new(big.Int)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m.SetBytes(em)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c :=3D encrypt(new(big.Int), pub, m)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 out :=3D make([]byte, k)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return c.FillBytes(out), nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return encrypt(pub, em), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; + // ErrDecryption represents a failure to decrypt a message.<br>
&gt; +@@ -451,98 +458,71 @@ func (priv *PrivateKey) Precompute() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// decrypt performs an RSA decryption, resulting in a plaintext inte=
ger. If a<br>
&gt; +-// random source is given, RSA blinding is used.<br>
&gt; +-func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big=
.Int, err error) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // TODO(agl): can we get away with reusing blin=
ds?<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if c.Cmp(priv.N) &gt; 0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D ErrDecrypti=
on<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++// decrypt performs an RSA decryption of ciphertext into out.<br>
&gt; ++func decrypt(priv *PrivateKey, ciphertext []byte) ([]byte, error) {<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 N :=3D modulusFromNat(natFromBig(priv.N))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 c :=3D natFromBytes(ciphertext).expandFor(N)<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if c.cmpGeq(N.nat) =3D=3D 1 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, ErrDecr=
yption<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if priv.N.Sign() =3D=3D 0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, Er=
rDecryption<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 var ir *big.Int<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if random !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 randutil.MaybeReadB=
yte(random)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Blinding enabled=
. Blinding involves multiplying c by r^e.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Then the decrypt=
ion operation performs (m^e * r^e)^d mod n<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // which equals mr =
mod n. The factor of r can then be removed<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // by multiplying b=
y the multiplicative inverse of r.<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var r *big.Int<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ir =3D new(big.Int)=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r, err =3D rand.Int(random, priv.N)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if r.Cmp(bigZero) =3D=3D 0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D bigOne<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ok :=3D ir.ModInverse(r, priv.N)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ok !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bigE :=3D big.NewIn=
t(int64(priv.E))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpowe :=3D new(big.=
Int).Exp(r, bigE, priv.N) // N !=3D 0<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cCopy :=3D new(big.=
Int).Set(c)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cCopy.Mul(cCopy, rp=
owe)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cCopy.Mod(cCopy, pr=
iv.N)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D cCopy<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Note that because our private decryption exp=
onents are stored as big.Int,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // we potentially leak the exact number of bits=
 of these exponents. This<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // isn&#39;t great, but should be fine.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if priv.Precomputed.Dp =3D=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D new(big.Int).=
Exp(c, priv.D, priv.N)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // We have the prec=
alculated values needed for the CRT.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D new(big.Int).=
Exp(c, priv.Precomputed.Dp, priv.Primes[0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2 :=3D new(big.Int=
).Exp(c, priv.Precomputed.Dq, priv.Primes[1])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Sub(m, m2)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m.Sign() &lt; 0 =
{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m.Add(m, priv.Primes[0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Mul(m, priv.Preco=
mputed.Qinv)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Mod(m, priv.Prime=
s[0])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Mul(m, priv.Prime=
s[1])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Add(m, m2)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i, values :=3D =
range priv.Precomputed.CRTValues {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 prime :=3D priv.Primes[2+i]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m2.Exp(c, values.Exp, prime)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m2.Sub(m2, m)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m2.Mul(m2, values.Coeff)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m2.Mod(m2, prime)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if m2.Sign() &lt; 0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.Add(m2, prime)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m2.Mul(m2, values.R)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m.Add(m, m2)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if ir !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Unblind.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Mul(m, ir)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.Mod(m, priv.N)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out :=3D make([]byt=
e, modulusSize(N))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return new(nat).exp=
(c, priv.D.Bytes(), N).fillBytes(out), nil<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t0 :=3D new(nat)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 P :=3D modulusFromNat(natFromBig(priv.Primes[0]=
))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Q :=3D modulusFromNat(natFromBig(priv.Primes[1]=
))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m =3D c ^ Dp mod p<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m :=3D new(nat).exp(t0.mod(c, P), priv.Precompu=
ted.Dp.Bytes(), P)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m2 =3D c ^ Dq mod q<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m2 :=3D new(nat).exp(t0.mod(c, Q), priv.Precomp=
uted.Dq.Bytes(), Q)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m =3D m - m2 mod p<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.modSub(t0.mod(m2, P), P)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m =3D m * Qinv mod p<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.modMul(natFromBig(priv.Precomputed.Qinv).expa=
ndFor(P), P)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m =3D m * q mod N<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.expandFor(N).modMul(t0.mod(Q.nat, N), N)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // m =3D m + m2 mod N<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m.modAdd(m2.expandFor(N), N)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for i, values :=3D range priv.Precomputed.CRTVa=
lues {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p :=3D modulusFromN=
at(natFromBig(priv.Primes[2+i]))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // m2 =3D c ^ Exp m=
od p<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.exp(t0.mod(c, p)=
, values.Exp.Bytes(), p)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // m2 =3D m2 - m mo=
d p<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.modSub(t0.mod(m,=
 p), p)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // m2 =3D m2 * Coef=
f mod p<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.modMul(natFromBi=
g(values.Coeff).expandFor(p), p)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // m2 =3D m2 * R mo=
d N<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R :=3D natFromBig(v=
alues.R).expandFor(N)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.expandFor(N).mod=
Mul(R, N)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // m =3D m + m2 mod=
 N<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m.modAdd(m2, N)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out :=3D make([]byte, modulusSize(N))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return m.fillBytes(out), nil<br>
&gt; + }<br>
&gt; +<br>
&gt; +-func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int)=
 (m *big.Int, err error) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m, err =3D decrypt(random, priv, c)<br>
&gt; ++func decryptAndCheck(priv *PrivateKey, ciphertext []byte) (m []byte,=
 err error) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 m, err =3D decrypt(priv, ciphertext)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// In order to defend against errors in th=
e CRT computation, m^e is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// calculated, which should match the orig=
inal ciphertext.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 check :=3D encrypt(new(big.Int), &amp;priv.Publ=
icKey, m)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if c.Cmp(check) !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 check :=3D encrypt(&amp;priv.PublicKey, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if subtle.ConstantTimeCompare(ciphertext, check=
) !=3D 1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
rors.New(&quot;rsa: internal error&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return m, nil<br>
&gt; +@@ -554,9 +534,7 @@ func decryptAndCheck(random io.Reader, priv *Priv=
ateKey, c *big.Int) (m *big.Int<br>
&gt; + // Encryption and decryption of a given message must use the same ha=
sh function<br>
&gt; + // and sha256.New() is a reasonable choice.<br>
&gt; + //<br>
&gt; +-// The random parameter, if not nil, is used to blind the private-ke=
y operation<br>
&gt; +-// and avoid timing side-channel attacks. Blinding is purely interna=
l to this<br>
&gt; +-// function =E2=80=93 the random data need not match that used when =
encrypting.<br>
&gt; ++// The random parameter is legacy and ignored, and it can be as nil.=
<br>
&gt; + //<br>
&gt; + // The label parameter must match the value given when encrypting. S=
ee<br>
&gt; + // EncryptOAEP for details.<br>
&gt; +@@ -570,9 +548,7 @@ func DecryptOAEP(hash hash.Hash, random io.Reader=
, priv *PrivateKey, ciphertext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, Er=
rDecryption<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 c :=3D new(big.Int).SetBytes(ciphertext)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 m, err :=3D decrypt(random, priv, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 em, err :=3D decrypt(priv, ciphertext)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, er=
r<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -581,10 +557,6 @@ func DecryptOAEP(hash hash.Hash, random io.Reade=
r, priv *PrivateKey, ciphertext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lHash :=3D hash.Sum(nil)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hash.Reset()<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // We probably leak the number of leading zeros=
.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // It&#39;s not clear that we can do anything a=
bout this.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 em :=3D m.FillBytes(make([]byte, k))<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0firstByteIsZero :=3D subtle.ConstantTimeBy=
teEq(em[0], 0)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0seed :=3D em[1 : hash.Size()+1]<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#193344): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/193344" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/193344</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10353912=
4/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103539124/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000028fed9060e335375--

