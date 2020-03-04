Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 823D8618E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 01:16:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0241GhkU027118
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 3 Mar 2020 17:16:43 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.75]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0487.000;
	Tue, 3 Mar 2020 17:16:43 -0800
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] bash: Fix CVE-2019-18276
Thread-Index: AQHV5nEF1mNPtkf9pEeXfnWEUuCQSaghnagAgBSmwkWAAeG1gP//kZFC
Date: Wed, 4 Mar 2020 01:16:42 +0000
Message-ID: <E6F6D39CB834524199A3A6D928AB1465539F4804@ALA-MBD.corp.ad.wrs.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	,<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
	<E6F6D39CB834524199A3A6D928AB1465539F327D@ALA-MBD.corp.ad.wrs.com>,
	<5cc81afa618ea969dc3d03f6e7ce356ec08e8efe.camel@intel.com>
In-Reply-To: <5cc81afa618ea969dc3d03f6e7ce356ec08e8efe.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.26.212]
MIME-Version: 1.0
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Wed, 04 Mar 2020 01:16:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Got it, thanks Anuj!

Thanks,
Mingli
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Mittal, Anuj [anuj.mittal@intel=
.com]
Sent: Wednesday, March 04, 2020 7:49 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] bash: Fix CVE-2019-18276

On Tue, 2020-03-03 at 03:11 +0000, Yu, Mingli wrote:
> Hi Anuj,
>
> I agree the Backport status is not accurate as the patch doesn't go
> to master branch, but why do you say the patch is irrelevant to the
> CVE-2019-18276, could you help to provide more info?

I didn't say that the patch was irrelevant to the CVE. I had said that
not all the changes were relevant. I believe the glob changes in the
patch were irrelevant. Those changes also introduced a failure in bash
ptests.

Thanks,

Anuj
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core=

