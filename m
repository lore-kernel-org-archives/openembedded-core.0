Return-Path: <Randy.MacLeod@windriver.com>
X-Greylist: delayed 1085 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 00:00:11 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5870960CE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 00:00:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 015Ng6bl021756
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Feb 2020 15:42:06 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 5 Feb 2020 15:42:05 -0800
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <b678f3b8b7dc947dec08b47886eb49e5bd61f097.camel@linuxfoundation.org>
	<763401698becd74610d4771100229b0a5350847f.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <390369cc-1e42-86cb-f2d3-4f1ee240fd23@windriver.com>
Date: Wed, 5 Feb 2020 18:42:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <763401698becd74610d4771100229b0a5350847f.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.8]
Subject: Re: Reproducible Builds Issue Status
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
X-List-Received-Date: Thu, 06 Feb 2020 00:00:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2/5/20 2:02 PM, Richard Purdie wrote:
> On Wed, 2020-02-05 at 14:27 +0000, Richard Purdie wrote:
>> Good news is we're down to a set of specific issues and those issues
>> seem "stable". The ones we haven't fixed yet with master-next are:
>>
>> /srv/autobuilder/autobuilder.yoctoproject.org/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl:
>> (https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200205-rtw2qpgl/)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
>> (needs a bug)
> 
> Ross has a patch for the gtk3 issue (thanks!).
> 
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13771)
> 
> I've sent a patch for libidn2.
> 
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20191019-r0_amd64.deb
>> (needs a bug)
> 
> Still needs a bug, not looked at.

Minimal bug report created:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13781

Richard claimed that the rest are in hand there are
no other defects to file.

../Randy

> 
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13770)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13773)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13772)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=13774)
> 
> 13772 is looking to be partially a dash vs bash issue.
> 13774 is partially a sorting issue from perl-cross, I've something
> locally I'm experimenting with.
> 
> There are multiple perl issues intertwined and I suspect several more
> issues to find.
> 
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
>> (unfiled, may be related to above 13772)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
>> (unfiled, may be related to above 13772)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
>> (unfiled, may be related to above 13772)
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
>> /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-25815/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
>> (needs a bug)
> 
> This one is fixed, patch out for review.
> 
>> Also:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13776
>> (didn't show on this set of builds)
> 
> I looked at and commented on this but don't know how to reproduce.
> 
> Cheers,
> 
> Richard
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

