Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1St83g-0003c1-U6
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 04:07:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6N1uD5a003935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 18:56:13 -0700 (PDT)
Received: from [128.224.22.136] (128.224.22.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 22 Jul 2012 18:56:12 -0700
Message-ID: <500CAF3B.1020001@windriver.com>
Date: Sun, 22 Jul 2012 21:56:11 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Robert Yang
	<liezhi.yang@windriver.com>
References: <cover.1342939738.git.jackie.huang@windriver.com>
	<9c2d0c1746a945290b6c64551fc6ca2e5e043028.1342939738.git.jackie.huang@windriver.com>,
	<1342946215.21788.53.camel@ted>
	<1B858668EC6A94408DCA5225FDFA85AA575F4CD3@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA575F4CD3@ALA-MBA.corp.ad.wrs.com>
X-Originating-IP: [128.224.22.136]
Subject: Re: [PATCH 1/1] useradd.bbclass: use locking of bb.utils to avoid lock race issue of useradd/groupadd
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
X-List-Received-Date: Mon, 23 Jul 2012 02:07:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-22 08:10 AM, Huang, j (Jackie) wrote:
>
>
>> On Sun, 2012-07-22 at 14:53 +0800, jackie.huang@windriver.com wrote:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> A race condition can occur when adding users and groups to the
>>> passwd and group files, in [YOCTO #1794], 10 times retry added
>>> but it is not fixed completely.
>>>
>>> This fix re-writes the useradd_preinst and useradd_sysroot with
>>> python and use locking of bb.utils to lock the passwd and group
>>> files before executing useradd/groupadd commands to avoid the
>>> lock race themselves.
>>>
>>> [YOCTO #2779]
>>>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> ---
>>>   meta/classes/useradd.bbclass |  284 ++++++++++++++++++------------------------
>>>   1 files changed, 124 insertions(+), 160 deletions(-)
>>
>> Please resend this with the whitespace issues resolved. Its near
>> impossible to review as it stands :(
>
> Re-sent, sorry about that.

Hi Jackie,

I don't see that your new version sent at 8:01 is any better
but I could be wrong...

Robert,
Please take a look and help Jackie with formatting
and perhaps small single purpose commits as needed -
i.e. separate the whitespace changes from the functional changes.

This problem is happening frequently so I'd like to get this
worked out upstream.

Thanks,
// Randy


>
> Thanks,
> Jackie
>
>>
>> Cheers,
>>
>> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


-- 
# Randy MacLeod. MTS, Linux, Wind River
Direct: 613.963.1350


