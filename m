Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15F4674A35
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 02:09:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA629ZIb025295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Nov 2018 18:09:35 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 5 Nov 2018 18:09:34 -0800
To: Grygorii Tertychnyi <gtertych@cisco.com>
References: <1541138869-68039-1-git-send-email-changqing.li@windriver.com>
	<20181102064101.13840.12812@do.openembedded.org>
	<f8c4a061-f2d2-9c04-1885-647f98a222ea@windriver.com>
	<87a7mn2zlc.fsf@cisco.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <e9ef8495-0501-9aec-e667-bc005c259d2a@windriver.com>
Date: Tue, 6 Nov 2018 10:09:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87a7mn2zlc.fsf@cisco.com>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGN1cmw6IGZpeCBmb3IgQ1ZFLTIwMTgtMTY4MzkvQ1ZFLTIwMTgtMTY4NDAvQ1ZFLTIwMTgtMTY4NDI=?=
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
X-List-Received-Date: Tue, 06 Nov 2018 02:09:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/6/18 1:39 AM, Grygorii Tertychnyi wrote:
>
> On Fri Nov02 2018 @ 06:48, Changqing Li <changqing.li@windriver.com> 
> wrote:
>
>> I have add CVE tag in the patch file, is this test result incorrect?
>
> My guess is it was fooled by (well, "incorrect") "CVE-YYYY-XXXX" 
> lines. Even thouhg it is followed by the (correct) "CVE: 
> CVE-YYYY-XXXX" in your CVE patches
>
> 43                     # first match is lax but second strict 
> 44                     if self.re_cve_payload_pattern.match(line): 
> 45                         if not self.re_cve_payload_tag.match(line): 
> 46                             self.fail('Missing or incorrectly 
> formatted CVE tag in included patch file', 
> 47                                       'Correct or include the CVE 
> tag on cve patch with format: "CVE: CVE-YYYY-XXXX"', 48 commit)
> Do you really need "incorrect" lines?

Thanks.  the incorrect line are not necessary. I will rework this patch 
based on  new updated version 7.61.1

//changqing

>
>> On 11/2/18 2:41 PM, Patchwork wrote:
>>> == Series Details ==
>>>
>>> Series: curl: fix for CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
>>> Revision: 1
>>> URL   : https://patchwork.openembedded.org/series/14764/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>>
>>> Thank you for submitting this patch series to OpenEmbedded Core. 
>>> This is
>>> an automated response. Several tests have been executed on the proposed
>>> series by patchtest resulting in the following failures:
>>>
>>>
>>>
>>> * Patch            curl: fix for 
>>> CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
>>>   Issue             Missing or incorrectly formatted CVE tag in   
>>> included patch file [test_cve_tag_format]
>>>    Suggested fix    Correct or include the CVE tag on cve patch    
>>> with format: "CVE: CVE-YYYY-XXXX"
>>>
>>>
>>>
>>> If you believe any of these test results are incorrect, please reply 
>>> to the
>>> mailing list (openembedded-core@lists.openembedded.org) raising your 
>>> concerns.
>>> Otherwise we would appreciate you correcting the issues and 
>>> submitting a new
>>> version of the patchset if applicable. Please ensure you 
>>> add/increment the
>>> version number when sending the new version (i.e. [PATCH] -> [PATCH 
>>> v2] ->
>>> [PATCH v3] -> ...).
>>>
>>> ---
>>> Guidelines: 
>>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>>> Test suite: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>>
>>>
>> -- 
>> BRs
>>
>> Sandy(Li Changqing)
>
>
-- 
BRs

Sandy(Li Changqing)


