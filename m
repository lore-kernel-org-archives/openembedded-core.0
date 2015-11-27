Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDB58601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 06:20:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAR6KjKI013082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Nov 2015 22:20:45 -0800 (PST)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 Nov 2015 22:20:44 -0800
Message-ID: <5657F63B.6020501@windriver.com>
Date: Fri, 27 Nov 2015 14:20:43 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1447738630.git.wenzong.fan@windriver.com>
	<564BD3C0.8000900@gmail.com>
In-Reply-To: <564BD3C0.8000900@gmail.com>
Subject: Re: [PATCH 0/2] subversion: fix CVE-2015-3184, CVE-2015-3187
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
X-List-Received-Date: Fri, 27 Nov 2015 06:20:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2015 09:26 AM, akuster808 wrote:
>
> On 11/16/2015 09:38 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> The following changes since commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57:
>>
>>    gcc: Drop 4.8 (2015-11-16 14:59:18 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib wenzong/svn
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/svn
>>
>> Wenzong Fan (2):
>
> Thanks.
>
>>    subversion: fix CVE-2015-3184
>>    subversion: fix CVE-2015-3187
>
> These two fixes only affect Apache.
>
> Apache version < 2.4.16 will need the following fix too.
>
> CVE-2015-3185 httpd: ap_some_auth_required() does not properly indicate
> authenticated request in 2.4

apache2 has been updated to 2.4.16, it should be fixed now.

commit fe0833e87e853024c9162fae17cbaf2fbfc6a53f
Author: Roy Li <rongqing.li@windriver.com>
Date:   Fri Aug 7 14:07:49 2015 +0800

     apache: upgrade to 2.4.16

     2.4.16 includes fixes for CVE-2015-3185, CVE-2015-0253 and 
CVE-2015-3183
     remove a backport patch 0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch

     Signed-off-by: Roy Li <rongqing.li@windriver.com>
     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks
Wenzong

>
>
> This affects fido.
>
> - armin
>
>
>>
>>   .../subversion-CVE-2015-3184.patch                 | 2094 ++++++++++++++++++++
>>   .../subversion-CVE-2015-3187.patch                 |  346 ++++
>>   .../subversion/subversion_1.8.13.bb                |    2 +
>>   3 files changed, 2442 insertions(+)
>>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
>>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
>>
>

