Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A75596D35C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 10:16:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA8AG6VA005816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2013 02:16:06 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 8 Nov 2013 02:16:05 -0800
Message-ID: <527CB9D9.80804@windriver.com>
Date: Fri, 8 Nov 2013 18:15:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <52777AD9.20201@gmail.com> <52778738.5010706@windriver.com>
	<527CAB5B.9080601@gmail.com>
In-Reply-To: <527CAB5B.9080601@gmail.com>
Subject: Re: [dora] Cherry-pick Qt fixes
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
X-List-Received-Date: Fri, 08 Nov 2013 10:16:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/08/2013 05:14 PM, Jonathan Liu wrote:
> Hi Robert,
>
> Is the queue visible publically?

Hi Jonathan,

I will put the branch to poky-contrib:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib

If you can access it, then yes. We haven't figured out which ones should
go into dora atm., I will put it to the robert/dora-next temporally when
it is done.

// Robert

>
> Regards,
> Jonathan
>
> On 4/11/2013 10:38 PM, Robert Yang wrote:
>>
>> Hi Jonathan,
>>
>> Thank you very much, these will be included in the queue.
>>
>> // Robert
>>
>> On 11/04/2013 06:45 PM, Jonathan Liu wrote:
>>> Hi Robert,
>>>
>>> I propose we cherry-pick the following Qt fixes from master to dora branch:
>>> -qt4: add upstream QTBUG-31579 patch for QPainter regression
>>> [OE-Core/a5afc67cbfc32beb3be10392bf9788cfc3610ab1]
>>> -nativesdk-qt4-tools: create qt.conf file
>>> [OE-Core/23f88695683a8e428375a8ccb6be935347a8768c]
>>> -meta-toolchain-qt: put QT_CONF_PATH in environment script
>>> [OE-Core/fffa4c37c49b169f663d28612b9251819cef9577]
>>> -qt4: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch
>>> [OE-Core/3af8f2e0697a9523d3b505ba4c48eca35f6de3a9]
>>>
>>> Regards,
>>> Jonathan
>>>
>>>
>
>
>

