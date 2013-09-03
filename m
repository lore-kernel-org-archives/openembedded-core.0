Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB426BD56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 11:49:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r83BnAaW022006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2013 04:49:10 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 3 Sep 2013 04:49:09 -0700
Message-ID: <5225CC91.9050003@windriver.com>
Date: Tue, 3 Sep 2013 19:48:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
References: <cover.1378194734.git.liezhi.yang@windriver.com>
	<f6faba2e39ab7055392521e8324ca08f2afa4c03.1378194734.git.liezhi.yang@windriver.com>
	<CAJTo0LYOgNNfeAHWaCYU-QvE+pEKfOmxU0U13iLu5FLKXfewnw@mail.gmail.com>
	<5225C515.9010804@windriver.com> <5225CA59.50307@r-finger.com>
In-Reply-To: <5225CA59.50307@r-finger.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 11:49:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/03/2013 07:39 PM, Tomas Frydrych wrote:
> On 03/09/13 12:16, Robert Yang wrote:
>>
>>
>> On 09/03/2013 05:51 PM, Burton, Ross wrote:
>>> On 3 September 2013 08:52, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> +    sed -i -e 's/^\(ABS_GLIB_RUNTIME_LIBDIR=.*readlink\) -f/\1 -m/'
>>>> ${S}/configure.ac
>>>
>>> Please do this as a patch instead of a sed.
>>
>> It seems that sed command is preferred ? For example, we don't have to
>> port the
>> patch once we upgrade glib-2.0.
>
> Having to port a patch when it fails to apply ensures we are still doing
> the right thing. In contrast, these sed snippets don't generate errors
> when they fail, and they remain in recipes for years when no longer
> working/needed.
>

Thanks, I will send a V2.

// Robert

> Tomas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

