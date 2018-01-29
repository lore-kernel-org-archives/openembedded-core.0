Return-Path: <Jose.DiazdeGrenu@digi.com>
X-Greylist: delayed 381 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Jan 2018 12:20:44 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD02787F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:20:43 +0000 (UTC)
Received: from [216.82.241.132] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta-8.messagelabs.com id DC/6E-03980-0201F6A5;
	Mon, 29 Jan 2018 12:14:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleJIrShJLcpLzFFi42Jx8l0noKsgkB9
	lMHkBr8X/x9vYLO78fMfuwOQx72Sgx7mNKxgDmKJYM/OS8isSWDMOX2pgLFgjXnH72meWBsYd
	wl2MXBxCAqsYJXoXfmSEcJYwSuzac5Kli5GTg03AXGLa4YMsIAkRgUlAVUv/MoIkhAUiJB4dn
	gRWJCIQKXGu/S5rFyMHkG0k8eKGFEiYRUBV4mfzahaQMK+Ar8SMBcYgYSEBF4n+9ufsIDangK
	vE/2MzwWxGAVmJledPg01nFhCXuPVkPhOILSEgILFkz3lmCFtU4uXjf6wQtrzEq3NHmCDqdSQ
	W7P7EBmFrSyxb+BqsnldAUOLkzCcsEHvVJNrmTGCewCgyC8mKWUjaZyFpn4WkfQEjyypGjeLU
	orLUIl1DC72kosz0jJLcxMwcXUMDC73c1OLixPTUnMSkYr3k/NxNjMBIqWdgYNzBuPW8+yFGS
	Q4mJVHeVafzooT4kvJTKjMSizPii0pzUosPMcpwcChJ8Bbw50cJCRalpqdWpGXmAGMWJi3Bwa
	MkwuvJB5TmLS5IzC3OTIdInWI05ni290EbM8eNF6/bmIVY8vLzUqXEeW1BJgmAlGaU5sENgqW
	SS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeT1BpvBk5pXA7XsFdAoT0CkrcnNBTilJREhJ
	NTAqPy7lEZVl+cR2dO2xne633KMemiXqxaqd2v55Y9HK7Hu3vjAc23Fq2won55qHRR+3sX6bH
	iNREbj+/KIj4bMKdUrZAq9+a/ptvMxA6WRQ06me2wyvv50TyDFN0Tjr9/+s2Y6UwqvJM54Em+
	tvaept7V4XdyJlax8DZ8kCga8qKkp/b5TEJxsosRRnJBpqMRcVJwIAfcOaLiADAAA=
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-7.tower-45.messagelabs.com!1517228064!71393579!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29779 invoked from network); 29 Jan 2018 12:14:24 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-7.tower-45.messagelabs.com with SMTP;
	29 Jan 2018 12:14:24 -0000
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 29 Jan 2018 06:14:21 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Mon, 29 Jan 2018 13:14:19 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/7] Fix first boot deferral and postinst
	error	reporting
Thread-Index: AQHTmPj2ccEkbHr+fUWYpUgzCrt/GqOKwr5Q
Date: Mon, 29 Jan 2018 12:14:18 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01BC5A66@dor-sms-xch01.digi.com>
References: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.93]
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] Fix first boot deferral and postinst error	reporting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 12:20:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I fully agree with this patchset. The old way of defining seems a bit hacky=
. Also even if you follow the documented way to create postinstallation scr=
ipts [1] you still get noisy warnings which seem like a problem.

Thanks for the effort!

[1] http://www.yoctoproject.org/docs/2.4/mega-manual/mega-manual.html#new-r=
ecipe-post-installation-scripts=20

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Alexander Kanavin
Sent: Monday, January 29, 2018 1:01 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/7] Fix first boot deferral and postinst error r=
eporting

This patchset is aiming to fix long-standing problems with package post-ins=
tallation
scriptlets:

1) The way to defer them to first boot is to issue 'exit 1'. On the other h=
and, 'exit 1' is also the way to indicate an error in the script. The patch=
es decouple these two things.

2) Scriptlets should be executed using '-e', otherwise failing commands in =
the middle of the scriptlet will not be reported as such.

3) The patchset also adds a convenient shortcut for deferring scriptlets to=
 first boot execution:

pkg_postinst_ontarget_PACKAGENAME() {
      # Actions to carry out on the device go here
      ....
}

The following changes since commit 0c537554fc2cf58a9cbfeaf39ed918c607483dce=
:

  testimage: enable gi test suite (2018-01-29 10:31:58 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/dnf-rpm4-postinst-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/dnf-r=
pm4-postinst-fix

Alexander Kanavin (7):
  postinst_intercepts: add a delay_to_first_boot hook
  meta/lib/oe/rootfs.py: separate first boot deferral logic into a
    separate function
  meta/lib/oe/rootfs.py: do not execute defer_to_first_boot when
    processing postinst_intercept hooks
  package.bbclass: add support for pkg_postinst_ontarget()
  meta/lib/oe/package_manager.py: deprecate 'exit 1' as a way to defer
    to first boot
  package_rpm.bbclass: run pre/post installation scriptlets using sh -e
  rootfs.py: change the notice about deferring scripts to first boot
    from warning to a note

 .../recipes-test/postinst/postinst_1.0.bb          | 14 ++------
 meta/classes/package.bbclass                       | 20 +++++++++++
 meta/classes/package_rpm.bbclass                   |  8 ++---
 meta/lib/oe/package_manager.py                     |  3 ++
 meta/lib/oe/rootfs.py                              | 39 +++++++++++++-----=
----
 scripts/postinst-intercepts/delay_to_first_boot    |  2 ++
 6 files changed, 54 insertions(+), 32 deletions(-)  create mode 100644 scr=
ipts/postinst-intercepts/delay_to_first_boot

--
2.15.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

