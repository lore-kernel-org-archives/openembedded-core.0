Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E26307F457
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 16:48:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Oct 2019 09:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="209392524"
Received: from adahiya-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.249.39.45])
	by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 09:48:40 -0700
To: openembedded-core@lists.openembedded.org
References: <b8921ea9bc7bad48a33b0a818d47e2ea069a1dc6.camel@linuxfoundation.org>
	<db51470b-812f-d60d-b9e9-7741c536f3e2@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <46eada65-ea51-a311-3ebc-af0ce5c2d18b@intel.com>
Date: Mon, 21 Oct 2019 17:48:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db51470b-812f-d60d-b9e9-7741c536f3e2@gmail.com>
Subject: Re: Help with intermittent autobuilder exposed bugs
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
X-List-Received-Date: Mon, 21 Oct 2019 16:48:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/10/2019 16:54, akuster808 wrote:
> 
> 
> On 10/20/19 5:54 AM, Richard Purdie wrote:
>> We have a situation brewing on the autobuilder. Each run there are some
>> bugs which sometimes can appear. Law of averages says one or more of
>> the issues below will now appear as we have so many of them. The
>> project's standard processes aren't helping to capture the issues or
>> track them down.
>>
>> With the release mostly sorted out from my perspective I can look at
>> some of the other health aspects of the project.
>>
>> In theory SWAT should have filed bugs for these. In most cases they
>> haven't. If they did, we'd discuss them at triage, decide they looked
>> hard and then there wouldn't be anyone to "assign" to them so they'd
>> most likely end up on my plate anyway. I find it hard to know what to
>> do with these. I already have a load in my bug backlog which I've not
>> gotten sorted out so adding more probably won't help.
>>
>> To summarise the issues [just from the last few builds]:
> 
> I'll get started logging bugs
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/756
>> oe-selftest recipetool.RecipetoolTests.test_recipetool_load_plugin
>> RP has a long standing bug:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13070
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1177
>> qa-extras2 step2c testimage logrotate.LogrotateTest.test_2_logrotate
>> for core-image-sato
>> [no open bug?]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13602
> 
> 
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/441
>> oe-selftest devtool.DevtoolExtractTests.test_devtool_deploy_target
>> [no open bug, unhelpful backtrace from tinfoil]
> 
> Bug #13601, seen with stable/warrior-nmut and on same host - fedora30-ty-1
> 
> 
> 
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/440
>> oe-sefltest signing.LockedSignatures.test_locked_signatures
>> [no open bug or any idea why it failed]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13605
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/440
>> oe-selftest distrodata.Distrodata.test_maintainer
>> [no open bug, same unhelpful backtrace from tinfoil]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13604
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/440
>> oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
>> [no open bug?, fedora specific perldoc reproducibility issue]
> Think its the same as
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13602

I think you got the wrong number?

If you meant the bug where pod2man writes its version number into the 
manpages then that isn't Fedora-specific, nor impacts these files:

perl-dbg_5.30.0-r0_amd64.deb
perl-module-config-heavy_5.30.0-r0_amd64.deb
perl-module-digest-md5_5.30.0-r0_amd64.deb
perl-module-encode-byte_5.30.0-r0_amd64.deb
perl-module-encode-cn_5.30.0-r0_amd64.deb
perl-module-encode-ebcdic_5.30.0-r0_amd64.deb
perl-module-encode-jp_5.30.0-r0_amd64.deb
perl-module-encode-kr_5.30.0-r0_amd64.deb
perl-module-encode-symbol_5.30.0-r0_amd64.deb
perl-module-encode-tw_5.30.0-r0_amd64.deb
perl-module-encode_5.30.0-r0_amd64.deb
perl-module-tie-hash-namedcapture_5.30.0-r0_amd64.deb
perl-ptest_5.30.0-r0_amd64.deb
perl-src_5.30.0-r0_amd64.deb

I don't actually have a Fedora machine to hand right now but if anyone 
does, this should be fairly trivial to replicate/isolate.

Ross

