Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7E73E6F57B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 08:54:30 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Mar 2014
	09:54:27 +0100
Message-ID: <53144333.8020509@enea.com>
Date: Mon, 3 Mar 2014 09:54:11 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>	<20140227142404.GB3534@lpalcu-linux>	<530F4D46.1060401@enea.com>	<20140227151815.GC3534@lpalcu-linux>	<530F9913.4080704@gmail.com>
	<CAP9ODKpqMHG239UczMVLhiGEhvz_X6ppuiV_yD2pEvjzP510sw@mail.gmail.com>
In-Reply-To: <CAP9ODKpqMHG239UczMVLhiGEhvz_X6ppuiV_yD2pEvjzP510sw@mail.gmail.com>
X-Originating-IP: [172.16.141.133]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Mon, 03 Mar 2014 08:54:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-03-01 19:10, Otavio Salvador wrote:
> Hello David,
>
> On Thu, Feb 27, 2014 at 4:59 PM, David Nystr=F6m <david.c.nystrom@gmail.c=
om>wrote:
>
>>
>> On 2014-02-27 16:18, Laurentiu Palcu wrote:
>>
>>> On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nystr=F6m wrote:
>>>
>>>> On 2014-02-27 15:24, Laurentiu Palcu wrote:
>>>>
>>>>> Hi David,
>>>>>
>>>>> My comments/questions below.
>>>>>
>>>> Thank you for your detailed comments on the RFC.
>>>> I will return with V2, where your comments are addressed when the
>>>> general approach is Acked.
>>>>
>>>> What do you think about the general approach ?
>>>>
>>> I think the approach is ok. I don't know a simpler way than this to add
>>> package feeds into the image.
>>>
>>
>> OK, there seems to be no screaming objections from other parties either.
>>
>> I'll resend v2
>>
>
> I understand why you are adding this here but I think it'd be good to the
> settings to be put in a package so in a product we may add extra
> repositories updating the package.
>

Good point.

> I am trying to think now how this could be done (or optionally done).
>
> What you think?

Yes, how would we determine the repo subdirs for a specific machine=20
without too much
anonymous python magic in a recipe, considering multilib setups?

Example for qemux86-64:
--=20
all
x86_64 =3D ${TARGET_ARCH}
core2-64 =3D ${??}
qemu86_64 =3D ${MACHINE}
--=20

If we can get a sane way to retrieve them, modifying the repo feeds via=20
install/postinstall should be the easy part.


> Other point, PACKAGE_FEED_URIS could be change to PACKAGE_FEED_URI as it
> matches SRC_URI for example.

Agreed.


