Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PugjL-0006m3-Dc
	for openembedded-core@lists.linuxtogo.org;
	Wed, 02 Mar 2011 08:44:19 +0100
Received: by fxm8 with SMTP id 8so5456496fxm.6
	for <openembedded-core@lists.linuxtogo.org>;
	Tue, 01 Mar 2011 23:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=u7avp1ROk2Tujo7Ez9/dhbBdzUUmpqBNwzK2jVIavzE=;
	b=JqWPIlrBeDE/qF9OXa8flTwX7Emt2/UwsEB0tqy4wXH6vBmmHXFay9phTU9RLEJk/I
	GSZRlp8AV3bZrOdErCDEaqTizKdcgypY/IsZ5sQe7/duWnLPtqLKrgfA3l0oRmeDfMQH
	puoMidoLK1HbKlaCwlfRVXS55zQci9bHVtBzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=EnfrCgaNkz268XEEOKhkHTYdEwKOOh0JMmrr45zegwPx5hHNamtmujDuR9s/2mYdMZ
	8+e61CJ8PG1v8s9kMWye0WwPkwHcJ61LJyXj03uLg41OVv7xHxJweJf5Flpj3hRJcG/v
	aFyW/DB3ZsHzzHJ1prxVLrqKK+xgWXxVe4704=
Received: by 10.223.93.140 with SMTP id v12mr6989053fam.96.1299051772155; Tue,
	01 Mar 2011 23:42:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 23:42:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 23:42:32 -0800
Message-ID: <AANLkTimeooOaoAorCseJ4hxUhS3yx2sR+Uhmy4TtMgrp@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: rpm-native fails to build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 07:44:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am getting following error message while build rpm-native. It seems
beecrypt is not getting linked in. My host is ubuntu 11.04/64bit. Any
pointers ?


| make[3]: Entering directory
`/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/tools'
| /bin/sh ../x86_64-linux-libtool --tag=CC   --mode=link ccache gcc
-isystem/scratch/oe-core/sysroots/x86_64-linux/usr/include -O2
-DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -g -D_GNU_SOURCE -D_REENTRANT
      -L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib     -o mtree
rpmmtree.o ../lib/librpm.la ../rpmdb/librpmdb.la ../rpmio/librpmio.la
../misc/librpmmisc.la  -lacl -lattr -lpcreposix -lpcre -ldb-5.1
-lcrypto -lbz2 -lz -lpopt -lpthread -lrt  -lelf -lpopt   -lssl
-lcrypto   -lpcre
| /bin/sh ../x86_64-linux-libtool --tag=CC   --mode=link ccache gcc
-isystem/scratch/oe-core/sysroots/x86_64-linux/usr/include -O2
-DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -g -D_GNU_SOURCE -D_REENTRANT
      -L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath-link,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib     -o rpmcache
rpmcache.o ../lib/librpm.la ../rpmdb/librpmdb.la ../rpmio/librpmio.la
../misc/librpmmisc.la  -lacl -lattr -lpcreposix -lpcre -ldb-5.1
-lcrypto -lbz2 -lz -lpopt -lpthread -lrt  -lelf -lpopt   -lssl
-lcrypto   -lpcre
| x86_64-linux-libtool: link: ccache gcc
-isystem/scratch/oe-core/sysroots/x86_64-linux/usr/include -O2
-DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -g -D_GNU_SOURCE -D_REENTRANT
-Wl,-rpath-link -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-Wl,-rpath-link -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-o .libs/mtree rpmmtree.o
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
../lib/.libs/librpm.so -L../beecrypt -L../syck/lib -L../syck
/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmdb/.libs/librpmdb.so
../rpmdb/.libs/librpmdb.so
/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so
/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/misc/.libs/librpmmisc.so
../rpmio/.libs/librpmio.so -lm ../misc/.libs/librpmmisc.so -ldl
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libacl.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libattr.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libpcreposix.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libdb-5.1.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libbz2.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libz.so -lpthread -lrt
-lelf /scratch/oe-core/sysroots/x86_64-linux/usr/lib/libpopt.so -lssl
-lcrypto /scratch/oe-core/sysroots/x86_64-linux/usr/lib/libpcre.so
-Wl,-rpath -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
 x86_64-linux-libtool: link: ccache gcc
-isystem/scratch/oe-core/sysroots/x86_64-linux/usr/include -O2
-DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -g -D_GNU_SOURCE -D_REENTRANT
-Wl,-rpath-link -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-Wl,-rpath-link -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
-Wl,-rpath -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib -Wl,-O1
-o .libs/rpmcache rpmcache.o
-L/scratch/oe-core/sysroots/x86_64-linux/usr/lib
../lib/.libs/librpm.so -L../beecrypt -L../syck/lib -L../syck
/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmdb/.libs/librpmdb.so
../rpmdb/.libs/librpmdb.so
/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so
/scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/misc/.libs/librpmmisc.so
../rpmio/.libs/librpmio.so -lm ../misc/.libs/librpmmisc.so -ldl
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libacl.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libattr.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libpcreposix.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libdb-5.1.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libbz2.so
/scratch/oe-core/sysroots/x86_64-linux/usr/lib/libz.so -lpthread -lrt
-lelf /scratch/oe-core/sysroots/x86_64-linux/usr/lib/libpopt.so -lssl
-lcrypto /scratch/oe-core/sysroots/x86_64-linux/usr/lib/libpcre.so
-Wl,-rpath -Wl,/scratch/oe-core/sysroots/x86_64-linux/usr/lib
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `b64encode_chars_per_line'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `md4Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `b64encode'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `b64crc'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpbsethex'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `dlkp_pInit'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd256Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `st_free_table'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd128Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `md4Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_strndup'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `b64encode_eolstr'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd256Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha1Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_parser_taguri_expansion'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `dlkp_pFree'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `md4Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd128Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_new_parser'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_lookup_sym'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha224Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha224Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha384Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpsetw'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `dsasign'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `randomGeneratorContextFree'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `rsakpMake'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpnzero'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha512Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mplshift'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `st_foreach'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `i2osp'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha256Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha512Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `md5Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha256Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha384Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd256Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha1Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd160Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_parser_error_handler'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha224Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd320Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd320Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_seq_read'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd128Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `rsavrfy'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `randomGeneratorContextInit'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_parse'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpnsethex'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_parser_str_auto'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpfprintln'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_parser_handler'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_free_parser'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha256Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpnfree'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd160Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpnsetbin'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_add_sym'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpbnrnd'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_map_read'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha384Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd320Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `rsapricrt'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `dsaparamMake'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `ripemd160Reset'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpbits'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `rsakpFree'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha1Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `dldp_pPair'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `b64decode'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpadd'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `syck_parser_implicit_typing'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `sha512Update'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `randomGeneratorDefault'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `mpzero'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `dsavrfy'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `md5Digest'
| /scratch/oe-core/work/x86_64-linux/rpm-native-5.4.0-r13/rpm-5.4.0/rpmio/.libs/librpmio.so:
undefined reference to `md5Reset'
| collect2: ld returned 1 exit status
| make[3]: *** [mtree] Error 1
| make[3]: *** Waiting for unfinished jobs....


