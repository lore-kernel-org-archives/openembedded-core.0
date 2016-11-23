Return-Path: <kristian.amlie@mender.io>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2355A60750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:04:31 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id n6so5518537qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=C6AQ/zkF5R6WXYVxN1YgRrlFNt7TXksgCfj+Xu3gl1E=;
	b=j9BlxAgyXsUqZP6MN91s0RMoPavlPNJONzsuk3J/jKb6watWImH1eFCo+mQCggp6WM
	VJS1ag2+0XtI43/tndwicT3uWu5vgRIGi4/jxQleOOis3EhKvgKpI95P/YC0OmvF+Bgk
	VBWn19z//fItt3nF25UggOHUf5l/7dkmiwDleN3kbHdEKHQeSIi1XK3VbF12+a1gii8w
	kgeVPSBOj/75kIdLXw0/MEX8/WbFWuKdydjV0Iez9SdUqfhljCKQ0GY2njdj/FTgVoeV
	pTil8deFalW5BzT9O7S1l0YT/6O27HA579jbZIP5qYBlgREIiVWkf9CZlmqoM/0xaPWP
	MLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=C6AQ/zkF5R6WXYVxN1YgRrlFNt7TXksgCfj+Xu3gl1E=;
	b=JjQWZxTLTOgvajm62p+kHQG33Ejvb4FKJy0kOkwAV0tTx6OfQhQKXjqgF0/7Z4k27U
	e37vIMZD9DsSzM4bUA7o2prqDW1eHrWz6aOjN73IaUQ8fLzLBh6zsqvX4qaCP/uizB3z
	6qI1lsvBYnn8gYFqNbscc3LIdvVXUdsYJD57pm+vM7Kfm7/U2gbYNEyPzbcOV3YYNte7
	ptjYWtZnzvIu7BH9eCTbQpExGIIrQJ5pC3wzH6jWYRmoFaPSe3c9MhOvLKu1AmxhJ76k
	Fje3eTV9c6jHFGWSKnf5v0EO7E9HVxxSkoSaTgP2a05YKTGmazNu97emqPnkuGgZ3n+z
	pH2w==
X-Gm-Message-State: AKaTC01TL5b3mRRVKucXLhsBHRN96xqht78pGpWD6zuDPq8Uo1NFwdewDqo3F90KfGcX/g==
X-Received: by 10.25.134.139 with SMTP id i133mr452619lfd.79.1479891872748;
	Wed, 23 Nov 2016 01:04:32 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	18sm7039319ljj.7.2016.11.23.01.04.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:04:31 -0800 (PST)
To: Enrico Joerns <ejo@pengutronix.de>, Patrick Ohly
	<patrick.ohly@intel.com>, Eduard Bartosh <eduard.bartosh@intel.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <15d3387f-3f73-fb6a-3e9a-0c68abb3739a@mender.io>
Date: Wed, 23 Nov 2016 10:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 23 Nov 2016 09:04:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 23/11/16 09:40, Enrico Joerns wrote:
> On 11/22/2016 12:54 PM, Kristian Amlie wrote:
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
> 
> I totally agree with this solution, because it is the same approach we
> are already using for several years.

Good! Sounds like there are several votes in favor of this proposal then.

> Instead of wic we are using the genimage tool
> (http://public.pengutronix.de/software/genimage/) together with a Yocto
> class for easing image creation, but its pretty much the same concerning
> its base purpose.
> 
> We called the option to split up 'mountpoint' while assuming that the
> splitted partition will be mounted to the same location in the file
> system it was taken from.
> 
> An example configuration would look like this (stripped down to the
> essential parts):
> 
>   image my-disk-image {
>           [...]
>           partition root {
>                   image = "rootfs.ext4"
>                   [...]
>           }
> 
>           partition home {
>                   image = "home.ext4"
>                   [...]
>           }
>   }
> 
>   image rootfs.ext4 {
>           [...]
>           mountpoint = "/"
>   }
> 
>   image home.ext4 {
>           [...]
>           mountpoint = "/home"
>   }
> 
> Maybe a similar approach could be used in wic, too.

Yes, this looks very similar "in spirit" to what I'm thinking of right now.

-- 
Kristian

