Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id C70B177E99
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 13:22:06 +0000 (UTC)
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7QDJs3v002086 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 09:22:07 -0400
From: "Alarcon, Jose (GE Healthcare)" <jose.alarcon@ge.com>
To: Martin Jansa <martin.jansa@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
Thread-Topic: [OE-core] EXT: Re: [PATCH] libinput: remove obsolete touchpad
	patch
Thread-Index: AQHTHlU58EYaE2C37ECWH3/3/1ZlIqKWn/KP
Date: Sat, 26 Aug 2017 13:22:03 +0000
Message-ID: <1CC7AAE7-A9C6-47E7-8C69-D45958C5EC66@ge.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
	<CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>,
	<bab72ff8-d672-5fd4-f7bf-b21c7e4e9c51@ge.com>
In-Reply-To: <bab72ff8-d672-5fd4-f7bf-b21c7e4e9c51@ge.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708260215
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Sat, 26 Aug 2017 13:22:07 -0000
Content-Language: es-ES
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry, I failed to read the whole thread (inbox filters).

I sent the revert this morning.

As I said, we have been running our devices with this patch in and kernels =
newer than 4.1 and we have not observed any issues with the touchpad. But o=
f course that is quite limited testing.

Thanks,

--
Jose

> El 26 ago 2017, a las 13:22, Alarcon, Jose (GE Healthcare) <jose.alarcon@=
ge.com> escribi=F3:
>=20
>=20
>=20
>> On 25.08.2017 21:59, Martin Jansa wrote:
>> Does the patch cause any harm when used on newer kernel?
>=20
> Based on my limited testing on our devices running kernel 4.11.0, no.
>=20
>>=20
>> If so shouldn't the patch be fixed to work correctly even with newer
>> kernel?
>>=20
>> Or what's the main reason to remove it?
>=20
> I am going through each and every patch that we carry on our layers. If
> upstreaming status is pending, we try to upstream it. If the patch is no
> longer needed, we remove it.
>=20
> When I came across this particular patch, I thought it was obsolete and
> that it should be removed upstream too. I was not aware of OLDEST_KERNEL.
>=20
> I will send a revert now.
>=20
> Thanks,
>=20
> --
> Jose
>=20
>>=20
>> On Fri, Aug 25, 2017 at 8:55 PM, Mark Hatle <mark.hatle@windriver.com
>> <mailto:mark.hatle@windriver.com>> wrote:
>>=20
>>>    On 8/25/17 1:48 PM, Andre McCurdy wrote:
>>> On Fri, Aug 25, 2017 at 12:09 AM, Jose Alarcon
>>    <jose.alarcon@ge.com <mailto:jose.alarcon@ge.com>> wrote:
>>>> On 24.08.2017 20 <tel:24.08.2017%2020>:45, Andre McCurdy wrote:
>>>>> On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon
>>    <jose.alarcon@ge.com <mailto:jose.alarcon@ge.com>> wrote:
>>>>>> This patch was a temporal workaround needed with 4.1 kernels.
>>>>>> Remove it.
>>>>> OLDEST_KERNEL is still set to 3.2.0
>>>>>=20
>>>>> How can you be sure nobody is using 4.1 ?
>>>>=20
>>>> That's a good point!
>>>>=20
>>>> I didn't know about this variable. I believe we should not
>>    integrate
>>>> this change.
>>>> I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.
>>>=20
>>> The original patch has been merged to master so a second patch
>>    will be
>>> needed to revert it.
>>>=20
>>=20
>>    It may make sense to selectively apply the patch based on what
>>    OLDEST_KERNEL is
>>    set to.
>>=20
>>    This way if a user or distribution sets a newer 'OLDEST_KERNEL',
>>    that item can
>>    be removed automatically.
>>=20
>>    --Mark
>>    --
>>    _______________________________________________
>>    Openembedded-core mailing list
>>    Openembedded-core@lists.openembedded.org
>>    <mailto:Openembedded-core@lists.openembedded.org>
>>    http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>    <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>=20
>>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

