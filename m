Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2A78F71B03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:08:29 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id t196so3374693lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KCA/zazO5ojZv43PTDnAw8K3ULOiTJe9axCykZOKrVY=;
	b=sucKhxQ0Qfsh3tBffIEv9LL+Qh2tRRolKUjHjQ8nudiU2QU/AGJJemwyeTRnvDjJlO
	W/+lOor3cfNJ3Z6vdbKliV0xHMxR3T872k9IzYDDzHkugee73VeaeMm4CxOOn7wPmwoX
	Gi5arl7RAsV8zYpF5lNde/LJ9Xu9LnW9u/f2jek1Bmz++ZN0tFB+XSUkaq93itDav8d8
	lwkOEccWdmVPRWarXA5jN92zyCofMRGnvvXhuAUimGO8U2+rg3TS0z2A//HqO/UecPTA
	mmf4akRFa5n1nnQjDQyuinEZHL/zYplx6TNkuks6Z6XUlBAfmKHvX+0qkHSLCpSDDGHG
	sAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KCA/zazO5ojZv43PTDnAw8K3ULOiTJe9axCykZOKrVY=;
	b=SHDTpGjLHIJvLun/NhWKUGAcynNfe1CV3w4K59N1uhUf8i1xQqHPekO50JGIHx4U+B
	ZwIalPlxTtIZUV9XoOdRo2VFzffKV9CWuXcH8ARdPDMfksnhUvdxdq3YXxd8VCeugr+/
	5N9yaZ85wb+QEtxZsu/k8I9zooCOQ0jLK1dcfu/wKEkJ1AF9Z0DIxattaqIhXrZWlrk+
	V7nu6t3nL1DQmqYMkZqQMvIpmgZBmeLAqXc7EY1STpOu80h9+9+FZqt+gPXSOLe6IO8e
	OO9x3JErwKwdnaidjJgHzeQlhk8Uxn2KNw7rCAguCI3ix3hInBW08KxWUZipM7T9HxsN
	AdHw==
X-Gm-Message-State: AKaTC00B2DEiJRlvXoDrLu1x8n3LoAkF0gRgSbJdVg1aESbE4F/QpCS7J5k937KwRjjbKg==
X-Received: by 10.25.67.85 with SMTP id m21mr803410lfj.28.1479906509935;
	Wed, 23 Nov 2016 05:08:29 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	o196sm7160649lff.20.2016.11.23.05.08.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 05:08:29 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
Date: Wed, 23 Nov 2016 14:08:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161123120816.GC12545@linux.intel.com>
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 13:08:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 23/11/16 13:08, Ed Bartosh wrote:
> On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
>> On 22/11/16 12:10, Patrick Ohly wrote:
>>>> ...
>>>
>>> All of these introduce some special mechanism. Let me propose something
>>> that might integrate better with the existing tooling:
>>>
>>> The "rootfs" directory gets redefined as representing the entire virtual
>>> file system. When creating a disk image, it gets split up into different
>>> partitions based on the image configuration.
>>>
>>> For example, the /home or /data directories in the rootfs could hold the
>>> content that in some image configurations goes into separate partitions.
>>>
>>> The advantage of this approach is that the tooling for staging content
>>> for image creation does not need to be changed. The same staged content
>>> then can be used to create different images, potentially even using
>>> different partition layouts.
>>
>> That's a very good idea. I think it beats all of my suggestions!
>>
>>> To implement this approach with wic, wic needs to be taught how to
>>> exclude directories from the main rootfs. Ideally, the mkfs.* tools
>>> should also support that without having to make an intermediate copy of
>>> the files for a certain partition, but initially wic could create
>>> temporary directory trees.
>>
>> Yes, some work would be needed here, but ultimately it would be contained within wic and related tools, which is a good thing.
>>
> 
> I support the idea. Let's discuss the details of implementation and
> create a bug in bugzilla to track the development 

Do you want me to create the ticket? (it'll be my first, so apologies in
advance if I omit something important)

> This can be done by extending existing rootfs plugin. It should be able
> to do 2 things:
> 
> - populate content of one rootfs directory to the partition. We can
>   extend syntax of --rootfs-dir parameter to specify optional directory path to use
> 
> - exclude rootfs directories when populating partitions. I'd propose to
>   introduce --exclude-dirs wks parser option to handle this.
> 
> Example of wks file with proposed new options:
> part /     --source rootfs --rootfs-dir=core-image-minimal       --ondisk sda --fstype=ext4 --label root --align 1024 --exclude-dirs data --exclude-dirs home
> part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024
> part /home --source rootfs --rootfs-dir=core-image-minimal:/data --ondisk sda --fstype=ext4 --label data --align 1024
> 
> Does this make sense?

Looks good. The only thing I would question is that, in the interest of
reducing redundancy, maybe we should omit --exclude-dirs and have wic
figure this out by combining all the entries, since "--exclude-dirs
<dir>" and the corresponding "part <dir>" will almost always come in
pairs. Possibly we could mark the "/" partition with one single
--no-overlapping-dirs to force wic to make this consideration. Or do you
think that's too magical?

(I haven't checked how feasible this is in the code btw)

-- 
Kristian

