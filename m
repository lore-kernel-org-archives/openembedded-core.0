Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 23D936018D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 06:06:22 +0000 (UTC)
Received: by lfaz4 with SMTP id z4so7642839lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 22:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=yRDk4iKpdGFDTJhtTp2WjdrfSMd2t44C1bs8TrAKe+U=;
	b=eRJQqqg3HR/+NvSgEe9V0i5FwMHde9UeUbli/S2eXDCPpGD5o9nBfNllgJxby/m6ZT
	W6A54rztWfMQNCXyg0/6eWX9og7z5x1UtRbqsVkjAeCndntpHnUfqEN5C7+AXWV/yIvp
	o+abKIn8egFvYFWsxJ5ucEUOVCI0E2/yVUAbNDD6uqXj16SQvwZH57+BQ/AbtNolgpfu
	4GNSwq6k3yGUl5slmqBnyV9Liaw+TLXFIYz+237RH5tM4yvHso3e2cVupbWn3yR1lJfS
	XkXj/pjvib8INfRRT3qC4IT+Oo3m31TwW6LfykRVAt6pNaM1iYoVxYHxzErCwcLld6jF
	x98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=yRDk4iKpdGFDTJhtTp2WjdrfSMd2t44C1bs8TrAKe+U=;
	b=m/vVKGRUqV7uJ2bx9hrrJ3Iy3L1WjPB/FHF++XJWZezvaybJgCnc8IW0oF1wf76lLT
	hrgXbYFFEFCyr5zRlfCyNaF3tvF7pzo9hH+3bkSQJFh2sNczFmafunrPVHyCm3OL5+/1
	ELb0y/0yYDciY/haN5hjEvziUxitpuJDlu2Vvm/M0P6oUn16xZcPvI2DYCiQsQZ1gFSi
	80Zzgm2/anFgdzLi2tgvvi9W8lKQJ5Om4A8RawXZaNf90E5JH2jm/NHhLLF1jZT0IZiR
	AOw0CARwIejvnc1LNCXKzx877tovPR2Km9SIHhTo+LOKuQvD28igJaAF9jHJBpQKjl0X
	pJbg==
X-Gm-Message-State: ALoCoQkFt5TGe0RtgVOuVOwqLwpXng/OoEDmCjp+iJl96KZ1q7V2Mn8XqKnWQnlBsW7Foqh7CjI9
X-Received: by 10.112.72.201 with SMTP id f9mr12163688lbv.62.1448345182867;
	Mon, 23 Nov 2015 22:06:22 -0800 (PST)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id ak1sm2307882lbc.2.2015.11.23.22.06.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Nov 2015 22:06:22 -0800 (PST)
Date: Tue, 24 Nov 2015 07:06:20 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
Message-ID: <20151124060620.GA10937@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
References: <56538808.5050606@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56538808.5050606@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 06:06:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mariano Lopez <mariano.lopez@linux.intel.com> [151123 22:41]:

> There has been interest in an image based software updater in Yocto Project.

Ok. Sure, it might be nice with something that can be shared, instead
off everyone's building our own solutions.

> The proposed solution for a image based updater is to use Stefano Babic's
> software updater (http://sbabic.github.io/swupdate). This software do a
> binary copy, so it is needed to have at least two partitions, these
> partitions would be the rootfs and the maintenance partition. The rootfs
> it's the main partition used to boot during the normal device operation, on
> the other hand, the maintenance will be used to update the main partition.

I haven't checked the swupdate tool, though I'd suspect that it also
supports the alternating rootfs use case? (I.e. run system1 update
system2; reboot to system2. Next update is system1). This is a rather
common setup, not least when you need a remote upgrade facility.

Would your proposed inclusion to the Yocto Project support that case
too?

> To update the system, the user has to connect to device and boot in the
> maintenance partition; once in the maintenance partition the software
> updater will copy the new image in the rootfs partition. A final reboot into
> the rootfs it is necessary to complete the upgrade.

Like said above, not all system can be reached manually (at least not in
cost efficient way). Sure, the mainenance partition scheme can be made
to work anyway...

> As mentioned before the the software will copy an image to the partition, so
> everything in that partition will be wiped out, including custom
> configurations. To avoid the loss of configuration I explore three different
> solutions:
> 1. Use a separate partition for the configuration.
>   a. The pro of this method is the partition is not touched during the
> update.
>   b. The con of this method is the configuration is not directly in rootfs
> (example: /etc).

I'd vote for that as well. Though, I only keep the re-writable
configurations here. The one that are constant between all systems are
shipped in /etc in the read-only-rootfs.

> With the above information I'm proposing to use a separate partition for the
> configuration; this is because is more reliable and doesn't require big
> changes in the current architecture.

> So, the idea is to have 4 partitions in the media:
> 1. boot. This is the usual boot partition
> 2. data. This will hold the configuration files. Not modified by updates.
> 3. maintenance. This partition will be used to update rootfs.
> 4. rootfs. Partition used for normal operation.

How flexible to you intend to make this system? Allow everything that
swupdate supports? Or a specific subset?

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

