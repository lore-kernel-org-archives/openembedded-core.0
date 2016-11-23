Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 72A62719F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:47:50 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t79so20016795wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7kLrkFkmVGo7gRROLgWLkNzxaWfZu9jswIBdyALRZww=;
	b=S21eTqekjydryc0fDO6S042SsThpZyj0xb4++WwW3Dfg7bTwpV0tmgyA85EPtIZ5fU
	Ov3AJGDNw5EVWV07cYMwSM7ft1vfgSsjIAP5Y5ftNMIMW5xw+XoGijKwlzzQtpVPZFQI
	mGPpxWnqiIuKRAe9BCRL6bLZQWfH1fprSwo5/6EyauL92zPtGko05e4Gyp7PcI9zHpyj
	b1DJwLqym2pfTB75Z3FOE7T8KW08+pi7I5XRtJpbQu6KcYC+ivjA+3bFRIvmEeckU+XM
	rXl015j7DRxyMQ5TY/Rs5m5Ar1D6oglic4F3ryCbnbYq2Ku2S2AL06wBSAsqQrpE3FsX
	PEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7kLrkFkmVGo7gRROLgWLkNzxaWfZu9jswIBdyALRZww=;
	b=YCEC6nt5RGEjJyn4v1MuTfzj9GFyRSKEBos8z/jnfykqX2nIvvYBDZXkk3NjG4ytW8
	h5gX+z0E/aW8NGW4PmnuXlIJd+YWdsaO3Ab3ZkU4mCJQVeh6n4AEeCACtVBT0L3q7wXm
	EBChhrmcZYvEts1GUDoOwnMhrNY68+SchFHMOPxLP9DXyoI4MQhXJ2mu6aqLziV27+gc
	g4JL2mte9mqQHZTOVr1HtljMXS3meM09IlFS0v/CxJZngYaf9PIPkFnGXdZkSpNoDnxm
	9K6Ze+4bMHUsT3I7lhbUSBYz6S40X3LO397CGCatk/vXajEE/Zsei8evizfyWq5RfjUR
	31eQ==
X-Gm-Message-State: AKaTC03iBWDZKu9BYSM/J0Kp9mKAFkqpjgbSRFIj9nGAiqjtguDV5EMW65hd0LCLw3XRh9kETJfgDxP+hvN1ww==
X-Received: by 10.28.208.203 with SMTP id h194mr6723863wmg.45.1479901672155;
	Wed, 23 Nov 2016 03:47:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Wed, 23 Nov 2016 03:47:31 -0800 (PST)
In-Reply-To: <20161123113630.GB12545@linux.intel.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
	<7c765b6d3940a7b7dc9daeb32f712809a4b5464e.1479887010.git.maciej.borzecki@rndity.com>
	<20161123113630.GB12545@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 23 Nov 2016 12:47:31 +0100
Message-ID: <CAD4b0_+QUgJyV0S8P1d7TzftR6kZEXa1rv6=o2xZ6YJU8DD8+A@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 7/7] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Wed, 23 Nov 2016 11:47:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 12:36 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Hi Maciej,
>
> Thank you for the patchset!
> The changes and the tests look good to me.
> I have little suggestions, but most of them just a matter of taste, so
> feel free to ignore them.
>
> On Wed, Nov 23, 2016 at 08:46:33AM +0100, Maciej Borzecki wrote:
>> wic has a new flag for setting a fixed parition size --fixed-size. Add
>> tests that verify if partition is indeed sized properly and that errors
>> are signaled when there is not enough space to fit partition data.
>>
>> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>> ---
>>  meta/lib/oeqa/selftest/wic.py | 69 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
>> index ad783043b92130a023fd70120becec479c6253a7..45f68df1e74828e11401f57dd732a88a50dd1f00 100644
>> --- a/meta/lib/oeqa/selftest/wic.py
>> +++ b/meta/lib/oeqa/selftest/wic.py
>> @@ -29,6 +29,7 @@ import unittest
>>  from glob import glob
>>  from shutil import rmtree
>>  from functools import wraps
>> +from tempfile import NamedTemporaryFile
>>
>>  from oeqa.selftest.base import oeSelfTest
>>  from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
>> @@ -61,6 +62,8 @@ class Wic(oeSelfTest):
>>
>>      def setUpLocal(self):
>>          """This code is executed before each test method."""
>> +        self.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
>> +
>>          arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
>>          is_x86 = arch in ['i586', 'i686', 'x86_64']
>>          if is_x86:
>> @@ -378,3 +381,69 @@ class Wic(oeSelfTest):
>>          self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
>>                                     % wic_cmd_vars).status)
>>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
>> +
>> +    def _make_fixed_size_wks(self, size):
>> +        """
>> +        Create a wks of an image with a single partition. Size of the partition is set
>> +        using --fixed-size flag. Returns a tuple: (path to wks file, wks image name)
>> +        """
>> +        with NamedTemporaryFile("w", suffix=".wks", delete=False) as tf:
>> +            wkspath = tf.name
>> +            tf.write("part " \
>> +                     "--source rootfs --ondisk hda --align 4 --fixed-size %d "
>> +                     "--fstype=ext4\n" % size)
>> +        wksname = os.path.splitext(os.path.basename(wkspath))[0]
>> +
>> +        return (wkspath, wksname)
> Would 'return wkspath, wksname' be a bit more readable?

Agreed.

-- 
Maciej Borzecki
RnDity

