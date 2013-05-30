Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7612060825
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 12:33:17 +0000 (UTC)
Message-ID: <51A7470C.403@communistcode.co.uk>
Date: Thu, 30 May 2013 13:33:16 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: OpenSSL compile failure - building-docs related
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2013 12:33:18 -0000
X-Groupsio-MsgNum: 39935
Content-Type: multipart/mixed; boundary="------------070100050105040401040306"

--------------070100050105040401040306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I hit this today after a pull on master, seems to be an issue with perl 
maybe? Anyone have a clue what it might mean? A -c clean didn't fix up 
the issue.

Attached(1)

Cheers,
Jack.
-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

--------------070100050105040401040306
Content-Type: text/plain; charset=UTF-8;
 name="log.do_install.7282"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_install.7282"

DEBUG: Executing shell function do_install
NOTE: make -e MAKEFLAGS= INSTALL_PREFIX=/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image MANDIR=/usr/share/man install
making all in crypto...
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto'
making all in crypto/objects...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/objects'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/objects'
making all in crypto/md4...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/md4'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/md4'
making all in crypto/md5...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/md5'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/md5'
making all in crypto/sha...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/sha'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/sha'
making all in crypto/mdc2...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/mdc2'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/mdc2'
making all in crypto/hmac...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/hmac'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/hmac'
making all in crypto/ripemd...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ripemd'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ripemd'
making all in crypto/whrlpool...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/whrlpool'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/whrlpool'
making all in crypto/des...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/des'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/des'
making all in crypto/aes...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/aes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/aes'
making all in crypto/rc2...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rc2'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rc2'
making all in crypto/rc4...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rc4'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rc4'
making all in crypto/idea...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/idea'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/idea'
making all in crypto/bf...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/bf'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/bf'
making all in crypto/cast...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/cast'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/cast'
making all in crypto/camellia...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/camellia'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/camellia'
making all in crypto/seed...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/seed'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/seed'
making all in crypto/modes...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/modes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/modes'
making all in crypto/bn...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/bn'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/bn'
making all in crypto/ec...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ec'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ec'
making all in crypto/rsa...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rsa'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rsa'
making all in crypto/dsa...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/dsa'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/dsa'
making all in crypto/ecdsa...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ecdsa'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ecdsa'
making all in crypto/dh...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/dh'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/dh'
making all in crypto/ecdh...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ecdh'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ecdh'
making all in crypto/dso...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/dso'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/dso'
making all in crypto/engine...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/engine'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/engine'
making all in crypto/buffer...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/buffer'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/buffer'
making all in crypto/bio...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/bio'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/bio'
making all in crypto/stack...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/stack'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/stack'
making all in crypto/lhash...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/lhash'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/lhash'
making all in crypto/rand...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rand'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/rand'
making all in crypto/err...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/err'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/err'
making all in crypto/evp...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/evp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/evp'
making all in crypto/asn1...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/asn1'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/asn1'
making all in crypto/pem...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pem'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pem'
making all in crypto/x509...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/x509'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/x509'
making all in crypto/x509v3...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/x509v3'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/x509v3'
making all in crypto/conf...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/conf'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/conf'
making all in crypto/txt_db...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/txt_db'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/txt_db'
making all in crypto/pkcs7...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pkcs7'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pkcs7'
making all in crypto/pkcs12...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pkcs12'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pkcs12'
making all in crypto/comp...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/comp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/comp'
making all in crypto/ocsp...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ocsp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ocsp'
making all in crypto/ui...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ui'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ui'
making all in crypto/krb5...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/krb5'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/krb5'
making all in crypto/cms...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/cms'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/cms'
making all in crypto/pqueue...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pqueue'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/pqueue'
making all in crypto/ts...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ts'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/ts'
making all in crypto/srp...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/srp'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/srp'
making all in crypto/cmac...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/cmac'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto/cmac'
if [ -n "libcrypto.so.1.0.0 libssl.so.1.0.0" ]; then \
	(cd ..; make -e libcrypto.so.1.0.0); \
fi
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
[ -z "" ] || arm-oecore-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN 	-DTERMIO  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -Iinclude \
	-DFINGERPRINT_PREMAIN_DSO_LOAD -o fips_premain_dso  \
	fips_premain.c fipscanister.o \
	libcrypto.a -lgcc -ldl
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/crypto'
making all in ssl...
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/ssl'
if [ -n "libcrypto.so.1.0.0 libssl.so.1.0.0" ]; then \
	(cd ..; make -e libssl.so.1.0.0); \
fi
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
[ -z "" ] || arm-oecore-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/mnt/SSD/oe-r0005/ccoR0005/tmp/sysroots/beaglebone -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN 	-DTERMIO  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -Iinclude \
	-DFINGERPRINT_PREMAIN_DSO_LOAD -o fips_premain_dso  \
	fips_premain.c fipscanister.o \
	libcrypto.a -lgcc -ldl
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e'
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/ssl'
making all in engines...
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/engines'
echo 

making all in engines/ccgost...
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/engines/ccgost'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/engines/ccgost'
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/engines'
making all in apps...
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/apps'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/openssl-1.0.1e/apps'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr/share'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr/share/man'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr/share/man/man1'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr/share/man/man3'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr/share/man/man5'
created directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/image/usr/share/man/man7'
installing man1/CA.pl.1ssl
installing man1/asn1parse.1ssl
installing man1/ca.1ssl
installing man1/ciphers.1ssl
installing man1/cms.1ssl
cms.pod around line 457: Expected text after =item, not a number
cms.pod around line 461: Expected text after =item, not a number
cms.pod around line 465: Expected text after =item, not a number
cms.pod around line 470: Expected text after =item, not a number
cms.pod around line 474: Expected text after =item, not a number
POD document had syntax errors at /usr/bin/core_perl/pod2man line 71.
make: *** [install_docs] Error 1
ERROR: oe_runmake failed
ERROR: Function failed: do_install (log file is located at /mnt/SSD/oe-r0005/ccoR0005/tmp/work/armv7a-vfp-neon-oecore-linux-gnueabi/openssl/1.0.1e-r15.0/temp/log.do_install.7282)

--------------070100050105040401040306--
