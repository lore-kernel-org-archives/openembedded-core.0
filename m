Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SAFLm-0000rD-4n
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 07:48:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2L6duAk005234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 23:39:56 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Mar 2012 23:39:56 -0700
Message-ID: <4F6977BA.9040109@windriver.com>
Date: Wed, 21 Mar 2012 14:39:54 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1331877464.git.xiaofeng.yan@windriver.com>	<22ff60ec34d2c54393d4ceb2a81394c6512baa17.1331877464.git.xiaofeng.yan@windriver.com>	<4F679F53.40302@linux.intel.com>
	<4F681A97.4020201@windriver.com>	<665F9083-9747-4972-BCDE-BCE209266221@dominion.thruhere.net>	<4F685087.6080303@windriver.com>
	<4F6852C0.4050409@windriver.com>	<CAE4k23-U8gr0_B9jyZb8qXhwQQZLFA6O20PdG7j1SohpdQdx6Q@mail.gmail.com>
	<4F689719.6090100@linux.intel.com>
In-Reply-To: <4F689719.6090100@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q2L6duAk005234
Subject: Re: [PATCH 2/7] archiver.bbclass: New bbclass for archiving sources, patches, logs and scripts
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
X-List-Received-Date: Wed, 21 Mar 2012 06:48:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 22:41, Saul Wold wrote:
> On 03/20/2012 03:00 AM, Anders Darander wrote:
>> On Tue, Mar 20, 2012 at 10:49, Xiaofeng=20
>> Yan<xiaofeng.yan@windriver.com>  wrote:
>>> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 17:40, Xiaofeng Yan wrote:
>>>>
>>>> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 16:07, Koen Kooi wrote:
>>>>>
>>>>> Op 20 mrt. 2012, om 06:50 heeft Xiaofeng Yan het volgende geschreve=
n:
>>>>>
>>>>>> On 2012=E5=B9=B403=E6=9C=8820=E6=97=A5 05:04, Saul Wold wrote:
>>>>>>>
>>>>>>> On 03/15/2012 11:23 PM, Xiaofeng Yan wrote:
>>>>>>>>
>>>>>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>>>>>
>>>>>>> Why do you rebuild the tarball here are rename it instead of just
>>>>>>> copying the original tarball?
>>>>>>>
>>>>>> because many packages come from non-tarball and they could be git
>>>>>> sources , So I archive these sources after do_unpack.
>>>>>
>>>>> But if you have the original tarball and reuse it, you'll get the=20
>>>>> warm
>>>>> fuzzy feeling of matching checksums.
>>>>
>>>> So How about  renaming archive-original-source to
>>>> archive-prepatched-source?
>>>
>>> Hi Saul,
>>>
>>> Or I can add a new functions to get tarball from downloads if have=20
>>> tarball
>>> and archive source codes directory if have directory without tarball.
>>> Do you think it is necessary for us to add this function?
>>
>> I'd say that this is a change that should be made. If nothing else,
>> just to get the assurance that the archived tarball's are the same as
>> the ones that was used to build the system. (This is beneficial both
>> when it comes to using the archived tarballs for rebuilding the
>> system, as well as for ensuring licence compliance).
>>
> I agree here, as Koen also pointed out, it will have matching checksums.
>
> As to the name of the tarball, again best to keep it named the same as=20
> the original tarball.
>
> Sau!
got it. I will release V4 for this feature this week.
>
>> /Anders
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



