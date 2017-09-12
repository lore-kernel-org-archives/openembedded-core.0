Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3B078407
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:18:50 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CCIoXN016816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:18:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1505218731;
	bh=6cxR5IKgb0FvSE5WR6yz9cIoXxXYttl+SKSOIJ4INi8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=kz5SpJxL12Y2BNJ9zZ9NNp2hZ62wjp12QWJO92zJSf9LWV541lDZi91G7WGEw44Dn
	o+9V8E/AOEXmeCiP1IhqCznQab65JoWLxF5BwTIwwStuG7cOX30eF8eXoELOSkSXNO
	PIg0jfEcBpjpo7xVcon3Go+8BUAcj7aG9NZYvyyE=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CCIhGr019723 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 12 Sep 2017 14:18:44 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 2BF0FD0844F;
	Tue, 12 Sep 2017 14:13:39 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CCIfGw019720
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 12 Sep 2017 14:18:41 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1drk9J-0007MA-A4; Tue, 12 Sep 2017 14:18:41 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
	<lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912114837.ytzatxdw2cqcwsyz@linux.intel.com>
Date: Tue, 12 Sep 2017 14:18:41 +0200
In-Reply-To: <20170912114837.ytzatxdw2cqcwsyz@linux.intel.com> (Ed Bartosh's
	message of "Tue, 12 Sep 2017 14:48:37 +0300")
Message-ID: <lya820f6u6.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 12:18:51 -0000
Content-Type: text/plain

Ed Bartosh <ed.bartosh@linux.intel.com> writes:

>> >> >> The --extra-space and --overhead option did not had an effect to squashfs
>> >> >> partitions.  Although squashfs is read-only, it can be useful to allocate
>> >> >> more space for the on-disk partition to avoid repartitioning of the whole
>> >> >> disk when a new (and larger) squashfs image is written on later updates.
>> >> >
>> >> > Is it possible to just use --size or --fixed-size in .wks to allocate
>> >> > partition of certain size?
>> >> 
>> >> --fixed-size works with this patch (tested); --size should work.
>> >
>> > Sorry for not being clear. Why do we need this if we can use --size to
>> > explicity specify partition size?
>> 
>> --size and --fixed-size did not had an effect for squashfs with the old
>> code.
>>
>
> I'd propose to fix this instead of applying extra space and overhead
> factor to the filesystems that don't support this by design.
>
> The idea is to make size and fixed-size parameters to set partition size
> and use extra-space and overhead-factor to extend filesystem size as
> they're currently used.

For what is this overhead to be used?  In most cases, to allow future
updates.  And this is required for squashfs too.

Only difference is, that updates for squashfs are to be applied on
partition level and these for other file systems on file system level.
But the need for extra space exists in both cases.


>> I want/need it to allow updates of the running system without complete
>> repartitioning.  E.g. at wic creation time, the squashfs has a certain
>> size.  Sometime in the future, there are needed e.g. 5 MiB more because
>> a new package was added or so.
>>
>
> Yep, I understood what you want. I think it's better achieved by setting
> partition size with --size option than artificially apply extra-space and
> overhead factor to the filesystem that doesn't support this.

It really does not matter for me whether the filesystem itself can be
extended or whether I need a larger partition to apply future updates.

I just need a partition which provides an absolute or relative amount of
additional space.


>> I need to reserve space in the partition so that I can 'dd' the new
>> image without a complete repartitioning.
>> 
>> --extra-space/--overhead has the meaning which I want (e.g. to say
>> "reserve +20% for changes in the future").
>
> So far extra-space and overhead factor were used to allocate additional
> space on the file system. This is different from the way you want to
> use them. You're not allocating space on squashfs, you're allocating
> unformatted space on the partition. It's better to use --size for this.

No; --size is not what I want. --size (or --fixed-size) assume that I
know the absolute size.

Of course, I can get this size empirically.  But it is highly inflexible
and requires different wks files for different image types.

I want to reserve an extra percentage for future updates.  And these
percentages can be in the range of 1 - 5 MB (for small images with
only test tools) or several hundred MB (for large image types with
e.g. desktop environments).

--size or --fixed-size for these image types would be in completely
different ranges while --extra-space/--overhead fits to all.


> I mean that method is called for all possible filesystems, but makes
> sense only for squashfs. It makes code less understandable for no
> reason. When code is used in the only place it's much more easy to
> understand from my point of view.

Not in my one.



Enrico

