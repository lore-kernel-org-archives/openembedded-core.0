Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qnrsc-0008Ui-Af
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 14:45:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2011 05:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,300,1309762800"; d="scan'208";a="33775942"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2011 05:41:36 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 1 Aug 2011 20:41:36 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 1 Aug 2011 20:41:35 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Mon, 1 Aug 2011
	20:41:34 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 20:41:32 +0800
Thread-Topic: [OE-core] [PATCH 1/1] python-native:	Fix	a	compiler	finding issue
Thread-Index: AcxOBEzzbGFj2GpwS1y9hz/gahgWVwCQCyGg
Message-ID: <749B9D3DBF0F054390025D9EAFF47F2212D0FCD06C@shsmsx501.ccr.corp.intel.com>
References: <cover.1311836896.git.lei.mei@intel.com>
	<2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>
	<4E317B82.1020907@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0F6D3D5@shsmsx501.ccr.corp.intel.com>
	<4E321053.1050305@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0FCC70E@shsmsx501.ccr.corp.intel.com>
	<4E32D1B3.4010707@mentor.com>
In-Reply-To: <4E32D1B3.4010707@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] python-native:	Fix	a	compiler	finding	issue
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
X-List-Received-Date: Mon, 01 Aug 2011 12:45:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Tom Rini
>Sent: Friday, July 29, 2011 11:29 PM
>To: openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler finding i=
ssue
>
>On 07/28/2011 11:58 PM, Mei, Lei wrote:
>>
>>
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>Of
>>> Tom Rini
>>> Sent: Friday, July 29, 2011 9:44 AM
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler findin=
g
>issue
>>>
>>> On 07/28/2011 06:15 PM, Mei, Lei wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>Behalf
>>> Of
>>>>> Tom Rini
>>>>> Sent: Thursday, July 28, 2011 11:09 PM
>>>>> To: openembedded-core@lists.openembedded.org
>>>>> Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler find=
ing
>>> issue
>>>>>
>>>>> On 07/28/2011 12:20 AM, Mei Lei wrote:
>>>>>> The CC variable sometimes add option information after compiler name=
,
>>> but
>>>>> python can't get the real compiler name if those information added.
>>>>>> Fix this issue by dropping the option information when finding compi=
ler
>>> name.
>>>>>>
>>>>>> Signed-off-by: Mei Lei <lei.mei@intel.com>
>>>>>
>>>>> I think this is going to cause problems when you must pass flags to g=
cc
>>>>> to have it work, eg 'gcc -m64'.
>>>>
>>>> This patch fixed your worried issue.
>>>> The CC variable, sometimes like:  "x86_64-poky-linux-gcc -m64
>>> --sysroot=3D/${TMPDIR}/sysroots/qemux86-64", contains flags information=
.
>>>> This will lead to wrong compiler name "qemux86-64" rather than
>>> "x86_64-poky-linux-gcc" when python finding the compiler name, so add t=
his
>>> patch to find the real gcc name.
>>>
>>> No, what I'm saying is I have a compiler that must be invoked as 'gcc
>>> -m64' (which is what BUILD_CC is).  So, I think after saying that, the
>>> right answer is to modify python to read the OE-specific BUILD_CC varia=
ble.
>>
>>
>> I think I didn't describe this patch exactly before.
>>
>> This patch is only for function runtime_library_dir_option, this functio=
n is to
>detect which platform we are running and what compiler we used, then decid=
e
>what option information should be passed to compiler.
>>
>> By default, our cross-compiler's name be recognized as "qemux86" rather
>than " x86_64-poky-linux-gcc" in this function, this is wrong, this will i=
nduce a
>wrong option information passed to x86_64-poky-linux-gcc and block the
>compile process.
>>
>> And function runtime_library_dir_option only return the option informati=
on,
>so didn't influence compiler name in global.
>>
>> By the way, I think BUILD_CC is host compiler name, not for target.
>
>You're patching python-native, not python, which means the host python
>and not the target python.

Yes, but I think this function will be called by python-pycairo, which will=
 use cross compiler name in this function, so we should get the compiler na=
me from CC.

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


