Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E393E605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 09:09:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O99hNb001656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Apr 2015 02:09:43 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 24 Apr 2015 02:09:43 -0700
Message-ID: <553A085F.60203@windriver.com>
Date: Fri, 24 Apr 2015 17:09:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1429865892.git.Qi.Chen@windriver.com>
	<d690fdd4b6924ba28eff25f4f9fb4dc5d2f5ca56.1429865892.git.Qi.Chen@windriver.com>
	<9598845.8ZbdBo0yX6@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <9598845.8ZbdBo0yX6@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [128.224.162.236]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/2] uninative-tarball: delete the packagedata task
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
X-List-Received-Date: Fri, 24 Apr 2015 09:09:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2015 05:03 PM, Paul Eggleton wrote:
> On Friday 24 April 2015 16:59:34 Chen Qi wrote:
>> This task is meaningless for uninative-tarball as the package task
>> has been deleted. Besides, sometimes it would cause problems. To
>> reproduce, use the following command.
>>
>> bitbake uninative-tarball -c cleansstate && bitbake uninative-tarball &&
>> bitbake uninative-tarball -c clean && bitbake uninative-tarball
>>
>> The error is something like below.
>>
>> File: 'sstate.bbclass', lineno: 33, function: sstate_installpkg
>>       0029:        bb.build.exec_func(f, d)
>>       0030:
>>       0031:    for state in ss['dirs']:
>>       0032:        prepdir(state[1])
>>   *** 0033:        os.rename(sstateinst + state[0], state[1])
>>       0034:    sstate_install(ss, d)
>>       0035:
>>       0036:    for plain in ss['plaindirs']:
>>       0037:        workdir = d.getVar('WORKDIR', True)
>> Exception: OSError: [Errno 2] No such file or directory
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/meta/uninative-tarball.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/meta/uninative-tarball.bb
>> b/meta/recipes-core/meta/uninative-tarball.bb index 62bdde8..41f7927 100644
>> --- a/meta/recipes-core/meta/uninative-tarball.bb
>> +++ b/meta/recipes-core/meta/uninative-tarball.bb
>> @@ -23,6 +23,7 @@ inherit populate_sdk
>>
>>   deltask install
>>   deltask package
>> +deltask packagedata
>>
>>   SDK_DEPENDS += "patchelf-native"
> I forgot to note, this one is filed also - [YOCTO #7597]. Can you please add
> this to the commit message on the branch?
>
> Thanks,
> Paul
>

Thanks for pointing that out.

I've updated the remote branch.

The bug number has been added to the commit message. See below.
http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=ChenQi/uninative-tarball-fixes&id=db6c1f96c80a967b314cd1d1a671044c249e7777

Best Regards,
Chen Qi

