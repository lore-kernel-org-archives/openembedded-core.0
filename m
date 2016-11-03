Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id C09A371AC9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:19:58 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 62so3730984oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 17:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/T6wnkjlNaDfYiKJxrVu7bPTlQKXTK3urD2TY79uqDE=;
	b=iEGF0/hQXYDgrMf4Ls20BkzaVJ1nLU8YT+lvQ/qCVdQ2Datk2H7siULTC+w8EdAFUk
	YMiVZhsiWGeVzg67JRBUUJwuWkhZ631iy38ntoqzLdo8gEl4wt14z0n8sNC6WWJM/rs2
	ZGqsn3y03Svzs3Rb18ZxL7QLPeAaNHugh4d5N5Ox+YWR2CfKmJh7TFiNITGgrIjRQck6
	N/pUyLK7OeqCspdG9rLnokf+wGlV9QnNBpdlsR8VIEBer1aeTpj4ZC1dMFxAJSCQIh2O
	SUGvPsxsiplfrQNB76d8zrQ6QCesZTx5XGvTFQAsxS7FeUOZZGgqgJ2AUYr+Og5mqYn0
	0Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/T6wnkjlNaDfYiKJxrVu7bPTlQKXTK3urD2TY79uqDE=;
	b=SivcS9hUe9qSAJ5692PGW1kHF3fijN12hwhFIcl/Y38vjbGotxboK5KcLP4CbF2lqB
	JCozvVNBpV0Hw5Lt8zpr/j7bkfN2RF1P6QjiSMtUrjNNg0tX9xQ80rUlW3R2A7J3aRgK
	BY4xRfMfNFp9ZmCG1f6GVGZ90AMy2+pQDMUmz27++RyyUfjixP7l4zdnocPleHxRRdLb
	DumRUwhP09PKj0ucaqvG5Djx0hE/jKoBWDx83wZhg8VXjUUkcfVt8p0BTKb/yf1ZhHpc
	b4SOUaURQauKcimZqvVfN5XctD7DrgrvhxPSqYJQxJ87jZvB9KQ+Eh1whZmPUy5qbEMy
	BDeQ==
X-Gm-Message-State: ABUngvc+70IJUG6fpUSdvaZBizN/dmaMR0A8Gn/nr0ZzkFS2BIl/3Zfyi9t2o4iRiLkap+eMkzBuDq6qTUnLpg==
X-Received: by 10.202.76.199 with SMTP id z190mr5715381oia.100.1478132399798; 
	Wed, 02 Nov 2016 17:19:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Wed, 2 Nov 2016 17:19:29 -0700 (PDT)
In-Reply-To: <CAJ86T=WY7SJu1s271hhVjh5x9ismvGW_2baJSsX6zZdiURMz7Q@mail.gmail.com>
References: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
	<1478128703-12144-3-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKNX+9gFkukkL=eN_wPrv+0tDPf5jpvnRaL6BjHe-xmkHQ@mail.gmail.com>
	<CAJ86T=WY7SJu1s271hhVjh5x9ismvGW_2baJSsX6zZdiURMz7Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Nov 2016 17:19:29 -0700
Message-ID: <CAKmqyKMhjYSTAUU6R_FLg2gF92w7rSOkKqhjvBMXAwp6WnG51g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Thu, 03 Nov 2016 00:20:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 2, 2016 at 5:13 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Nov 2, 2016 at 4:30 PM, Alistair Francis <alistair23@gmail.com> wrote:
>> On Wed, Nov 2, 2016 at 4:18 PM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>>> In some cirsumstances the user doesn't want to supply a kernel, rootFS
>>> or DTB to QEMU. This will occur more now that QEMU supports loading
>>> images using a '-device loader' method.
>>>
>>> Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
>>> to avoid supplying these options to QEMU.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>  scripts/runqemu | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>> index 922ebaf..ac10ee2 100755
>>> --- a/scripts/runqemu
>>> +++ b/scripts/runqemu
>>> @@ -453,7 +453,7 @@ class BaseConfig(object):
>>>      def check_rootfs(self):
>>>          """Check and set rootfs"""
>>>
>>> -        if self.fstype == 'nfs':
>>> +        if self.fstype == 'nfs' or self.fstype == "none":
>>>              return
>>>
>>>          if self.rootfs and not os.path.exists(self.rootfs):
>>> @@ -481,6 +481,10 @@ class BaseConfig(object):
>>>          # QB_DEFAULT_KERNEL is always a full file path
>>>          kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
>>>
>>> +        # The user didn't want a kernel to be loaded
>>> +        if kernel_name == "none":
>>> +            return
>>> +
>>>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
>>>          if not self.kernel:
>>>              kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
>>
>> This diff didn't end up making it in somehow. This is also required:
>
> Squash the two commits and send the result as a v2.

I was trying to avoid spam, but you are right. I sent a v2

Thanks,

Alistair

>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index ac10ee2..5f60312 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -861,6 +861,9 @@ class BaseConfig(object):
>>              k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
>> self.nfs_dir, self.unfs_opts)
>>              self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>>
>> +        if self.fstype == 'none':
>> +            self.rootfs_options = ''
>> +
>>          self.set('ROOTFS_OPTIONS', self.rootfs_options)
>>
>>      def guess_qb_system(self):
>>
>> Thanks,
>>
>> Alistair
>>
>>> --
>>> 2.7.4
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

