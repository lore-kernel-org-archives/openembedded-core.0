Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SDHZf-0003TB-TI
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 17:47:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2TFcdfQ003528
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 08:38:39 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Mar 2012 08:38:40 -0700
Message-ID: <4F7481FE.3020505@windriver.com>
Date: Thu, 29 Mar 2012 10:38:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
	<CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
In-Reply-To: <CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 15:47:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/12 11:54 PM, Chris Larson wrote:
> On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
> <B29882@freescale.com>  wrote:
>> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson<clarson@kergoth.com>  wrote:
>>>> If you can explain why the override isn't overriding the default
>>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can consistently
>>>> modify all of the elements... I'm happy to accept the changes to all of the
>>>> tunings.
>>>
>>> See above. It's not an override. And plenty of files already specify
>>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>>> do so for the defaults, personally.
>>
>> If no one else has complained so far it makes me believe they are not
>> missing any TUNE_PKGARCH_tune-<tune>  then.
>
> I don't understand the point you're attempting to make here.

Just an FYI -- I've not forgotten about this.. I'm going to look into what is 
currently implemented and figure out how to get it to be consistent.. things 
have definitely changed since the initial implementation, and things are no 
longer consistent.

Hopefully I'll have an update later today.

--Mark


