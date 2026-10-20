Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4737.1792538581201252840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=AHB89UUf;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so82730f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538579; x=1793143379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oOfJDU/L67aE8812wEIY5aynw6bwn58L9cGnM5UNG7Y=;
        b=AHB89UUfIVuJZxnH/TCKWVmNO0EjJJ5RNIt8/+pKMArkURrW/zvCm5vvQKTrre7bPD
         U3V46KetFX8R/8jyhwFW4yDZoN986YlPuWVzyloRrr1YButdZWg9V9PUqP8QsHDn1B3d
         RAz5yNr5NIO5TNMl/QCRW9Sm6lky1QdRq1kg4ca82jwNZxl/YIWA0UwIS05WbVBrORRX
         3dR+RcgfwtP9fHq8aJO8KGo85G0zmKzMcOKyc1Dp/OUR50F1XJtXGYRzEArqL2okC3lh
         riyjicA+vFF9SZNd7gHMkF5CJmF+Kw3H9kLnmlv16LQ4F+FECGoWJgCMyvVKgclBdJlR
         np4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538579; x=1793143379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oOfJDU/L67aE8812wEIY5aynw6bwn58L9cGnM5UNG7Y=;
        b=Nyb8SRmoM9P+GU63Y/gHIl8ArBaqtd2KLTG/hgLXtyzVKVWOl6mYLyb4BtmhY8FjQM
         wdAXmMp4vvD6fWzwUE3yFgQVkk/OPlBV2L6VTMp8dpFiVlGQxU2313ehHOwNlW1crtiK
         IUVXiXUtapDfBJciBbv7hYq4hSjb2mG1md5L1cDxAcuO1b++1faulYwHGWpUUdUwsOw9
         B4CfWSBFEYO8pqnYNo1/3+u7qTOO/5HIXkzk/Dk4vOCX7EhaEnvGZ8sSIW8pCS+ZJM7T
         qNsfPWmQ//FcOg9KUV2Vbl2tzbQeExLWE5TWBcIWz1/bTEp+0nvZTmrSyslczyjVDItV
         hggw==
X-Gm-Message-State: AFq9FYJT+MUdRQvYSIsYGanGONwbRH3Hf5oQX3m/v17ZQnVCE+dSA6/H
	O+zOyFdQ7oCNPP9vFJ9O5B+4kDbezijLwkhQhlvH41I4RQKQ+vNt8v5mHQMUUy8+UqD3SgJUBgQ
	nUvuTvfg=
X-Gm-Gg: AYBFou0QOh2hrGAr7ysh0wTRGtvGLB2uwFhLXrcQbqo/9YYUxTzYu04PeIKNziXXlxm
	uZ9tCGXL0HZYeXvPcvmFh4vhPuF7nKbcgtkPdo6KvQjofHVoR1bzor6sZBpU8sY6yJOXRkIu3vw
	3d2ac6woKfoaMVTz8cQ8nHnku+dXs7ONsVmzyKFdvpipAj5WdBWXM+EI6jdIxBKmViZqV5S04Id
	DoxRVBNXG1xyyhAfvzuTNyTsIu3RPodZ1iqKc6SXbsKM7VKrWnVxp93d53HGFFqtb0JPS0LGoZo
	UvUy1iwy67nSLfz1xzQpRf0sK3y2Yi5WUOuV0544VWeIibAlAYLf2rQDPshwQ5+yI+QU/o71XeT
	D9ht4mRGwPOQ7OJB0iQzJxG1HdTA6oR8tVAyaFyfp68wYf9KBs6q9gH4lFoh0iMC6NxE9XxhDYg
	h/C18n/cqZTFW9hzQj9bfjj/l34q4UxnDtpQ4+pzfW8LWO6JVdLYKuA0CDqjjdK6ecbKNGku6QP
	dqlBjYbzO4o3M9owDjOY/f9qjhY6xsBzR2a5sAZvPTquhXfmmzbb7r/394A2tiqW6QzPmeejg==
