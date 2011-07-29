Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qmbks-0000uJ-EZ
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 03:20:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jul 2011 18:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,285,1309762800"; d="scan'208";a="32834167"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 18:16:28 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 29 Jul 2011 09:15:36 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 29 Jul 2011 09:15:35 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 29 Jul 2011 09:15:35 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2011 09:15:33 +0800
Thread-Topic: [OE-core] [PATCH 1/1] python-native: Fix a compiler finding issue
Thread-Index: AcxNOE82btDmtgACTImRfzQ/QS1wuAAVAQJA
Message-ID: <749B9D3DBF0F054390025D9EAFF47F2212D0F6D3D5@shsmsx501.ccr.corp.intel.com>
References: <cover.1311836896.git.lei.mei@intel.com>
	<2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>
	<4E317B82.1020907@mentor.com>
In-Reply-To: <4E317B82.1020907@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] python-native: Fix a compiler finding	issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2011 01:20:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Tom Rini
>Sent: Thursday, July 28, 2011 11:09 PM
>To: openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler finding i=
ssue
>
>On 07/28/2011 12:20 AM, Mei Lei wrote:
>> The CC variable sometimes add option information after compiler name, bu=
t
>python can't get the real compiler name if those information added.
>> Fix this issue by dropping the option information when finding compiler =
name.
>>
>> Signed-off-by: Mei Lei <lei.mei@intel.com>
>
>I think this is going to cause problems when you must pass flags to gcc
>to have it work, eg 'gcc -m64'.

This patch fixed your worried issue.
The CC variable, sometimes like:  "x86_64-poky-linux-gcc -m64 --sysroot=3D/=
${TMPDIR}/sysroots/qemux86-64", contains flags information.=20
This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky=
-linux-gcc" when python finding the compiler name, so add this patch to fin=
d the real gcc name.

Thanks
Lei=20


>
>--
>Tom Rini
>Mentor Graphics Corporation
>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


