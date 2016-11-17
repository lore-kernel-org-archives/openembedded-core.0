Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7DC86E666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:20:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2016 10:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,506,1473145200"; d="scan'208";a="192658041"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2016 10:20:47 -0800
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 17 Nov 2016 10:20:47 -0800
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.55]) by
	FMSMSX102.amr.corp.intel.com ([169.254.10.135]) with mapi id
	14.03.0248.002; Thu, 17 Nov 2016 10:20:47 -0800
From: "Pedraza Gonzalez, Francisco J" <francisco.j.pedraza.gonzalez@intel.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] Test needed to verify postinst script order.
Thread-Index: AQHSP6N3W32Xj2+/A0+NB/Uzz6x7NqDdnxwAgAA3ooD//6hGXg==
Date: Thu, 17 Nov 2016 18:20:46 +0000
Message-ID: <475C95148A21B945A7A18605A8298B991028E82D@fmsmsx107.amr.corp.intel.com>
References: <1479257423-4281-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com>,
	<358803d5-7678-9c6e-2017-9007263d02d5@linux.intel.com>
In-Reply-To: <358803d5-7678-9c6e-2017-9007263d02d5@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.42]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Test needed to verify postinst script order.
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
X-List-Received-Date: Thu, 17 Nov 2016 18:20:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Sure I can send a patch with the updates.
Ross: Could you please give more details about PACKAGE_CLASSES?, I am not v=
ery familiar with.
Regards,
Paco
________________________________________
From: Jose Perez Carranza [jose.perez.carranza@linux.intel.com]
Sent: Thursday, November 17, 2016 7:33 AM
To: Burton, Ross; Pedraza Gonzalez, Francisco J
Cc: OE-core
Subject: Re: [OE-core] [PATCH] Test needed to verify postinst script order.

On 11/17/2016 06:14 AM, Burton, Ross wrote:

On 16 November 2016 at 00:50, Francisco Pedraza <francisco.j.pedraza.gonzal=
ez@intel.com<mailto:francisco.j.pedraza.gonzalez@intel.com>> wrote:
Will verify the following:
1. Compile a minimal image.
2. The compiled image will add the created layer with the
recipes postinstz postinsta postinstb postinstd postinstp postinstt
created previously at "meta-selftest/recipes-test"
2. Run qemu
3. Validate the task execution order.
V4

This is missing the test that some postinsts should be happening at rootfs =
time.
I have assigned the bug 8433 and I will send a different patch to add those=
 test cases, I'm just waiting to the final implementation of this  patch to=
 be accepted to avoid execution and merge conflicts.

Also, can it permute PACKAGE_CLASSES (rotate through all three options) so =
it exercises all backends.

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com<ma=
ilto:francisco.j.pedraza.gonzalez@intel.com>>
---
 .../recipes-test/postinsta/postinsta_1.0.bb<http://postinsta_1.0.bb>      =
  | 20 +++++++++++
 .../recipes-test/postinstb/postinstb_1.0.bb<http://postinstb_1.0.bb>      =
  | 22 ++++++++++++
 .../recipes-test/postinstd/postinstd_1.0.bb<http://postinstd_1.0.bb>      =
  | 22 ++++++++++++
 .../recipes-test/postinstp/postinstp_1.0.bb<http://postinstp_1.0.bb>      =
  | 22 ++++++++++++
 .../recipes-test/postinstt/postinstt_1.0.bb<http://postinstt_1.0.bb>      =
  | 22 ++++++++++++
 .../recipes-test/postinstz/postinstz_1.0.bb<http://postinstz_1.0.bb>      =
  | 12 +++++++

For clarity can all of these be squashed into a single recipe with clearer =
names?

Ross




