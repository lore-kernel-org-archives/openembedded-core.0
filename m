Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 02804787B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 19:48:31 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 11:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,443,1505804400"; d="scan'208";a="179362153"
Received: from rowlandm-mobl.amr.corp.intel.com ([10.254.126.215])
	by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2017 11:48:33 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 23 Nov 2017 12:48:32 -0700
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
	<20171123183755.2786.77539@do.openembedded.org>
	<51B97520-F81D-4567-A4EB-17D52CE2968A@linux.intel.com>
	<EE6427AE-250D-4EB7-A63A-14AAD7B226FD@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <EE6427AE-250D-4EB7-A63A-14AAD7B226FD@linux.intel.com>
Message-Id: <D9EA3C8D-7E13-452D-847E-70A8B45402B7@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFkZCBweXBpLmJiY2xhc3M7IHB5dGhvbiBpbXByb3ZlbWVudHM=?=
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
X-List-Received-Date: Thu, 23 Nov 2017 19:48:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I stand corrected. When I try to apply the mbox file from patchwork it =
throws:

error: patch fragment without header at line 147: @@ -172,6 +172,10 @@ =
SUMMARY_${PN}-png                                                        =
                          util=3D"Python package extension utility =
support=E2=80=9D

My guess is this is because the manifest files have lines that are 2500+ =
characters long.


> On Nov 23, 2017, at 12:31 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> I just manually applied the entire series on top of openembedded-core =
master, so this is definitely a false positive.
>=20
>> On Nov 23, 2017, at 12:10 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>>=20
>> This seems like a false positive, as this series is based on top of =
master?
>>=20
>> Is it expecting master for =E2=80=9Cpoky=E2=80=9D or master for =
=E2=80=9Copenembedded-core=E2=80=9D?
>>=20
>>> On Nov 23, 2017, at 11:37 AM, Patchwork =
<patchwork@patchwork.openembedded.org> wrote:
>>>=20
>>> =3D=3D Series Details =3D=3D
>>>=20
>>> Series: Add pypi.bbclass; python improvements
>>> Revision: 1
>>> URL   : https://patchwork.openembedded.org/series/9940/
>>> State : failure
>>>=20
>>> =3D=3D Summary =3D=3D
>>>=20
>>>=20
>>> Thank you for submitting this patch series to OpenEmbedded Core. =
This is
>>> an automated response. Several tests have been executed on the =
proposed
>>> series by patchtest resulting in the following failures:
>>>=20
>>>=20
>>>=20
>>> * Issue             Series does not apply on top of target branch =
[test_series_merge_on_head]=20
>>> Suggested fix    Rebase your series on top of targeted branch
>>> Targeted branch  master (currently at 33418ed064)
>>>=20
>>>=20
>>>=20
>>> If you believe any of these test results are incorrect, please reply =
to the
>>> mailing list (openembedded-core@lists.openembedded.org) raising your =
concerns.
>>> Otherwise we would appreciate you correcting the issues and =
submitting a new
>>> version of the patchset if applicable. Please ensure you =
add/increment the
>>> version number when sending the new version (i.e. [PATCH] -> [PATCH =
v2] ->
>>> [PATCH v3] -> ...).
>>>=20
>>> ---
>>> Guidelines:     =
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>>> Test suite:     =
http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>>=20
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


