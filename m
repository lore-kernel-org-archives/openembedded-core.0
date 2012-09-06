Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1T9cpQ-0006zp-Ho
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 16:13:08 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1T9cdO-00060v-Nm from Noor_Ahsan@mentor.com ;
	Thu, 06 Sep 2012 07:00:42 -0700
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 6 Sep 2012 07:00:42 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.57]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.01.0289.001; Thu, 6 Sep 2012 15:00:41 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: jhuang0 <jackie.huang@windriver.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] quota 4.00: add DEPENDS gettext-native
Thread-Index: AQHNgacx6d2yVlnQ1keOsEbi4qstHZd9bISQ
Date: Thu, 6 Sep 2012 14:00:40 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699945BDAC44A@EU-MBX-03.mgc.mentorg.com>
References: <cover.1343032359.git.jackie.huang@windriver.com>
	<5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
	<1343037628.21788.83.camel@ted> <500E2FFF.2050202@windriver.com>
	<5036F27B.2050906@windriver.com>
In-Reply-To: <5036F27B.2050906@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Sep 2012 14:00:42.0629 (UTC)
	FILETIME=[00FD9B50:01CD8C38]
Cc: "Zhao, Zhenfeng" <Zhenfeng.Zhao@windriver.com>, "Yang,
	Liezhi" <Liezhi.Yang@windriver.com>
Subject: Re: [PATCH 1/1] quota 4.00: add DEPENDS gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 14:13:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Kindly someone merge this patch. We are hitting this issue.

Regards,
Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of jhuang0
Sent: Friday, August 24, 2012 8:18 AM
To: Patches and discussions about the oe-core layer
Cc: Zhao, Zhenfeng; Yang, Liezhi
Subject: Re: [OE-core] [PATCH 1/1] quota 4.00: add DEPENDS gettext-native



On 7/24/2012 1:17 PM, jhuang0 wrote:
>
>
> On 7/23/2012 6:00 PM, Richard Purdie wrote:
>> On Mon, 2012-07-23 at 16:38 +0800, jackie.huang@windriver.com wrote:
>>> From: Jackie Huang<jackie.huang@windriver.com>
>>>
>>> do_install needs command 'msgfmt', it would fail if the command=20
>>> doesn't exist on the host, add DEPENDS gettext-native to fix this.
>>>
>>> [YOCTO #2811]
>>>
>>> Signed-off-by: Jackie Huang<jackie.huang@windriver.com>
>>> ---
>>>   meta/recipes-extended/quota/quota_4.00.bb |    2 ++
>>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/quota/quota_4.00.bb
>>> b/meta/recipes-extended/quota/quota_4.00.bb
>>> index 5fef9cb..25f6381 100644
>>> --- a/meta/recipes-extended/quota/quota_4.00.bb
>>> +++ b/meta/recipes-extended/quota/quota_4.00.bb
>>> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D=20
>>> "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51f
>>>
>>>   S =3D "${WORKDIR}/quota-tools"
>>>
>>> +DEPENDS =3D "gettext-native"
>>> +
>>>   inherit autotools
>>>
>>>   EXTRA_OEMAKE +=3D 'STRIP=3D""'
>>
>> Shouldn't this be "inherit gettext" ?
>
> No, quota doesn't depend on gettext at runtime, so I don't think we=20
> need 'inherit gettext'.

quota only needs command 'msgfmt' which provied by gettext in do_install, s=
o I don't think we need 'inherit gettext' to both depends on gettext-native=
 and virtual/gettext. Could anyone explain why we should use 'inherit gette=
xt' instead of just depending on gettext-native?

Thanks,
Jackie

>
> Thanks,
> Jackie
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>

--
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


