Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C4E5660767
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:13:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 68so5409227wmz.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 17:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JA4kBXl0bXyi1CN12zb5pyY+YtBxoOJrso8/m+k2oYM=;
	b=m8Ip+R082PDO279d63Wq+6Oodm5V1QHzvNyweSwb/FBF8mUdLYlvic0NGT28YIwD5l
	IdfSdAXrEzvX5NnyB/4bhUc/svcVqe1w+HUbG5BQK8UYqLMNeLjRgcXya8O68nF3O9bX
	qR6AB7os1l3/0bFSOl8+FmgyL8uP2u51eV+jE4xOXJViEfobn5Xcy2bfnhd4t9B0S9dc
	nDXezbDAixZn7n5ZD7FVoMx83hMUmWFcOXSm5vJMgc4NPZABFCUM1z8bbqvMY6ZJsaM9
	i2UjFiuexyf1QFO1K7S8CdDACzPzxsFVDAlfxO+zf5UV2Fx4iTf/bXH1NKnoRXKQuZwY
	ee7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JA4kBXl0bXyi1CN12zb5pyY+YtBxoOJrso8/m+k2oYM=;
	b=KvG6ongw08JVvKrS9qVeAuaVnq3IXkRiAtLh62a/kUEJRT2uTbqMqgs85+I2eLpizD
	x5+yUy4IA4FJjXKkk5xoc/mfyKzQyapmqqowLoT6bCOtysDu8y7DQxaDAqJg4Tx9x5Iu
	GsnBv0OzcjZt4wIAM743fMjN5D+51UU3UhxtIxYTt6a/xdJ4zM89B22A3+O/1mRh3kg/
	+DZdu22OnUi3g02iF9lfZ5bQ2N1EmNNXb8i5gz4yfMZk01qgv1biciSNCHF8TxpKh1Fy
	c2MVuxFncZ75S231WKxldKDwn+ZbRwOKvjnuDiWQTgpdq/yirQJOoCXNCKQanygAzgSF
	FAuw==
X-Gm-Message-State: ABUngvdScDrbEAXQ86QJjnV+eZXQps9uDS01Lki77ZEwZYgeBUwuxW4tJhvbuFx+KmTsXHzRcwBcxZdjX8w7oQ==
X-Received: by 10.28.189.69 with SMTP id n66mr5291943wmf.35.1478131991471;
	Wed, 02 Nov 2016 17:13:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.155.103 with HTTP; Wed, 2 Nov 2016 17:13:10 -0700 (PDT)
In-Reply-To: <CAKmqyKNX+9gFkukkL=eN_wPrv+0tDPf5jpvnRaL6BjHe-xmkHQ@mail.gmail.com>
References: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
	<1478128703-12144-3-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKNX+9gFkukkL=eN_wPrv+0tDPf5jpvnRaL6BjHe-xmkHQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 2 Nov 2016 17:13:10 -0700
Message-ID: <CAJ86T=WY7SJu1s271hhVjh5x9ismvGW_2baJSsX6zZdiURMz7Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 00:13:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 2, 2016 at 4:30 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Wed, Nov 2, 2016 at 4:18 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> In some cirsumstances the user doesn't want to supply a kernel, rootFS
>> or DTB to QEMU. This will occur more now that QEMU supports loading
>> images using a '-device loader' method.
>>
>> Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
>> to avoid supplying these options to QEMU.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  scripts/runqemu | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 922ebaf..ac10ee2 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -453,7 +453,7 @@ class BaseConfig(object):
>>      def check_rootfs(self):
>>          """Check and set rootfs"""
>>
>> -        if self.fstype == 'nfs':
>> +        if self.fstype == 'nfs' or self.fstype == "none":
>>              return
>>
>>          if self.rootfs and not os.path.exists(self.rootfs):
>> @@ -481,6 +481,10 @@ class BaseConfig(object):
>>          # QB_DEFAULT_KERNEL is always a full file path
>>          kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
>>
>> +        # The user didn't want a kernel to be loaded
>> +        if kernel_name == "none":
>> +            return
>> +
>>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
>>          if not self.kernel:
>>              kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
>
> This diff didn't end up making it in somehow. This is also required:

Squash the two commits and send the result as a v2.

> diff --git a/scripts/runqemu b/scripts/runqemu
> index ac10ee2..5f60312 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -861,6 +861,9 @@ class BaseConfig(object):
>              k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
> self.nfs_dir, self.unfs_opts)
>              self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>
> +        if self.fstype == 'none':
> +            self.rootfs_options = ''
> +
>          self.set('ROOTFS_OPTIONS', self.rootfs_options)
>
>      def guess_qb_system(self):
>
> Thanks,
>
> Alistair
>
>> --
>> 2.7.4
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

