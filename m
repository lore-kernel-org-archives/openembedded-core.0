Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RkeLc-0003dR-Lg
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:14:52 +0100
Received: by wibhq7 with SMTP id hq7so3855702wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:07:23 -0800 (PST)
Received: by 10.180.76.131 with SMTP id k3mr13070038wiw.2.1326211643887;
	Tue, 10 Jan 2012 08:07:23 -0800 (PST)
Received: from [128.224.170.207] ([89.121.200.106])
	by mx.google.com with ESMTPS id g26sm57596586wbo.16.2012.01.10.08.07.23
	(version=SSLv3 cipher=OTHER); Tue, 10 Jan 2012 08:07:23 -0800 (PST)
Message-ID: <4F0C623B.7050209@gherzan.ro>
Date: Tue, 10 Jan 2012 18:07:23 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
In-Reply-To: <CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Tue, 10 Jan 2012 16:14:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 05:34 PM, Chris Larson wrote:
> On Tue, Jan 10, 2012 at 8:17 AM, Andrei Gherzan<andrei@gherzan.ro>  wrote:
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> A new function was defined in license.bbclass in order to correctly exclude packages where OE-Style licence naming
>> is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 etc will be excluded from a non-GPLv3 build. This function
>> takes into consideration if 'or' operand is used.
>> The function defined in license.bbclass is called in base.bbclass where packages are excluded based on
>> INCOMPATIBLE_LICENSE variable.
>>
>> [YOCTO #1884]
>> [YOCTO #1844]
>>
>> Signed-off-by: Andrei Gherzan<andrei at gherzan.ro>
>
> Out of curiosity, why are we using regex for this when we already have
> license parsing in the oe.license module which can handle the OR case?

I'm using regex only for excluding '+' characters from LICENSE. The rest 
of the work is done in oe.license.
If X is defined as INCOMPATIBLE_LICENSE, X+ should be exluded as well.



