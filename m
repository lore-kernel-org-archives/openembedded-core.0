Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2C560D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 16:51:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0AGpYKY001243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 08:51:35 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 10 Jan 2014 08:51:34 -0800
Message-ID: <52D02516.3010503@windriver.com>
Date: Fri, 10 Jan 2014 10:51:34 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>	<52CF90CB.3010300@windriver.com>
	<1389350516.19102.206.camel@ted>
In-Reply-To: <1389350516.19102.206.camel@ted>
Subject: Re: [dora][PATCH 0/2] Dora backports
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
X-List-Received-Date: Fri, 10 Jan 2014 16:51:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/14, 4:41 AM, Richard Purdie wrote:
> On Fri, 2014-01-10 at 14:18 +0800, Robert Yang wrote:
>> Hi Martin,
>>
>> Thanks, please see my comments in line.
>>
>> On 01/06/2014 06:21 PM, Martin Jansa wrote:
>>> The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c27353d8:
>>>
>>>     libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>     git://git.openembedded.org/openembedded-core-contrib jansa/dora-backports2
>>>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dora-backports2
>>>
>>> Martin Jansa (1):
>>>     ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
>>>
>>
>> I will take this.
>>
>>> Richard Purdie (1):
>>>     eglibc-initial.inc: Drop duplicate include
>>>
>>
>>
>> It seems that this is a trivial fix, I don't think it's a good idea to merge
>> it to dora.
>
> Thanks to one of the bitbake patches we backported, this "trivial" issue
> is now putting warnings in peoples builds so I think it might be a good
> idea to fix it.

Ya I agree.  This is going to cause confusion for people.  Being a small 2 line 
patch, and pretty easy to show that it's "safe".  I'd also recommend that that 
backport be accepted.

--Mark

> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


