Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Swead-00047v-7o
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 21:28:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71JGZdd023127
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 12:16:35 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 12:16:35 -0700
Message-ID: <50198091.6050001@windriver.com>
Date: Wed, 1 Aug 2012 14:16:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
	<CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
In-Reply-To: <CABcZANk2SzKKcXTdU0MLUeXwOWSxq4HqJceMPO6tOLP3M_GejA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q71JGZdd023127
Subject: Re: number of tasks increased since last update
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
X-List-Received-Date: Wed, 01 Aug 2012 19:28:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 8/1/12 2:08 PM, Chris Larson wrote:
> On Wed, Aug 1, 2012 at 8:29 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> today I updated and found the the number of tasks has increased about
>> 400. Another strange behaviour: in my build dir there are two new
>> folders:
>>
>> x86_64-nativesdk-angstromsdk-linux
>> x86_64-angstromsdk-linux
>>
>> but up to now I was not interested in sdk stuff. Is that another bug
>> or a feature?
>
> I just went to build core-image-base and saw it building crosssdk
> stuff -- not sure if it's related, but thought I'd throw that
> datapoint out there.
>

do you have the updated bitbake?  Prior to RP's changes about a month ago=
, the=20
task / dependency resolver was unable to resolve things on a per-task bas=
is.  So=20
any task within a recipe triggered the resolver to build dependencies.

The SDK stuff adds dependencies only do the sdk task.

With the current head of tree bitbake, I have not seen a revert of behavi=
or...=20
the SDK items only build when triggered.

--Mark