X-Received: by 2002:a05:6000:25c6:b0:48d:f1b3:7e67 with SMTP id ffacd0b85a97d-48e1e7cc1ffmr8285686f8f.18.1792538579045;
        Tue, 20 Oct 2026 16:22:59 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/25] python3-cryptography: fix CVE-2026-69247
Date: Wed, 21 Oct 2026 01:22:23 +0200
Message-ID: <f95c20f42050fd0659c83bea9f870d14bedb0827.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248332
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

A direct backport is used because the fixed 50.0.0
release also contains backward-incompatible API changes
and new features, which are unsuitable for a stable
Wrynose update.

[1] https://github.com/pyca/cryptography/commit/53fccd93413a8d7f07d6d8999681f27b75cffa3f
[2] https://github.com/pyca/cryptography/security/advisories/GHSA-g6cj-pr64-35w5

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-cryptography.bb            |   1 +
 .../python3-cryptography/CVE-2026-69247.patch | 435 ++++++++++++++++++
 2 files changed, 436 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index f3cb755ed5b..a94b79ed4ce 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://CVE-2026-69249.patch \
             file://check-memfree.py \
             file://run-ptest \
+            file://CVE-2026-69247.patch \
            "
 
 require ${BPN}-crates.inc
diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch
new file mode 100644
index 00000000000..85b47faac5c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69247.patch
@@ -0,0 +1,435 @@
+From 53fccd93413a8d7f07d6d8999681f27b75cffa3f Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Fri, 31 Jul 2026 09:24:53 -0400
+Subject: [PATCH] Don't leak how PKCS#7 encryptedKey decryption failed (#15369)
+
+* Don't leak how PKCS#7 encryptedKey decryption failed
+
+pkcs7_decrypt_der and its PEM and S/MIME variants reported invalid RSA
+PKCS#1 v1.5 padding, a recovered key of the wrong length, and a wrong
+key as three distinct errors, and the middle one disclosed the exact
+recovered length. That is a Bleichenbacher oracle for any caller that
+decrypts untrusted messages. The wrong-length case also returned before
+the AES-CBC pass, so the same distinction was observable by timing,
+proportional to a content size the attacker chooses.
+
+Substitute a random key of the expected length on failure, per RFC 3218,
+and continue down an identical path so that every outcome looks alike.
+
+EnvelopedData still authenticates nothing, so revealing whether
+decryption succeeded remains a CBC padding oracle regardless. That is a
+property of PKCS#7 rather than of this implementation, and is now
+documented instead.
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+
+* Cover the non-ValueError path out of encryptedKey decryption
+
+Only a ValueError from unwrapping the key is attacker controlled and so
+deliberately silenced. A private key implemented outside of this library
+can fail in other ways, and those still reach the caller -- but nothing
+exercised that arm, leaving it uncovered.
+
+Add a DummyRSAPrivateKey double whose decrypt() raises a TypeError, and
+tests for each of its methods.
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+
+* fix?
+
+* error message
+
+---------
+
+Co-authored-by: Claude Opus 5 <noreply@anthropic.com>
+
+CVE: CVE-2026-69247
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/53fccd93413a8d7f07d6d8999681f27b75cffa3f]
+
+Backport Changes:
+- Dropped the CHANGELOG.rst update because it targets the 50.0.0 release.
+- Adapted DummyRSAPrivateKey to the 46.0.7 RSA abstract API, which lacks
+  NoDigestInfo and __deepcopy__.
+- Added only the RSA tests from tests/test_doubles.py because the older
+  source does not contain the unrelated Ed25519 test double.
+
+(cherry picked from commit 53fccd93413a8d7f07d6d8999681f27b75cffa3f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../primitives/asymmetric/serialization.rst   | 21 +++++
+ docs/spelling_wordlist.txt                    |  1 +
+ src/rust/src/pkcs7.rs                         | 81 +++++++++++--------
+ tests/doubles.py                              | 46 ++++++++++-
+ tests/hazmat/primitives/test_pkcs7.py         | 62 ++++++++++++++
+ tests/test_doubles.py                         | 53 ++++++++++++
+ 6 files changed, 229 insertions(+), 35 deletions(-)
+ create mode 100644 tests/test_doubles.py
+
+diff --git a/docs/hazmat/primitives/asymmetric/serialization.rst b/docs/hazmat/primitives/asymmetric/serialization.rst
+index fb49c7d14..8364131da 100644
+--- a/docs/hazmat/primitives/asymmetric/serialization.rst
++++ b/docs/hazmat/primitives/asymmetric/serialization.rst
+@@ -1436,6 +1436,15 @@ contain certificates, CRLs, and much more. PKCS7 files commonly have a ``p7b``,
+     Deserialize and decrypt a DER-encoded PKCS7 message. PKCS7 (or S/MIME) has multiple versions,
+     but this supports a subset of :rfc:`5751`, also known as S/MIME Version 3.2.
+ 
++    .. warning::
++
++        ``EnvelopedData`` does not authenticate its content. An application
++        that decrypts attacker-supplied messages and reveals whether
++        decryption succeeded -- through an error, a status code, or timing --
++        gives the attacker a CBC padding oracle sufficient to recover the
++        plaintext. This is a property of PKCS#7 and cannot be fixed here,
++        so avoid decrypting untrusted ``EnvelopedData``.
++
+     :param data: The data, encoded in DER format.
+     :type data: bytes
+ 
+@@ -1491,6 +1500,12 @@ contain certificates, CRLs, and much more. PKCS7 files commonly have a ``p7b``,
+     Deserialize and decrypt a PEM-encoded PKCS7E message. PKCS7 (or S/MIME) has multiple versions,
+     but this supports a subset of :rfc:`5751`, also known as S/MIME Version 3.2.
+ 
++    .. warning::
++
++        The padding oracle described in
++        :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`
++        applies equally here.
++
+     :param data: The data, encoded in PEM format.
+     :type data: bytes
+ 
+@@ -1548,6 +1563,12 @@ contain certificates, CRLs, and much more. PKCS7 files commonly have a ``p7b``,
+     Deserialize and decrypt a S/MIME-encoded PKCS7 message. PKCS7 (or S/MIME) has multiple versions,
+     but this supports a subset of :rfc:`5751`, also known as S/MIME Version 3.2.
+ 
++    .. warning::
++
++        The padding oracle described in
++        :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`
++        applies equally here.
++
+     :param data: The data. It should be in S/MIME format, meaning MIME with content type
+         ``application/pkcs7-mime`` or ``application/x-pkcs7-mime``.
+     :type data: bytes
+diff --git a/docs/spelling_wordlist.txt b/docs/spelling_wordlist.txt
+index 831369fe9..956325782 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -151,6 +151,7 @@ Ubuntu
+ unencrypted
+ unicode
+ unpadded
++untrusted
+ unpadding
+ validator
+ Ventura
+diff --git a/src/rust/src/pkcs7.rs b/src/rust/src/pkcs7.rs
+index 3fb5abf15..dd64c3aff 100644
+--- a/src/rust/src/pkcs7.rs
++++ b/src/rust/src/pkcs7.rs
+@@ -266,27 +266,6 @@ fn decrypt_der<'p>(
+                 }
+             };
+ 
+-            // Raise error when the key encryption algorithm is not RSA
+-            let key = match recipient_info.key_encryption_algorithm.oid() {
+-                &oid::RSA_OID => {
+-                    let padding = types::PKCS1V15.get(py)?.call0()?;
+-                    private_key
+-                        .call_method1(
+-                            pyo3::intern!(py, "decrypt"),
+-                            (recipient_info.encrypted_key, &padding),
+-                        )?
+-                        .extract::<pyo3::pybacked::PyBackedBytes>()?
+-                }
+-                _ => {
+-                    return Err(CryptographyError::from(
+-                        exceptions::UnsupportedAlgorithm::new_err((
+-                            "Only RSA with PKCS #1 v1.5 padding is currently supported for key decryption.",
+-                            exceptions::Reasons::UNSUPPORTED_SERIALIZATION,
+-                        )),
+-                    ));
+-                }
+-            };
+-
+             // The function can decrypt content encrypted with AES-128-CBC, which the S/MIME v3.2
+             // RFC specifies as MUST support, and AES-256-CBC, which is specified as SHOULD+
+             // support. More info: https://datatracker.ietf.org/doc/html/rfc5751#section-2.7
+@@ -294,19 +273,9 @@ fn decrypt_der<'p>(
+             let algorithm_identifier = enveloped_data
+                 .encrypted_content_info
+                 .content_encryption_algorithm;
+-            let (algorithm, mode) = match algorithm_identifier.params {
+-                AlgorithmParameters::Aes128Cbc(iv) => (
+-                    types::AES128.get(py)?.call1((key,))?,
+-                    types::CBC
+-                        .get(py)?
+-                        .call1((pyo3::types::PyBytes::new(py, &iv),))?,
+-                ),
+-                AlgorithmParameters::Aes256Cbc(iv) => (
+-                    types::AES256.get(py)?.call1((key,))?,
+-                    types::CBC
+-                        .get(py)?
+-                        .call1((pyo3::types::PyBytes::new(py, &iv),))?,
+-                ),
++            let (algorithm_type, key_size, iv) = match algorithm_identifier.params {
++                AlgorithmParameters::Aes128Cbc(iv) => (&types::AES128, 16, iv),
++                AlgorithmParameters::Aes256Cbc(iv) => (&types::AES256, 32, iv),
+                 _ => {
+                     return Err(CryptographyError::from(
+                         exceptions::UnsupportedAlgorithm::new_err((
+@@ -317,6 +286,50 @@ fn decrypt_der<'p>(
+                 }
+             };
+ 
++            // Raise error when the key encryption algorithm is not RSA
++            if recipient_info.key_encryption_algorithm.oid() != &oid::RSA_OID {
++                return Err(CryptographyError::from(
++                    exceptions::UnsupportedAlgorithm::new_err((
++                        "Only RSA with PKCS #1 v1.5 padding is currently supported for key decryption.",
++                        exceptions::Reasons::UNSUPPORTED_SERIALIZATION,
++                    )),
++                ));
++            }
++
++            // Unwrap the content encryption key. RFC 3218 requires that a
++            // failure to recover a usable key is not distinguishable from
++            // recovering a key that simply isn't the right one -- otherwise
++            // this becomes a Bleichenbacher oracle for anything that decrypts
++            // attacker-supplied data. We substitute a random key of the
++            // expected size, so that every failure surfaces as the same
++            // content decryption error.
++            let padding = types::PKCS1V15.get(py)?.call0()?;
++            let random_key = crate::backend::rand::get_rand_bytes(py, key_size)?;
++            let key = match private_key.call_method1(
++                pyo3::intern!(py, "decrypt"),
++                (recipient_info.encrypted_key, &padding),
++            ) {
++                Ok(key) => {
++                    let key = key.extract::<pyo3::Bound<'_, pyo3::types::PyBytes>>()?;
++                    if key.as_bytes().len() == key_size {
++                        key
++                    } else {
++                        random_key
++                    }
++                }
++                // A ValueError here is entirely attacker controlled (invalid
++                // padding, or an encrypted key of the wrong length) and must
++                // stay silent. Any other exception reflects a caller mistake
++                // rather than the contents of the message.
++                Err(e) if e.is_instance_of::<pyo3::exceptions::PyValueError>(py) => random_key,
++                Err(e) => return Err(e.into()),
++            };
++
++            let algorithm = algorithm_type.get(py)?.call1((key,))?;
++            let mode = types::CBC
++                .get(py)?
++                .call1((pyo3::types::PyBytes::new(py, &iv),))?;
++
+             // Decrypt the content using the key and proper algorithm
+             let encrypted_content = match enveloped_data.encrypted_content_info.encrypted_content {
+                 Some(content) => content,
+diff --git a/tests/doubles.py b/tests/doubles.py
+index cf2c96a3e..25f1b4c59 100644
+--- a/tests/doubles.py
++++ b/tests/doubles.py
+@@ -2,9 +2,11 @@
+ # 2.0, and the BSD License. See the LICENSE file in the root of this repository
+ # for complete details.
+ 
++from __future__ import annotations
+ 
+ from cryptography.hazmat.primitives import hashes, serialization
+-from cryptography.hazmat.primitives.asymmetric import padding
++from cryptography.hazmat.primitives.asymmetric import padding, rsa
++from cryptography.hazmat.primitives.asymmetric import utils as asym_utils
+ from cryptography.hazmat.primitives.ciphers import (
+     BlockCipherAlgorithm,
+     CipherAlgorithm,
+@@ -53,3 +55,45 @@ class DummyKeySerializationEncryption(
+ 
+ class DummyAsymmetricPadding(padding.AsymmetricPadding):
+     name = "dummy-padding"
++
++
++class DummyRSAPrivateKey(rsa.RSAPrivateKey):
++    """
++    A fake RSAPrivateKey whose decrypt() raises a non-ValueError. Used for
++    testing that a failure originating outside of this library is not
++    mistaken for an attacker controlled decryption failure.
++    """
++
++    def decrypt(
++        self, ciphertext: bytes, padding: padding.AsymmetricPadding
++    ) -> bytes:
++        raise TypeError("TypeError for testing")
++
++    @property
++    def key_size(self) -> int:
++        raise NotImplementedError
++
++    def public_key(self) -> rsa.RSAPublicKey:
++        raise NotImplementedError
++
++    def sign(
++        self,
++        data: bytes,
++        padding: padding.AsymmetricPadding,
++        algorithm: asym_utils.Prehashed | hashes.HashAlgorithm,
++    ) -> bytes:
++        raise NotImplementedError
++
++    def private_numbers(self) -> rsa.RSAPrivateNumbers:
++        raise NotImplementedError
++
++    def private_bytes(
++        self,
++        encoding: serialization.Encoding,
++        format: serialization.PrivateFormat,
++        encryption_algorithm: serialization.KeySerializationEncryption,
++    ) -> bytes:
++        raise NotImplementedError
++
++    def __copy__(self) -> rsa.RSAPrivateKey:
++        raise NotImplementedError
+diff --git a/tests/hazmat/primitives/test_pkcs7.py b/tests/hazmat/primitives/test_pkcs7.py
+index 1496a23e1..87f2bec1a 100644
+--- a/tests/hazmat/primitives/test_pkcs7.py
++++ b/tests/hazmat/primitives/test_pkcs7.py
+@@ -18,6 +18,7 @@ from cryptography.hazmat.primitives import hashes, serialization
+ from cryptography.hazmat.primitives.asymmetric import ed25519, padding, rsa
+ from cryptography.hazmat.primitives.ciphers import algorithms
+ from cryptography.hazmat.primitives.serialization import pkcs7
++from tests.doubles import DummyRSAPrivateKey
+ from tests.x509.test_x509 import _generate_ca_and_leaf
+ 
+ from ...hazmat.primitives.fixtures_rsa import (
+@@ -1406,6 +1407,67 @@ class TestPKCS7Decrypt:
+                 email_message.as_bytes(), certificate, private_key, []
+             )
+ 
++    def test_decrypt_encrypted_key_is_not_an_oracle(
++        self, data, certificate, private_key
++    ):
++        # An attacker who replaces the encryptedKey must not be able to tell
++        # the RSA decryption outcomes apart. Recovering an unusable key, or
++        # failing to recover one at all, has to look exactly like recovering
++        # a key of the right length that simply isn't the right key. See
++        # RFC 3218 and Bleichenbacher's '98 attack.
++        enveloped = (
++            pkcs7.PKCS7EnvelopeBuilder()
++            .set_data(data)
++            .add_recipient(certificate)
++        )
++        der = enveloped.encrypt(serialization.Encoding.DER, [])
++
++        public_key = certificate.public_key()
++        assert isinstance(public_key, rsa.RSAPublicKey)
++
++        # The encryptedKey is the only OCTET STRING in the structure as long
++        # as the RSA modulus, so it can be located by its DER header.
++        key_bytes = public_key.key_size // 8
++        marker = b"\x04\x82" + key_bytes.to_bytes(2, "big")
++        assert der.count(marker) == 1
++        offset = der.index(marker) + len(marker)
++
++        for encrypted_key in [
++            # Invalid PKCS#1 v1.5 padding.
++            b"\x00" * key_bytes,
++            # Valid padding concealing a key of the wrong length.
++            public_key.encrypt(b"A" * 15, padding.PKCS1v15()),
++            public_key.encrypt(b"A" * 17, padding.PKCS1v15()),
++            public_key.encrypt(b"A" * 32, padding.PKCS1v15()),
++            # Valid padding concealing a correctly sized but wrong key.
++            public_key.encrypt(b"A" * 16, padding.PKCS1v15()),
++        ]:
++            tampered = der[:offset] + encrypted_key + der[offset + key_bytes :]
++            try:
++                pkcs7.pkcs7_decrypt_der(tampered, certificate, private_key, [])
++            except ValueError as exc:
++                # Decrypting under a substituted random key leaves plausible
++                # PKCS#7 padding roughly one time in 256, in which case the
++                # caller gets garbage instead of an error. That is equally
++                # uninformative, so it is an acceptable outcome here.
++                assert str(exc) == "Invalid padding bytes."
++
++    def test_decrypt_key_error_is_not_swallowed(self, data, certificate):
++        # Only a ValueError from unwrapping the key is attacker controlled and
++        # therefore silenced. A private key implemented outside this library
++        # can fail in other ways, and those must still reach the caller.
++        enveloped = (
++            pkcs7.PKCS7EnvelopeBuilder()
++            .set_data(data)
++            .add_recipient(certificate)
++            .encrypt(serialization.Encoding.DER, [])
++        )
++
++        with pytest.raises(TypeError, match="TypeError for testing"):
++            pkcs7.pkcs7_decrypt_der(
++                enveloped, certificate, DummyRSAPrivateKey(), []
++            )
++
+ 
+ @pytest.mark.supported(
+     only_if=lambda backend: backend.pkcs7_supported(),
+diff --git a/tests/test_doubles.py b/tests/test_doubles.py
+new file mode 100644
+index 000000000..f52bd3bbf
+--- /dev/null
++++ b/tests/test_doubles.py
+@@ -0,0 +1,53 @@
++# This file is dual licensed under the terms of the Apache License, Version
++# 2.0, and the BSD License. See the LICENSE file in the root of this repository
++# for complete details.
++
++import copy
++
++import pytest
++
++from cryptography.hazmat.primitives import hashes, serialization
++from cryptography.hazmat.primitives.asymmetric import padding
++
++from .doubles import DummyRSAPrivateKey
++
++
++class TestDummyRSAPrivateKey:
++    def test_decrypt(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(TypeError):
++            key.decrypt(b"ciphertext", padding.PKCS1v15())
++
++    def test_key_size_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.key_size
++
++    def test_public_key_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.public_key()
++
++    def test_sign_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.sign(b"data", padding.PKCS1v15(), hashes.SHA256())
++
++    def test_private_numbers_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.private_numbers()
++
++    def test_private_bytes_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            key.private_bytes(
++                serialization.Encoding.PEM,
++                serialization.PrivateFormat.PKCS8,
++                serialization.NoEncryption(),
++            )
++
++    def test_copy_not_implemented(self):
++        key = DummyRSAPrivateKey()
++        with pytest.raises(NotImplementedError):
++            copy.copy(key)
+-- 
+2.35.6
