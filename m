Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 296E76A4E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 11:18:40 +0000 (UTC)
Message-ID: <51A4928E.5000500@communistcode.co.uk>
Date: Tue, 28 May 2013 12:18:38 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: bitbake image -> bitbake image -c populate_sdk failures
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
X-List-Received-Date: Tue, 28 May 2013 11:18:40 -0000
X-Groupsio-MsgNum: 39767
Content-Type: multipart/mixed; boundary="------------040603060300090809040905"

--------------040603060300090809040905
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok, this has been happening for a while but I've only just had a chance 
to write up this email.

When I peform the following:

bitbake my-image

bitbake my-sdk -c populate_sdk

I _always_ get build failures. I am running master and these are the 
packages which appear to consistently fail:

binutils-crosssdk
nativesdk-gettext
nativesdk-gdbm
nativesdk-gmp (log attached)

To fix the problems, I can either wipe tmp/ or clean the failing recipes 
and then rebuild. Does anyone know what is causing this and how we could 
go about fixing it?

I run on master, my target is ARM and host x86_64.

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------040603060300090809040905
Content-Type: text/plain; charset=UTF-8;
 name="log.do_install.22874"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_install.22874"

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
DEBUG: Executing shell function do_install
NOTE: make -j 8 DESTDIR=/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image install
make  install-recursive
make[1]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
Making install in tests
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests'
Making install in .
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests'
Making install in devel
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/devel'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/devel'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/devel'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/devel'
Making install in mpn
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpn'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpn'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpn'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpn'
Making install in mpz
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpz'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpz'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpz'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpz'
Making install in mpq
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpq'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpq'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpq'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpq'
Making install in mpf
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpf'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpf'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpf'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/mpf'
Making install in rand
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/rand'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/rand'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/rand'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/rand'
Making install in misc
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/misc'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/misc'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/misc'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/misc'
Making install in cxx
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/cxx'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/cxx'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/cxx'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests/cxx'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tests'
Making install in mpn
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpn'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpn'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpn'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpn'
Making install in mpz
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpz'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpz'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpz'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpz'
Making install in mpq
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpq'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpq'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpq'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpq'
Making install in mpf
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpf'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpf'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpf'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/mpf'
Making install in printf
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/printf'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/printf'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/printf'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/printf'
Making install in scanf
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/scanf'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/scanf'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/scanf'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/scanf'
Making install in rand
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/rand'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/rand'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/rand'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/rand'
Making install in cxx
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/cxx'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/cxx'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/cxx'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/cxx'
Making install in demos
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos'
Making install in calc
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/calc'
make  install-am
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/calc'
make[5]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/calc'
make[5]: Nothing to be done for `install-exec-am'.
make[5]: Nothing to be done for `install-data-am'.
make[5]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/calc'
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/calc'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/calc'
Making install in expr
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/expr'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/expr'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/expr'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos/expr'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos'
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos'
make[4]: Nothing to be done for `install-exec-am'.
make[4]: Nothing to be done for `install-data-am'.
make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/demos'
Making install in tune
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tune'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tune'
make[3]: Nothing to be done for `install-exec-am'.
make[3]: Nothing to be done for `install-data-am'.
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tune'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/tune'
Making install in doc
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/doc'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/doc'
make[3]: Nothing to be done for `install-exec-am'.
 /usr/bin/mkdir -p '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/share/info'
 /usr/bin/install -c -m 644 ./gmp.info ./gmp.info-1 ./gmp.info-2 '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/share/info'
 install-info --info-dir='/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/share/info' '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/share/info/gmp.info'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/doc'
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1/doc'
make[2]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
make[3]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
 /usr/bin/mkdir -p '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/include'
 /usr/bin/mkdir -p '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/include'
 /usr/bin/mkdir -p '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/lib'
 ./x86_64-oecore-linux-libtool   --mode=install /usr/bin/install -c   libgmp.la libgmpxx.la '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/lib'
 /usr/bin/install -c -m 644 gmpxx.h '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/include'
make  install-data-hook
make[4]: Entering directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
 /usr/bin/install -c -m 644 gmp.h '/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/include'

+-------------------------------------------------------------+
| CAUTION:                                                    |
|                                                             |
x86_64-oecore-linux-libtool: install: /usr/bin/install -c .libs/libgmp.so.10.1.1 /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/lib/libgmp.so.10.1.1
| If you have not already run "make check", then we strongly  |
| recommend you do so.                                        |
|                                                             |
| GMP has been carefully tested by its authors, but compilers |
| are all too often released with serious bugs.  GMP tends to |
x86_64-oecore-linux-libtool: install: (cd /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/lib && { ln -s -f libgmp.so.10.1.1 libgmp.so.10 || { rm -f libgmp.so.10 && ln -s libgmp.so.10.1.1 libgmp.so.10; }; })
x86_64-oecore-linux-libtool: install: (cd /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/lib && { ln -s -f libgmp.so.10.1.1 libgmp.so || { rm -f libgmp.so && ln -s libgmp.so.10.1.1 libgmp.so; }; })
x86_64-oecore-linux-libtool: install: /usr/bin/install -c .libs/libgmp.lai /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/image/mnt/SSD/r0005sdk/1.0-20130528/sysroots/x86_64-oecore-linux/usr/lib/libgmp.la
| explore interesting corners in compilers and has hit bugs   |
| on quite a few occasions.                                   |
x86_64-oecore-linux-libtool: install: error: cannot install `libgmpxx.la' to a directory not ending in /mnt/SSD/r0005sdk/1.0-20130513/sysroots/x86_64-oecore-linux/usr/lib
make[3]: *** [install-libLTLIBRARIES] Error 1
make[3]: *** Waiting for unfinished jobs....
|                                                             |
+-------------------------------------------------------------+

make[4]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
make[3]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
make[2]: *** [install-am] Error 2
make[2]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory `/mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/gmp-5.1.1'
make: *** [install] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_install (log file is located at /mnt/SSD/oe-r0005/ccoR0005/tmp/work/x86_64-nativesdk-oecore-linux/nativesdk-gmp/5.1.1-r0/temp/log.do_install.22874)

--------------040603060300090809040905--
