Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C77177190D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 01:46:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ1knkZ029000
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Nov 2014 17:46:50 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 17:46:49 -0800
Message-ID: <546BF687.2040007@windriver.com>
Date: Wed, 19 Nov 2014 09:46:47 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: akuster <akuster@mvista.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1416213365.git.wenzong.fan@windriver.com>
	<546A15B5.9030205@mvista.com>
In-Reply-To: <546A15B5.9030205@mvista.com>
Subject: Re: [PATCH 0/1] uprev serf: 1.3.6 -> 1.3.8
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
X-List-Received-Date: Wed, 19 Nov 2014 01:47:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

As https://subversion.apache.org/security/CVE-2014-3522-advisory.txt 
mentioned:

   We recommend all users to upgrade to Subversion 1.8.10.  Users of
   Subversion 1.7.x or 1.8.x who are unable to upgrade may apply the
   included patch.  We also recommend that all users upgrade to Serf 1.3.7
   or newer to resolve CVE-2014-3504.

The subversion has been 1.8.10 on master and we only need to uprev serf now.

Akuster,

I wonder how would you like to process this on Dizzy?

Uprev subversion or just apply related CVE fixes, I did think the serf 
should be uprev-ed.

Thanks
Wenzong

On 11/17/2014 11:35 PM, akuster wrote:
> Please add to the 1.3.7 the security fix
>
> - CVE-2014-3504: (Closes: #757965)
>
> On 11/17/2014 12:38 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Release changes:
>>
>> Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
>>    Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
>>    Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
>>    Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.
>>
>> Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
>>    Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)
>>
>> The following changes since commit
>> edaeb8940813b620090a0797ad3b6a076897512d:
>>
>>    bitbake: cooker.py: fix loginfo op being set to an invalid value
>> (2014-11-12 17:04:50 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib wenzong/serf
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/serf
>>
>> Wenzong Fan (1):
>>    serf: 1.3.6 -> 1.3.8
>>
>>   .../serf/{serf_1.3.6.bb => serf_1.3.8.bb}          |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)
>>
>

