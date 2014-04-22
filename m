Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 51F66609AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 13:21:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2014 06:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,904,1389772800"; d="scan'208";a="524855188"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2014 06:21:40 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.183]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.98]) with mapi id
	14.03.0123.003; Tue, 22 Apr 2014 14:20:44 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: WSR: WW15 & WW16 Corneliu Stoicescu
Thread-Index: Ac9eLVD6s6ToP3jyTzOVedmyuKY52A==
Date: Tue, 22 Apr 2014 13:20:43 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A253AFB@IRSMSX103.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: WSR: WW15 & WW16 Corneliu Stoicescu
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
X-List-Received-Date: Tue, 22 Apr 2014 13:21:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

WW15:
	- OOO WW15.4
	- Finished 1.6 M5 RC2 Full Pass=20
	- Started 1.6 M5 RC4 Full Pass
	- Verified QA owned bugs=20
	- Tried to boot beaglebone image on a beaglebone black board. The kernel h=
ad some issues and are logged in this bug: https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D6165=20

WW16:
	- Finished 1.6 M5 RC4 Full Pass
		* Also did the beaglebone black stress testing
		* send out the final report to the oe-core mailing list
	- Verified feature: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D54=
56
	- Verified QA owned bugs

Next WW17:
	- OOO WW17.1
	- beaglebone black re-testing for kernel boot fixes (post 1.6_M5_RC4)
	- re-organize tests in Testopia and oe-selftest
		* some test cases in Testopia should be moved on other products that make=
 more sense for them.
		* in order to better correlate oe-selftest and Testopia tests, we should =
have a clear correlation between oe-selftest tests modules and Testopia pro=
ducts. We will do this by having exactly 1 module for each Testopia product=
 (eg: bitbake, oe-core, meta-yocto, toaster, etc.)
	- Send  RFC on oe-core mailing list about possible developer-oriented oe-s=
elftest improvements
		* we have some proposals for developer oriented improvements to oe-selfte=
st; these should help them better test patches before submission and it sho=
uld be easy and straightforward to use.=20

Regards,
Corneliu Stoicescu
Yocto QA

