Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C4C6771DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 22:25:50 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jan 2017 14:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="57334300"
Received: from unknown (HELO jairdejeMOBL3) ([10.219.17.214])
	by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2017 14:25:50 -0800
From: "Jair Gonzalez" <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: "'Leonardo Sandoval'" <leonardo.sandoval.gonzalez@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1485193773.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
	<20170123185334.23275.18839@do.openembedded.org>
	<77e394cd-16df-205b-cc20-a88ef3817038@linux.intel.com>
In-Reply-To: <77e394cd-16df-205b-cc20-a88ef3817038@linux.intel.com>
Date: Mon, 23 Jan 2017 16:25:49 -0600
Message-ID: <00db01d275c7$a6db7e70$f4927b50$@linux.intel.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQK80hzxTEWfBANOpt00Q9Dfazff6QG0vp52AzGji/afSrG84A==
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODA4ZDIzYjUtZTdlNi00MmYzLWE2MGQtYmUyYjYzYzk1ZGU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IldXcElDWUdhZm9zaTVBZWJrd0xoRTZsbVphZSt6TE5DZUorZkNaSjd3UE09In0=
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFFBOiBjcmVhdGUgdW5pdCB0ZXN0cyBmb3IgZXZlbnQgbW9kdWxl?=
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
X-List-Received-Date: Mon, 23 Jan 2017 22:25:51 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us

Leonardo,

Thank you for the clarification and sorry for the error. I'll re-submit =
it to the correct list.

Regards,
Jair

> -----Original Message-----
> From: Leonardo Sandoval
> [mailto:leonardo.sandoval.gonzalez@linux.intel.com]
> Sent: Monday, January 23, 2017 3:13 PM
> To: openembedded-core@lists.openembedded.org; Jair Gonzalez
> <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
> Subject: Re: [OE-core] =E2=9C=97 patchtest: failure for QA: create =
unit tests for event
> module
>=20
> Jair, patchtest failed because your series is intended for bitbake =
project, not
> oe-core. Please send your series to
>=20
>      Mailing list: bitbake-devel@lists.openembedded.org
>=20
>=20
>=20
> On 01/23/2017 12:53 PM, Patchwork wrote:
> > =3D=3D Series Details =3D=3D
> >
> > Series: QA: create unit tests for event module
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/4918/
> > State : failure
> >
> > =3D=3D Summary =3D=3D
> >
> >
> > Thank you for submitting this patch series to OpenEmbedded Core. =
This
> > is an automated response. Several tests have been executed on the
> > proposed series by patchtest resulting in the following failures:
> >
> >
> >
> > * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
> >    Suggested fix    Rebase your series on top of targeted branch
> >    Targeted branch  master (currently at 842ad404b3)
> >
> >
> >
> > If you believe any of these test results are incorrect, please reply
> > to the mailing list (openembedded-core@lists.openembedded.org) =
raising
> your concerns.
> > Otherwise we would appreciate you correcting the issues and =
submitting
> > a new version of the patchset if applicable. Please ensure you
> > add/increment the version number when sending the new version (i.e.
> > [PATCH] -> [PATCH v2] -> [PATCH v3] -> ...).
> >
> > ---
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     =
http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >



