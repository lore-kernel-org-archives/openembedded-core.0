Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E300665C5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:51:39 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a197so78798964wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JOY38fL//SFjh8fIGixod0QSN+c5WTUMFbpi0iXwggU=;
	b=cxz4HJI8UOwNkHLTXbT8MdtMAPtp80t4jM2x9CcJmI38RrkgJp5PFH4w0PtOhkqkEh
	FKaPRyxECbZJVoeORQ4VdGtn2E91KEdsyvhrbxpGeMELUGqoFZc8fWMPWtQ1rgPVIE5f
	DMAd77SOdD9tel8sRZej28/AmCKJJ5Vej1A2QOD1KigLQ2DaPyFQKyBHbRH06RpbpPcb
	kLfUcDLHNiV72MbVBMu8PpSdwfIxn7DHMT26Ua+A8ZME5wbByDr8qkfSGymm8Lg2kQFz
	6qwe2bdaUGX6YDjDXqnti6x3VenKcO5o8aQfLhIcVGh1k66o3rhOQBxVSBh4nqd3GVIH
	mDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JOY38fL//SFjh8fIGixod0QSN+c5WTUMFbpi0iXwggU=;
	b=TWXleHvuOG20vlV6Sdu3d6zxDXgLceVg8T+z0QHFfVca3+GSor0kQj7nzYp0s5/pON
	ABzWvbPsvL0DUiGDPJF/mQRadMV7KyMesYbC2bzqVLRpIDnAl7dcWt1Dccduo7QZGrsR
	7Q51uhqHEsvYjjDdPy9GkbglK9oyxduKbA92o7KOAAuoJVLnarXB6H3yULxb+ABwE+k2
	vAPn9D4xSnifrAtLaRdHjbJNdPnZp95pBqJgIf0YK0HL9s1ux0AzOgNIBlegcF98x1Jc
	b5crbdzP+PD9TId3F4V6HvcvcEQ6PgSEpcYzcK6JKeZcZYQu57jT+s9kOKO8x1gmZFcd
	bkYA==
X-Gm-Message-State: AKaTC00YTSRuR/3jZtm0Pt+Ig2Qv8xyX/QoFoptVEVIGSENmDbrv3UEI4nZm41q2NbNusIKc0O2Zbci7rNYzuQ==
X-Received: by 10.194.41.163 with SMTP id g3mr3252728wjl.162.1479909100612;
	Wed, 23 Nov 2016 05:51:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Wed, 23 Nov 2016 05:51:20 -0800 (PST)
In-Reply-To: <20161123132229.GA13863@linux.intel.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 23 Nov 2016 14:51:20 +0100
Message-ID: <CAD4b0_JPQ9_9bBd0NnTcGn+JyvtsLU7GA-kt4sfW1rzfuPovgw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Nov 2016 13:51:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 2:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
>> On 23/11/16 13:08, Ed Bartosh wrote:
>> > On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
>> >> On 22/11/16 12:10, Patrick Ohly wrote:
>> >>>> ...
>> >>>
>> >>> All of these introduce some special mechanism. Let me propose something
>> >>> that might integrate better with the existing tooling:
>> >>>
>> >>> The "rootfs" directory gets redefined as representing the entire virtual
>> >>> file system. When creating a disk image, it gets split up into different
>> >>> partitions based on the image configuration.
>> >>>
>> >>> For example, the /home or /data directories in the rootfs could hold the
>> >>> content that in some image configurations goes into separate partitions.
>> >>>
>> >>> The advantage of this approach is that the tooling for staging content
>> >>> for image creation does not need to be changed. The same staged content
>> >>> then can be used to create different images, potentially even using
>> >>> different partition layouts.
>> >>
>> >> That's a very good idea. I think it beats all of my suggestions!
>> >>
>> >>> To implement this approach with wic, wic needs to be taught how to
>> >>> exclude directories from the main rootfs. Ideally, the mkfs.* tools
>> >>> should also support that without having to make an intermediate copy of
>> >>> the files for a certain partition, but initially wic could create
>> >>> temporary directory trees.
>> >>
>> >> Yes, some work would be needed here, but ultimately it would be contained within wic and related tools, which is a good thing.
>> >>
>> >
>> > I support the idea. Let's discuss the details of implementation and
>> > create a bug in bugzilla to track the development
>>
>> Do you want me to create the ticket? (it'll be my first, so apologies in
>> advance if I omit something important)
>>
>> > This can be done by extending existing rootfs plugin. It should be able
>> > to do 2 things:
>> >
>> > - populate content of one rootfs directory to the partition. We can
>> >   extend syntax of --rootfs-dir parameter to specify optional directory path to use
>> >
>> > - exclude rootfs directories when populating partitions. I'd propose to
>> >   introduce --exclude-dirs wks parser option to handle this.
>> >
>> > Example of wks file with proposed new options:
>> > part /     --source rootfs --rootfs-dir=core-image-minimal       --ondisk sda --fstype=ext4 --label root --align 1024 --exclude-dirs data --exclude-dirs home
>> > part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024
>> > part /home --source rootfs --rootfs-dir=core-image-minimal:/data --ondisk sda --fstype=ext4 --label data --align 1024
>> >
>> > Does this make sense?
>>
>> Looks good. The only thing I would question is that, in the interest of
>> reducing redundancy, maybe we should omit --exclude-dirs and have wic
>> figure this out by combining all the entries, since "--exclude-dirs
>> <dir>" and the corresponding "part <dir>" will almost always come in
>> pairs. Possibly we could mark the "/" partition with one single
>> --no-overlapping-dirs to force wic to make this consideration. Or do you
>> think that's too magical?
>>
> Tt's quite implicit from my point of view. However, if people like it we
> can implement it this way.
>
>> (I haven't checked how feasible this is in the code btw)
>
> I think it would be much easier to implement --exclude-dirs.
>
> BTW, it will also allow to exclude directories from any partition, not just from
> root, e.g. to use --exclude dirs this way:
> part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024 --exclude-dirs cache --exclude-dirs tmp

Just to be sure, --exclude-dirs means that the contents of the
directory are skipped, not the directory itself?

Given your example, /home/tmp, /home/cache will be included in /data,
but /home/{cache,tmp}/* not. Is this correct?

Regards,
-- 
Maciej Borzecki
RnDity

