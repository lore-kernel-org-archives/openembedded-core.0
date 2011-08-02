Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qo5Ps-0001a3-MY
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 05:13:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 20:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,304,1309762800"; d="scan'208";a="34481536"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 20:08:50 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 2 Aug 2011 11:08:15 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Tue, 2 Aug 2011
	11:08:15 +0800
From: "Mei, Lei" <lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 2 Aug 2011 11:08:14 +0800
Thread-Topic: [OE-core] [PATCH 1/1]	python-native:	Fix	a	compiler	finding issue
Thread-Index: AcxQcDBHR5wY37QbSBuc61NLCvnISAAT96qQ
Message-ID: <749B9D3DBF0F054390025D9EAFF47F2212D0FCD355@shsmsx501.ccr.corp.intel.com>
References: <cover.1311836896.git.lei.mei@intel.com>
	<2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>
	<4E317B82.1020907@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0F6D3D5@shsmsx501.ccr.corp.intel.com>
	<4E321053.1050305@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0FCC70E@shsmsx501.ccr.corp.intel.com>
	<4E32D1B3.4010707@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0FCD06C@shsmsx501.ccr.corp.intel.com>
	<20110801172718.GB7798@sakrah.homelinux.org>
In-Reply-To: <20110801172718.GB7798@sakrah.homelinux.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1]	python-native:	Fix	a	compiler	finding	issue
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
X-List-Received-Date: Tue, 02 Aug 2011 03:13:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>Khem Raj
>Sent: Tuesday, August 02, 2011 1:27 AM
>To: Patches and discussions about the oe-core layer
>Subject: Re: [OE-core] [PATCH 1/1] python-native: Fix a compiler finding i=
ssue
>
>On (01/08/11 20:41), Mei, Lei wrote:
>>
>> >
>> >You're patching python-native, not python, which means the host python
>> >and not the target python.
>>
>> Yes, but I think this function will be called by python-pycairo, which w=
ill use
>cross compiler name in this function, so we should get the compiler name f=
rom
>CC.
>
>so we inject the cross compiler name hardcoded into python and then
>python uses it when it needs to do cross compilation ?

No hardcode, I think. Python use the cross compiler name from CC, which wil=
l be exported to environment when we do cross compilation.
If environment didn't define the CC, the default compiler name will be used=
, I mean, host compiler name.

Thanks
Lei

>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


