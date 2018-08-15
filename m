Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4208079101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 20:49:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7FKnhQN010135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Aug 2018 13:49:44 -0700
Received: from server.local (128.224.20.117) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 15 Aug 2018 13:49:43 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1534339941-1968-1-git-send-email-bruce.ashfield@windriver.com>
	<ebb9e2738e47c62514b0816b8d8c2ede13a54275.camel@linuxfoundation.org>
	<32bf2998f462edc3286fbd04f44ab251ef1f90ed.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <59a7651b-4e13-6eff-58ce-fa8d705edc9e@windriver.com>
Date: Wed, 15 Aug 2018 16:49:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <32bf2998f462edc3286fbd04f44ab251ef1f90ed.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Wed, 15 Aug 2018 20:49:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-08-15 4:42 PM, Richard Purdie wrote:
> On Wed, 2018-08-15 at 16:50 +0100, Richard Purdie wrote:
>> There has been one failure so far:
>>
>> https://autobuilder.yocto.io/builders/build-appliance/builds/1201/ste
>> ps/BuildImages_1/logs/stdio
>>
>> I suspect we need to tweak the do_populate_poky_src task in the
>> build-
>> appliance-image recipe given the kernel devsrc change.
>>
>> Other things are still building. Will reply if anything else comes
>> up.
> 
> It looks really close. There was one sanity test failure basically on
> all arches/kernels:
> 
> | NOTE: ======================================================================
> | NOTE: FAIL: test_stap (stap.StapTest)
> | NOTE: ----------------------------------------------------------------------
> | NOTE: Traceback (most recent call last):
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
> |     return func(*args, **kwargs)
> |   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc/build/meta/lib/oeqa/runtime/cases/stap.py", line 33, in test_stap
> |     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> | AssertionError: 1 != 0 : cd /lib/modules/`uname -r` && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)
> | ln: failed to create symbolic link 'build/kernel': File exists
> 
> If we can fix that (may need the test to be tweaked?) I'll rerun and
> check there isn't anything else. Looks like its hopefully not too hard
> to fix!

Looks easy enough. I'll poke at it tonight and hopefully send something
out first thing tomorrow.

Bruce

> 
> Cheers,
> 
> Richard
> 


