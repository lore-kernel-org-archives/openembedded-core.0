Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 94A4D7854D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:14:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 03:14:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="5301460"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2017 03:14:30 -0800
Date: Tue, 21 Nov 2017 13:15:19 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171121111519.GA34166@mbabyjoh-desk.ger.corp.intel.com>
References: <1510847767-2966-1-git-send-email-maxin.john@intel.com>
	<1510847767-2966-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LYyqm8ycgT5z+J6zku6xJmLj73O_i5mVd7PyzSze6p=ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYyqm8ycgT5z+J6zku6xJmLj73O_i5mVd7PyzSze6p=ww@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] image.bbclass: improve reproducibility
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
X-List-Received-Date: Tue, 21 Nov 2017 11:14:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Nov 21, 2017 at 10:59:49AM +0000, Burton, Ross wrote:
>I think this is to blame for a slew of failures on the autobuilder:

Sorry for that. Please revert it.

>http://errors.yoctoproject.org/Errors/Latest/?filter=57ddf212e64207edfbd813d32ca3a15f6c1c8211&type=commit
>
>Such as:
>
>NOTE: FAIL [0.616s]: test_df (df.DfTest)
>NOTE: ----------------------------------------------------------------------
>NOTE: Traceback (most recent call last):
>File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
> return func(*args, **kwargs)
> File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
> return func(*args, **kwargs)
> File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/meta/lib/oeqa/runtime/cases/df.py", line 13, in test_df
> self.assertTrue(int(output)>5120, msg=msg)
> AssertionError: False is not true : Not enough space on image. Current size is 0
>
>Ross

I will check what went wrong there.

>On 16 November 2017 at 15:56, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> Improve reproducibility of builds by adding --apparent-size to du -ks in
>> get_rootfs_size
>>
>> [YOCTO #12235]

Best Regards,
Maxin

