Return-Path: <cathy.shen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EBE0965C89
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 01:52:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2015 18:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,389,1432623600"; d="scan'208";a="738911716"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2015 18:52:14 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	KMSMSX152.gar.corp.intel.com (172.21.73.87) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 2 Jul 2015 09:52:13 +0800
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.46]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.246]) with mapi id
	14.03.0224.002; Thu, 2 Jul 2015 09:52:12 +0800
From: "Shen, Cathy" <cathy.shen@intel.com>
To: "Zhang, JunhuiX" <junhuix.zhang@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] testimage: Support full TC path such
	oeqa.runtime.pnp.get_memory_size in TEST_SUITES
Thread-Index: AQHQrYlU7wTR2Ch2EkCs+q9Wy32k+53HeCJA
Date: Thu, 2 Jul 2015 01:52:12 +0000
Message-ID: <9CF54C48BF4DE04F9D8FBEB712F28E401106CCF7@SHSMSX103.ccr.corp.intel.com>
References: <1435046066-2894-1-git-send-email-junhuix.zhang@intel.com>
In-Reply-To: <1435046066-2894-1-git-send-email-junhuix.zhang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] testimage: Support full TC path such	oeqa.runtime.pnp.get_memory_size in TEST_SUITES
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
X-List-Received-Date: Thu, 02 Jul 2015 01:52:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are we OK with this patch?

-Cathy

>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of zjh
>Sent: Tuesday, June 23, 2015 3:54 PM
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [PATCH 1/2] testimage: Support full TC path such
>oeqa.runtime.pnp.get_memory_size in TEST_SUITES
>
>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7834
>
>If a TC name start with "oeqa", it is thought as a full TC path. if not,
>follow original logic (assume under oeqa.runtime), and this case will be  =
  7 load by
>loadTests.
>for example:
>TEST_SUITES =3D "oeqa.runtime.pnp.get_memory_size oeqa.runtime.sanity.rebo=
ot"
>this will run these two case when bitbake -c testimage
>
>Signed-off-by: zjh <junhuix.zhang@intel.com>
>---
> meta/classes/testimage.bbclass | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcla=
ss
>index 4074ff7..5d74fe4 100644
>--- a/meta/classes/testimage.bbclass
>+++ b/meta/classes/testimage.bbclass
>@@ -77,6 +77,9 @@ def get_tests_list(d, type=3D"runtime"):
>     testslist =3D []
>     for testname in testsuites:
>         if testname !=3D "auto":
>+            if testname.startswith("oeqa."):
>+                testslist.append(testname)
>+                continue
>             found =3D False
>             for p in bbpath:
>                 if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, te=
stname +
>'.py')):
>--
>1.9.1
>
>--
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core

