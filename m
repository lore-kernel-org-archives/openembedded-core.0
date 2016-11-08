Return-Path: <alistair23@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF92C6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:23:33 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e187so17700352itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 09:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gL9FjeZvoWzN9IbVWTPyBcMcKcPQ6mfPRpdhKsPrhk8=;
	b=KvpvYFmlZ9mZpX0dF0H8VDv2k0ak3VTiS9d801XSISBuMWPwL+/dlTYLq4Yq1aAF1i
	Ip/uR4mg3CxCYNiWW+ELsLBTnRBfScUkapDC/oTNkMdM6mq2pz+AnvpdKWNq6oD1m7ig
	FC7qH2rWgp1QVW5ho8I8Lbxi4t9XMn0IasuNnL8glICfhL3xgSn1CX4lgxf3EuFFx4yg
	y88KRneHeodkNSt/O8Tz083fHj+cs4J5UJ9aF3O5nWTSluGwYNElObwSsVXeTNvmkh25
	pZH7+ab+A8DUEoRf2pH7g6s3lxXSOthK5xM7Xg3YxobJIsmgAnBbCN8PfNEBompwnbKQ
	IvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gL9FjeZvoWzN9IbVWTPyBcMcKcPQ6mfPRpdhKsPrhk8=;
	b=VXMCAOcbk/y6fdSQ3vpXXz+BcwAJPOggSvpv44r3pksCna7iJmPUP0fX1OzRyb9FcA
	CzQBUjta2R+r6N/agAJzRcFemttgHcZEKMceNMY2ddqxwPcue76aAwSo3CJetB9FXODb
	kMO2Qwjtr9nIAuSIOIux7C8jcEEN9QetDn5izOPUCsNrwHZiXteADD/QFyXA4h4gQcti
	9DKg0uC66EU/0cW6cYk3FtwXrnu6p4RUs4foX4A9RkDr6yPIK6ybyHXBbBaBDLCLQNw0
	qjtGKkQ7SD0atXWJx52Tyy5L7YVKmcwB+s5l+1NanFNsdRtvePfPNlhOC0CiPVGhec9y
	MNXw==
X-Gm-Message-State: ABUngvdiwvlDDPr/TcceCCa5amKYqzVuSF7Geb9cQ2U5ycq1YEPK5isv9j2K3PydSRZAQNHxVvxb7fb3xABTWQ==
X-Received: by 10.157.0.74 with SMTP id 68mr6304645ota.249.1478625815027; Tue,
	08 Nov 2016 09:23:35 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.122.34 with HTTP; Tue, 8 Nov 2016 09:23:04 -0800 (PST)
In-Reply-To: <CA+aJhH2_HGwTCuOy8ahGpygxXWBJLLOb6O6Cao9scvUAWYrFbw@mail.gmail.com>
References: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
	<1478132237-28350-3-git-send-email-alistair.francis@xilinx.com>
	<CA+aJhH2_HGwTCuOy8ahGpygxXWBJLLOb6O6Cao9scvUAWYrFbw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 8 Nov 2016 09:23:04 -0800
X-Google-Sender-Auth: oK_XtKQhFQI7LWU3Icsytgn3QV0
Message-ID: <CAKmqyKNQswsEYqTyavhwcbJ_F6W_W74gAKS+CmhVv7ijOjOKzw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Tue, 08 Nov 2016 17:23:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 8, 2016 at 3:15 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
> On 3 November 2016 at 10:17, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> In some cirsumstances the user doesn't want to supply a kernel, rootFS
>> or DTB to QEMU. This will occur more now that QEMU supports loading
>> images using a '-device loader' method.
>>
>> Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
>> to avoid supplying these options to QEMU.
>
> Just wondering if it would be worth adding a "QB_KERNEL_OPT" similar
> to how QB_ROOTFS_OPT works. This way the "none" would not be needed
> and it would allow for using the "-device loader" arg for machines
> that boot that way.
>
> e.g.
>
> QB_KERNEL_OPT = "-kernel @KERNEL@"
> or
> QB_KERNEL_OPT = "-device loader,addr=0xdeadbeef,file=@KERNEL@"
> or (if not able to load kernel, aka 'none')
> QB_KERNEL_OPT = ""

That way is fine with me, but that would then break compatibility with
other layers using this (they would all need to set the KERNEL_OPT so
I tried to avoid that.

I guess you could set the default to "-kernel @KERNEL@" which probably
wouldn't break anything though.

I'm happy to update the patch if that is the preference. Do people
think that's a better option?

Thanks,

Alistair

>
> Regards,
> Nathan
>
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  scripts/runqemu | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 922ebaf..5f60312 100755
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
>> @@ -857,6 +861,9 @@ class BaseConfig(object):
>>              k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
>>              self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>>
>> +        if self.fstype == 'none':
>> +            self.rootfs_options = ''
>> +
>>          self.set('ROOTFS_OPTIONS', self.rootfs_options)
>>
>>      def guess_qb_system(self):
>> --
>> 2.7.4
>>

