Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5218.1613463848513890660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3849338C1279
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.10.1 SUCCEEDED
Message-ID: <MADEUP.16642CD2D300F759.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148117
Content-Type: multipart/mixed; boundary="===============3209160188991642539=="

--===============3209160188991642539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.9.9-3.10.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3209160188991642539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-l
 inux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython
 -39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash
 /_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_
 ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-pa
 ckages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-l
 inux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython
 -39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash
 /_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_
 ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-pa
 ckages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i38
 6-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpyt
 hon-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/H
 ash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ciphe
 r/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site
 -packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-
 i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.c
 python-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypt
 o/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ci
 pher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/s
 ite-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386
 -linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpyth
 on-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Ha
 sh/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher
 /_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-
 packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 34081965 to 1838851 (-95%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux
 -gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-
 i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SH
 A512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4
 .abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packag
 es/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so"
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCGFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCGFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCGFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCKeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCKeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCKeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/gcmDecrypt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/gcmEncryptExtIV128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBGFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBGFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBGFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBKeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBKeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBKeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/README.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/README.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCinvperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCMMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCMMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCpermop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCsubtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCvarkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCvartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64invperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64MMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64MMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64permop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64subtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64varkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64vartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8invperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8MMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8MMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8permop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8subtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8varkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8vartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TECBMMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TECBMMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBinvperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBMMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBMMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBpermop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBsubtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBvarkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBvartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aead_aes_siv_cmac_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_ccm_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_eax_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_gcm_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_siv_cmac_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/chacha20_poly1305_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha1_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha224_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha224_mgf1sha224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha256_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha256_mgf1sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha384_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha384_mgf1sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha512_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha512_mgf1sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha256_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha256_mgf1sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha512_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha512_mgf1sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha256_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha256_mgf1sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha512_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha512_mgf1sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_misc_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_pkcs1_2048_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_pkcs1_3072_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_pkcs1_4096_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/xchacha20_poly1305_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b/blake2b-test.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b/tv1.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b/tv2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s/blake2s-test.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s/tv1.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s/tv2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/readme.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA1 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA1/SHA1ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2/SHA512_224ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2/SHA512_256ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2/SHA512ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHAKE128.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHAKE256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/wycheproof/aes_cmac_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_ecparams.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes128.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes192.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes256_gcm.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes256.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_des3.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8_clear.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8_clear.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_compressed.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_compressed.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_x509.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_x509.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes128.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes192.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes256_gcm.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes256.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_des3.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8_clear.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8_clear.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public_compressed.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public_compressed.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_x509.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_x509.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes128.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes192.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes256_gcm.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes256.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_des3.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8_clear.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8_clear.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public_compressed.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public_compressed.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_x509.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_x509.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p256.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p384.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p521.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/openssl_version_p384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/openssl_version_p521.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/openssl_version.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P521.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/gen_rsa_2048.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/openssl_version.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/DSA was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/DSA/FIPS_186_3_SigGen.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/DSA/FIPS_186_3_SigVer.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA/README.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA/SigGen.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA/SigVer.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS/SigGenPSS_186-2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS/SigGenPSS_186-3.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS/SigVerPSS_186-3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigGen15_186-2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigGen15_186-3.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigVer15_186-3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/dsa_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha224_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha256_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha3_224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha256_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha3_384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha384_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp521r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp521r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp521r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_webcrypto_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha1_mgf1_20_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha256_mgf1_0_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha512_256_mgf1_28_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha512_256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_3072_sha256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_4096_sha256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_4096_sha512_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_misc_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_sig_gen_misc_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha512_224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha512_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha3_384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha512_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_4096_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_4096_sha512_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_4096_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/top_level.txt was removed

--===============3209160188991642539==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.9.9-3.10.1.patch"

From 644f1037730a4d592f843c695fe1abc170b8eaf4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:56:12 +0000
Subject: [PATCH] python3-pycryptodome: upgrade 3.9.9 -> 3.10.1

---
 .../python/python-pycryptodome.inc            |   2 +-
 .../python/python3-pycryptodome_3.10.1.bb     | 227 ++++++++++++++++++
 .../python/python3-pycryptodome_3.9.9.bb      |   5 -
 3 files changed, 228 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 68b084eb04..48481bcf9a 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=accfa6aeaceb3ba96676edf18e78302c"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
new file mode 100644
index 0000000000..22a680fb6b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
@@ -0,0 +1,227 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -67,208 +67,3 @@
+#  8,321,675. The directory Doc/ocb contains three free licenses for implementors 
+#  and users. As a general statement, OCB can be freely used for software not meant 
+#  for military purposes. Contact your attorney for further information.
+# -
+# -Apache 2.0 license (Wycheproof)
+# -===============================
+# -
+# -                                 Apache License
+# -                           Version 2.0, January 2004
+# -                        http://www.apache.org/licenses/
+# -
+# -   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+# -
+# -   1. Definitions.
+# -
+# -      "License" shall mean the terms and conditions for use, reproduction,
+# -      and distribution as defined by Sections 1 through 9 of this document.
+# -
+# -      "Licensor" shall mean the copyright owner or entity authorized by
+# -      the copyright owner that is granting the License.
+# -
+# -      "Legal Entity" shall mean the union of the acting entity and all
+# -      other entities that control, are controlled by, or are under common
+# -      control with that entity. For the purposes of this definition,
+# -      "control" means (i) the power, direct or indirect, to cause the
+# -      direction or management of such entity, whether by contract or
+# -      otherwise, or (ii) ownership of fifty percent (50%) or more of the
+# -      outstanding shares, or (iii) beneficial ownership of such entity.
+# -
+# -      "You" (or "Your") shall mean an individual or Legal Entity
+# -      exercising permissions granted by this License.
+# -
+# -      "Source" form shall mean the preferred form for making modifications,
+# -      including but not limited to software source code, documentation
+# -      source, and configuration files.
+# -
+# -      "Object" form shall mean any form resulting from mechanical
+# -      transformation or translation of a Source form, including but
+# -      not limited to compiled object code, generated documentation,
+# -      and conversions to other media types.
+# -
+# -      "Work" shall mean the work of authorship, whether in Source or
+# -      Object form, made available under the License, as indicated by a
+# -      copyright notice that is included in or attached to the work
+# -      (an example is provided in the Appendix below).
+# -
+# -      "Derivative Works" shall mean any work, whether in Source or Object
+# -      form, that is based on (or derived from) the Work and for which the
+# -      editorial revisions, annotations, elaborations, or other modifications
+# -      represent, as a whole, an original work of authorship. For the purposes
+# -      of this License, Derivative Works shall not include works that remain
+# -      separable from, or merely link (or bind by name) to the interfaces of,
+# -      the Work and Derivative Works thereof.
+# -
+# -      "Contribution" shall mean any work of authorship, including
+# -      the original version of the Work and any modifications or additions
+# -      to that Work or Derivative Works thereof, that is intentionally
+# -      submitted to Licensor for inclusion in the Work by the copyright owner
+# -      or by an individual or Legal Entity authorized to submit on behalf of
+# -      the copyright owner. For the purposes of this definition, "submitted"
+# -      means any form of electronic, verbal, or written communication sent
+# -      to the Licensor or its representatives, including but not limited to
+# -      communication on electronic mailing lists, source code control systems,
+# -      and issue tracking systems that are managed by, or on behalf of, the
+# -      Licensor for the purpose of discussing and improving the Work, but
+# -      excluding communication that is conspicuously marked or otherwise
+# -      designated in writing by the copyright owner as "Not a Contribution."
+# -
+# -      "Contributor" shall mean Licensor and any individual or Legal Entity
+# -      on behalf of whom a Contribution has been received by Licensor and
+# -      subsequently incorporated within the Work.
+# -
+# -   2. Grant of Copyright License. Subject to the terms and conditions of
+# -      this License, each Contributor hereby grants to You a perpetual,
+# -      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+# -      copyright license to reproduce, prepare Derivative Works of,
+# -      publicly display, publicly perform, sublicense, and distribute the
+# -      Work and such Derivative Works in Source or Object form.
+# -
+# -   3. Grant of Patent License. Subject to the terms and conditions of
+# -      this License, each Contributor hereby grants to You a perpetual,
+# -      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+# -      (except as stated in this section) patent license to make, have made,
+# -      use, offer to sell, sell, import, and otherwise transfer the Work,
+# -      where such license applies only to those patent claims licensable
+# -      by such Contributor that are necessarily infringed by their
+# -      Contribution(s) alone or by combination of their Contribution(s)
+# -      with the Work to which such Contribution(s) was submitted. If You
+# -      institute patent litigation against any entity (including a
+# -      cross-claim or counterclaim in a lawsuit) alleging that the Work
+# -      or a Contribution incorporated within the Work constitutes direct
+# -      or contributory patent infringement, then any patent licenses
+# -      granted to You under this License for that Work shall terminate
+# -      as of the date such litigation is filed.
+# -
+# -   4. Redistribution. You may reproduce and distribute copies of the
+# -      Work or Derivative Works thereof in any medium, with or without
+# -      modifications, and in Source or Object form, provided that You
+# -      meet the following conditions:
+# -
+# -      (a) You must give any other recipients of the Work or
+# -          Derivative Works a copy of this License; and
+# -
+# -      (b) You must cause any modified files to carry prominent notices
+# -          stating that You changed the files; and
+# -
+# -      (c) You must retain, in the Source form of any Derivative Works
+# -          that You distribute, all copyright, patent, trademark, and
+# -          attribution notices from the Source form of the Work,
+# -          excluding those notices that do not pertain to any part of
+# -          the Derivative Works; and
+# -
+# -      (d) If the Work includes a "NOTICE" text file as part of its
+# -          distribution, then any Derivative Works that You distribute must
+# -          include a readable copy of the attribution notices contained
+# -          within such NOTICE file, excluding those notices that do not
+# -          pertain to any part of the Derivative Works, in at least one
+# -          of the following places: within a NOTICE text file distributed
+# -          as part of the Derivative Works; within the Source form or
+# -          documentation, if provided along with the Derivative Works; or,
+# -          within a display generated by the Derivative Works, if and
+# -          wherever such third-party notices normally appear. The contents
+# -          of the NOTICE file are for informational purposes only and
+# -          do not modify the License. You may add Your own attribution
+# -          notices within Derivative Works that You distribute, alongside
+# -          or as an addendum to the NOTICE text from the Work, provided
+# -          that such additional attribution notices cannot be construed
+# -          as modifying the License.
+# -
+# -      You may add Your own copyright statement to Your modifications and
+# -      may provide additional or different license terms and conditions
+# -      for use, reproduction, or distribution of Your modifications, or
+# -      for any such Derivative Works as a whole, provided Your use,
+# -      reproduction, and distribution of the Work otherwise complies with
+# -      the conditions stated in this License.
+# -
+# -   5. Submission of Contributions. Unless You explicitly state otherwise,
+# -      any Contribution intentionally submitted for inclusion in the Work
+# -      by You to the Licensor shall be under the terms and conditions of
+# -      this License, without any additional terms or conditions.
+# -      Notwithstanding the above, nothing herein shall supersede or modify
+# -      the terms of any separate license agreement you may have executed
+# -      with Licensor regarding such Contributions.
+# -
+# -   6. Trademarks. This License does not grant permission to use the trade
+# -      names, trademarks, service marks, or product names of the Licensor,
+# -      except as required for reasonable and customary use in describing the
+# -      origin of the Work and reproducing the content of the NOTICE file.
+# -
+# -   7. Disclaimer of Warranty. Unless required by applicable law or
+# -      agreed to in writing, Licensor provides the Work (and each
+# -      Contributor provides its Contributions) on an "AS IS" BASIS,
+# -      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+# -      implied, including, without limitation, any warranties or conditions
+# -      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
+# -      PARTICULAR PURPOSE. You are solely responsible for determining the
+# -      appropriateness of using or redistributing the Work and assume any
+# -      risks associated with Your exercise of permissions under this License.
+# -
+# -   8. Limitation of Liability. In no event and under no legal theory,
+# -      whether in tort (including negligence), contract, or otherwise,
+# -      unless required by applicable law (such as deliberate and grossly
+# -      negligent acts) or agreed to in writing, shall any Contributor be
+# -      liable to You for damages, including any direct, indirect, special,
+# -      incidental, or consequential damages of any character arising as a
+# -      result of this License or out of the use or inability to use the
+# -      Work (including but not limited to damages for loss of goodwill,
+# -      work stoppage, computer failure or malfunction, or any and all
+# -      other commercial damages or losses), even if such Contributor
+# -      has been advised of the possibility of such damages.
+# -
+# -   9. Accepting Warranty or Additional Liability. While redistributing
+# -      the Work or Derivative Works thereof, You may choose to offer,
+# -      and charge a fee for, acceptance of support, warranty, indemnity,
+# -      or other liability obligations and/or rights consistent with this
+# -      License. However, in accepting such obligations, You may act only
+# -      on Your own behalf and on Your sole responsibility, not on behalf
+# -      of any other Contributor, and only if You agree to indemnify,
+# -      defend, and hold each Contributor harmless for any liability
+# -      incurred by, or claims asserted against, such Contributor by reason
+# -      of your accepting any such warranty or additional liability.
+# -
+# -   END OF TERMS AND CONDITIONS
+# -
+# -   APPENDIX: How to apply the Apache License to your work.
+# -
+# -      To apply the Apache License to your work, attach the following
+# -      boilerplate notice, with the fields enclosed by brackets "[]"
+# -      replaced with your own identifying information. (Don't include
+# -      the brackets!)  The text should be enclosed in the appropriate
+# -      comment syntax for the file format. We also recommend that a
+# -      file or class name and description of purpose be included on the
+# -      same "printed page" as the copyright notice for easier
+# -      identification within third-party archives.
+# -
+# -   Copyright [yyyy] [name of copyright owner]
+# -
+# -   Licensed under the Apache License, Version 2.0 (the "License");
+# -   you may not use this file except in compliance with the License.
+# -   You may obtain a copy of the License at
+# -
+# -       http://www.apache.org/licenses/LICENSE-2.0
+# -
+# -   Unless required by applicable law or agreed to in writing, software
+# -   distributed under the License is distributed on an "AS IS" BASIS,
+# -   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+# -   See the License for the specific language governing permissions and
+# -   limitations under the License.
+# 
+#
+
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "3e2e3a06580c5f190df843cdb90ea28d61099cf4924334d5297a995de68e4673"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
deleted file mode 100644
index 1e84ce4df7..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "910e202a557e1131b1c1b3f17a63914d57aac55cf9fb9b51644962841c3995c4"
-
-- 
2.17.1


--===============3209160188991642539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.9.9.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.10.1.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-
 gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.c
 python-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Cryp
 to/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ciph
 er/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto
 /Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 890408 to 891272 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-
 gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.c
 python-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Cryp
 to/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ciph
 er/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto
 /Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-
 gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.c
 python-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Cryp
 to/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ciph
 er/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto
 /Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-lin
 ux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2
 b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/C
 rypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/C
 ipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Cry
 pto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-
 gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.c
 python-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Cryp
 to/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ciph
 er/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto
 /Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2705905 to 2706004 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-
 linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLA
 KE2b.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-package
 s/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypt
 o/Cipher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/
 Crypto/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linu
 x-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b
 .cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Cr
 ypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Ci
 pher/_Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Cryp
 to/Hash/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 34081965 to 1838851 (-95%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.9.9" to "3.10.1"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.
 so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpyth
 on-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/H
 ash/_SHA384.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so", added "/usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_
 Salsa20.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so /usr/lib/python3.9/site-packages/Crypto/Has
 h/_MD4.abi3.so /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.9.9 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3053299 to 3028611 (-1%)
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.abi3.so was added
  /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.abi3.so was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/pycryptodome-3.10.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_ARC4.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_chacha20.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aes.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_aesni.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_arc2.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_blowfish.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cast.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cbc.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_cfb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ctr.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des3.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_des.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ecb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_eksblowfish.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ocb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_raw_ofb.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Cipher/_Salsa20.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2b.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_BLAKE2s.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_clmul.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_ghash_portable.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_keccak.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD2.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD4.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_MD5.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_poly1305.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_RIPEMD160.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA1.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA224.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA256.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA384.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Hash/_SHA512.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Math/_modexp.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Protocol/_scrypt.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/PublicKey/_ec_ws.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCGFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCGFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCGFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCKeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCKeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCKeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCMMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CBCVarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128GFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128KeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128MMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB128VarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8GFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8KeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8MMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/CFB8VarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/gcmDecrypt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/gcmEncryptExtIV128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBGFSbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBGFSbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBGFSbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBKeySbox128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBKeySbox192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBKeySbox256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMCT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMCT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMCT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMMT128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMMT192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBMMT256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarKey128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarKey192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarKey256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarTxt128.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarTxt192.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/OFBVarTxt256.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/AES/README.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/README.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCinvperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCMMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCMMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCpermop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCsubtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCvarkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCBCvartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64invperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64MMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64MMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64permop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64subtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64varkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB64vartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8invperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8MMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8MMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8permop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8subtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8varkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TCFB8vartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TECBMMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TECBMMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBinvperm.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBMMT2.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBMMT3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBpermop.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBsubtab.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBvarkey.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/TDES/TOFBvartext.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aead_aes_siv_cmac_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_ccm_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_eax_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_gcm_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/aes_siv_cmac_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/chacha20_poly1305_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha1_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha224_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha224_mgf1sha224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha256_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha256_mgf1sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha384_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha384_mgf1sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha512_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_2048_sha512_mgf1sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha256_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha256_mgf1sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha512_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_3072_sha512_mgf1sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha256_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha256_mgf1sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha512_mgf1sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_4096_sha512_mgf1sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_oaep_misc_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_pkcs1_2048_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_pkcs1_3072_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/rsa_pkcs1_4096_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Cipher/test_vectors/wycheproof/xchacha20_poly1305_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b/blake2b-test.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b/tv1.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2b/tv2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s/blake2s-test.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s/tv1.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/BLAKE2s/tv2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ExtremelyLongMsgKAT_512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/LongMsgKAT_512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/readme.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/keccak/ShortMsgKAT_512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA1 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA1/SHA1ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2/SHA512_224ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2/SHA512_256ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA2/SHA512ShortMsg.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-224.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHA3-512.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHAKE128.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/SHA3/ShortMsgKAT_SHAKE256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Hash/test_vectors/wycheproof/aes_cmac_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha1_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Protocol/test_vectors/wycheproof/hkdf_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_ecparams.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes128.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes192.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes256_gcm.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_aes256.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_enc_des3.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8_clear.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8_clear.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private_p8.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_compressed.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_compressed.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_public.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_x509.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p256_x509.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes128.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes192.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes256_gcm.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_aes256.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_enc_des3.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8_clear.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8_clear.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private_p8.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public_compressed.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public_compressed.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_public.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_x509.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p384_x509.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes128.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes192.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes256_gcm.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_aes256.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_enc_des3.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8_clear.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8_clear.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private_p8.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public_compressed.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public_compressed.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_public.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_x509.der was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/ecc_p521_x509.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p256.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p384.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/gen_ecc_p521.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/openssl_version_p384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/openssl_version_p521.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/openssl_version.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P256.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P384.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/ECC/point-at-infinity.org-P521.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/gen_rsa_2048.sh was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/openssl_version.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh_pwd_old.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private_openssh_pwd.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_private.pem was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/PublicKey/test_vectors/RSA/rsa2048_public_openssh.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/DSA was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/DSA/FIPS_186_3_SigGen.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/DSA/FIPS_186_3_SigVer.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA/README.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA/SigGen.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/ECDSA/SigVer.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS/SigGenPSS_186-2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS/SigGenPSS_186-3.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-PSS/SigVerPSS_186-3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5 was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigGen15_186-2.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigGen15_186-3.txt was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/PKCS1-v1.5/SigVer15_186-3.rsp was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/dsa_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha224_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha256_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha3_224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp224r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha256_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp256r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha3_384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha384_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp384r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp521r1_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp521r1_sha512_p1363_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_secp521r1_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/ecdsa_webcrypto_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha1_mgf1_20_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha256_mgf1_0_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha512_256_mgf1_28_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_2048_sha512_256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_3072_sha256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_4096_sha256_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_4096_sha512_mgf1_32_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_pss_misc_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_sig_gen_misc_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha512_224_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha512_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_2048_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha3_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha3_384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha3_512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha512_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_3072_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_4096_sha384_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_4096_sha512_256_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_4096_sha512_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/SelfTest/Signature/test_vectors/wycheproof/rsa_signature_test.json was removed
  /usr/lib/python3.9/site-packages/Crypto/Util/_cpuid_c.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/Crypto/Util/_strxor.cpython-39-i386-linux-gnu.so was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/pycryptodome-3.9.9-py3.9.egg-info/top_level.txt was removed

--===============3209160188991642539==--
