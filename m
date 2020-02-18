Return-Path: <De.Huo@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32AD96021C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 02:47:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01I2kE8i018213
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 17 Feb 2020 18:46:24 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.168]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Mon, 17 Feb 2020 18:46:04 -0800
From: "Huo, De" <De.Huo@windriver.com>
To: "chet.ramey@case.edu" <chet.ramey@case.edu>, Phil Reid
	<preid@electromag.com.au>, "akuster808@gmail.com" <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Patches and
	discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: bash: Fix CVE-2019-18276
Thread-Index: AQHV5Z4qZTbV/Yg+HUmTF5baP1M/zKggPyY3
Date: Tue, 18 Feb 2020 02:46:04 +0000
Message-ID: <444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>,
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
In-Reply-To: <4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.16.163]
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
X-List-Received-Date: Tue, 18 Feb 2020 02:47:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 I applied the patch to fix CVE defect CVE-2019-18276.=0A=
Can I reproduce this failure on my side?=0A=
________________________________________=0A=
From: Chet Ramey [chet.ramey@case.edu]=0A=
Sent: Monday, February 17, 2020 10:24 PM=0A=
To: Phil Reid; Huo, De; akuster808@gmail.com; Richard Purdie; Patches and d=
iscussions about the oe-core layer=0A=
Cc: chet.ramey@case.edu=0A=
Subject: Re: bash: Fix CVE-2019-18276=0A=
=0A=
On 2/16/20 9:56 PM, Phil Reid wrote:=0A=
> Hi All,=0A=
>=0A=
> I recently started get the following failure with bash after "b348e31c93f=
0=0A=
> bash: Fix CVE-2019-18276"=0A=
> was applied to zeus.=0A=
>=0A=
> Any thoughts?=0A=
=0A=
What is the `Fix CVE-2019-18276' patch? Who supplied it?=0A=
=0A=
--=0A=
``The lyf so short, the craft so long to lerne.'' - Chaucer=0A=
                 ``Ars longa, vita brevis'' - Hippocrates=0A=
Chet Ramey, UTech, CWRU    chet@case.edu    http://tiswww.cwru.edu/~chet/=
=0A=

