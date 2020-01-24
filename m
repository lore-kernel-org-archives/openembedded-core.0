Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7BEF7F867
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 13:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A89879C009A;
	Fri, 24 Jan 2020 08:04:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 7OgXL_8fZgpR; Fri, 24 Jan 2020 08:04:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B7CE79C00B9;
	Fri, 24 Jan 2020 08:04:16 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 176d5YA8uWaw; Fri, 24 Jan 2020 08:04:16 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7ACEF9C009A;
	Fri, 24 Jan 2020 08:04:16 -0500 (EST)
Date: Fri, 24 Jan 2020 08:04:16 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <500729986.2189004.1579871056402.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <3d7273734bd7ce04a6b6ca76f210204a948328dc.camel@linuxfoundation.org>
References: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
	<3d7273734bd7ce04a6b6ca76f210204a948328dc.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: m4JrCF+1HqN9oMnB/zhqoFfURcbhWw==
Cc: Jonas Andersson <jonaskgandersson@gmail.com>,
	paul eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Chris Elston <cdelston0@gmail.com>, bunk <bunk@stusta.de>,
	rennes-dev <rennes-dev@savoirfairelinux.com>
Subject: Re: [PATCH v5 00/13] NPM refactoring
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
X-List-Received-Date: Fri, 24 Jan 2020 13:04:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Jan 24, 2020, at 12:56 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> On Mon, 2020-01-20 at 11:26 +0100, Jean-Marie LEMETAYER wrote:
>> Hi folks and happy new year,
>> 
>> For readability here is a link if you want the history of this patchset:
>> http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290298.html
> 
> Thanks for this! I think we're nearly there.
> 
> There were some selftest failures:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/632
> 
> The reproducible one isn't from your patches but some are:
> 
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolAddTests.test_devtool_add_npm: FAILED (16.29s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolUpgradeTests.test_devtool_finish_upgrade_origlayer: FAILED
> (31.89s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolUpgradeTests.test_devtool_finish_upgrade_otherlayer: FAILED
> (44.65s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolUpgradeTests.test_devtool_upgrade: FAILED (33.96s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> recipetool.RecipetoolTests.test_recipetool_create: FAILED (8.81s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> recipetool.RecipetoolTests.test_recipetool_create_cmake: FAILED (9.25s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> recipetool.RecipetoolTests.test_recipetool_create_npm: FAILED (3.56s)
> 2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS -
> recipetool.RecipetoolTests.test_recipetool_create_python3_distutils: FAILED
> (8.60s)
> 2020-01-23 18:32:58,727 - oe-selftest - INFO - RESULTS -
> recipetool.RecipetoolTests.test_recipetool_create_python3_setuptools: FAILED
> (9.33s)
> 2020-01-23 18:32:58,727 - oe-selftest - INFO - RESULTS -
> reproducible.ReproducibleTests.test_reproducible_builds: FAILED (3620.27s)
> 
> Mostly things like:
> 
> Traceback (most recent call last):
>  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/devtool",
>  line 334, in <module>
>    ret = main()
>  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/devtool",
>  line 321, in main
>    ret = args.func(args, config, basepath, workspace)
>  File
>  "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/lib/devtool/upgrade.py",
>  line 557, in upgrade
>    tinfoil, rd)
>  File
>  "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/lib/devtool/upgrade.py",
>  line 218, in _extract_new_source
>    md5 = checksums['md5sum']
> KeyError: 'md5sum'

OK this is definitely a side effect of one of my patches. I will check this as soon as possible.

> from some of the checksum code changes but also some nodejs-native
> being missing (incorrect guards on npm code?)

The npm recipes needs nodejs-native which is in the meta-openembedded/meta-oe layer.

So the builder needs to add this layer to be able to have a successful build.

This can lead to another question: Shouldn't the nodejs recipe be in OE-core ?

> Could you have a look into those please?
> 
> Cheers,
> 
> Richard

