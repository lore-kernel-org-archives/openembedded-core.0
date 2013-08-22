Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4066B89B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:53:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7M5rmJw012135
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 22:53:48 -0700 (PDT)
Received: from [128.224.21.167] (128.224.21.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 22:53:47 -0700
Message-ID: <5215A767.3040601@windriver.com>
Date: Thu, 22 Aug 2013 01:53:43 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: wenzong fan <wenzong.fan@windriver.com>
References: <520C9F8A.7080703@windriver.com> <52128427.3020009@windriver.com>
	<5213006A.5050602@windriver.com>
In-Reply-To: <5213006A.5050602@windriver.com>
X-Originating-IP: [128.224.21.167]
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 22 Aug 2013 05:53:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-20 01:36 AM, wenzong fan wrote:
> On 08/20/2013 04:46 AM, Randy MacLeod wrote:
>> Add Joe Slater who owns US17463: PACKAGECONFIG clean-up.
>>
>>
>> On 13-08-15 05:29 AM, wenzong fan wrote:
>>> Hi All,
>>>
>>> We have seen some problems like this:
>>>
>>> $ bitbake libcap
>>>
>>> ld: warning: libaudit.so.1, needed by .../lib64/libpam.so, not found
>>> .../lib64/libpam.so: undefined reference to `audit_open'
>>> .../lib64/libpam.so: undefined reference to `audit_close'
>>> ......
>>>
>>> The libaudit has been available and libpam build with it, after we run
>>> another build with sstate-cache and w/o libaudit, the error occurs. The
>>> solution in these cases is to use PACKAGECONFIG to lay out dependencies
>>> on optional packages and make them explicit. We need to run an audit and
>>> catch all of these issues.
>>>
>>> A probable ways maybe:
>>>
>>> 1) Run world build to generate the sysroots as much as possible;
>>> 2) Run 'configure --help' on each package to spot all of the optional
>>> dependencies, and convert them into PACKAGECONFIG specs/or any other
>>> prompts.
>>
>> We should try to automate or codify this step so that the output is
>> a list of oe-core package names.
>>
>>> 3) Run #1, #2 as an audit script periodically.
>>>
>>> Or could we run this check as part of a QA build step?
>>
>> Do you mean:
>>    scripts/test-dependencies.sh
>
> No, I mean some check steps that if PACKAGECONFIG should be used, not
> limit to the script.

thread replace by discussion on:

[Bug 5033] New: Way to audit all optional dependencies
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5033

// Randy

>
> Thanks
> Wenzong
>
>>
>> // Randy
>>
>>>
>>>
>>> Thanks
>>> Wenzong
>>
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

