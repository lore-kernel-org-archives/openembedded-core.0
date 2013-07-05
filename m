Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 479876AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 15:37:37 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so1893885veb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 08:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=VLJAC7VmHJX0KlXOMr2oVSg8dIHNvlaq5v+Z3tCJ5+M=;
	b=CakldCAW07c3JJG2GkL+jwQKKyvbJVUN4+sc1lJBFXjEwCGyHU3Cc4HqAjhf31gwDH
	9Wx808y0b654Un3V12zF2/2+5A2iT22F51TAa6MBV+n+9h318gtqvP8BcMCvJFUMgq3C
	dDOd3wG2K3gLRSfoVuMxtnr81It+tg5/IfKp3HytpIhx8gZBUz8E4WtjmdeN+v5RwoEz
	duBbiQ1tbk9pi3wCufWY/Wu1+RqN3m5t8nhTi8+Qhf8cOs4E3nB77oSjP4OZn5aSCINv
	vKBCXyCtdAjW6ifcYXbhe5ZuhOkLGE2YXMenug6Ke/mD5EtHOg7sVmqrs0bLqpW77RXB
	pQGQ==
X-Received: by 10.220.1.9 with SMTP id 9mr7240046vcd.37.1373038658137; Fri, 05
	Jul 2013 08:37:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 5 Jul 2013 08:37:17 -0700 (PDT)
In-Reply-To: <1458807.Cif2MtSWk2@helios>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
	<1458807.Cif2MtSWk2@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2013 16:37:17 +0100
Message-ID: <CAJTo0LaYXrE9Up9yGq=zyQG7WQAWgQCMo5Mv2Rs8__smGWsKNA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkGx6bwiVvxn++rBybS09bv5xzHfwaIra6JMtpodZKZ2CbPrGgDtl/0Y5/fLEdbBPh4kQOX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Missing deps discovered in per-recipe builds
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
X-List-Received-Date: Fri, 05 Jul 2013 15:37:37 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 16:28, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>   rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache
>> tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone
>> tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps
>> tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/*

Do you really need all those rms?  wipe-sysroot will blast away the
sysroot which will then be re-populated from sstate, and the
per-package work directories will be cleaned out by the -ccleansstate
(that does a clean + remove from sstate, right?)

Ross

