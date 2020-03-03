Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5953B60637
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 03:13:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0233BBqj006245
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 2 Mar 2020 19:11:21 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.75]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0487.000;
	Mon, 2 Mar 2020 19:11:01 -0800
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "chet.ramey@case.edu"
	<chet.ramey@case.edu>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"Huo, De" <De.Huo@windriver.com>,
	"preid@electromag.com.au" <preid@electromag.com.au>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Thread-Topic: [OE-core] bash: Fix CVE-2019-18276
Thread-Index: AQHV5nEF1mNPtkf9pEeXfnWEUuCQSaghnagAgBSmwkU=
Date: Tue, 3 Mar 2020 03:11:00 +0000
Message-ID: <E6F6D39CB834524199A3A6D928AB1465539F327D@ALA-MBD.corp.ad.wrs.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>,
	<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
In-Reply-To: <41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.26.223]
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
X-List-Received-Date: Tue, 03 Mar 2020 03:13:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I agree the Backport status is not accurate as the patch doesn't go to mast=
er branch, but why do you say the patch is irrelevant to the CVE-2019-18276=
, could you help to provide more info?

Hi Chet,
Does https://git.savannah.gnu.org/cgit/bash.git/commit/?h=3Ddevel&id=3D951b=
daad7a18cc0dc1036bba86b18b90874d39ff fix the issue reported in CVE-2019-182=
76? Could you help to provide some info here?

Thanks,
Mingli
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Mittal, Anuj [anuj.mittal@intel=
.com]
Sent: Tuesday, February 18, 2020 11:43 PM
To: chet.ramey@case.edu; richard.purdie@linuxfoundation.org; openembedded-c=
ore@lists.openembedded.org; Huo, De; preid@electromag.com.au; akuster808@gm=
ail.com
Subject: Re: [OE-core] bash: Fix CVE-2019-18276

On Tue, 2020-02-18 at 15:35 +0000, Richard Purdie wrote:
> On Tue, 2020-02-18 at 10:28 -0500, Chet Ramey wrote:
> > On 2/17/20 9:46 PM, Huo, De wrote:
> > >  I applied the patch to fix CVE defect CVE-2019-18276.
> >
> > That's not exactly an answer to the question of who produced the
> > patch.
> > If that patch is the one causing failures when it's applied,
> > doesn't it
> > make sense to go back to the person who produced it and ask them to
> > update it if necessary?
>
> Its likely a general CVE patch where both configure and configure.ac
> are patched. For OE, we can drop the configure part since we
> reautoconf
> the code. Its therefore the OE port of the patch which is likely at
> fault.
>
> Someone just needs to remove that section of the patch.

There are other issues with this patch which should also be fixed I
think. It has been marked as a Backport while it is not one. The patch
includes changes that are irrelevant to the CVE. And, it should have
gone to master first.


Thanks,

Anuj
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core=

