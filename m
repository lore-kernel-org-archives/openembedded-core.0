Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0AB560926
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 01:15:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0241Ef91026939
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 3 Mar 2020 17:14:41 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.75]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0487.000;
	Tue, 3 Mar 2020 17:14:28 -0800
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "chet.ramey@case.edu" <chet.ramey@case.edu>, "Mittal, Anuj"
	<anuj.mittal@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"Huo, De" <De.Huo@windriver.com>,
	"preid@electromag.com.au" <preid@electromag.com.au>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Thread-Topic: [OE-core] bash: Fix CVE-2019-18276
Thread-Index: AQHV5nEF1mNPtkf9pEeXfnWEUuCQSaghnagAgBSmwkWAATubgIAANrZQ
Date: Wed, 4 Mar 2020 01:14:27 +0000
Message-ID: <E6F6D39CB834524199A3A6D928AB1465539F47F1@ALA-MBD.corp.ad.wrs.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
	<E6F6D39CB834524199A3A6D928AB1465539F327D@ALA-MBD.corp.ad.wrs.com>,
	<ee8f4da6-d917-4dab-d166-62bd7dcf6142@case.edu>
In-Reply-To: <ee8f4da6-d917-4dab-d166-62bd7dcf6142@case.edu>
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
X-List-Received-Date: Wed, 04 Mar 2020 01:15:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Chet very much for your confirmation!

If the commit fixs the CVE-2019-18276, why is it merged to the master branc=
h?

Thanks,
Mingli
________________________________________
From: Chet Ramey [chet.ramey@case.edu]
Sent: Tuesday, March 03, 2020 9:55 PM
To: Yu, Mingli; Mittal, Anuj; richard.purdie@linuxfoundation.org; openembed=
ded-core@lists.openembedded.org; Huo, De; preid@electromag.com.au; akuster8=
08@gmail.com
Cc: chet.ramey@case.edu
Subject: Re: [OE-core] bash: Fix CVE-2019-18276

On 3/2/20 10:11 PM, Yu, Mingli wrote:

> Does https://git.savannah.gnu.org/cgit/bash.git/commit/?h=3Ddevel&id=3D95=
1bdaad7a18cc0dc1036bba86b18b90874d39ff fix the issue reported in CVE-2019-1=
8276? Could you help to provide some info here?

Yes, the changes from 6/27 fix the issue in the CVE.


--
``The lyf so short, the craft so long to lerne.'' - Chaucer
                 ``Ars longa, vita brevis'' - Hippocrates
Chet Ramey, UTech, CWRU    chet@case.edu    http://tiswww.cwru.edu/~chet/=

