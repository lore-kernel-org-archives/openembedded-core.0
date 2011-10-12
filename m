Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RDnya-0000hq-Gg
	for openembedded-core@openembedded.org; Wed, 12 Oct 2011 03:51:20 +0200
Received: from mail111-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.22; Wed, 12 Oct 2011 01:30:34 +0000
Received: from mail111-ch1 (localhost.localdomain [127.0.0.1])	by
	mail111-ch1-R.bigfish.com (Postfix) with ESMTP id CB7351570484	for
	<openembedded-core@openembedded.org>;
	Wed, 12 Oct 2011 01:30:34 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzzz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail111-ch1 (localhost.localdomain [127.0.0.1]) by mail111-ch1
	(MessageSwitch) id 1318383024372585_11769;
	Wed, 12 Oct 2011 01:30:24 +0000 (UTC)
Received: from CH1EHSMHS006.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.247])	by mail111-ch1.bigfish.com (Postfix) with ESMTP id
	4E5E519B8058	for <openembedded-core@openembedded.org>; Wed, 12 Oct 2011
	01:30:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS006.bigfish.com
	(10.43.70.6) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 12 Oct 2011 01:30:21 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.225]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 11 Oct 2011 20:30:20 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Thread-Topic: Comparing sig's for some recipes - task dependecies
Thread-Index: AQHMiH6Am30n+LqzGkepViH/kVDyXQ==
Date: Wed, 12 Oct 2011 01:30:19 +0000
Message-ID: <CAEsOVNcF7NaOwBC401fS9eWnSwdHEuB0SUqL4+KnqyS5=cjVRQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Comparing sig's for some recipes - task dependecies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 12 Oct 2011 01:51:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <10575AB6C5051B44922F2C40A448D561@freescale.net>
Content-Transfer-Encoding: quoted-printable

All,

I'm doing some basic sstate testing as follows (note: strace is just
an example package used):

$ cd  /opt/yocto/cache-build/p1020rdb
$ source oe-init-env-build
$ bitbake strace
$ cd /opt/yocto/cache-test/p1020rdb
$ source oe-init-env-build
$ cp /opt/yocto/cache-build/p1020rdb/build/sstate-cache/* sstate-cache/
$ bitbake strace

I'm left with two instances of some sstate-cache:

$ bitbake-diffsig
sstate-cache/sstate-strace-ppce5500-fsl-linux-4.5.20-r2-ppce5500-2-*_deploy=
-rpm.tgz.siginfo
Dependency on task
/opt/yocto/cache-test/meta/recipes-devtools/perl/perl_5.12.3.bb.do_package
was added
Dependency on task
virtual:native:/opt/yocto/cache-test/meta/recipes-devtools/pseudo/pseudo_1.=
1.1.bb.do_populate_sysroot
was added
Dependency on task
/opt/yocto/cache-test/meta/recipes-devtools/strace/strace_4.5.20.bb.do_pack=
age
was added
Dependency on task
virtual:native:/opt/yocto/cache-test/meta/recipes-devtools/rpm/rpm_5.4.0.bb=
.do_populate_sysroot
was added
Dependency on task
virtual:native:/opt/yocto/cache-build/p1020rdb/meta/recipes-devtools/pseudo=
/pseudo_1.1.1.bb.do_populate_sysroot
was removed
Dependency on task
/opt/yocto/cache-build/p1020rdb/meta/recipes-devtools/strace/strace_4.5.20.=
bb.do_package
was removed
Dependency on task
/opt/yocto/cache-build/p1020rdb/meta/recipes-devtools/perl/perl_5.12.3.bb.d=
o_package
was removed
Dependency on task
virtual:native:/opt/yocto/cache-build/p1020rdb/meta/recipes-devtools/rpm/rp=
m_5.4.0.bb.do_populate_sysroot
was removed

It seems like just the task paths are changing which should not really
be an issue? Although I admit it could for some packages. This seems
to be happening for a lot of packages I'm building as well and not
just strace.

-M=



