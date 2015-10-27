Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id 88842755F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:58:42 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Zr05I-0001RV-QI; Tue, 27 Oct 2015 09:58:41 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 27 Oct 2015 09:57:14 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20151026151307.GA16394@deadlock.dhs.org>
	<562F3615.8040907@topic.nl>
	<1445934977.4521.11.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <562F3CAA.6040401@topic.nl>
Date: Tue, 27 Oct 2015 09:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1445934977.4521.11.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0mvayrARxQsaVhW6R5/2thqbscANip7ZwTyX91RPNepXTxYO9+h4+Kgr/VqvR5kS3/2
	Vj1oFhjIOjqxr7d+bLa/1cZ+pmLjC9RK4pQjNegTMgby/raZUz8oZkzEwVDiGrv32EeInn7+IwbG
	dVcXhj0HI9deIyWbcHH1dmoY1lvQ1pb6+vmlSAVaN3170C4kBl4YxnegtYDetT5GAiabhipImsU1
	B7gGNFJawvnSQ113XIDYmIO5MaByvz1GY8RZnHcovBtceMenHPxU5a3FqpFGJWOteWaoXFvbbwb3
	Cge76eYZ0yJ5/BL2lhOrdRHUTpFVgpT1b21uZVckGp0ccOY05guNsa2Nl1J/2pvGKzma2sWSLFwZ
	4CJju5wll4p3LFNaAhoZRraaMNflySj+cWKLBDMrD7q/cJogwbqzsuok8mw8szTMmTj+nFR7q8hD
	ktZeels3I4vsqtm1dXCnaLEPI5yIYX6ertfJ+XlA08ZZW1c910nswSgEhzA0mBTvwtOt8DSD/Oht
	TFTFIhsSLFs6YJM2wTJFrRk1JkkXZzTU2+EbFlIc0bIVNWVHbCoT88gXECdr2PefsRtKvdfUIgJ8
	51TaRAUkTN+SrghOjOYzN2cjO02LjmNVuFSzDdNmIkk/zXngo0NBQLY8wn80JTGMiOEDOZQke4jI
	0IOSnzCFgd5cqVso720r7ULAXMtTA30+hzAnLdltOt7x6PhHgwQxL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problem with RDEPENDS in multimachine builds for allarch packages
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
X-List-Received-Date: Tue, 27 Oct 2015 08:58:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 27-10-15 09:36, Richard Purdie wrote:
> On Tue, 2015-10-27 at 09:30 +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 26-10-15 16:13, Sergey 'Jin' Bostandzhyan wrote:
>>> Hi,
>>>
>>> I recently ran into a problem that I described here:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8578 and while debu=
gging
>>> this issue an other problem came to light.
>>>
>>> I have a multimachine configuration (armv5/imx6) and the same distro fo=
r both
>>> of them (poky 2.0 RC based).
>>>
>>> I have some allarch packages which have no DEPENDS, however which have =
an
>>> RDEPENDS_${PN} setting.
>>>
>>> I can see that even though there were no changes to the recipe itself a=
nd
>>> also no changes to the recipes listed in RDEPENDS, my recipe still gets
>>> rebuilt each time.
>>>
>>> What we tried:
>>>
>>> <bluelightning> so cleansstate the recipe, change machine, cleansstate =
again,
>>>                   then build it, then change machine, build it again an=
d note
>>>                   the first task that executes
>>>
>>> The logs for these steps, one with RDEPENDS and one without are at the =
end of
>>> this mail. I can see that with present RDEPENDS "real" tasks get execut=
ed
>>> even though no changes occured in the recipe; this is not the case when=
 I
>>> drop RDEPENDS.
>>>
>>> Is this a bug or is this just something that needs to be documented?
>>
>> I think it's the same problem as described here:
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/70070/foc=
us=3D70072
>>
>>> What is the "desired" behaviour?
>>
>> Apparently, this needless rebuilding is "desired".
>
> Its more that we can't tell the difference between a case where it is
> needless and a case where it is no. The system therefore rebuilds as if
> it didn't, there would be cases where it should have rebuilt and did
> not.

But that would not solve any issue at all.

Whatever package got built last will end up in the feed, under the "all"=20
architecture. So if machine X and Y have different versions of some package=
 P,=20
and the build for Y ran last, machine X will still install Y's version of P=
.



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at : Aerospace Electrical Systems Expo Europe which will be held f=
rom 17.11.2015 till 19.11.2015, Findorffstrasse 101 Bremen, Germany, Hall 5=
, stand number C65
http://www.aesexpo.eu



