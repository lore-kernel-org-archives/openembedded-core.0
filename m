Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ2wt-0005UM-7O
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 21:43:55 +0200
Received: by wwb17 with SMTP id 17so1850738wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=3Uygcj3Uep4Xho9yR7GC7KBNAHqWUIkeqcWReGkFNQs=;
	b=NSK35aWZIyxPPOkEjEqfn8fqioERy7/ee/6ldofljMOEDJ214PF1hM6qJWLmtToZra
	IR/RaRs7WZQE9X7WIY93yJo5fhN2HSKez3XoXTHkePn/dtO+JCsA3qbl3AXfuDbtK2qM
	6aY/UaaldSsk9EnI/mA4kNfG3IwjbCABpWA/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=JSe1UqsAv4HQsMKrgdy4bX8Qf6gufBHwYidIsOhgpMagg9xDeoz8VA8WV4OHF0czQa
	16wBiQ2ZlsltLlpMWN2IxgYxgfcvEzDURZ2SOXw2o+8O9GeN8FqHc7MPMspy3QUMcOjh
	hR/KhZnEubwnWOO/kuyH8Vq6ScuQ6vQX3TfbU=
Received: by 10.216.55.193 with SMTP id k43mr2393036wec.51.1306525250131; Fri,
	27 May 2011 12:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.60.145 with HTTP; Fri, 27 May 2011 12:40:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 May 2011 12:40:20 -0700
Message-ID: <BANLkTi=O=CFrCTNEow0=yxFbuooUP6DbyQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Get PRAUTO and use PKGV/PKGR is causing problems
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
X-List-Received-Date: Fri, 27 May 2011 19:43:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have started getting this error.

ERROR: Error executing a python function in
/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/uclibc/uclibc_git.bb:
ImportError: No module named xmlrpc

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "package_get_auto_pr", line 11, in <module>
ERROR:
ERROR:   File "package_get_auto_pr", line 4, in package_get_auto_pr
ERROR:
ERROR:   File "prserv.bbclass", line 8, in prserv_get_pr_auto
ERROR:
ERROR:   File "prserv.bbclass", line 2, in prserv_make_conn
ERROR:
ERROR:   File "/home/kraj/work/slugos/bitbake/lib/prserv/serv.py",
line 6, in <module>
ERROR:     import bb.server.xmlrpc
ERROR:
ERROR: The code that was being executed was:
ERROR:      0007:                       return
ERROR:      0008:               d.setVar('PRAUTO',str(auto_pr))
ERROR:      0009:
ERROR:      0010:
ERROR:  *** 0011:package_get_auto_pr(d)
ERROR:      0012:
ERROR: (file: 'package_get_auto_pr', lineno: 11, function: <module>)
ERROR:      0001:
ERROR:      0002:def package_get_auto_pr(d):
ERROR:      0003:       if d.getVar('USE_PR_SERV', True):
ERROR:  *** 0004:               auto_pr=prserv_get_pr_auto(d)
ERROR:      0005:               if auto_pr is None:
ERROR:      0006:                       bb.fatal("Can NOT get auto PR
revision from remote PR service")
ERROR:      0007:                       return
ERROR:      0008:               d.setVar('PRAUTO',str(auto_pr))
ERROR: (file: 'package_get_auto_pr', lineno: 4, function: package_get_auto_pr)
ERROR: Function 'package_get_auto_pr' failed
ERROR: Logfile of failure stored in:
/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-uclibc/work/efikamx-angstrom-linux-uclibceabi/uclibc-0.9.31+0.9.32rc3-r2.2/temp/log.do_package.3715
Log data follows:
| ERROR: Error executing a python function in
/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/uclibc/uclibc_git.bb:
| ImportError: No module named xmlrpc
|
| ERROR: The stack trace of python calls that resulted in this
exception/failure was:
| ERROR:   File "package_get_auto_pr", line 11, in <module>
| ERROR:
| ERROR:   File "package_get_auto_pr", line 4, in package_get_auto_pr
| ERROR:
| ERROR:   File "prserv.bbclass", line 8, in prserv_get_pr_auto
| ERROR:
| ERROR:   File "prserv.bbclass", line 2, in prserv_make_conn
| ERROR:
| ERROR:   File "/home/kraj/work/slugos/bitbake/lib/prserv/serv.py",
line 6, in <module>
| ERROR:     import bb.server.xmlrpc
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0007:                     return
| ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
| ERROR:      0009:
| ERROR:      0010:
| ERROR:  *** 0011:package_get_auto_pr(d)
| ERROR:      0012:
| ERROR: (file: 'package_get_auto_pr', lineno: 11, function: <module>)
| ERROR:      0001:
| ERROR:      0002:def package_get_auto_pr(d):
| ERROR:      0003:     if d.getVar('USE_PR_SERV', True):
| ERROR:  *** 0004:             auto_pr=prserv_get_pr_auto(d)
| ERROR:      0005:             if auto_pr is None:
| ERROR:      0006:                     bb.fatal("Can NOT get auto PR
revision from remote PR service")
| ERROR:      0007:                     return
| ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
| ERROR: (file: 'package_get_auto_pr', lineno: 4, function: package_get_auto_pr)
| ERROR: Function 'package_get_auto_pr' failed
NOTE: package uclibc-0.9.31+0.9.32rc3-r2.2: task do_package: Failed
ERROR: Task 9 (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/uclibc/uclibc_git.bb,
do_package) failed with exit code '1'
ERROR: '/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/uclibc/uclibc_git.bb'
failed


After bisecting this seems to be the point of cause. What am I missing.
I am using angstrom. Is there something needed in config ?

b1f6120c04731d3d66f322ce550b0d223c118dab is the first bad commit
commit b1f6120c04731d3d66f322ce550b0d223c118dab
Author: Lianhao Lu <lianhao.lu@intel.com>
Date:   Wed May 18 21:15:01 2011 +0800

    classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.

    1. Added package_get_auto_pr to PACKAGEFUNCS to get the auto
    incremented value(PRAUTO) from remote PR service.

    2. use PKGV/PKGR for pkgdata which will be used by package_write_xxx.

    3. Added supporting functions in prserv.bbclass.

    Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>


